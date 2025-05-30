
# Removes Windows-style carriage returns (CR) at the end of lines.
# It replaces \r characters (carriage return) with nothing (//), 
# ensuring Unix-style line endings (LF only).
sed -i 's/\r$//' myscript.sh

# It grants execute permission so you can run it directly  
# using Zsh: ./myscript.sh.
chmod +x myscript.sh