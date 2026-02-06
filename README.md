# LM Serve
Local Language Model serving

# Setup Instructions

## Gateway and UI

```bash
cd ./gateway
cp .env.sample .env
```

### Config setup
**Reference**

```LITELLM_MASTER_KEY```: This sets the default password for the admin and the master API KEY

```OPENAI_API_BASE_URL```: This points the Openai api compatiable server or gateway used by openweb ui

```OPENAI_API_KEY```: API keys for Openai api compatiable server or gateway used by open web ui

```WEBUI_URL```: URL of the chat ui

```CORS_ALLOW_ORIGIN```: URL of the chat ui

```WEBUI_ADMIN_EMAIL```: Default admin email for open web ui

```WEBUI_ADMIN_PASSWORD```: Default admin password for open web ui

---
```NOTE```: Make sure that litellm config file has valid config and it is not empty. 


### Docker setup
```bash
docker compose up -d
```
## vLLM
Make sure you have compatiable Nvidia drivers and CUDA toolkit

```bash
cd ./vllm
docker compose up -d
```

# Components
lm-serve has 3 major componenet
1. LLM - vLLM server (8000)
2. LLM Proxy - litellm (port 4000)
3. Chat UI - Open Web UI (port 8080)

The LLM instances can run anywhere. They can be added to litellm via the dashboard or editting ```litellm_config.yaml```
