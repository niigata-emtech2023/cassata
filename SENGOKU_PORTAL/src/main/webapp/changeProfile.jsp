<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プロフィール変更</title>
</head>
<body>
    <jsp:useBean id="" class="model.entity.UserBean" scope="session" />
    <form action="" method="POST">
    ニックネーム：<input type="text" name="nickname" 
    	value="<jsp:getPropaty name="" property="nickname" />"><br>
    ユーザーID：<input type="text" name="ID" 
    	value="<jsp:getPropaty name="" property="ID" />"><br>
    パスワード：<input type="password" name="password" 
    	value="<jsp:getPropaty name="" property="password" />"><br>
    自己紹介：<input type="password" name="password" 
    	value="<jsp:getPropaty name="" property="password" />"><br>
    性別：
    生年月日：
    推しの武将：
    アイコン：
    出身地：
    <input type="submit" value="変更する">
    </form>
</body>
</html>