++++++++++++++++++++++++++++++++++++++
# NTP server setup
# In MASTER And CHILD:
sudo apt update
sudo apt install chrony -y

sudo nano /etc/chrony/chrony.conf
sudo nano /etc/chrony/conf.d/00-cpc.conf # comment prefer line

# Only in MASTER paste as per your requirement
allow 10.0.0.0/16   # Adjust this to your VPC CIDR
local stratum 10    # Acts as a fallback time source

# Only in CHILD 
server 10.0.1.10 prefer iburst # private ip of your NTP server

# In MASTER And CHILD:
sudo systemctl restart chrony
sudo systemctl enable chrony
chronyc sources -v

++++++++++++++++++++++++++++++++++++++
MASTER:
sudo apt update
sudo apt install bind9 bind9utils bind9-doc -y
sudo vim /etc/bind/named.conf.local
# paste

# from here 
zone "myvpc.local" 
{
    type master;
    file "/etc/bind/db.myvpc.local";
};
# till here 


sudo cp /etc/bind/db.local /etc/bind/db.myvpc.local
sudo vim /etc/bind/db.myvpc.local
# remove and paste below one

# from here 
$TTL    604800
@       IN      SOA     ns.myvpc.local. root.myvpc.local. (
                             2         ; Serial
                        604800         ; Refresh
                         86400         ; Retry
                       2419200         ; Expire
                        604800 )       ; Negative Cache TTL

; Nameservers
@       IN      NS      ns.myvpc.local.

; A records (change IPs accordingly)
ns              IN      A       172.31.10.10    ; DNS server
web1            IN      A       172.31.20.21
db1             IN      A       172.31.30.31
# till here 


sudo named-checkconf
sudo named-checkzone myvpc.local /etc/bind/db.myvpc.local
sudo systemctl restart bind9
sudo systemctl status bind9

CHILD:
sudo nano /etc/resolv.conf #(temporary)
# paste
nameserver 172.31.13.238

####OR######

sudo nano /etc/netplan/*.yaml  #(Permanent)
# paster it under ethernet

# from here 
nameservers:
  addresses:
    - 172.31.13.238
# till here 


sudo netplan apply

++++++++++++++++++++++++++++++++++++++