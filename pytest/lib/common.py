from lib.log import *
import json
import requests
from pathlib import Path

my_logger = Logger(Path(__file__).stem).get_logger()

def login(url,username,password):
    data = {
        "username":username,
        "password":password
    }
    json_data = json.dumps(data)
    response = requests.post(url,json_data)
    my_logger.info(response)
    return response

def get_json(key):
    json_path = str(ROOT_PATH) + "/variables/test.json"
    with open(json_path,"r") as f:
        json_data = f.read()
        json_value = json.loads(json_data)
        try:
            return json_value[key]
        except:
            my_logger.error(f"no key: {key} in json file!")
