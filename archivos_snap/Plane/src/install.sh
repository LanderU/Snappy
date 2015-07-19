sudo cp service/plane.service /lib/systemd/system/
systemctl daemon-reload
sudo systemctl enable plane.service
echo "APM:Plane app enabled"
