# LM Serve
Local Language Model serving

# Setup Instructions

```bash
cp .env.sample .env
```
Fill all the env variables

# Docker setup
```bash
docker network create llm-network
```
Once the network is created
```bash
docker compose up -d
```
run the above command in the directories gateway and vllm respectively

```NOTE:``` This is for dev testing. In real deployment vllm container will be deployed and its https url will be added to the gateway and ui which is hosted elsewhere.

# Components
lm-serve has 3 major componenet
1. LLM - vLLM server (8000)
2. LLM Proxy - litellm (port 4000)
3. Chat UI - Open Web UI (port 8080)

# Proxy setup
Setup nginx proxy with required setting and forward the web socket request from nginx to the web ui container

```conf
server {
        listen 8000;
        server_name vllm;

        location / {
            proxy_pass http://vllm:8000;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        }
    }
```

