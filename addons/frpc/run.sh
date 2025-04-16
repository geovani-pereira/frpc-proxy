#!/usr/bin/env sh

CONFIG_PATH=/data/options.json

SERVER_ADDRESS=$(jq -r .server_addr "$CONFIG_PATH")
SERVER_PORT=$(jq -r .server_port "$CONFIG_PATH")
PROXY_NAME=$(jq -r .proxy_name "$CONFIG_PATH")
PROXY_TYPE=$(jq -r .proxy_type "$CONFIG_PATH")
PROXY_LOCAL_IP=$(jq -r .proxy_local_ip "$CONFIG_PATH")
PROXY_LOCAL_PORT=$(jq -r .proxy_local_port "$CONFIG_PATH")
PROXY_DOMAIN=$(jq -r .proxy_custom_domains "$CONFIG_PATH")

echo "Iniciando frpc com:"
echo "- Server: $SERVER_ADDRESS:$SERVER_PORT"
echo "- Proxy: $PROXY_NAME ($PROXY_TYPE) -> $PROXY_LOCAL_IP:$PROXY_LOCAL_PORT"

cat <<EOF > /etc/frpc.toml
serverAddr = "${SERVER_ADDRESS}"
serverPort = ${SERVER_PORT}

[[proxies]]
name = "${PROXY_NAME}"
type = "${PROXY_TYPE}"
localPort = ${PROXY_LOCAL_PORT}
localIp = "${PROXY_LOCAL_IP}"
customDomains = ["${PROXY_DOMAIN}"]
EOF

exec ./frpc -c /etc/frpc.toml
