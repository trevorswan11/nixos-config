for path in $argv
    set -l target (realpath $path)

    if set -l index (contains -i $target $fish_user_paths)
        set -e fish_user_paths[$index]
        echo "Removed $target from fish_user_paths"
    else
        echo "$target not found in fish_user_paths"
    end
end

echo "Updated PATH: $PATH"

