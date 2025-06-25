import urllib3
from urllib3.exceptions import HTTPError
import json
import os

# 从环境变量获取API密钥
API_KEY = os.getenv("OPENAI_API_KEY")
OPENAI_ORGANIZATION = os.getenv("OPENAI_ORG_ID")  # 可选
OPENAI_PROJECT = os.getenv("OPENAI_PROJECT_ID")  # 可选

def build_headers() -> dict:
    """构建请求头"""
    headers = {
        "Authorization": f"Bearer {API_KEY}"
    }
    if OPENAI_ORGANIZATION:
        headers["OpenAI-Organization"] = OPENAI_ORGANIZATION
    if OPENAI_PROJECT:
        headers["OpenAI-Project"] = OPENAI_PROJECT
    return headers

def test_api_key():
    """测试OpenAI API密钥"""
    if not API_KEY:
        print("错误：未找到OPENAI_API_KEY环境变量")
        return
    
    http = urllib3.PoolManager()
    url = "https://api.openai.com/v1/models"
    headers = build_headers()
    
    print(f"测试API密钥: {API_KEY[:20]}...")
    print(f"使用的请求头: {list(headers.keys())}")

    try:
        response = http.request("GET", url, headers=headers)
        if response.status == 200:
            print("✅ API密钥有效，请求成功！")
            data = json.loads(response.data.decode('utf-8'))
            print(f"可用模型数量: {len(data.get('data', []))}")
        else:
            print(f"❌ 请求失败，状态码: {response.status}")
            print("响应:", json.loads(response.data.decode('utf-8')))
    except HTTPError as e:
        print(f"❌ HTTPS错误: {e}")

if __name__ == "__main__":
    test_api_key() 