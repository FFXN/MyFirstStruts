<%--
  Created by IntelliJ IDEA.
  User: 15651873068
  Date: 2019-7-21
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>showAllUser</title>
</head>
<body>
    姓名：<s:property value="users[0].userName"/>
    <table border="1px">
        <tr>
            <th>username</th>
            <th>password</th>
        </tr>
        
        <%--<s:iterator value="users" var="user" status="status">--%>
        <s:iterator value="#request.users" >
            <tr>
                <td><s:property value="userName" /></td>
                <td><s:property value="password"/></td>
            </tr>
        </s:iterator>
    </table>
</body>
</html>
