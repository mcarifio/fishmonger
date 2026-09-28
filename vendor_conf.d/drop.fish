set -l cmd (path basename -E (status filename))
command -q $cmd; or return 0
set -l apparmor /etc/apparmor.d/$cmd
[ -e "$apparmor" ] && return 0
set -l cmd_fqpn (command -s $cmd)

printf '%s\n' "
abi <abi/4.0>,
include <tunables/global>
profile $cmd $cmd_fqpn flags=(unconfined) {
  userns,
}
" | sudo tee $apparmor

sudo systemctl reload apparmor.service