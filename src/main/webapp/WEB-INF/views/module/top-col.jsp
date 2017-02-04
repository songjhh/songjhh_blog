<%--
  Created by IntelliJ IDEA.
  User: song9
  Date: 2017/1/15
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
                        <li><a href="javascript:void(0)">我的信息</a></li>
                        <li class="dropdown">
                            <a href="##" data-toggle="dropdown" class="dropdown-toggle">设置<span
                                    class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/setting/<shiro:principal/>">设置个人信息</a>
                                </li>
                                <li><a href="javascript:void(0)">修改密码</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/logout">登出</a></li>
                            </ul>
                        </li>
                        <shiro:hasRole name="blogger">
                            <li class="dropdown">
                                <a href="##" data-toggle="dropdown" class="dropdown-toggle">我的控制<span
                                        class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/admin">控制</a></li>
                                    <li><a href="${pageContext.request.contextPath}/blog/write">写文章</a></li>
                                </ul>
                            </li>
                        </shiro:hasRole>
                    </ul>
                </div>
            </shiro:user>
        </div>
    </div>
