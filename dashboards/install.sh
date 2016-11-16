
MACHINE=localhost
MACHINE=192.168.0.21
NAME=grafana
BASEURL=http://admin:admin@$MACHINE:30000
BASEAPI=${BASEURL}/api
DASHBOARDSPATH=.
CURLOUT=./Output
mkdir ${CURLOUT}

# Check API
echo "Check API"
curl ${BASEAPI}/org
echo ""

# Show datasources
echo "Check Datasources"
curl ${BASEAPI}/datasources
echo ""

#DASHBOARDSPATH=${SCRIPT_DIR}/../../../LocalServers/Grafana/Dashboards

# Add datasource 
echo "Check datasource API available"
# TODO: Missing credentials
AVAILABLE=false
while ! ${AVAILABLE} ; do
    curl -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{"orgId":1,"name":"localhost","type":"influxdb","access":"direct","url":"http://'$MACHINE':8086","password":"admin","user":"admin","database":"myMeasures","basicAuth":true,"basicAuthUser":"admin", "basicAuthPassword":"admin" }' ${BASEAPI}/datasources
    RETURNVALUE=$?
    if [[ $RETURNVALUE -eq 1 ]];then
        echo "Exitcode is $RETURNVALUE whilst creating dashboard";
    else
        AVAILABLE=true
    fi

    echo '.'
    sleep 5
done

echo "Add datasource"
curl -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{"orgId":1,"name":"localhost","type":"influxdb","access":"direct","url":"http://'$MACHINE':8086","password":"admin","user":"admin","database":"service","basicAuth":true,"basicAuthUser":"admin", "basicAuthPassword":"admin" }' ${BASEAPI}/datasources
#print_info ""


echo "Add Percentages Dashboard"
# Upload dashboard 
# TODO: THis is not working - but the same one works through webpage :-(
curl --trace ${CURLOUT}/send.txt -H "Accept: application/json" -H "Content-Type: application/json" -X POST --data-binary @"${DASHBOARDSPATH}/success.json" ${BASEAPI}/dashboards/db
echo ""

