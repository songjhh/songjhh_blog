<%--
  Created by IntelliJ IDEA.
  User: song9
  Date: 2017/1/13
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<html>
<head>
    <title>Write</title>
    <link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/bootstrap-markdown/2.10.0/css/bootstrap-markdown.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <script src="//cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap-markdown/2.10.0/js/bootstrap-markdown.js"></script>
    <script src="//cdn.bootcss.com/markdown.js/0.5.0/markdown.min.js"></script>
</head>
<body>

<div id="container">

    <div id="top-col">
        <div class="navbar navbar-inverse" style="margin-bottom: inherit;background: #575757;border: none">
            <div class="navbar-header">
                <a href="javascript:void(0)" class="navbar-brand">song</a>
            </div>
            <shiro:guest>
                <div style="float: right">
                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath}/user/login">登录</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/register">注册</a></li>
                    </ul>
                </div>
            </shiro:guest>
            <shiro:user>
                <div style="float: right">
                    <ul class="nav navbar-nav">
                        <li><a href="javascript:void(0)">[<shiro:principal/>]</a></li>
                        <li><a href="javascript:void(0)">我的信息</a> </li>
                        <li class="dropdown">
                            <a href="##" data-toggle="dropdown" class="dropdown-toggle">设置<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/user/setting/<shiro:principal/>">设置个人信息</a></li>
                                <li><a href="javascript:void(0)">修改密码</a></li>
                            </ul>
                        </li>
                        <shiro:hasRole name="blogger">
                            <li class="dropdown">
                                <a href="##" data-toggle="dropdown" class="dropdown-toggle">我的控制<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/admin">控制</a></li>
                                    <li><a href="${pageContext.request.contextPath}/blog/write">写文章</a></li>
                                    <li><a href="${pageContext.request.contextPath}/user/logout">登出</a></li>
                                </ul>
                            </li>
                        </shiro:hasRole>
                    </ul>
                </div>
            </shiro:user>
        </div>
    </div>

    <div id="left-col" >
        <div class="overlay"></div>
        <div class="intrude-less">
            <header id="header" class="inner">
                <a href="${pageContext.request.contextPath}" class="profilepic">
                    <img src="http://tva3.sinaimg.cn/crop.0.0.750.750.180/69f4eca0jw8fa118uqadsj20ku0kuab0.jpg">
                </a>
                <hgroup>
                    <h1 class="header-author"><a href="${pageContext.request.contextPath}">Songjhh</a></h1>
                </hgroup>
                <p class="header-subtitle">寻找意义</p>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="${pageContext.request.contextPath}">主页</a></li>
                    <li><a href="/instagram">相册</a></li>
                    <li><a href="/archives">资源</a></li>
                </ul>
                <nav class="header-smart-menu" id="tools-cols">
                    <div class="panel">
                        <a class="js-smart-menu" data-toggle="collapse"
                           data-parent="#tools-cols" href="#tools-wrap1">文章列表</a>
                        <div id="tools-wrap1" class="collapse"></div>

                        <a class="js-smart-menu" data-toggle="collapse"
                           data-parent="#tools-cols" href="#tools-wrap2">标签</a>
                        <div id="tools-wrap2" class="collapse"></div>

                        <a class="js-smart-menu" data-toggle="collapse"
                           data-parent="#tools-cols" href="#tools-wrap3">关于我</a>
                        <div id="tools-wrap3" class="collapse"></div>
                    </div>
                </nav>
                <div class="header-nav">
                    <div class="social">
                        <a class="glyphicon glyphicon-envelope " style="font-size: xx-large;margin-right: 10px;" target="_blank"
                           href="mailto:songjhh0312@gmail.com" data-toggle="tooltip" title="email"></a>
                        <a class="glyphicon glyphicon-cloud" style="font-size: xx-large;margin-right: 10px;" target="_blank"
                           href="github.com/songjhh" data-toggle="tooltip" title="github"></a>
                        <a class="glyphicon glyphicon-book" style="font-size: xx-large" target="_blank"
                           href="javascript:void(0)" data-toggle="tooltip" title="book"></a>
                    </div>
                </div>
            </header>
        </div>
    </div>

    <%--    <div id="tools-col">
            <div class="tools-wrap">
                <select class="tools-section tools-section-me chose">
                    <div class="aboutme-wrap" id="js-aboutme">
                        Raysmond<br><br>
                        九一摩羯，生性矛盾<br>
                        熱愛運動，追求自我<br>
                        混跡魔都，卖碼為生
                    </div>
                </select>
            </div>
        </div>--%>

    <div id="mid-col">
        <div class="body-wrap">
            <div class="article-inner">
                <form action="${pageContext.request.contextPath}/blog/submit" method="post">
                    <input name="title" class="form-control" type="text" placeholder="请输入标题" />
                    <textarea name="text" data-provide="markdown" rows="30"></textarea>
                    <div style="float: right">
                        <label>
                            <input type="checkbox" value="1" name="locked"> 私人
                        </label>
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>
                </form>
            </div>
        </div>

    </div>

</div>

</body>
</html>
