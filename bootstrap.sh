# install ohmyzsh if not already running zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# verify that the key file is present or tell me to it from lastpass
( [[ -f ~/.ssh/mbkey ]] && echo "found mbkey, good" ) || \
    (\
    echo "NO mbkey FOUND! Get your key from lastpass and put it in under ~/.ssh/mbkey" \
    && read && echo \
    )

# create the workspace folder and go there
echo "creating the workspace folder if needed..."
( [[ -d ~/workspace ]] || mkdir -p ~/workspace ) && cd ~/workspace

# clone mbhome and tell me continue with bootstrap using that repo
echo "cloning mbhome if not already present..."
[[ -d mbhome ]] || git clone git@github.com:manubansal/mbhome.git

# tell me to continue setup using mbhome
echo "now continue setting up the dev environment by following mbhome/README.md"
