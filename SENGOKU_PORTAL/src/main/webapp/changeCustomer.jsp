<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プロフィール変更（管理者専用画面）</title>
</head>
<body>
    <jsp:useBean id="user" class="model.entity.UserBean" scope="session" />
    <form action="changeCustomerConfilm.jsp" method="POST">
    顔写真：
    ニックネーム：<input type="text" name="nickname" ><br>
    ID：<input type="text" name="user_id" ><br>
    パスワード：<input type="password" name="password" ><br>
    自己紹介：<input type="text" name="myself" ><br>
    性別：<input type="radio" name="gender" value="1">不明
          <input type="radio" name="gender" value="2">男性
          <input type="radio" name="gender" value="3">女性<br>
    生年月日：<input type="text" name="birth_date" ><br>
    推しの武将：<input type="text" name="busho_id" ><br>
    出身地：<input type="text" name="area" ><br>
    <input type="submit" value="変更する">
    </form>
</body>
</html>