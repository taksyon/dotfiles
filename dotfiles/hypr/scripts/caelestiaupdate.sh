#!/bin/bash

# safety
set -Eeuo pipefail

# formatting
r=$'\033[0m'  # reset
i=$'\033[3m'  # italic
ul=$'\033[4m' # underline
B=$'\033[1m'  # bold
b=$'\033[34m' # blue
y=$'\033[33m' # yellow

# directory vars
BCKUP_DIR="$HOME/backup"
QCKSH_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/quickshell"
CAE_DIR="$QCKSH_DIR/caelestia"

# flag for backup
BKUP=true

# sanity: make sure commands/directory exist
for cmd in git cmake ninja; do
	command -v "$cmd" >/dev/null || {
		printf "Missing required tool: %s\n" "$cmd"
		exit 1
	}
done
if [[ ! -d "$CAE_DIR" ]]; then
	printf "This script requires %shttps://github.com/caelestia-dots/shell%s to be installed. Exiting...\n" "$ul" "$r"
	exit 1
fi

#    ▌     ▌
#    ▛▌▀▌▛▘▙▘▌▌▛▌
#    ▙▌█▌▙▖▛▖▙▌▙▌
#              ▌

if [[ ! -d "$BCKUP_DIR" ]]; then
	echo "Backup directory not found."
	read -rp "${b} -> ${r}${B}Create \"~/backup\" ? (y/n): ${r}" answer
	if [[ -z $answer || $answer == [Yy]* ]]; then
		mkdir -p "$BCKUP_DIR"
	else
		printf "%sSkipping backup...%s\n" "$i" "$r"
		BKUP=false
	fi
elif [[ $BKUP == true && -d "$BCKUP_DIR" ]]; then
	ts="$(date +%Y%m%d-%H%M%S)"
	dest="$BCKUP_DIR/caelestia-$ts"
	printf "Found backup directory: %s%s%s \nSaving Caelestia backup to: %s\n" "$i" "$BCKUP_DIR" "$r" "$dest"
	mkdir -p "$dest"
	cp -a "$CAE_DIR"/ "$dest"/
fi

# NOTE: if breaking changes after update, revert changes by rebuilding in $BCKUP_DIR/caelestia
# cd ~/backup/caelestia || exit
# cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/
# cmake --build build
# sudo cmake --install build

#         ▌  ▗
#    ▌▌▛▌▛▌▀▌▜▘█▌
#    ▙▌▙▌▙▌█▌▐▖▙▖
#      ▌
### Update Caelestia
### WARNING: Updates via git pull. Local changes are not preserved

printf "\n%sWARNING:%s Updating via git pull. Local tweaks in %s%s%s will not be preserved.\n" "$y" "$r" "$i" "$CAE_DIR" "$r"
read -rp "${b} -> ${r}${B}Continue? (y/n): ${r}" answer
if [[ -z $answer || $answer == [Yy]* ]]; then
	echo "Continuing..."
else
	echo "Exiting script..."
	exit 0
fi

cd "$CAE_DIR" || exit
printf "Last chance... will discard local changes and untracked files in %s%s%s\n" "$i" "$CAE_DIR" "$r"
read -rp "${b} -> ${r}${B}Continue? (y/n): ${r}" answer
if [[ -z $answer || $answer == [Yy]* ]]; then
	echo "Continuing..."
else
	echo "Exiting script..."
	exit 0
fi

# clean slate
git fetch --prune
# reset to the remote tracking branch (fallback if no upstream set)
branch="$(git rev-parse --abbrev-ref HEAD)"

if git rev-parse --abbrev-ref "@{u}" >/dev/null 2>&1; then
	git reset --hard "@{u}"
else
	git reset --hard "origin/${branch}"
fi

git clean -fdx # removes untracked files/dirs, including dotfiles

# pull latest (rebase keeps history tidy; merge fallback if needed)
if ! git pull --rebase; then git pull --no-rebase; fi
cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/
cmake --build build
printf "\n\n %s ->%s %sRunning sudo cmake --install build...%s\n" "$b" "$r" "$B" "$r"
sudo cmake --install build
