package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;
import model.entity.UserBean;

/**
 * Servlet implementation class ShowMyProfileServlet
 */
@WebServlet("/ShowMyProfileServlet")
public class ShowMyProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowMyProfileServlet() {
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
		
		List<UserBean> userList = null;
		
		// リクエストオブジェクトのエンコーディング方式の指定
		request.setCharacterEncoding("UTF-8");
		// セッションオブジェクトの取得
		HttpSession session = request.getSession();

		// リクエストパラメータの取得
		String user_id = request.getParameter("user_id");

		// リクエストスコープへの属性の設定
		session.setAttribute("user_id", user_id);

		// DAOの生成
		UserDAO userdao = new UserDAO();

		try {
			// DAOの利用
			userList = userdao.selectProfile(user_id);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		// セッションスコープへの属性の設定
		session.setAttribute("userList", userList);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("myProfile.jsp");
		rd.forward(request, response);
		
	}

}
