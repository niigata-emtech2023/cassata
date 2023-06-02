<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将一覧（管理者専用画面）</title>
<link rel="icon" href="images/favicon.ico" id="favicon">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/main-jsp.css">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/busholist.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
	rel="stylesheet">
</head>
<body class="busho-list-body">
	<!-- ShowBushoListServlet  -->
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="busho" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="busho" />
	</jsp:include>
	
	<!--  <div class="jsp-main-contents">-->
	<div class="jsp-main-contents">
		
	    	<%
			List<BushoBean> bushoList
				= (List<BushoBean>) request.getAttribute("bushoList");
			%>
			<div class="bushoListFromHead">
				<div class="bushoHeadForm bushoflex">
					<form action="BushoListSortServlet" method="POST">
					<label class="selectbox-003">
						<select name="sort">
							<option value="period_id">年代順</option>
							<option value="birth_date">生年月日順</option>
						</select>
					</label>
					<label class="selectbox-003">
						<select name="order">
							<option value="ASC">昇順</option>
							<option value="DESC">降順</option>
						</select>
					</label>
						<input class="formButton sortButton" type="submit" value="ソート">
					</form>
				</div>
				<div class="busholistheadtext bushoflex">
					武将一覧
				</div>
				<div class="bushoHeadAdd bushoflex">
					<form action="bushoInsert.jsp">
						<input class="formButton" type="submit" value="追加">
					</form>
				</div>
			</div>

		<div class="bushoList-contents">
			<%
				for (BushoBean busho : bushoList) {
			%>
				<div class="busho-box">
					<div class="busho-header-contents">
						<div class="busho-header-list">
							<img src="<%=busho.getBushoImg()%>" class="busho-img" alt="武将の画像">
							<span class="busho-name"><%=busho.getBushoName()%></span>
							<span class="busho-period"><%=busho.getPeriodName()%>時代</span>
							<span class="busho-birthDate"><%=busho.getBirthDate()%>生</span>
						</div>
						<div class="busho-button-list">
							<form action="BushoChangeSendServlet" method="POST">
								<input type="hidden" name="busho_id" value="<%=busho.getBushoID()%>">
								<input class="formButton" type="submit" value="変更">
							</form>
					
					
							<form action="DeleteBushoSendServlet" method="POST">
								<input type="hidden" name="busho_id" value="<%=busho.getBushoID()%>">
								<input class="formButton Right" type="submit" value="削除">
							</form>
						</div>
					</div>
					<div class="busho-footer-contents">
						<%=busho.getCommentary() %>
					</div>
				</div>
			<%
				}
			%>
			
		</div>
	</div>

</body>
</html>