<%--
  Created by IntelliJ IDEA.
  User: hotch
  Date: 2024/6/30
  Time: 下午11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8"%>
<link rel="stylesheet" type="text/css" href="assets/menu.css"/>
<div id="sidebar" class="side-bar-container">
    <div id="side-bar-title">
        新闻管理
    </div>
    <ul id="side-bar-menu">
        <li id="editNews">发布新闻</li>
        <li id="manageNews">管理新闻</li>
    </ul>
</div>

<script>
    function setSideMenuSelectedById(index){
        var chd = $('#side-bar-menu').children();
        chd.eq(index).prop("class", "side-bar-menu-selected");
        chd.not(chd.eq(index)).prop("class", "");
    }

    $('#editNews').click(()=>{
        window.location.replace('${pageContext.request.contextPath}/admin?op=add');
    });

    $('#manageNews').click(()=>{
        window.location.replace('${pageContext.request.contextPath}/admin?op=manage');
    });
</script>

