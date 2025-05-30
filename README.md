# Exquisite-corpse-Schillings
Git exercises – collaborative project

## Execute the Scripts with Bash

Get the current path:

```bash
pwd
```
Navigate to the script directory by adding git-bash-zsh-scipts to your current path:

```bash
cd {your current path}/git-bash-zsh-scipts
```

## Execute all scripts using Bash:

```bash
bash 40-run-all-scripts.sh
```

## Execute the Scripts with Zsh

Open an Ubuntu WSL terminal (or type `zsh` to switch from Bash):

### Get the current path:

```zsh
pwd
```

### Navigate to the script directory:

```zsh
cd /mnt/{your path}/Exquisite-corpse-Schillings/git-bash-zsh-script
```

### Make the main script executable (if not already):

```zsh
chmod +x 40-run-all-scripts.sh
```

### Execute all scripts using Zsh:

```zsh
zsh 40-run-all-scripts.sh
```

### Or, if made executable:

```zsh
./40-run-all-scripts.sh
```

## Make All Scripts Executable

Make all Bash and Zsh scripts executable:

```bash
chmod +x 10-init-repo.sh
chmod +x 20-time-machine.sh
chmod +x 25-time-machine-zsh.sh
chmod +x 30-branching.sh
chmod +x 35-branching-zsh.sh
chmod +x 40-run-all-scripts.sh
chmod +x 45-run-all-scripts-zsh.sh
```

### Or use a wildcard to make all `.sh` files executable at once:

```bash
chmod +x *.sh
```

## Remove Windows Carriage Returns (\r) from Scripts

Sometimes, scripts created or edited on Windows have CRLF line endings, which cause errors like:

```
bad interpreter: /bin/bash^M: no such file or directory
```

To fix this, you can use the following sed command:

```bash
sed -i 's/\r$//' myscript.sh
```

### Explanation:

- `sed` – A stream editor for filtering and transforming text.
- `-i` – Edit the file in-place.
- `'s/\r$//'` – Removes carriage return characters at the end of each line.
- `myscript.sh` – The file to clean.

### Or for all `.sh` files:

```bash
sed -i 's/\r$//' *.sh
```

## Configure Git Identity (Required Before Running the Script)

The script `25-time-machine-zsh.sh` uses Git commands that create commits.  
To avoid errors, you must ensure that your Git identity is correctly set up before running the script.

If it's not already done, you should modify the script `25-time-machine-zsh.sh` to include the following lines (or run them manually beforehand):

```bash
git config --global user.name "{user.name}"
git config --global user.email "{user.email}"
```

### Explanation:

- `git config --global` – Sets the configuration for all Git repositories on your machine.
- `user.name` – Your Git username, visible in commit logs.
- `user.email` – Your Git email address, used to link commits to your account.

### You can also configure identity locally (per repository):

```bash
47: git config user.name "your-local-username"
48: git config user.email "your-local-email@example.com"
```

Modify the script by changing lines 47, 48, or make sure to run them once globally, and delete lines 47, 48 from the script
