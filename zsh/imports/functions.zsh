# ssh
ss () {
  local server
  server=$(grep -E 'Host ' ~/.ssh/config | awk '{print $2}' | fzf)
  if [[ -n $server ]]; then
    ssh $server
  fi
}
