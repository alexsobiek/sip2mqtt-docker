#!/bin/ash

# Define the command and add arguments if environment variables are set
CMD="python /opt/sip2mqtt/sip2mqtt.py"

[ -n "$MQTT_ADDRESS" ] && CMD="$CMD -a$MQTT_ADDRESS"
[ -n "$MQTT_PORT" ] && CMD="$CMD -t$MQTT_PORT"
[ -n "$MQTT_USERNAME" ] && CMD="$CMD -u$MQTT_USERNAME"
[ -n "$MQTT_PASSWORD" ] && CMD="$CMD -p$MQTT_PASSWORD"
[ -n "$SIP_DOMAIN" ] && CMD="$CMD -d$SIP_DOMAIN"
[ -n "$SIP_USERNAME" ] && CMD="$CMD -n$SIP_USERNAME"
[ -n "$SIP_PASSWORD" ] && CMD="$CMD -s$SIP_PASSWORD"

# Execute the command
exec $CMD