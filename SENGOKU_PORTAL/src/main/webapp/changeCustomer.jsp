<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プロフィール変更（管理者専用画面）</title>
</head>
<body>
    <jsp:useBean id="user" class="model.entity.UserBean" scope="session" />
    <form action="" method="POST">
    ニックネーム：<input type="text" name="nickname" 
    	value="<jsp:getProperty name="user" property="nickname" />"><br>
    ユーザーID：<input type="text" name="user_id" 
    	value="<jsp:getProperty name="user" property="user_id" />"><br>
    パスワード：<input type="password" name="password" 
    	value="<jsp:getProperty name="user" property="password" />"><br>
    自己紹介：<input type="text" name="myself" 
    	value="<jsp:getProperty name="user" property="myself" />"><br>
    性別：<input type="radio" name="gender" value="1">不明
          <input type="radio" name="gender" value="2">男性
          <input type="radio" name="gender" value="3">女性<br>
    生年月日：<input type="text" name="birth_date" 
    	value="<jsp:getPropery name="user" property="birth_date" />"><br>
    推しの武将：<input type="text" name="busho_id" 
    	value="<jsp:getPropaty name="user" property="busho_id" />"><br>
    アイコン：
    出身地：<input type="text" name="area" 
    	value="<jsp:getPropaty name="user" property="area" />"><br>
    <input type="submit" value="変更する">
    </form>
</body>
</html>