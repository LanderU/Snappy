#lander@erlerobot.com
echo "Connect the ethernet wire into the ERLE-BRAIN, at port (if it is not already)"
sleep 15
sudo ifconfig eth0 up
echo "Setting your network, please wait..."
sudo dhclient eth0
echo "Network address: `ifconfig eth0 2>/dev/null`"
