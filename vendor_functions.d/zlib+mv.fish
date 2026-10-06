function (fn (status filename))
    argparse -us -- $argv
    for f in $argv
	set -l cat (zlib+category $f)
        set -l dest (zlib+category2fqpn $cat)
	[ -z "$dest" ]; and set -l dest "$(zlib+root)/2sort/$cat/"
	# only overwrite older files
	mv -u -v "$f" (dest $dest)
    end
end
