<%--
  Created by IntelliJ IDEA.
  User: song9
  Date: 2016/12/30
  Time: 9:55
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
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
</head>
<body>

<div id="container">
    <%@ include file="../module/top-col.jsp"%>
    <%@ include file="../module/left-col.jsp"%>

    <div id="mid-col">
        <div class="body-wrap">
            <c:if test="${errorMsg!=null}">
                <div class="alert alert-danger">
                        ${errorMsg}
                </div>
            </c:if>
            <form action="${pageContext.request.contextPath }/user/login" method="post">
                <div class="form-group">
                    <label>userName:</label>
                    <input class="form-control" type="text" name="username" value="${user.username }"/><br/>
                </div>
                <div class="form-group">
                    <label>password:</label>
                    <input class="form-control" type="password" name="password" value="${user.password }"><br/>
                </div>
                <input type="submit" value="login"/>
            </form>
        </div>
    </div>
</div>

</body>
</html>
