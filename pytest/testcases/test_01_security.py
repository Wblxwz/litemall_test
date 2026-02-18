from pathlib import Path

from lib import common
from lib.log import *
import allure
import json

my_logger = Logger(Path(__file__).stem).get_logger()

@allure.epic("api测试")
@allure.feature("安全模块")
class TestSecurity:
    @allure.story("登录功能")
    @allure.description("默认用户登录成功")
    @allure.issue("jira")
    @allure.testcase("testlink")
    def test_login(self):
        api = common.get_json("url") + common.get_json("login_api")
        response = common.login(api,common.get_json("default_username"),common.get_json("default_password"))
        my_logger.info(response.text)
        json_data = json.loads(response.text)
        errno = json_data["errno"]
        errmsg = json_data["errmsg"]
        assert  errno == 0
        assert errmsg == "成功"
    @allure.story("登录功能")
    @allure.description("使用错误用户名登录失败")
    @allure.issue("jira")
    @allure.testcase("testlink")
    def test_login_fail_username(self):
        api = common.get_json("url") + common.get_json("login_api")
        response = common.login(api,common.get_json("wrong_username"),common.get_json("default_password"))
        my_logger.info(response.text)
        json_data = json.loads(response.text)
        errno = json_data["errno"]
        errmsg = json_data["errmsg"]
        assert  errno == 700
        assert errmsg == "账号不存在"
    @allure.story("登录功能")
    @allure.description("使用错误密码登录失败")
    @allure.issue("jira")
    @allure.testcase("testlink")
    def test_login_fail_password(self):
        api = common.get_json("url") + common.get_json("login_api")
        response = common.login(api,common.get_json("default_username"),common.get_json("wrong_password"))
        my_logger.info(response.text)
        json_data = json.loads(response.text)
        errno = json_data["errno"]
        errmsg = json_data["errmsg"]
        assert  errno == 700
        assert errmsg == "账号密码不对"

if __name__ == "__main__":
    test = TestSecurity()
    test.test_login()
