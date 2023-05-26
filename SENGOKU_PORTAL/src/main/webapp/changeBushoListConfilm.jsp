<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の変更確認（管理者専用画面）</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
    
    <jsp:useBean id="busho" class="model.entity.BushoBean" scope="session" />
    
    <jsp:getProperty name="busho" property="image" />
    <jsp:setProperty name="busho" property="bushoName" />
    <jsp:setProperty name="busho" property="period_id" />
    <jsp:setProperty name="busho" property="birth_date" />
    <jsp:setProperty name="busho" property="commentary" />
    
    顔写真：<input type="" name="image" /><br>
    名前：<input type="text" name="bushoName" /><br>
    年代：<input type="" name="period_id" /><br>
    生年月日：<input type="" name="birth_date" /><br>
    説明文：<input type="text" name="commentary" /><br>
    以上の内容でよろしいですか
    
    <form action="" method="POST">
    <input type="submit" value="変更する">
    </form>

</body>
</html>