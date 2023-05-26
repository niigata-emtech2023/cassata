<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プロフィール変更確認（管理者専用画面）</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
    
    <jsp:useBean id="user" class="model.entity.UserBean" scope="session" />
    <form action="" method="POST">
    
    <jsp:getProperty name="user" property="nickname" />
    <jsp:setProperty name="user" property="user_id" />
    <jsp:setProperty name="user" property="password" />
    <jsp:setProperty name="user" property="myself" />
    <jsp:setProperty name="user" property="gender" />
    <jsp:setProperty name="user" property="birth_date" />
    <jsp:setProperty name="user" property="busho_id" />
    
    <jsp:getProperty name="user" property="area" />
    
    ニックネーム：<jsp:getProperty name="user" property="nickname" />"><br>
    ユーザーID：<jsp:getProperty name="user" property="user_id" />"><br>
    パスワード：<jsp:getProperty name="user" property="password" />"><br>
    自己紹介：<jsp:getProperty name="user" property="myself" />"><br>
    性別：<jsp:getProperty name="user" property="gender" />"><br>
    生年月日：<jsp:getProperty name="user" property="birth_date" />"><br>
    推しの武将：<jsp:getProperty name="user" property="busho_id" />"><br>
    アイコン：
    出身地：<jsp:getProperty name="user" property="area" />"><br>
    以上の内容でよろしいですか
    <input type="submit" value="変更する">
    </form>

</body>
</html>