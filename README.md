# songjhh_blog

 我是通过这个项目进行Java相关学习，这个博客系统融入了许多现在常用的前后端技术。当然现在项目做得还不完全，还有许多功能还未有时间进行开发，
 我会在今后慢慢的完善的。由于我还在一个学习阶段，代码中定有许多漏洞和错误，希望各位可以指出，有其他初学者有问题可以向我提出，注释比较详细，共同进步。
 邮箱：songjhh0312@gmail.com

**相关技术**

本博客系统是利用Spring+Spring MVC+Mybatis搭建的，Apache的Shrio作为安全框架实现安全认证，前端使用来自Twitter的Bootstrap架构进行页面搭建，编写
博文和解析博文用的是Bootstrap_Markdown,数据库用mysql,整个项目使用Maven来管理。下面详细列出使用的基本技术：
- Spring
- Spring MVC
- Mybatis
- Shiro
- Bootstrap
- Bootstrap_Markdown
- mysql
 
 
**博客功能**
 
- 博文编写使用Markdown语法编写，数据库储存markdown格式文本，通过markdown解析器展示到首页。
- 能注册账号，有三种角色，分别是博主，管理员和游客。三种角色的权限不同，博主和管理员能够查看所有注册账号，而只有博主能够发表博文，三种角色都可以修改个人信息。这权限管理是通过shiro框架进行控制的。
- 通过shiro框架，能够并发控制登录人数，后登录会顶替掉先登录的账号。同时启用了RememberMe功能，关闭浏览器下次再访问时无须再登录即可访问，但如修改个人信息等重要操作上还需进行身份认证。
