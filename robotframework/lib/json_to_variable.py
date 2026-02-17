"""
将Json文件转为Resource文件
"""

import json
from pathlib import Path
import log

logger = log.Logger(Path(__file__).stem).get_logger()

def json_to_variable():
    variable_path = Path.joinpath(log.ROOT_PATH, "variables")
    for json_file in Path(variable_path).rglob("*.json"):
        with open(json_file,"r") as f:
            data = f.read()
            variable_name = Path(json_file).stem
            logger.info(f"start convert {json_file}...")
            with open(f"{variable_path}\{variable_name}.resource","w") as v:
                json_value = json.loads(data)
                logger.info(f"json_value:{json_value}")
                v.write("*** Variables ***\n")
                for key in json_value:
                    v.write(f"${{{key}}}    {json_value[key]}\n")
            logger.info(f"convert {json_file} end...")

if __name__ == "__main__":
    json_lib = json_to_variable()
    json_lib.json_to_variable()
    