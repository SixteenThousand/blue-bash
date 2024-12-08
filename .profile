PATH="$HOME/.local/bin:$HOME/bin:$PATH"

if which nvim 2>&1 1>/dev/null
then
	export EDITOR=nvim
elif which vim 2>&1 1>/dev/null
then
	export EDITOR=vim
fi
export VISUAL=$EDITOR
export PAGER=less

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"

if [ "$XDG_CURRENT_DESKTOP" != "KDE" ]
then
    export QT_QPA_PLATFORMTHEME=qt6ct
fi

# java windows on wayland
export _JAVA_AWT_WM_NONREPARENTING=1

# android studio
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

