function _on_exit --on-event fish_exit
    status is-interactive; or return
    # cull missing directories on fish_user_paths
    fish_update_path
end