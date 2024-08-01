<%@ page import="entity.News" %><%--
  Created by IntelliJ IDEA.
  User: hotch
  Date: 2024/7/11
  Time: 上午8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<jsp:useBean id="news" scope="request" type="java.util.List<entity.News>"/>
<jsp:useBean id="currentPage" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="totalPage" scope="request" type="java.lang.Integer"/>
<html>
<head>
    <title>计控学院（软件工程）</title>
    <link rel="stylesheet" href="resources/css/common.css">
    <link rel="stylesheet" href="resources/css/style.css">
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
<div class="news-list">
    <br>
    <h2>新闻动态</h2>
    <ul>
        <% for (News n : news) { %>
        <li class="news-item">
            <a href="${pageContext.request.contextPath}/news?id=<%=n.getId()%>" target="_blank">
                <div class="news-line">
                    <div class="time">
                        <strong><%=n.getFormattedDateStr("dd")%>
                        </strong>
                        <br/>
                        <span><%=n.getFormattedDateStr("yyyy-MM")%></span>
                    </div>
                    <div class="news-text">
                        <h4><%=n.getTitle()%>
                        </h4>
                        <p>
                            <%=n.getBrief(30)%>
                        </p>
                    </div>
                </div>
            </a>
        </li>
        <% } %>
    </ul>

    <div class="page-container">
        <%
            int left = Math.max(currentPage - 5, 1);
            int right = Math.min(currentPage + 5, totalPage);

            for (int i = left; i <= right; i++) { %>

        <span>
            <a href="${pageContext.request.contextPath}/recentNews?p=<%=i%>"
               class="<%=i==currentPage?"page-button-selected":"page-button"%>"><%=i%></a>
        </span>


        <% } %>
    </div>
</div>
</body>
<style>
    .news-list {
        width: 70%;
        margin: 0 auto;

        h2 {
            text-align: center;
        }

        ul {
            list-style: none;
            text-decoration: none;
            margin: 5px 0;

            li {

            }
        }

        a {
            text-decoration: none;
            color: #333;
        }
    }

    .news-line {


        .time {
            display: inline-block;
            width: 88px;
            height: 88px;
            border: solid 1px #1b3b77;

            strong {
                position: relative;
                display: block;
                width: 100%;
                text-align: center;
                font-size: 1.5em;
                color: white;
                background: #1b3b77;
            }

            span {
                display: block;
                width: 100%;
                text-align: center;
            }
        }

        .news-text {
            display: inline-block;
        }
    }

    .news-item {
        margin: 10px;
        padding: 5px;
        transition: background-color 100ms;
        border-radius: 5px;
    }

    .news-item:hover {
        background: lightgray;
        cursor: pointer;
    }

    .page-container {
        margin: 0 auto;
        display: block;
        text-align: center;
    }

    .page-button {
        display: inline-block;
        border-radius: 4px;
        border: none;
        background-color: lightgray;
        color: black;
        text-align: center;
        width: 60px;
        height: 30px;
    }

    .page-button-selected {
        display: inline-block;
        border: none;
        background-color: transparent;
        width: 60px;
        height: 30px;
        font-weight: bold;
    }
</style>
<script>
    $(function () {
        setHeaderMenuSelectedById(5);
    })

</script>
<div class="copyright">
    版权所有 © 2024 东北林业大学计算机与控制工程学院->李建龙
</div>
</html>
