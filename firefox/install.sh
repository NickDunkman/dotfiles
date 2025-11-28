profile_directories=($(ls ~/Library/Application\ Support/Firefox/Profiles/))
for profile_directory in "${profile_directories[@]}"
do
    # Create/replace a symlink to user.js
    rm -f ~/Library/Application\ Support/Firefox/Profiles/$profile_directory/user.js
    cp "$DOTFILES/firefox/user.js" ~/Library/Application\ Support/Firefox/Profiles/$profile_directory/user.js

    # Create/replace a symlink to chrome/userChrome.css
    mkdir ~/Library/Application\ Support/Firefox/Profiles/$profile_directory/chrome 2> /dev/null
    rm -f ~/Library/Application\ Support/Firefox/Profiles/$profile_directory/chrome/userChrome.css
    cp "$DOTFILES/firefox/userChrome.css" ~/Library/Application\ Support/Firefox/Profiles/$profile_directory/chrome/userChrome.css

    # Note: firefox refuses to follow symlinks in profile folders. So gotta copy these fuckers over instead.
    #ln -s "$PWD/user.js" ~/Library/Application\ Support/Firefox/Profiles/$profile_directory/user.js
    #ln -s "$PWD/userChrome.css" ~/Library/Application\ Support/Firefox/Profiles/$profile_directory/chrome/userChrome.css
done
