#! /bin/bash
sudo cp service/copter.service
sudo systemctl daemon-reload
sudo systemctl start copter.service
echo "APM:Copter app running"