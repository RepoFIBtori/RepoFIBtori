#!/bin/bash

# 1.3.1
sudo apt install -y gcc libpcre3-dev zlib1g-dev libluajit-5.1-dev \libpcap-dev openssl libssl-dev libnghttp2-dev libdumbnet-dev \bison flex libdnet

# 1.3.2
mkdir ~/snort_src && cd ~/snort_src
wget https://asoserver.pc.ac.upc.edu/daq-2.0.7.tar.gz -O - | tar -xzf -
cd daq-2.0.7
./configure && make && sudo make install
cd ~/snort_src
wget https://asoserver.pc.ac.upc.edu/snort-2.9.16.tar.gz -O - | tar -xzf -
cd snort-2.9.16/
./configure --enable-sourcefire && make && sudo make install

# 1.3.3
sudo ldconfig

sudo groupadd snort
sudo useradd snort -r -s /sbin/nologin -c SNORT_IDS -g snort

sudo mkdir -p /etc/snort/rules
sudo mkdir /var/log/snort
sudo mkdir /usr/local/lib/snort_dynamicrules

sudo chmod -R 5775 /etc/snort
sudo chmod -R 5775 /var/log/snort
sudo chmod -R 5775 /usr/local/lib/snort_dynamicrules
sudo chown -R snort:snort /etc/snort
sudo chown -R snort:snort /var/log/snort
sudo chown -R snort:snort /usr/local/lib/snort_dynamicrules

sudo touch /etc/snort/rules/white_list.rules
sudo touch /etc/snort/rules/black_list.rules
sudo touch /etc/snort/rules/local.rules

sudo cp ~/snort_src/snort-2.9.16/etc/*.conf* /etc/snort
sudo cp ~/snort_src/snort-2.9.16/etc/*.map /etc/snort

# 1.3.4.1
wget https://www.snort.org/rules/snortrules-snapshot-29160.tar.gz?oinkcode=621589647d4b3998eaae36bacaf2ac78422fb62f -O ~/registered.tar.gz
sudo tar -C /etc/snort -xzf ~/registered.tar.gz

# 1.3.5 - copy from my file 
ifconfig # To get your ip

# replace 192.168.152.129 for yout ip, that one is mine
code /etc/snort/snort.conf


# 1.3.6
sudo snort -T -c /etc/snort/snort.conf

# 1.4 - copy from my file
code /etc/snort/rules/local.rules

ifconfig # To get your interface

# Replace ens33 for yout interface
sudo snort -A console -i ens33 -u snort -g snort -c/etc/snort/snort.conf

# Now open another terminal and ping youself
# you should see messages in the console with snort
# The ip i had to ping was: 192.168.152.2
ping 192.168.152.2

# 1.5

sudo apt install hping3

# Copy this rule to /etc/snort/rules/local.rules
# alert tcp $HOME_NET any -> $HOME_NET 80 (flags: S; msg:"Possible TCP DoS"; flow: stateless;threshold: type both, track by_src, count 70, seconds 10; sid:10001;rev:1;)
code /etc/snort/rules/local.rules

sudo hping3 -S -p 80 --flood --rand-source 192.168.152.2

