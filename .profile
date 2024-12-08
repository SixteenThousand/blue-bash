EDITOR=nvim
if ! which nvim 2>&1 >/dev/null
then
	EDITOR=vim
fi
export EDITOR

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
PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"

PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH
