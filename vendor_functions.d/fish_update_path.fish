function (fn (status filename))
   set -U fish_user_paths (path filter -d $fish_user_paths)
   refresh-gx fish_user_paths
end

# $PATH[63]: |/nix/var/nix/profiles/default/bin|
# $PATH[64]: |/usr/local/sbin|
# $PATH[65]: |/usr/local/bin|
# $PATH[66]: |/usr/sbin|
# $PATH[67]: |/usr/bin|
# $PATH[68]: |/sbin|
# $PATH[69]: |/bin|
# $PATH[70]: |/usr/games|
# $PATH[71]: |/usr/local/games|
# $PATH[72]: |/snap/bin|
