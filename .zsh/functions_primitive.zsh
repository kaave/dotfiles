# Load from .zshenv

# get .gitignore template.
#
# example:
#   gi osx,windows,linux,node
gi() {
    curl -L -s https://www.gitignore.io/api/$@ ;
}

ip-info() {
    curl -L -s https://checkip.amazonaws.com/
}

uuidgen7() {
    local timestamp value1 value2 value3 return_value

    timestamp=`printf '%012x\n' $(perl -MTime::HiRes=time -e 'printf "%.3f\n", time' | sed "s/\.//g")`
    value1=`printf '%03x\n' $(shuf -i 0-$((0xfff)) -n 1)`
    value2=`printf '%04x\n' $(shuf -i 0-$((0xffff)) -n 1)`
    value3=`printf '%012x\n' $(shuf -i 0-$((0xffffffffffff)) -n 1)`
    return_value="${timestamp:0:8}-${timestamp:8:4}-7$value1-$value2-$value3"

    if [ "$1" = "-U" ]; then
        echo $return_value | tr 'a-f' 'A-F'
    else
        echo $return_value
    fi
}

charalias() {
    alias | grep '^.=[a-zA-Z]' | sed "s/['|\']//g" | sed "s/^alias //g" | sed "s/=/: /"| sort
}

default_browser() {
    osascript <<-AS
    use framework "AppKit"
    use AppleScript version "2.4"
    use scripting additions

    property NSWorkspace : a reference to current application's NSWorkspace
    property NSURL : a reference to current application's NSURL

    set wurl to NSURL's URLWithString:"https://www.apple.com"
    set thisBrowser to (NSWorkspace's sharedWorkspace)'s ¬
                        URLForApplicationToOpenURL:wurl
    set appname to (thisBrowser's absoluteString)'s lastPathComponent()'s ¬
                    stringByDeletingPathExtension() as text
    return appname as text
AS

    return
    cat $osascript | perl -pe 's/%20/ /g'
}
