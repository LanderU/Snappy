sudo cp service/copter.service /lib/systemd/system/
systemctl daemon-reload
sudo systemctl start copter.service
echo "APM:Copter app started"
