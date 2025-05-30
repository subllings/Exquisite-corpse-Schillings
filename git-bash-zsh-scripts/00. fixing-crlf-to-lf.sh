4# Removes Windows-style carriage returns (CR) at the end of lines.
# It replaces \r characters (carriage return) with nothing (//), 
# ensuring Unix-style line endings (LF only).
sed -i 's/\r$//' fix-all-scripts.sh

# Converts Windows-style line endings (CRLF) to Unix-style (LF)
# This avoids execution issues in Bash/Zsh caused by hidden carriage return characters (^M)
# If not instaleld yet : sudo apt update && sudo apt install dos2unix  
dos2unix fix-all-scripts.sh

# It grants execute permission so you can run it directly  
chmod +x fix-all-scripts.sh

# fix alls scripts, using Zsh:
./fix-all-scripts.s

