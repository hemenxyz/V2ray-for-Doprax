#!/bin/sh
# Create By ifeng
# Telegram:https://t.me/HiaiFeng

sed -i "s#UUID#$UUID#g;s#VMESS_WSPATH#$VMESS_WSPATH#g;s#VLESS_WSPATH#$VLESS_WSPATH#g" /etc/v2ray/config.json
sed -i "s#VMESS_WSPATH#$VMESS_WSPATH#g;s#VLESS_WSPATH#$VLESS_WSPATH#g" /etc/nginx/nginx.conf


# Create the V2Ray configuration URL
config_url="vmess://ws+tls:$UUID-0@$DOPRAX_APP_URL:443/?path=$VMESS_WSPATH"

# Echo out the V2Ray configuration URL
echo "V2Ray Configuration URL: $config_url"

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
