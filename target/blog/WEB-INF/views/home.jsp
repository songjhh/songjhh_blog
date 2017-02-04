<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<html>
<head>
    <title>home page</title>
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
        $(document).ready(function() {
            $.ajax({
                type:'post',
                url:'${pageContext.request.contextPath}/getblog',
//                contentType:'application/html;charset=utf-8',
                data:null,
                success:test
            })
        });
        function test(data) {
            var i = 0;
            $('.body-wrap div p').each(function () {
                $(this).html(markdown.toHTML(data[i].text));
                i++;
            });
        }
    </script>

<%--    <script type="text/javascript">
        $(function(){
            //此demo通过Ajax加载分页元素
            var initPagination = function() {
                var num_entries = $("#hiddenresult div.result").length;
                // 创建分页
                $("#Pagination").pagination(num_entries, {
                    num_edge_entries: 1, //边缘页数
                    num_display_entries: 4, //主体页数
                    callback: pageselectCallback,
                    items_per_page: 2, //每页显示1项
                    prev_text: "前一页",
                    next_text: "后一页"
                });
            };

            function pageselectCallback(page_index, jq){
                var new_content = $("#hiddenresult div.result:eq("+page_index+")").clone();
                $("#Searchresult").empty().append(new_content); //装载对应分页的内容
                return false;
            }
            //ajax加载
            $("#hiddenresult").load("load.html", null, initPagination);
        });
    </script>--%>
                <%--$("div").children(".body-wrap p").html(markdown.toHTML( $("div").children(".body-wrap .tttt").val()));$('.text').val()--%>

</head>
<body>
<div id="container">

    <%@ include file="module/top-col.jsp"%>
    <%@ include file="module/left-col.jsp"%>
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
    <%--
    <script>
        function t() {
        var markdown = require("markdown").markdown;
            $('#uuu').html(markdown.toHTML(content));
        }
    </script>
    --%>
    <div id="mid-col">
        <div class="body-wrap">
            <c:forEach items="${blogs}" var="blog">
                <div class="article-inner ${blog.title}">
                    <header class="article-header">
                        <h2>${blog.title}</h2>
                    </header>
                    <div class="details">
                        <p class="text-left"></p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
