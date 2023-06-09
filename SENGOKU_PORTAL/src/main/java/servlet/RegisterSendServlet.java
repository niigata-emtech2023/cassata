package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.LoginDAO;

/**
 * Servlet implementation class RegisterSendServlet
 */
@WebServlet("/RegisterSendServlet")
public class RegisterSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterSendServlet() {
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

		// リクエストパラメータの取得
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		
		request.setAttribute("user_id", user_id);
		request.setAttribute("password", password);
		request.setAttribute("nickname", nickname);
		
		Boolean registerJudge = false;
		LoginDAO loginDAO = new LoginDAO();
		try {
			registerJudge = loginDAO.registerCheck(user_id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		
		if(registerJudge != false) {
			RequestDispatcher rd = request.getRequestDispatcher("registerConfirm.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("error", "IDが既に使用されています");
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		}
		

	}

}
