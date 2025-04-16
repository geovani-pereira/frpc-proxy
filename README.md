# 🛰️ FRPC Client Add-on for Home Assistant

Este add-on integra o [FRPC (Fast Reverse Proxy Client)](https://github.com/fatedier/frp) ao Home Assistant, permitindo expor seu HA para acesso externo através de um servidor FRPS.

Ideal para quem deseja acesso remoto sem abrir portas no roteador, utilizando um túnel seguro via domínio customizado.

---

## 🚀 Funcionalidades

- Cliente **frpc** 100% funcional dentro do Home Assistant
- Configurável via interface
- Compatível com domínios HTTPS personalizados
- Suporte a diferentes arquiteturas (`aarch64`, `amd64`, `armv7`, etc.)
- Exposição do Home Assistant com proxy reverso tipo HTTP

---

## ⚙️ Requisitos

- Um servidor rodando o **FRPS** (Fast Reverse Proxy Server)
- Um domínio apontando para o IP do servidor FRPS
- Porta `vhost_http_port` ou `vhost_https_port` aberta no servidor FRPS

---

## 🧾 Configuração no `configuration.yaml`

Para evitar o erro `400: Bad Request`, adicione ao seu `configuration.yaml`:

```yaml
homeassistant:
  external_url: "https://homeassistant.seudominio.com.br"

http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 127.0.0.1
    - ::1
    - 192.168.0.0/16
    - 10.0.0.0/8
    - IP_DO_SERVIDOR_FRPS