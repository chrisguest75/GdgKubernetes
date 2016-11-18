#!/usr/bin/env python

import os
import time
import random
from influxdb import InfluxDBClient
from datetime import datetime

if __name__ == '__main__':

    dbName = os.getenv('DBNAME', "myMeasures")
    measurementName = os.getenv('MEASURENAME', "myMeasurement")
    containerName = os.getenv('CONTAINERNAME', "container")
    dbUrl = os.getenv('DBURL', "192.168.0.36")
    dbPort = os.getenv('DBPORT', "8086")
    dbUser = os.getenv('DBUSER', "admin")
    dbPass = os.getenv('DBPASS', "admin")

    print(dbUrl + ":" + dbPort)	
    influxclient = InfluxDBClient(dbUrl, dbPort, dbUser, dbPass, dbName)

    if dbName is None:
        print("DB name is empty string")

    dbs = influxclient.get_list_database()
    found = False
    for d in dbs:
        if d["name"] == dbName:
            found = True
            
    if not found:
        print("Create DB:" + dbName)
        influxclient.create_database(dbName)
    else:
        print("Skip create DB:" + dbName)

    while True:
        json_batchbody = []
        timeepoch = int(datetime.utcnow().strftime('%s')) * 1000000000

        json_body = {
            "measurement": measurementName,
            "tags": {
            },
            "time": timeepoch,
            "fields": {
            }
        }
        value = random.randint(100, 1000)
        json_body['fields']['value'] = value
        json_body['tags']['container'] = containerName     
        print(str(json_body))
        json_batchbody.append(json_body)
        influxclient.write_points(json_batchbody)

        #time.sleep(1) # delays for 5 seconds
