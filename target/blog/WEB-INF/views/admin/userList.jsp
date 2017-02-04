<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%--
  Created by IntelliJ IDEA.
  User: song9
  Date: 2017/1/4
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/bootstrap-markdown/2.10.0/css/bootstrap-markdown.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/pagination.css" rel="stylesheet">

    <script src="//cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap-markdown/2.10.0/js/bootstrap-markdown.js"></script>
    <script src="//cdn.bootcss.com/markdown.js/0.5.0/markdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>

    <script type="text/javascript">
        function queryItems() {
            //提交form
            document.userForm.action = "${pageContext.request.contextPath}/admin/checkUserList";
            document.userForm.submit();
        }
    </script>

</head>
<body>

<div id="container">
    <%@ include file="../module/top-col.jsp"%>
    <%@ include file="../module/left-col.jsp"%>

    <div id="mid-col">
        <div class="body-wrap">
            <form name="userForm" action="${pageContext.request.contextPath}/admin/checkUserList" method="post">
                <table class="table">
                    <caption>查询条件：</caption>
                    <tr>
                        <td>账号名称：<input name="userCustom.username"></td>
                        <td><input type="button" value="查询" onclick="queryItems()"/></td>
                    </tr>
                </table>

                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>选择</th>
                        <th>用户名</th>
                        <th>创建时间</th>
                        <th>最后登录时间</th>
                        <th>邮箱</th>
                        <th>性别</th>
                        <th>是否被锁</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${userList}" var="user">
                    <tr>
                        <td><input type="checkbox" name="userId" value="${user.id}"/></td>
                        <td>${user.username}</td>
                        <td>${user.createtime}</td>
                        <td>${user.lasttime}</td>
                        <td>${user.email}</td>
                        <td>${user.sex}</td>
                        <td>${user.locked}</td>
                            <%--<td><a href="${pageContext.request.contextPath }/items/editItems?id=${item.id}">修改</a></td>--%>
                        <td><a href="${pageContext.request.contextPath}/items/${user.id}">修改</a> </td>
                    </tr>
                    </c:forEach>
                </table>
            </form>

        </div>
    </div>
</div>
</body>
</html>
