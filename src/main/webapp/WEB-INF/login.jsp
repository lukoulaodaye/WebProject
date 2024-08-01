<%--
  Created by IntelliJ IDEA.
  User: hotch
  Date: 2024/6/30
  Time: 上午10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<link rel="stylesheet" type="text/css" href="assets/layout.css"/>
<html>
<head>
    <link rel="stylesheet" href="resources/css/common.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <title>登录</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="assets/sha.js"></script>
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

<div class="layout">
    <div class="login-container">
        <h2>登录</h2>
        <div class="login-row">
            <label>用户名<input id="username" name="username" type="text" class="login-textbox" placeholder="admin"></label>
        </div>
        <div style="height: 5px"></div>
        <div class="login-row">
            <label>密码&nbsp  <input id="password" name="password" type="password" class="login-textbox" placeholder="admin"></label>
        </div>
        <div style="height: 15px"></div>
        <div class="login-button" id="submit-login">
            登录
        </div>
    </div>
</div>
<%--<div class="layout">--%>
<%--    <div class="login-container">--%>
<%--        <div class="login-row">--%>
<%--            <label>用户名<input id="username" name="username" type="text" class="login-textbox"></label>--%>
<%--        </div>--%>
<%--        <div style="height: 5px"></div>--%>
<%--        <div class="login-row">--%>
<%--            <label>密码<input id="password" name="password" type="password" class="login-textbox"></label>--%>
<%--        </div>--%>
<%--        <div style="height: 15px"></div>--%>
<%--        <div class="login-button" id="submit-login">--%>
<%--            登录--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
</body>
<script>
    $("#submit-login").click(() => {
        const hash = sha256ToBase64($("#password").val())
        var data = "username=" + $("#username").val() + "&password=" + hash;
        $.ajax({
            type: 'post',
            url: document.URL,
            data: data,
            complete: function (XMLHttpRequest) {
                // 通过xhr取得响应头
                const REDIRECT = XMLHttpRequest.getResponseHeader("REDIRECT");
                //如果响应头中包含 REDIRECT 则说明是我们需要进行重定向的
                if (REDIRECT === "REDIRECT") {
                    window.location.href = XMLHttpRequest.getResponseHeader("CONTEXTPATH");
                }
            }
        })
    })

    function sha256ToBase64(str) {
        // 创建jsSHA对象
        const shaObj = new jsSHA("SHA-256", "TEXT");

        // 更新SHA-256哈希内容
        shaObj.update(str);

        // 计算哈希值并转换为Base64字符串
        return shaObj.getHash("B64");
    }

</script>
<style>
    .login-container {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 360px;
        height: 400px;
        padding: 0 20px;
        background-color: #fff;
        box-shadow: 8px 2px 8px rgba(0, 0, 0, 0.2);
        transform: translate(-50%,-50%);
        border-radius: 8px;
    }
    .login-container h2{
        margin: 70px 0 40px;
        text-align: center;
    }
    .login-container label,
    .login-container input{
        display: inline-block;
    }

    .login-container label{
        width: 280px;
        text-align: right;
    }

    .login-container input{
        width: 70%;
        height: 30px;
        outline: none;
        border: 2px solid #18356e;
    }
    .login-textbox {
        border-radius: 4px;
        border: solid 1px lightgray;
        float: right;
        font-size: 1.2em;
        outline: none;
    }
    .login-row{
        margin-bottom: 10px;
    }

    .login-row input{
        padding-left: 5px;
        box-sizing: border-box;
    }

    .login-row input:hover{
        border: 4px solid #18356e;
    }

    .login-button{
        margin: 40px 0;
        text-align: center;
    }

    .login-button input{
        width: 120px;
        color: #fff;
        cursor: pointer;
        background-color: #18356e;
    }

    .login-button input:hover{
        background-color: #173562;
    }

    .login-button input:first-child{
        margin-right: 20px;
    }

    .login-row{
        label {
            font-size: 1.2em;
        }

        margin: 10px;
        display: block;
    }

    .login-button {
        margin: auto;
        border-radius: 5px;
        border: solid 1px lightgray;
        padding: 10px;
        width: 70px;
        text-align: center;
        user-select: none;
        display: block;

    }


    .login-button:hover {
        background: #1b3b77;
        color: white;
        cursor: pointer;
        border: solid 1px white;
    }
</style>
</html>
