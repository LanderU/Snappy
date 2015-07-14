sudo cp service/copter.service /lib/systemd/system/
systemctl daemon-reload
sudo systemctl enable copter.service
echo "APM:Copter app enabled"
