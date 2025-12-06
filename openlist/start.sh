#!/usr/bin/env bash
git clone https://github.com/waxz/self-hosted-instance-on-cloudflared /tmp/server

cd /tmp/server

source ./bash_utils.sh

#=== 1. Ensure libraries Installed ===#
libs=("jq" "curl" "git" "moreutils" "inotify-tools")
# Iterate over the array elements
for item in "${libs[@]}"; do
  echo "Processing item: $item"
  if ! command -v $item &>/dev/null; then
  echo "🌀 Installing $item..."
  apt update && apt install -y $item
else
  echo "✅ $item is already installed"
fi
done

chmod +x ./*.sh
cp ./*.sh /bin/

# openlist
gh_install OpenListTeam/OpenList openlist-linux-amd64.tar.gz /tmp/openlist.tar.gz
mkdir /tmp/openlist
tar -xvf /tmp/openlist.tar.gz -C /tmp/openlist
cp /tmp/openlist/openlist /bin

./setup_openlist.sh