#!/bin/sh
# Create By ifeng
# Telegram:https://t.me/HiaiFeng

sed -i "s#UUID#$UUID#g;s#VMESS_WSPATH#$VMESS_WSPATH#g;s#VLESS_WSPATH#$VLESS_WSPATH#g" /etc/v2ray/config.json
sed -i "s#VMESS_WSPATH#$VMESS_WSPATH#g;s#VLESS_WSPATH#$VLESS_WSPATH#g" /etc/nginx/nginx.conf



echo "########## CONFIG LINK ###########"
echo "   Here is your V2ray config link. Import it to your v2ray client, like Qv2ray in Linux."
echo ""
echo "vmess://ws+tls:$UUID-0@$DOPRAX_APP_URL:443/?path=$VMESS_WSPATH"
echo ""
echo "=========================================="


echo "########## CONFIG JSON ###########"
echo "   Here is your V2ray config json. Import this in your v2ray clinet like V2rayN or V2box"

echo "{\"outbounds\":[{\"mux\":{},\"protocol\":\"vmess\",\"sendThrough\":\"0.0.0.0\",\"settings\":{\"vnext\":[{\"address\":\"$DOPRAX_APP_URL\",\"port\":443,\"users\":[{\"id\":\"$UUID\"}]}]},\"streamSettings\":{\"network\":\"ws\",\"security\":\"tls\",\"tlsSettings\":{\"disableSystemRoot\":false},\"wsSettings\":{\"headers\":{\"Host\":\"\"},\"path\":\"$VMESS_WSPATH\"},\"xtlsSettings\":{\"disableSystemRoot\":false}},\"tag\":\"PROXY\"}]}"

echo "##################################"


/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
