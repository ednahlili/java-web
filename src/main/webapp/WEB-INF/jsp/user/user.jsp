<%@ page language="java"  pageEncoding="UTF-8"%>
<%@include file="../public.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>用户</title>
</head>
<body>

<table>
<c:forEach items="${users }" var="user">
 <tr>
 <td>${user.username }</td> <td>${user.sex }</td><td>${user.age }</td>
 </tr>
</c:forEach>
</table>
</body>
</html>