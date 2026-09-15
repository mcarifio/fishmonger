function _on_exit --on-event fish_exit
    status is-interactive; or return
    # cull missing directories on fish_user_paths
    set -Ux fish_user_paths (path filter -d $fish_user_paths)    
end