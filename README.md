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
To avoid errors, you must ensure that your Git identity is correctly set up **before running the script**.

If it's not already done, you should configure your identity **globally** or **locally**:

### Option 1: Configure Globally

Run the following commands once on your machine:

```bash
git config --global user.name "your-global-username"
git config --global user.email "your-global-email@example.com"
```

#### Explanation:

- `git config --global` – Applies the configuration to all Git repositories on your system.
- `user.name` – Your Git username, shown in commit history.
- `user.email` – Your Git email, used to link commits to your identity.

### Option 2: Configure Locally (per project)

Run these commands from inside your project folder if you want to use a different identity just for this repository:

```bash
cd /path/to/your/repo
git config user.name "your-local-username"
git config user.email "your-local-email@example.com"
```

#### Explanation:

- `cd /path/to/your/repo` – Navigate to your project repository.
- `git config user.name` – Sets your username for this specific repo only.
- `git config user.email` – Sets your email for this specific repo only.


### Link with the Script (`25-time-machine-zsh.sh`)

In the script, the following lines appear:

```bash
47: git config user.name "your-local-username"
48: git config user.email "your-local-email@example.com"
```

You have two options:

- **Recommended:** Configure Git manually using global or local config as shown above,  
  then **delete lines 47 and 48** from the script to avoid hardcoded identities.

- **Alternative (less secure):** Keep these lines in the script, but **replace** the placeholders with your actual Git identity.

This ensures that Git won't fail due to missing identity, and avoids exposing credentials in shared code.