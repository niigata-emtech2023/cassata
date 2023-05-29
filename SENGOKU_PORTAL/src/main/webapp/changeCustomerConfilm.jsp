<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.UserBean"%>
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
    
    顔写真：<%= request.getAttribute("busho_img") %><br>
    ニックネーム：<%= request.getAttribute("nickname") %><br>
    ID：<%= request.getAttribute("user_id") %><br>
    パスワード：<%= request.getAttribute("password") %><br>
    自己紹介：<%= request.getAttribute("myself") %><br>
    性別：<%= request.getAttribute("gender") %><br>
    生年月日：<%= request.getAttribute("birth_date") %><br>
    推しの武将：<%= request.getAttribute("busho_id") %><br>
    出身地：<%= request.getAttribute("area") %><br>
    以上の内容でよろしいですか
    
    <form action="ChangeCustomerServlet" method="POST">
    	<input type="submit" value="確定">
    </form>
    <form action="changeCustomer.jsp" method="POST">
    	<input type="submit" value="修正する">
    </form>

</body>
</html>