#!/bin/bash

display_usage() {
    echo -e "\nUsage:\n\033[1m$0 [on/off]\033[0m\n"
    }

if [[ $EUID -ne 0 ]]; then
   echo -e "\n\033[31mThis script must be run as root\033[0m\n"
   exit 1
fi

if [  $# -eq 0 ]
    then
        display_usage
        exit 0
    else
        foo="\n\033[1mTurning your Apple firewall\033[0m"
        if [ $1 == "on" ] || [ $1 == "ON" ] || [ $1 == "On" ]
            then
                foo+="\033[32m ON\033[0m\n"
                echo -e $foo
                defaults write /Library/Preferences/com.apple.alf globalstate -int 1
        elif [ $1 == "off" ] || [ $1 == "OFF" ] || [ $1 == "Off" ]
            then
                foo+="\033[31m OFF\033[0m\n"
                echo -e $foo
                defaults write /Library/Preferences/com.apple.alf globalstate -int 0
        fi
launchctl unload /System/Library/LaunchDaemons/com.apple.alf.agent.plist
launchctl load /System/Library/LaunchDaemons/com.apple.alf.agent.plist
fi

#@viljoenivan
