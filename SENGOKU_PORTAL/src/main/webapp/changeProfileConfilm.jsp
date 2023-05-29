<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プロフィール変更確認</title>
</head>
<body>
	<!--ProfileChangeSendServlet-->
    <%
        request.setCharacterEncoding("UTF-8");
    %>
    
    顔写真：<%request.getParameter("busho_img"); %><br>
    ニックネーム：<%request.getParameter("nickname"); %><br>
    ID：<%request.getParameter("user_id"); %><br>
    パスワード：<%request.getParameter("password"); %><br>
    自己紹介：<%request.getParameter("myself"); %><br>
    性別：<%request.getParameter("gender"); %><br>
    生年月日：<%request.getParameter("birth_date"); %><br>
    推しの武将：<%request.getParameter("busho_id"); %><br>
    出身地：<%request.getParameter("area"); %><br>
    以上の内容でよろしいですか
    
    <form action="ChangeProfileServlet" method="POST">
    <input type="submit" value="変更する">
    </form>

</body>
</html>