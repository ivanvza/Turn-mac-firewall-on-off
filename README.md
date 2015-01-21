# Mac-firewall-on-off
Bash script to easily switch your Mac osx firewall on or off.

The long way round going into System Preferences -> Security & Privacy -> Firewall (tab) -> ** Take Breath ** -> ./type password -> lock, feels too long!

So here is a short bash script to do it.

## Usage
```
λ ~/ sudo firewall_on_off.sh

Current firewall status: ON

Usage:
./firewall_on_off.sh [on/off]
```

## Sample Usage
```
λ ~/ sudo firewall_on_off.sh off

Current firewall status: ON

Turning your Apple firewall OFF
```
```
λ ~/ sudo firewall_on_off.sh on

Current firewall status: OFF

Turning your Apple firewall ON
```
Twitter: (at) viljoenivan
