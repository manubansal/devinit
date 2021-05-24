# install ohmyzsh if not already running zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# verify that the key file is present or tell me to it from lastpass
( [[ -f ~/.ssh/mbkey ]] && echo "found mbkey, good" ) || \
    (\
    echo "NO mbkey FOUND! Get your key from lastpass and put it in under ~/.ssh/mbkey" \
    && read && echo \
    )

# fail and exit if key file still not present
[[ -f ~/.ssh/mbkey ]] || ( echo "NO mbkey FOUND STILL! BAILING OUT." && exit 1 )

# set the right perms and add to ssh keys
chmod 400 ~/.ssh/mbkey && ssh-add ~/.ssh/mbkey

# create the workspace folder and go there
echo "creating the workspace folder if needed..."
( [[ -d ~/workspace ]] || mkdir -p ~/workspace ) && cd ~/workspace

# clone mbhome and tell me continue with bootstrap using that repo
echo "cloning mbhome if not already present..."
[[ -d mbhome ]] || git clone git@bitbucket.org:manubansal/mbhome.git

# tell me to continue setup using mbhome
echo "now continue setting up the dev environment by following mbhome/README.md"
