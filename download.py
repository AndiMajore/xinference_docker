import os
from huggingface_hub import login
from huggingface_hub import hf_hub_download, snapshot_download
import joblib

#access_token_read = os.environ.get('HF_TOKEN_READ','unset')
#login(token = access_token_read)

REPO_ID = os.environ.get('HF_REPO_ID')
snapshot_download(repo_id=REPO_ID, local_dir='/LLM/')
