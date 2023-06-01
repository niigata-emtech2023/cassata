<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean, model.entity.PeriodBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の変更（管理者専用画面）</title>
<link rel="icon" href="images/favicon.ico" id="favicon">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/main-jsp.css">
<link rel="stylesheet" href="css/form.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
	rel="stylesheet">
</head>
<body>
	<!-- adminBushoList.jsp -->
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<div class="jsp-main-contents">
	    <%
			List<BushoBean> bushoList = (List<BushoBean>) request.getAttribute("bushoList");
	    	List<BushoBean> bushoNameList = (List<BushoBean>) request.getAttribute("bushoNameList");
	    	List<PeriodBean> periodList = (List<PeriodBean>) request.getAttribute("periodList");
		%>
		
		<div class="Form">

			<form action="BushoSendServlet" method="POST">
			<div class="Form-Item">
		    	<h1>武将情報変更</h1>
		    </div>
			
			<!-- ニックネーム -->
			<% for(BushoBean busho : bushoList){ %>
			
			<input type="hidden" name="busho_id" value="<%=busho.getBushoID() %>">
			<input type="hidden" name="busho_img" value="<%=busho.getBushoImg() %>">
			
	    	<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">武将の画像</span>
			   </p>
			   <div class="Form-Icon">
					<img src="<%= busho.getBushoImg() %>"  alt="プロフィール写真">	
				</div>
			</div>
    
		    <!-- ニックネーム -->
	    	<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">名前</span>
			   </p>
			   <input type="text" name="busho_name" class="Form-Item-Input" value="<%=busho.getBushoName()%>" required>
			</div>
			
			<!-- 推しの武将 -->
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">年代</span>
			   </p>
			    <select class="Form-Item-Input-Select" name="period_name">
			    	<% for(PeriodBean periodName : periodList) { %>
			    	
			    		<% if(periodName.getPeriodName().equals(busho.getPeriodName())){ %>
			    			<option value="<%=periodName.getPeriodName()%>" selected><%=periodName.getPeriodName()%></option>
			    		<% } else { %>
			    			<option value="<%=periodName.getPeriodName()%>"><%=periodName.getPeriodName()%></option>
			    		<% } %>
			    	<% } %>
			    </select>
			</div>
			  
		    <div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">生年月日</span>
			   </p>
				<input class="Form-Item-Input" type="text" name="birth_date" value="<%=busho.getBirthDate()%>">
			</div>
		    
		    <div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">自己紹介</span>
			   </p>
			    <textarea class="Form-Item-Textarea" name="commentary" placeholder="500文字以内" maxlength="500"><%=busho.getCommentary()%></textarea>
			</div>

		    
		    <% } %>
		  	<input class="formButton" type="submit" value="変更する">
	    	</form>
		</div>

    </div>
</body>
</html>