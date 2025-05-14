#!/bin/bash

# --- Configuration ---
# Add your preferred browsers here.
# Format: "Display Name:executable_command"
# The executable_command should be what you type in the terminal to launch it.
# Ensure the executables are in your $PATH.

declare -A browsers_map=(
  ["Vivaldi (personal)"]="vivaldi-stable"               # Default profile
  ["Firefox (anonymous)"]="firefox"                     # Profile1 (Path=raa2v933.default Name=anonymous)
  ["Firefox (protokol)"]="firefox"                      # profile0 (Path=35obhphx.default-release Name=Protokol)
  ["Google Chrome (personal)"]="google-chrome-stable"   # Default profile
  ["Google Chrome (dotts)"]="google-chrome-stable"      # Profile 1
  ["Google Chrome (thinslices)"]="google-chrome-stable" # Profile 4
)

# Updated to map full display names to base icon names
declare -A browser_icons_map=(
  ["Vivaldi (personal)"]="vivaldi"
  ["Firefox (anonymous)"]="firefox"
  ["Firefox (protokol)"]="firefox"
  ["Google Chrome (personal)"]="google-chrome"
  ["Google Chrome (dotts)"]="google-chrome"
  ["Google Chrome (thinslices)"]="google-chrome"
)

# Profile arguments derived from comments in browsers_map
declare -A browser_profile_args_map=(
  ["Vivaldi (personal)"]="--profile-directory=\"Default\""
  ["Firefox (anonymous)"]="-P \"anonymous\""
  ["Firefox (protokol)"]="-P \"Protokol\""
  ["Google Chrome (personal)"]="--profile-directory=\"Default\""
  ["Google Chrome (dotts)"]="--profile-directory=\"Profile 1\""
  ["Google Chrome (thinslices)"]="--profile-directory=\"Profile 4\""
)

# Rofi theme (optional, leave empty for default or set path to your theme)
# ROFI_THEME=""
# Example: ROFI_THEME="~/.config/rofi/mytheme.rasi"

# --- Script Logic ---

# Get URL from the first argument
url="$1"

if [[ -z "$url" ]]; then
  exit 1
fi

# Step 1: Collect original display names of available browsers
declare -a available_original_names
# Iterate over keys of browsers_map to ensure we process each configured browser once
for original_name_key in "${!browsers_map[@]}"; do
  executable="${browsers_map[$original_name_key]}"
  if command -v "$executable" &>/dev/null; then
    available_original_names+=("$original_name_key")
  fi
done

# Optional: Sort for stable numbering (e.g., alphabetically). Uncomment the next two lines to enable.
# IFS=$'\n' available_original_names=($(sort <<<"${available_original_names[*]}"))
# unset IFS

if [[ ${#available_original_names[@]} -eq 0 ]]; then
  rofi -e "No configured browsers found or none are installed!" ${ROFI_THEME:+-theme "$ROFI_THEME"}
  exit 1
fi

# Step 2: Prepare options_string for Rofi with display text, icon, and meta (return value)
options_string_for_rofi=""
idx=0
for original_name in "${available_original_names[@]}"; do
  # Use the full original_name (which includes profile info) as key for icon map
  icon_name="${browser_icons_map[$original_name]}"
  number_to_display=$((idx + 1))

  # Style the number: small, bold, a distinct color. Adjust foreground color as you like.
  # The tab character '\t' is used to push the number to the right.
  # Its effectiveness depends on the Rofi theme's handling of tabs.
  styled_number="<span weight='bold' foreground='#e5c890'>${number_to_display}</span>"
  display_text_for_rofi="${styled_number}\\t${original_name}"

  # Construct the full entry for Rofi:
  # DISPLAY_TEXT \0icon\x1fICON_NAME \0meta\x1fRETURN_VALUE \n
  current_entry="${display_text_for_rofi}"
  if [[ -n "$icon_name" ]]; then
    current_entry+="\0icon\x1f${icon_name}"
  fi
  current_entry+="\0meta\x1f${original_name}\n"

  options_string_for_rofi+="$current_entry"
  idx=$((idx + 1))
done
chosen_original_name=$(echo -en "${options_string_for_rofi}" |
  rofi -use-hot-keys \
    -kb-select-1 "1" -kb-select-2 "2" -kb-select-3 "3" -kb-select-4 "4" -kb-select-5 "5" \
    -kb-select-6 "6" -kb-select-7 "7" -kb-select-8 "8" -kb-select-9 "9" \
    -dmenu \
    -i \
    -format p \
    -no-custom \
    -markup-rows \
    -p "Open in" \
    -mesg "URL: ${url}" \
    ${ROFI_THEME:+-theme "$ROFI_THEME"})

chosen_original_name="${chosen_original_name#*[[:space:]]}"
if [[ -z "$chosen_original_name" ]]; then
  echo "Browser selection cancelled." >&2 # Uncomment for debugging
  exit 0                                  # Exit gracefully, user cancelled
fi

# Get the executable for the chosen original display name
chosen_executable="${browsers_map[$chosen_original_name]}"
profile_args="${browser_profile_args_map[$chosen_original_name]}"
if [[ -n "$chosen_executable" ]]; then
  # Launch the browser in the background, detaching it
  # Use eval to correctly handle profile arguments that might contain spaces or need special parsing
  if [[ -n "$profile_args" ]]; then
    eval nohup "\"\$chosen_executable\" $profile_args \"\$url\" >/dev/null 2>&1 &"
  else
    nohup "$chosen_executable" "$url" >/dev/null 2>&1 &
  fi
  # For debugging, you might temporarily use:
  # echo "Launched '$chosen_executable' with profile args '$profile_args' and url '$url'" >&2
else
  # This should ideally not happen if filtering and rofi selection work correctly
  rofi -e "Error: Could not find executable for '${chosen_original_name}'." ${ROFI_THEME:+-theme "$ROFI_THEME"}
  exit 1
fi

exit 0
