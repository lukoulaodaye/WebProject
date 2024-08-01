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
<div class="container">
    <div class="column-title">
        <h3>在线视频</h3>
    </div>
    <div class="online-video">
        <a href="https://www.bilibili.com/video/BV1eG411R71b/?spm_id_from=333.337.search-card.all.click">哔哩哔哩</a>
        <a href="https://v.qq.com/x/page/y35149pqdkb.html">腾讯视频</a>
        <a href="https://www.bilibili.com/video/BV1QF411Q7Cs/?spm_id_from=333.999.0.0">芒果TV</a>
        <a href="https://www.bilibili.com/video/BV1QF411Q7Cs/?spm_id_from=333.999.0.0">爱奇艺</a>
        <a href="https://v.youku.com/v_show/id_XNjM5NjMwOTM1Mg==.html?playMode=pugv&frommaciku=1&false">优酷</a>
    </div>
    <div class="column-title">
        <h3>软工专业介绍</h3>
    </div>
    <div class="video-top flexbox">
        <div class="video-top-left">
            <video src="resources/video/video1.mp4" width="100%" height="100%" controls autoplay muted loop></video>
        </div>
        <div class="video-top-right column-text">
            <h2>专业介绍</h2>
            <h3>软件工程</h3>
            <p>软件工程是一门应用工程原则和方法来设计、开发和维护软件的学科。它涉及以下几个关键方面：<br>

                1. 需求分析：确定和理解用户需求。<br>
                2. 系统设计：设计软件的架构和组件。<br>
                3. 编码：编写实际的代码实现设计。<br>
                4. 测试：确保软件满足需求并修复缺陷。<br>
                5. 维护：在软件发布后进行更新和修复。<br>
                6. 项目管理：协调资源，确保按时按预算完成项目。<br>
                7. 质量保证：确保软件的可靠性和性能。<br>
                8. 伦理和法律问题：考虑软件对社会和个人的影响。
            </p>
        </div>
    </div>

    <br>
    <br>
    <br>
    <br><br><br><br><br>

</div>
<div class="copyright">
    版权所有 © 2024 东北林业大学计算机与控制工程学院->李建龙
</div>
</body>

</html>