<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List, model.entity.ChatBean, model.entity.UserBean"%>
<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<title>SENGOKU PORTAL</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
	rel="stylesheet">
</head>

<body>
	<header>
		<img class="logo" src="images/logo.jpg">
		<!-- ログイン状態であれば、「ニックネーム」でログイン中と表示する -->
		<p>
		<% if(session.getAttribute("nickname") == null){ %>
			ログインしていません
		<% } else { %>
			<span><%= session.getAttribute("nickname") %></span>でログイン中
		<% } %>
		</p>
		<div class="header-contents">

			<!-- 新規登録リンク  -->
			<a href="register.jsp">新規登録</a>

			<!-- ログインリンク -->
			<% if(session.getAttribute("nickname") == null){ %>
				<a href="login.jsp">ログイン</a>
			<% } else { %>
				<form method="POST" name="logout" action="LogoutServlet">
					<a href="javascript:logout.submit()">ログアウト</a>
				</form>
			<% } %>
			

			<!-- アイコン -->
			<img class="user-icon"
				src="https://lh3.googleusercontent.com/pw/AJFCJaXtZKeakKvThPGLSnVEpGrbX2JLCsrFyxI_7e3CmxqzBkOkf6n29Wm5Fw5Th0Cdin8EVAmbOMxiZBswPjp2CNWTPmZkL_-ddPPFskSpG_5wDBpMQA=s200-p-k">
		</div>
	</header>
	<main>
		<div class="top">
			<img class="top-image" src="images/top_img.jpg">
			<div class="top-contents">
				<div class="top-contents-title">
					<div class="top-contents-title-text">
						<h1>
							<span>武将</span>で繋がる
						</h1>
						<h1>ポータルサイト。</h1>
					</div>
					<div class="top-link-box">
						<a href="register.jsp">
							<div class="top-link">
								<div class="top-link-icon-box register">
									<img class="top-link-icon" width="90" height="90"
										src="https://img.icons8.com/ios-glyphs/90/user--v1.png"
										alt="user--v1" />
								</div>
								<div class="top-link-text">
									<h2>新規登録</h2>
									<p>会員登録をすることで、</p>
									<p>武将ファンと繋がれます。</p>
								</div>
								<div class="top-link-click-box">
									<img class="top-link-click" width="90" height="90"
										src="https://img.icons8.com/ios-glyphs/90/circled-chevron-right.png"
										alt="circled-chevron-right" />
								</div>
							</div>
						</a> 
						<form method="POST" name="bushoListTop" action="ShowBushoListServlet">
						<a href="javascript:bushoListTop.submit()">
							<div class="top-link">
								<div class="top-link-icon-box bushou">
									<img class="top-link-icon" width="90" height="90"
										src="https://img.icons8.com/ios-glyphs/90/katana.png"
										alt="katana" />
								</div>
								<div class="top-link-text">
									<h2>武将一覧</h2>
									<p>戦国武将の一覧や、</p>
									<p>その詳細を閲覧できます。</p>
								</div>
								<div class="top-link-click-box">
									<img class="top-link-click" width="90" height="90"
										src="https://img.icons8.com/ios-glyphs/90/circled-chevron-right.png"
										alt="circled-chevron-right" />
								</div>
							</div>
						</a>
						</form>
					</div>
				</div>
			</div>

		</div>
		<ul class="navigation-bar">
			<li class="selected-page"><a href="top.jsp"><p>トップ</p></a></li>
			<li>
				<form method="POST" name="chatList" action="ShowChatServlet">
					<a href="javascript:chatList.submit()"><p>全体チャット</p></a>
				</form>
			</li>
			<li>
				<form method="POST" name="bushoList" action="ShowBushoListServlet">
					<a href="javascript:bushoList.submit()"><p>武将一覧</p></a>
				</form>
			</li>
			<li>
				<p>マイページ</p>
			</li>
			<li>
				<p>ユーザ検索</p>
			</li>
		</ul>

		<div class="main-contents">
			<div class="about">
				<h1>戦国ポータルへようこそ！</h1>
				<p>当サイトでは、戦国時代に活躍した様々な武将の閲覧だけでなく、</p>
				<p>会員登録を行うことで、チャットを通じた他のユーザーとの交流を行えたり、</p>
				<p>プロフィールから推しの武将の設定や、武将のアイコンを設定することが出来ます。</p>
			</div>
			<div class="main-contents-list">
				<div class="ranking">
					<div class="contents-head bushou-h">
						<img width="96" height="96"
							src="https://img.icons8.com/color/96/samurai-helmet.png"
							alt="samurai-helmet" />
						<h2>ランキング</h2>
					</div>
					<div class="main-contents-inner">
						<div class="main-contents-inner-header">
							<p>推しに登録された数を基に、</p>
							<p>武将の人気ランキングを算出したものです。</p>
						</div>
						<!-- データベースから上位3名を取得する -->
						<% List<UserBean> bushoList = (List<UserBean>) request.getAttribute("bushoList"); %>
						<% int i = 1; %>
						<div class="ranking-box">
							<% for(UserBean busho: bushoList){ %>
								<h1 class="top<%=i%>"><%=i%>位 <%= busho.getBushoName() %></h1>
								<p>登録者:<%= busho.getCount() %>人</p>
								<% i++; %>
							<% } %>
						</div>
						
						<div class="btn-wrap btn-wrap-pc-sp">
							<a href="" class="btn btn-pc-sp btn-pc-sp--contact rankingbtn">
								武将一覧 <i class="fas fa-angle-right fa-position-right"></i>
							</a>

						</div>
					</div>

				</div>
				<div class="chat">
					<div class="contents-head chat-h">
						<img width="96" height="96"
							src="https://img.icons8.com/bubbles/96/chat.png" alt="chat" />
						<h2>チャット</h2>

					</div>
					<div class="main-contents-inner">
						<div class="main-contents-inner-header">
							<p>全体チャットの中から、</p>
							<p>最新の話題を表示しています。</p>
						</div>
						<div class="chat-box">
							<ul class="chat-list">
							
							<!-- 最新10件を受け取る -->
							<% List<ChatBean> chatList = (List<ChatBean>) request.getAttribute("chatList"); %>
							
							<% for(ChatBean chat: chatList) {%>
								<li>
									<div class="chat-head">
										<p><%= chat.getNickname() %></p>
										<p class="chat-date"><%= chat.getCreatedAt() %></p>
									</div>
									<div class="chat-contents">
										
										<!-- 推しの武将が設定されていなければデフォルトの画像を設定する -->
										<% if(chat.getBushoImg() == null) {%>
											<img class="chat-icon" src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k">
										<% } else { %>
											<img class="chat-icon" src="<%= chat.getBushoImg()%>">
										<% } %>
										<p><%= chat.getMessage() %></p>
									</div>
								</li>
							<% } %>
							</ul>
						</div>
						<a href="" class="btn btn-pc-sp btn-pc-sp--contact chatbtn">
							全体チャット <i class="fas fa-angle-right fa-position-right"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</main>

</body>

</html>