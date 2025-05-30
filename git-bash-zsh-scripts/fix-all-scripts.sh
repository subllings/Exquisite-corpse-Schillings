# ──────────────────────────────────────────────────────────────
# Title: Script Cleaner - Line Endings & Executable Fix
# Description:
#   This script processes all .sh files in the current directory by:
#     1. Converting Windows-style line endings (CRLF) to Unix-style (LF)
#     2. Removing hidden Byte Order Mark (lirke #EF #BB #BF) characters if present
#     3. Setting executable permission for each script
#
# Usage:
#   Run from the folder containing your .sh files:
#     ./fix-all-scripts.sh
# ──────────────────────────────────────────────────────────────

echo -e "\n Fixing all .sh scripts in: $(pwd)\n"

for script in *.sh; do
  if [ -f "$script" ]; then
    echo "Processing: $script"

    # Step 1: Convert CRLF to LF (removes ^M characters)
    echo "    Converting line endings to Unix format..."
    dos2unix "$script" > /dev/null 2>&1

    # Step 2: Ensure script is executable
    echo "    Setting executable permission..."
    chmod +x "$script"

    echo "    Done: $script processed."
  fi
done

echo -e "\n All scripts cleaned and ready to run.\n"