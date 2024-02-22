#!/bin/sh
# Create By ifeng
# Telegram:https://t.me/HiaiFeng

sed -i "s#UUID#$UUID#g;s#VMESS_WSPATH#$VMESS_WSPATH#g;s#VLESS_WSPATH#$VLESS_WSPATH#g" /etc/v2ray/config.json
sed -i "s#VMESS_WSPATH#$VMESS_WSPATH#g;s#VLESS_WSPATH#$VLESS_WSPATH#g" /etc/nginx/nginx.conf

# Echo the JSON configuration
echo "{"
echo "    \"outbounds\": ["
echo "        {"
echo "            \"mux\": {"
echo "            },"
echo "            \"protocol\": \"vmess\","
echo "            \"sendThrough\": \"0.0.0.0\","
echo "            \"settings\": {"
echo "                \"vnext\": ["
echo "                    {"
echo "                        \"address\": \"$DOPRAX_APP_URL\","
echo "                        \"port\": 443,"
echo "                        \"users\": ["
echo "                            {"
echo "                                \"id\": \"$UUID\""
echo "                            }"
echo "                        ]"
echo "                    }"
echo "                ]"
echo "            },"
echo "            \"streamSettings\": {"
echo "                \"network\": \"ws\","
echo "                \"security\": \"tls\","
echo "                \"tlsSettings\": {"
echo "                    \"disableSystemRoot\": false"
echo "                },"
echo "                \"wsSettings\": {"
echo "                    \"headers\": {"
echo "                        \"Host\": \"\""
echo "                    },"
echo "                    \"path\": \"$VMESS_WSPATH\""
echo "                },"
echo "                \"xtlsSettings\": {"
echo "                    \"disableSystemRoot\": false"
echo "                }"
echo "            },"
echo "            \"tag\": \"PROXY\""
echo "        }"
echo "    ]"
echo "}"

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
