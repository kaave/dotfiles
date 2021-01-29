cd `dirname $0`

urls=(
    "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
    "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
    "https://raw.githubusercontent.com/rupa/z/master/z.sh"
    "https://raw.githubusercontent.com/dsifford/yarn-completion/master/yarn-completion.bash"
)

for url in "${urls[@]}" ; do
    BASH_SETUP_OUTPUT=./bin/$(basename ${url})
    [ ! -f "$BASH_SETUP_OUTPUT" ] && curl -sSL ${url} -o $BASH_SETUP_OUTPUT
done

# install fzf
[ `uname` = "Darwin" ] && [ ! -f ~/.fzf.bash ] && /usr/local/opt/fzf/install
