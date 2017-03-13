#!/bin/sh
api="http://api.openweathermap.org/data/2.5/weather?q=Waterloo&APPID=fc3cf768e2ea4f683adac8f074a036c6&units=metric"
ret=$(curl $api)
weather=$(echo $ret | jq -r '.weather[0].main')
temp=$(echo $ret | jq -r '.main.temp')
echo " $weather $temp°C "
