for path in $argv
    set -l normalized_path (realpath $path)
    if test -d "$normalized_path"
        if not contains -- "$normalized_path" $fish_user_paths
            set -U fish_user_paths $fish_user_paths "$normalized_path"
        end
    else
        echo "Error: $path is not a valid directory."
    end
end

echo "Updated PATH: $PATH"

