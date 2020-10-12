eval (direnv hook fish)

set PATH /usr/local/opt/ruby/bin $PATH
set PATH ~/bin $PATH
set PATH /Library/Frameworks/Python.framework/Versions/3.7/bin $PATH

set SPACEFISH_NODE_SHOW false
set SPACEFISH_PACKAGE_SHOW false
set SPACEFISH_DOCKER_SHOW false
set SPACEFISH_EXEC_TIME_SHOWS false

set -x JAVA_HOME "`/usr/libexec/java_home -v 1.8`"
set -x ANDROID_HOME "/usr/local/share/android-sdk"
set -x ANDROID_SDK_ROOT "/usr/local/share/android-sdk"
set -x GRADLE_USER_HOME "/usr/local/share/gradle"
set -x M2_HOME "/usr/local/share/maven"

[ -f /Users/luiz.socrate/Code/klarna-app/bin/completion/klapp.fish.sh ]; and . /Users/luiz.socrate/Code/klarna-app/bin/completion/klapp.fish.sh; or true
