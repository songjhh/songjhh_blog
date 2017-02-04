<%--
  Created by IntelliJ IDEA.
  User: song9
  Date: 2016/12/30
  Time: 21:27
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
    <title>Setting</title>
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
            <c:if test="${errormessage!=null}">
                <div class="alert alert-danger">
                        ${errormessage}
                </div>
            </c:if>
            <form action="${pageContext.request.contextPath }/user/update" method="post">
                <input type="hidden" name="id" value="${user.id}"/>
                <div class="form-group">
                    <label>userName:</label>
                    <caption>${user.username}</caption>
                </div>
                <div class="form-group">
                    <label>email:</label>
                    <input class="form-control" type="text" name="email" value="${user.email}">
                </div>
                <div class="form-group">
                    <label>sex:</label>
                    <div class="radio">
                        <label>
                            <input type="radio" name="sex" id="optionsRadios1" value="male" checked> male
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="sex" id="optionsRadios2" value="female">female
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <input type="submit" value="update"/>
                </div>
            </form>
        </div>
    </div>
</div>

<form action="${pageContext.request.contextPath }/user/update" method="post">
    ${errormessage}<br/>
        <input type="hidden" name="id" value="${user.id}"/>
    userName:${user.username }<br/>
    email:<input class="userinput" type="text" name="email" value="${user.email}"><br/>
    sex:<input class="userinput" type="radio" name="sex" value="male" checked>male
    <input class="userinput" type="radio" name="sex" value="female">female<br/>
    <input type="submit" value="update"/>
</form>

</body>
</html>
