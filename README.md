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

