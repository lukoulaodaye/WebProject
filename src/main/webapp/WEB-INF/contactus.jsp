<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <c:url var="base" value="/"/>
    <base href="${base}">
    <link rel="stylesheet" href="resources/css/common.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <meta charset="UTF-8">
    <title>计控学院（软件工程）</title>
</head>
<body>

<div class="top">
    <ul class="loginbar clearboth container">
        <li><a href="index">
            <img src="resources/images/logodouble.png" alt="东北林业大学计算机与控制工程学院">
        </a></li>
        <li>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="login">管理</a></li>
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
<div class="contactus-banner clear"></div>
<div class="container">
    <div class="column-title">
        <h3>联系我们</h3>
    </div>
    <ul class="email-box">
        <li>邮箱：zsb@nefu.edu.cn</li>
        <li>电话：0451-82190346</li>
        <li>软工专业办公室：0451-82192243</li>
        <li>邮政编码：150040</li>
        <li>地址：黑龙江省哈尔滨市香坊区和兴路26号</li>
        <li><a href="mailto:zsb@nefu.edu.cn">点击此处发送email</a></li>
    </ul>
    <div class="column-title">
        <h3>留言中心</h3>
    </div>
    <form action="" class="leave-message">
        <div class="userbar flexbox">
            <div class="username"><label for="username">姓名：</label><input type="text" id="username"></div>
            <div class="userphone"><label for="userphone">电话：</label><input type="tel" id="userphone"></div>
        </div>
        <div class="useremail">
            <label for="useremail">邮箱：</label><input type="email" id="usermail">
        </div>
        <div class="mesagebar">
            <label for="usermessage">留言：</label><textarea name="usermessage" id="usermessage"></textarea>
        </div>
        <div class="submitbar">
            <input type="submit" value="提交">
            <input type="reset" value="重置">
        </div>
    </form>
</div>
<div class="copyright">
    版权所有 © 2024 东北林业大学计算机与控制工程学院->李建龙
</div>
</body>

</html>