#!/bin/bash

# --- Configuration ---
# Define browser properties in these parallel arrays.
# Ensure each browser entry has a corresponding element at the same index in all arrays.

# 1. Display names (also determines the order in Rofi)
declare -a browser_display_names=(
  "Vivaldi (personal)"         # Entry 0
  "Firefox (anonymous)"        # Entry 1
  "Firefox (protokol)"         # Entry 2
  "Google Chrome (personal)"   # Entry 3
  "Google Chrome (dotts)"      # Entry 4
  "Google Chrome (thinslices)" # Entry 5
)

# 2. Executable commands
declare -a browser_executables=(
  "vivaldi-stable"       # For Vivaldi (personal)
  "firefox"              # For Firefox (anonymous)
  "firefox"              # For Firefox (protokol)
  "google-chrome-stable" # For Google Chrome (personal)
  "google-chrome-stable" # For Google Chrome (dotts)
  "google-chrome-stable" # For Google Chrome (thinslices)
)

# 3. Icon names (base name, e.g., "firefox", "vivaldi")
declare -a browser_icon_names=(
  "vivaldi"       # For Vivaldi (personal)
  "firefox"       # For Firefox (anonymous)
  "firefox"       # For Firefox (protokol)
  "google-chrome" # For Google Chrome (personal)
  "google-chrome" # For Google Chrome (dotts)
  "google-chrome" # For Google Chrome (thinslices)
)

# 4. Profile-specific arguments (empty string if none)
declare -a browser_profile_args=(
  "--profile-directory=\"Default\""   # Vivaldi (personal)
  "-P \"anonymous\""                  # Firefox (anonymous)
  "-P \"Protokol\""                   # Firefox (protokol)
  "--profile-directory=\"Default\""   # Google Chrome (personal)
  "--profile-directory=\"Profile 1\"" # Google Chrome (dotts)
  "--profile-directory=\"Profile 4\"" # Google Chrome (thinslices)
)

# --- Script Logic ---

# Get URL from the first argument
url="$1"

if [[ -z "$url" ]]; then
  exit 1
fi

# Prepare options_string for Rofi assuming all configured browsers are available
options_string_for_rofi=""
for i in "${!browser_display_names[@]}"; do # Iterate over indices of the browser_display_names array
  display_name="${browser_display_names[$i]}"
  icon_name="${browser_icon_names[$i]}"

  number_to_display=$((i + 1)) # Rofi numbers are 1-based for display
  styled_number="<span weight='bold' foreground='#e5c890'>${number_to_display}</span>"
  display_text_for_rofi="${styled_number}\\t${display_name}"

  current_entry="${display_text_for_rofi}"
  if [[ -n "$icon_name" ]]; then
    current_entry+="\\0icon\\x1f${icon_name}"
  fi
  # The meta value is the 0-based index, useful if -format is not 'i'
  current_entry+="\\0meta\\x1f${i}\\n"

  options_string_for_rofi+="$current_entry"
done

launch_config_idx=$(echo -en "${options_string_for_rofi}" |
  rofi -use-hot-keys \
    -kb-select-1 "1" -kb-select-2 "2" -kb-select-3 "3" -kb-select-4 "4" -kb-select-5 "5" \
    -kb-select-6 "6" -kb-select-7 "7" -kb-select-8 "8" -kb-select-9 "9" \
    -dmenu \
    -i \
    -format i \
    -no-custom \
    -markup-rows \
    -p "Open in" \
    -mesg "URL: ${url}")

# Check if Rofi returned a valid index (non-empty)
if [[ -n "$launch_config_idx" && "$launch_config_idx" -ge 0 && "$launch_config_idx" -lt ${#browser_display_names[@]} ]]; then
  chosen_executable="${browser_executables[$launch_config_idx]}"
  profile_args_to_use="${browser_profile_args[$launch_config_idx]}"

  # We assume the executable exists because we skipped the check earlier
  if [[ -n "$profile_args_to_use" ]]; then
    eval nohup "\"\$chosen_executable\" $profile_args_to_use \"\$url\" >/dev/null 2>&1 &"
  else
    nohup "$chosen_executable" "$url" >/dev/null 2>&1 &
  fi
  # For debugging: echo "Launched '$chosen_executable' with profile args '$profile_args_to_use' and url '$url' (Index: $launch_config_idx)" >&2
else
  echo "Browser selection cancelled or invalid index returned." >&2
  exit 0 # Exit gracefully if user cancelled or Rofi returned an unexpected value
fi

exit 0
