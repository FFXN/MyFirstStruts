<%--
  Created by IntelliJ IDEA.
  User: 15651873068
  Date: 2019-7-21
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add user</title>
</head>
<body>
    <br action="test/user.action" method="post">
        <input type="hidden" name="method:add">
        username:<input type="text" name="username"><br/>
        password:<input type="text" name="password"><br/>
        age:<input type="text" name="age"><br/>
    <input type="submit" name="submit" value="添加用户">
    </form>
</body>
</html>
