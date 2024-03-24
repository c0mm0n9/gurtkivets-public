<html>

<head>
  <title>Головна</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>


<div class="main-menu">
    <div>

        <a class="active" href="/">Головна</a>
        <sec:authorize access="hasRole('ROLE_USER')">
            <a href="/account">Панель Акаунта</a>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <a href="/admin">Адмін панель</a>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_STAFF')">
            <a href="/employee">Панель працівника</a>
        </sec:authorize>
        <a href="/contests">Змагання</a>
    </div>
    <div>
        <sec:authorize access="isAuthenticated()">
            <a>Вітаємо: ${pageContext.request.userPrincipal.name}</a>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            <a href="/login">Увійти</a>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            <a href="/registration">Зареєструватися</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <a href="/logout">Вийти</a>
        </sec:authorize>
    </div>
</div>

<script>
    var navProto = Object.create(HTMLElement.prototype);
    var navDoc = document.currentScript.ownerDocument;
    navProto.createdCallback = function() {
        var shadow = this.createShadowRoot();
        var nav = navDoc.querySelector('nav');
        var clone = document.importNode(nav, true);
        shadow.appendChild(clone);
    };
    document.registerElement('my-nav', { prototype: navProto });
</script>

</html>