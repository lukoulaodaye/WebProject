<%@ page import="entity.News" %><%--
  Created by IntelliJ IDEA.
  User: hotch
  Date: 2024/6/30
  Time: 上午9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<jsp:useBean id="targetNews" scope="request" type="entity.News"/>
<jsp:useBean id="otherNews" scope="request" type="java.util.List<entity.News>"/>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title><%=targetNews.getTitle()%>
    </title>
    <c:url var="base" value="/"/>
    <base href="${base}">
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
<br>

<!--检视新闻-->
<div>
    <div class="news-container">
        <p class="news-title">
            <%=targetNews.getTitle()%>
        </p>
        <p class="news-time">
            <%=targetNews.getFormattedDateStr("yyyy年MM月dd日 HH:mm")%>
        </p>

        <%=targetNews.getContent()%>

    </div>

    <div class="r-col">
        <h2>往期新闻</h2>
        <% for (News n : otherNews) { %>
        <div class="r-col-news">
            <a href="${pageContext.request.contextPath}/news?id=<%=n.getId()%>">
                <div style="height: fit-content">
                    <label><%=n.getTitle()%>
                    </label>
                </div>
            </a>
        </div>
        <% } %>
    </div>
</div>
</body>
<style>
    .news-time {
        text-align: center;
        font-size: 0.5em;
        color: gray;
    }

    .news-title {
        text-align: center;
        font-size: 2em;
        font-weight: bold;
    }

    .news-container {
        position: relative;
        display: inline-block;
        left: 10%;
        width: 70%;
        padding: 20px;
        margin: auto;
    }

    .r-col {
        user-select: none;
        position: relative;
        display: inline-block;
        padding-left: 15px;
        border-left: solid 1px gray;
        float: right;
        width: 15%;
        min-height: 200px;
        height: fit-content;
        top: 300px;
        transition: all 100ms;
    }

    .r-col:hover{
        box-shadow: 5px 5px 5px lightgray;
    }

    .r-col-news {
        display: block;
        margin: 10px;

        a {
            text-decoration: none;
            color: #333;

            div{
                padding: 10px;
                transition: color 0.1s;
            }

            div:hover{
                color: #1b3b77;
            }
        }

        a div label:hover{
            cursor: pointer;

        }
    }

    .r-col-news:hover{

        border-radius: 4px;
        border: solid 1px lightgray;
        cursor: pointer;
    }

    img{
        max-width: 100%;
        height: auto!important;
        width: auto\9!important;
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
