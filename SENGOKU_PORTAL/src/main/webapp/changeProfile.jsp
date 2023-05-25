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
    	value="<jsp:getPropaty name="user" property="nickname" />"><br>
    ユーザーID：<input type="text" name="user_id" 
    	value="<jsp:getPropaty name="user" property="user_id" />"><br>
    パスワード：<input type="password" name="password" 
    	value="<jsp:getPropaty name="user" property="password" />"><br>
    自己紹介：<input type="text" name="myself" 
    	value="<jsp:getPropaty name="user" property="myself" />"><br>
    性別：<input type="radio" name="gender" 
    	value="<jsp:getPropaty name="user" property="gender" />"><br>
    生年月日：<input type="text" name="birth_date" 
    	value="<jsp:getPropaty name="user" property="birth_date" />"><br>
    推しの武将：
    アイコン：
    出身地：<input type="text" name="area" 
    	value="<jsp:getPropaty name="user" property="area" />"><br>
    <input type="submit" value="変更する">
    </form>
</body>
</html>