#### [附图 Word 版本](https://shimo.im/docs/PD8qwKwVJk8TWDQg/ 《Django 自动化测试平台》，可复制链接后用石墨文档 App 打开)

#### [视频演示](https://www.bilibili.com/video/BV1354y1X7fD/)

#### 平台介绍

> 支持 `API、AppUI、WebUI` 等自动化测试，集成实现测试用例管理、产品管理、任务计划、测试报告、定时任务或持续集成等功能模块。使自动化测试的过程达到数据、脚本、任务分离易于维护和管理，成本更低、数据更直观、产出更快等目标。
>
> - 当前已完成：用户可以按步骤，通过前端页面输入控件定位元素，以及对控件的操作动作，完成对产品、`Api` 接口、`App` 测试、`Web` 测试的用例管理以及 `bug` 管理

#### 待优化改进

> - 根据实际公司业务，结合 `PO` 模型，使用 `selenium` + `unittest` 框架，开发自动化测试脚本
> - 测试报告模块及其邮件通知模块的优化
> - 持续集成
> - 数据存储优化：缓存--`Redis`

#### 整体开发架构

> ![image](https://github.com/Leofighting/Django_auto_test_platform_V2/blob/master/static/git_images/01.png)

#### 启动配置

> - 运行终端，切换到相应的项目目录下，输入命令：`pip install -r requirements.txt`，安装所需的插件与库
>
> - 配置  `settings.py` 文件中的参数，包括数据库，静态文件路径，语言等
> - 导入 `auto_test01.sql` 数据到 `MySQL` 中
> - 运行项目，在浏览器输入 `http://127.0.0.1:8000/login`，用户名为 `admin`，密码为 `test123qwe`。



**利用 `Django` 自带的 `admin` 后台管理，完成各模块的版面**

> - 产品管理
>
> ![image](https://github.com/Leofighting/Django_auto_test_platform_V2/blob/master/static/git_images/02.png)

> - 流程场景接口
>
> ![image](https://github.com/Leofighting/Django_auto_test_platform_V2/blob/master/static/git_images/03.png)

> - 单一场景接口
>
> ![image](https://github.com/Leofighting/Django_auto_test_platform_V2/blob/master/static/git_images/04.png)

> - Bug 管理
>
> ![image](https://github.com/Leofighting/Django_auto_test_platform_V2/blob/master/static/git_images/05.png)

> - 系统设置
>
> ![image](https://github.com/Leofighting/Django_auto_test_platform_V2/blob/master/static/git_images/06.png)

> - `App` 测试用例管理
>
> ![image](https://github.com/Leofighting/Django_auto_test_platform_V2/blob/master/static/git_images/07.png)

> - Web 测试用例管理
>
> ![image](https://github.com/Leofighting/Django_auto_test_platform_V2/blob/master/static/git_images/08.png)

> - 搜索功能实现
>
> ![image](https://github.com/Leofighting/Django_auto_test_platform_V2/blob/master/static/git_images/09.png)

> - 性能测试
>
>   - `Locust` ：一个开源负载测试工具。使用 Python 代码定义用户行为，也可以仿真百万个用户。是完全基于时间的，因此单个机器支持几千个并发用户。相比其他许多事件驱动的应用，Locust 不使用回调，而是使用轻量级的处理方式 [gevent](http://www.oschina.net/p/gevent)。
>
>   - 安装方法：`pip install locust`；`pip install pyzmp`
>
>   - 使用：
>
>     1. 编写脚本文件：
>
>     ```python
>     from locust import HttpLocust, TaskSet, task
>     
>     
>     class WebsiteTasks(TaskSet):
>         @task
>         def login(self):
>             self.client.post("/test", {
>                 "username": "admin",
>                 "password": "test123qwe"
>             })
>     
>     
>     class WebsiteUser(HttpLocust):
>         task_set = WebsiteTasks
>         min_wait = 100
>         max_wait = 1000
>     ```
>
>   - 在脚本文件的路径下，进入终端，输入 Locust 启动命令：`locust -f (脚本文件名称) --host=( IP 地址)`；例如：`locust -f performance.py --host=http://127.0.0.1`
>
>   - 在浏览器中输入 `localhost:8089`，进行访问
>
>   - 输入虚拟并发用户数，每秒增加用户数，点击开始即可，结果如下图所示
>
> - ![image](https://github.com/Leofighting/Django_auto_test_platform_V2/blob/master/static/git_images/10.png)



