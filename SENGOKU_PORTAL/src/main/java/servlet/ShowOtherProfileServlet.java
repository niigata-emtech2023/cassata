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

import model.dao.FollowDAO;
import model.dao.UserDAO;
import model.entity.UserBean;

/**
 * Servlet implementation class ShowOtherProfileServlet
 */
@WebServlet("/ShowOtherProfileServlet")
public class ShowOtherProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowOtherProfileServlet() {
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
		
		HttpSession session = request.getSession();
		
		// リクエストオブジェクトのエンコーディング方式の指定
		request.setCharacterEncoding("UTF-8");
		// セッションオブジェクトの取得

		// リクエストパラメータの取得
		String other_user_id = request.getParameter("user_id");
		String my_user_id = (String) session.getAttribute("user_id");

		// UserDAOの生成
		UserDAO userdao = new UserDAO();

		try {
			// DAOの利用
			userList = userdao.selectProfile(other_user_id);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		// UserDAOの生成
		FollowDAO followdao = new FollowDAO();
		boolean followCheck = false;
		
		try {
			followCheck = followdao.checkFollow(my_user_id, other_user_id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		
		// セッションスコープへの属性の設定
		request.setAttribute("userList", userList);
		request.setAttribute("followCheck", followCheck);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("otherProfile.jsp");
		rd.forward(request, response);
		
	}

}
