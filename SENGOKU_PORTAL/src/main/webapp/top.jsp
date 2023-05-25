<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap" rel="stylesheet">
</head>

<body>
    <header>
        <img class="logo" src="images/logo.jpg">
        <p><span>あ</span>でログイン中</p>
        <div class="header-contents">
            <a href="#">新規登録</a>
            <a href="#">ログイン</a>
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
                        <h1><span>武将</span>で繋がる</h1>
                        <h1>ポータルサイト。</h1>
                    </div>
                    <div class="top-link-box">
                        <a href="#">
                            <div class="top-link">
                                <div class="top-link-icon-box register">
                                    <img class="top-link-icon" width="90" height="90"
                                        src="https://img.icons8.com/ios-glyphs/90/user--v1.png" alt="user--v1" />
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
                        <a href="#">
                            <div class="top-link">
                                <div class="top-link-icon-box bushou">
                                    <img class="top-link-icon" width="90" height="90"
                                        src="https://img.icons8.com/ios-glyphs/90/katana.png" alt="katana" />
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
                    </div>
                </div>
            </div>

        </div>
        <ul class="navigation-bar">
            <li class="selected-page">
                <p>トップ</p>
            </li>
            <li>
                <p>武将一覧</p>
            </li>
            <li>
                <p>全体チャット</p>
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
                        <img width="96" height="96" src="https://img.icons8.com/color/96/samurai-helmet.png"
                            alt="samurai-helmet" />
                        <h2>ランキング</h2>
                    </div>
                    <div class="main-contents-inner">
                        <div class="main-contents-inner-header">
                            <p>推しに登録された数を基に、</p>
                            <p>武将の人気ランキングを算出したものです。</p>
                        </div>
                        <!-- データベースから上位3名を取得する -->
                        <div class="ranking-box">
                            <h1 class="top1">1位 織田信長</h1>
                            <h1 class="top2">2位 徳川家康</h1>
                            <h1 class="top3">3位 明智光秀</h1>
                        </div>
                        <div class="btn-wrap btn-wrap-pc-sp">
                            <a href="" class="btn btn-pc-sp btn-pc-sp--contact rankingbtn">
                                武将一覧
                                <i class="fas fa-angle-right fa-position-right"></i>
                            </a>

                        </div>
                    </div>

                </div>
                <div class="chat">
                    <div class="contents-head chat-h">
                        <img width="96" height="96" src="https://img.icons8.com/bubbles/96/chat.png" alt="chat" />
                        <h2>チャット</h2>

                    </div>
                    <div class="main-contents-inner">
                        <div class="main-contents-inner-header">
                            <p>全体チャットの中から、</p>
                            <p>最新の話題を表示しています。</p>
                        </div>
                        <div class="chat-box">
                            <ul class="chat-list">
                                <li>
                                    <div class="chat-head">
                                        <p>山田太郎</p>
                                        <p class="chat-date">2023/05/24 12:00</p>
                                    </div>
                                    <div class="chat-contents">
                                        <img class="chat-icon" src="images/akechi_mitsuhide.jpg">
                                        <p>ハンバーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーグ</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="chat-head">
                                        <p>山田太郎2</p>
                                        <p class="chat-date">2023/05/24 12:00</p>
                                    </div>
                                    <div class="chat-contents">
                                        <img class="chat-icon" src="images/akechi_mitsuhide.jpg">
                                        <p>こんにちは</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="chat-head">
                                        <p>山田太郎2</p>
                                        <p class="chat-date">2023/05/24 12:00</p>
                                    </div>
                                    <div class="chat-contents">
                                        <img class="chat-icon" src="images/akechi_mitsuhide.jpg">
                                        <p>こんにちは</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="chat-head">
                                        <p>山田太郎2</p>
                                        <p class="chat-date">2023/05/24 12:00</p>
                                    </div>
                                    <div class="chat-contents">
                                        <img class="chat-icon" src="images/akechi_mitsuhide.jpg">
                                        <p>こんにちは</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="chat-head">
                                        <p>山田太郎2</p>
                                        <p class="chat-date">2023/05/24 12:00</p>
                                    </div>
                                    <div class="chat-contents">
                                        <img class="chat-icon" src="images/akechi_mitsuhide.jpg">
                                        <p>こんにちは</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <a href="" class="btn btn-pc-sp btn-pc-sp--contact chatbtn">
                            全体チャット
                            <i class="fas fa-angle-right fa-position-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </main>

</body>

</html>