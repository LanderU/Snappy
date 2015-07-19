sudo cp service/rover.service /lib/systemd/system/
systemctl daemon-reload
sudo systemctl enable rover.service
echo "APM:Rover app enabled"
