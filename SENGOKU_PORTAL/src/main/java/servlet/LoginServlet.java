package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.LoginDAO;
import model.dao.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		// リクエストオブジェクトのエンコーディング方式の指定
		request.setCharacterEncoding("UTF-8");
		
		boolean result = false;

		String url = null;
		// リクエストパラメータの取得
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();


		try {
			// DAOの生成
			LoginDAO loginDao = new LoginDAO();
			result = loginDao.login(user_id, password);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// DAOの利用
		if (result) {
			// 認証成功
			url = "start.jsp";
			// セッションスコープへの属性の設定
			session.setAttribute("user_id", user_id);
			session.setAttribute("password", password);
			
			
			
			/**
			 * ユーザ名を取得
			 */
			UserDAO dao = new UserDAO();
			try {
				String nickname = dao.selectUserName(user_id);
				session.setAttribute("nickname", nickname);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
			
			int authority = 1;
			try {
				authority = dao.selectAuthority(user_id);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
			session.setAttribute("authority", authority);

		} else {
			// 認証失敗
			url = "login.jsp";
		}
		

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
