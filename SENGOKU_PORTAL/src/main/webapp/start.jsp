<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>トップページを表示</title>
</head>
<body>
<form name="postTop" action="ShowTopPageServlet" method="POST">
<input type="hidden" name="valname1" value="val1">
<script language="JavaScript">document.postTop.submit();</script>
</body>
</html>