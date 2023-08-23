#!/bin/sh
# Create By ifeng
# Telegram:https://t.me/HiaiFeng

sed -i "s#UUID#$UUID#g;s#VMESS_WSPATH#$VMESS_WSPATH#g;s#VLESS_WSPATH#$VLESS_WSPATH#g" /etc/v2ray/config.json
sed -i "s#VMESS_WSPATH#$VMESS_WSPATH#g;s#VLESS_WSPATH#$VLESS_WSPATH#g" /etc/nginx/nginx.conf


config_link="vmess://ws+tls:$UUID-0@$DOPRAX_APP_URL:443/?path=$VMESS_WSPATH"


echo "=========================================="
echo "   Here is your V2ray config link"
echo ""
echo "$config_link"
echo ""
echo "=========================================="


/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
