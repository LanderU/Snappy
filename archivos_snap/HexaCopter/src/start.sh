sudo cp service/hexa.service /lib/systemd/system/
systemctl daemon-reload
sudo systemctl start hexa.service
echo "APM:HexaCopter app started"
