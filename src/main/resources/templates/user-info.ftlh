<!DOCTYPE html>
<html>
<head>
    <title>SELLORBUY</title>
</head>
<body>
<h1><a href="/">SELLORBUY</a></h1>
<hr>
<h3>Подробная информация о пользователе</h3>
<b>Номер телефона : </b> ${user.numberPhone}
<b>Электронная почта : </b> ${user.email}
<h4>Товары пользователя ${user.name}</h4>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее...</a></p>
    </div>
<#else>
    <h3>Товаров нет</h3>
</#list>

</body>
</html>