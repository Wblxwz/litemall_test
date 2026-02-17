import logging
from logging.handlers import RotatingFileHandler
from pathlib import Path

SCRIPT_FILE = Path(__file__)
LOG_PATH = SCRIPT_FILE.parents[0]
LIB_PATH = SCRIPT_FILE.parents[1]
ROOT_PATH = SCRIPT_FILE.parents[2]

class Logger():
    def __init__(self,name:str) -> None:
        self.logger = logging.getLogger(name)
        self.logger.setLevel(logging.INFO)
        handler = RotatingFileHandler(
            filename=f"{LOG_PATH}\{name}.log",
            #10MB轮转日志文件
            maxBytes=10 * 1024 * 1024,
            backupCount=10,
            encoding="utf-8"
        )
        formatter = logging.Formatter("%(asctime)s - %(levelname)s - %(filename)s:%(lineno)d - %(message)s")
        handler.setFormatter(formatter)
        self.logger.addHandler(handler)
    def get_logger(self):
        return self.logger