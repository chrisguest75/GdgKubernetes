docker run -d -p 30000:3000 --name grafana fg2it/grafana-armhf:v3.1.1

docker run -d -p 8083:8083 -p 8086:8086 --name influxdb fgabriel/rpi-influxdb 

docker run -d -e DBURL=influxdb --name fakedata chrisguest/rpi-fakedata
