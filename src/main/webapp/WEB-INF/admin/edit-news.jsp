<%@ page import="entity.News" %><%--
  Created by IntelliJ IDEA.
  User: hotch
  Date: 2024/6/30
  Time: 下午12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<jsp:useBean id="id" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="mode" scope="request" type="java.lang.String"/>
<jsp:useBean id="editNews" scope="request" type="entity.News"/>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <c:url var="base" value="/"/>
    <base href="${base}">
    <link rel="stylesheet" href="resources/css/common.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <title>编辑新闻</title>
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
        <form method="post" action="admin">
            <input name="op" value="<%=mode%>" type="hidden">
            <input name="id" value="<%=id%>" type="hidden">
            <div id="title-row" class="news-row">
                <label>新闻标题 <input type="text" name="title" id="title" class="news-textbox"
                    <% if(!editNews.equals(News.placeholder)) { %>
                                       value="<%=editNews.getTitle()%>"
                    <% } %>
                ></label>
            </div>
            <div id="time-row" class="news-row">
                <label>发布时间 <input type="datetime-local" name="publishDate"
                    <% if(!editNews.equals(News.placeholder)) { %>
                                       value="<%=editNews.getDateControlStr()%>"
                    <% } %>
                ></label>
            </div>
            <div id="content-row" class="news-row">
                <label>新闻内容 <textarea name="content" id="content"
                                          class="news-textbox article-box"

                ><%=!editNews.equals(News.placeholder) ? editNews.getRichText().toFormatString() : ""%></textarea></label>
            </div>
            <p>当前支持的格式在下面已列出，每种类别独占一行以便于识别：</p>

            <p>段落：以 "p:" 开始，紧接着是段落文本，表示为一个文本段落;</p>
            <p>图片：以"img:"开始，后面跟随图片的URL链接，表示为一个图像展示。</p>
            <div id="submit" class="news-row">
                <button type="submit" class="submit-button">提交</button>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    $('#menu-admin').prop("class", "head-menu-selected");
    $(function () {
        setSideMenuSelectedById(0);
    })
</script>
<style>
    .content-container {
        display: inline-block;
        margin: 0 300px;
        padding: 0;
        position: relative;


    }

    .news-textbox {
        border-radius: 4px;
        border: solid 1px lightgray;

        font-size: 1.2em;
        outline: none;
    }

    .news-row {
        margin: 10px;
        display: block;
    }

    .article-box {
        width: 700px;
        height: 300px;
        resize: none;
    }

    .submit-button {
        margin: auto;
        border-radius: 5px;
        border: solid 1px lightgray;
        padding: 10px;
        width: 70px;
        text-align: center;
        user-select: none;
        display: block;

    }
    .submit-button :hover{
        cursor: pointer;
    }


</style>
<div class="copyright">
    版权所有 © 2024 东北林业大学计算机与控制工程学院->李建龙
</div>
</html>
