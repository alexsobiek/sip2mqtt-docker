#!/bin/ash

# Define the command and add arguments if environment variables are set
CMD="python /opt/sip2mqtt/sip2mqtt.py"

[ -n "$MQTT_ADDRESS" ] && CMD="$CMD --mqtt_domain $MQTT_ADDRESS"
[ -n "$MQTT_PORT" ] && CMD="$CMD --mqtt_port $MQTT_PORT"
[ -n "$MQTT_KEEPALIVE" ] && CMD="$CMD --mqtt_keepalive $MQTT_KEEPALIVE"
[ -n "$MQTT_PROTOCOL" ] && CMD="$CMD --mqtt_protocol $MQTT_PROTOCOL"
[ -n "$MQTT_USERNAME" ] && CMD="$CMD --mqtt_username $MQTT_USERNAME"
[ -n "$MQTT_PASSWORD" ] && CMD="$CMD --mqtt_password $MQTT_PASSWORD"
[ -n "$MQTT_TOPIC" ] && CMD="$CMD --mqtt_topic $MQTT_TOPIC"
[ -n "$SIP_DOMAIN" ] && CMD="$CMD --sip_domain $SIP_DOMAIN"
[ -n "$SIP_USERNAME" ] && CMD="$CMD --sip_username $SIP_USERNAME"
[ -n "$SIP_PASSWORD" ] && CMD="$CMD --sip_password $SIP_PASSWORD"
[ -n "$SIP_DISPLAY" ] && CMD="$CMD --sip_display $SIP_DISPLAY"
[ -n "$LOG_LEVEL" ] && CMD="$CMD --log_level $LOG_LEVEL"
[ -n "$VERBOSITY" ] && CMD="$CMD --$VERBOSITY"
 
# Execute the command
exec $CMD