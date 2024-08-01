<%@ page import="entity.News" %><%--
  Created by IntelliJ IDEA.
  User: hotch
  Date: 2024/7/1
  Time: 上午12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<jsp:useBean id="news" scope="request" type="java.util.List<entity.News>"/>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <c:url var="base" value="/"/>
    <base href="${base}">
    <link rel="stylesheet" href="resources/css/common.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <title>管理新闻</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

<div class="top">
    <ul class="loginbar clearboth container">
        <li><a href="index">
            <img src="resources/images/logodouble.png" alt="东北林业大学计算机与控制工程学院">
        </a></li>
        <li>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="admin">管理</a></li>
        <li><a href="login">登录</a></li>
    </ul>
</div>
<div id="header">
    <ul class="nav clearboth container">
        <li><a href="index">首页</a></li>
        <li><a href="role_intro">师资队伍</a></li>
        <li><a href="atlas">学科建设</a></li>
        <li><a href="video">招生视频</a></li>
        <li><a href="recentNews">学院新闻</a></li>
        <li><a href="contactus">联系我们</a></li>
    </ul>
</div>
<br>
<h2>管理后台</h2>
<hr/>
<div>
    <%@include file="../news-sidebar.jsp" %>
    <div id="add-content" class="content-container">
        <div>
            <table class="news-list">

                <colgroup>
                    <col span="1" style="width: 70px"/>
                    <col span="1" style="width: calc((100% - 345px) * 0.5)"/>
                    <col span="1" style="width: 100px"/>
                    <col span="1" style="width: calc((100% - 345px) * 0.5)"/>
                    <col span="1" style="width: 175px"/>
                </colgroup>
                <thead>
                <tr>
                    <td>序号</td>
                    <td>新闻标题</td>
                    <td>发布时间</td>
                    <td>内容</td>
                    <td>操作</td>
                </tr>
                </thead>

                <tbody>

                <%
                    for (News n : news) { %>
                <tr>
                    <td><%=n.getId()%>
                    </td>
                    <td><%=n.getTitle()%>
                    </td>
                    <td><%=n.getFormattedDateStr("yyyy-MM-dd")%>
                    </td>
                    <td class="n-td"><%=n.getBrief(35)%>
                    </td>
                    <td>
                        <div class="news-operation-safe">
                            <a href="${pageContext.request.contextPath}/news?id=<%=n.getId()%>" target="_blank">查看</a>
                        </div>
                        <div class="news-operation-safe">
                            <a href="${pageContext.request.contextPath}/admin?op=edit&id=<%=n.getId()%>">编辑</a>
                        </div>
                        <div class="news-operation-delete">
                            <a href="${pageContext.request.contextPath}/admin?op=delete&id=<%=n.getId()%>">删除</a>
                        </div>
                    </td>
                </tr>
                <%
                    } %>

                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<style>
    .content-container {
        margin-left: 310px;
        padding: 0;
        position: relative;
    }

    .news-operation-safe,
    .news-operation-delete {
        display: inline-block;
        border: solid 1px lightgray;
        padding: 5px;
        margin: 5px;
        border-radius: 4px;
        user-select: none;
        color: white;

        a {
            text-decoration: none;
            color: #333;
        }
    }

    .news-operation-safe:hover,
    .news-operation-delete:hover {
        cursor: pointer;
    }

    .news-operation-delete:hover {
        background-color: #22752f;
        color: white;

    }

    .news-operation-safe {
        border: solid 1px #18356e;
        background: white;
        color: black;
    }

    .news-operation-delete {
        background: white;
        color: black;
        transition: background-color, color 0.1s;
    }

    .news-list {
        border: solid 1px lightgray;
        border-radius: 5px;
        border-collapse: collapse;
        margin: 0 auto;
        width: 90%;

        tr:nth-child(even) {
            background: lightgray;
        }
    }

    .n-td {
        width: 50%;
        overflow: hidden;
        text-overflow: ellipsis;
    }
</style>
<script>
    $('#menu-admin').prop("class", "head-menu-selected");
    $(function () {
        setSideMenuSelectedById(1);
    })
</script>
<div class="copyright">
    版权所有 © 2024 东北林业大学计算机与控制工程学院->李建龙
</div>
</html>
