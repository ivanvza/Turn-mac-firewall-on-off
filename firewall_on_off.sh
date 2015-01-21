#!/bin/bash

display_usage() {
    echo -e "\nUsage:\n\033[1m$0 [on/off]\033[0m\n"
    }

if [[ $EUID -ne 0 ]]; then
   echo -e "\n\033[31mThis script must be run as root\033[0m\n"
   exit 1
fi

state=`defaults read /Library/Preferences/com.apple.alf globalstate`
if [ $state -eq 0 ]
    then
        state="OFF"
        echo -e "\n\033[1mCurrent firewall status: \033[0m\033[31mOFF\033[0m"
    elif [ $state -eq 1 ]
        then
            state="ON"
            echo -e "\n\033[1mCurrent firewall status: \033[0m\033[32mON\033[0m"
        elif [ $state -eq 2 ]
            then
                state="SPECIAL"
                echo -e "\033[31mFirewall currently allowing special services...\033[0m"
fi

if [  $# -eq 0 ]
    then
        display_usage
        exit 0
    else
        foo="\n\033[1mTurning your Apple firewall\033[0m"
        if [ $1 == "on" ] || [ $1 == "ON" ] || [ $1 == "On" ]
            then
                if [ $state == "ON" ]
                    then
                        echo -e "\n\033[1mFirewall status is already \033[0m\033[32m$state\033[0m"
                        echo -e "\033[1mExiting...\033[0m"
                        exit 0
                fi
                foo+="\033[32m ON\033[0m\n"
                echo -e $foo
                defaults write /Library/Preferences/com.apple.alf globalstate -int 1
        elif [ $1 == "off" ] || [ $1 == "OFF" ] || [ $1 == "Off" ]
            then
                if [ $state == "OFF" ]
                    then
                        echo -e "\n\033[1mFirewall status is already \033[0m\033[31m$state\033[0m"
                        echo -e "\033[1mExiting...\033[0m"
                        exit 0
                fi
                foo+="\033[31m OFF\033[0m\n"
                echo -e $foo
                defaults write /Library/Preferences/com.apple.alf globalstate -int 0
        fi
launchctl unload /System/Library/LaunchDaemons/com.apple.alf.agent.plist
launchctl load /System/Library/LaunchDaemons/com.apple.alf.agent.plist
fi

#@viljoenivan
