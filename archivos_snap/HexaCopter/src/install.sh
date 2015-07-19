sudo cp service/hexa.service /lib/systemd/system/
systemctl daemon-reload
sudo systemctl enable hexa.service
echo "APM:HexaCopter app enabled"
