sudo cp service/rover.service /lib/systemd/system/
systemctl daemon-reload
sudo systemctl start rover.service
echo "APM:Rover app started"
