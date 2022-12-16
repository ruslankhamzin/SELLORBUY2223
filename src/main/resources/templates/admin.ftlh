<!DOCTYPE html>
<html>
<head>
    <title>SELLORBUY</title>
</head>
<body>
<h1><a href="/">SELLORBUY</a></h1>
<hr>
<h4>Панель администратора</h4>
<table>
    <tr>
        <th>Email</th>
        <th>Номер телефона</th>
        <th>Активность</th>
        <th>Роли</th>
        <th>Бан</th>
        <th>Редактирование</th>
        <th>Подробная информация</th>
    </tr>
    <#list  users as user>
        <tr>
            <th>${user.email}</th>
            <th>${user.numberPhone}</th>
            <th><#if user.active>true<#else>false</#if></th>
            <th><#list user.roles as role>${role}</#list></th>
            <th>
                <form action="/admin/user/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Бан">
                </form>
            </th>
            <th><a href="/admin/user/edit/${user.id}">Редактирование</a></th>
            <th><a href="/user/${user.id}"> Подробная информация </a></th>
        </tr>
    <#else>
        <h3>Пользователей нет</h3>

    </#list>
</table>

    <form action="/newRole" method="post">
    Название роли: <input type="text" name="name"><br><br>
    Доступ к панели администратора <input type = "checkbox" name ="check"<br><br>
    Доступ к созданию новых пользователей <input type = "checkbox" name ="create"<br><br>
    Доступ к редактированию пользователей <input type = "checkbox" name ="edit"<br><br>
    Дата старта <input type = "date" name ="datestart"<br><br>
    Дата конца <input type = "date" name ="dateend"<br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Создать"/>
    </form>

</body>
</html>