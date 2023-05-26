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
import model.entity.FollowBean;

/**
 * Servlet implementation class ShowFollowServlet
 */
@WebServlet("/ShowFollowServlet")
public class ShowFollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowFollowServlet() {
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

		// リクエストオブジェクトのエンコーディング方式の指定
		request.setCharacterEncoding("UTF-8");

		// リクエストパラメータの取得
		String user_id = request.getParameter("user_id");
		String follow_user_id = request.getParameter("follow_user_id");

		request.setCharacterEncoding("UTF-8");

		// セッションオブジェクトの取得
		HttpSession session = request.getSession();

		// セッションスコープへの属性の設定
		request.setAttribute("user_id", user_id);
		request.setAttribute("follow_user_id", follow_user_id);

		List<FollowBean> followList = null;

		// DAOの生成
		FollowDAO followdao = new FollowDAO();

		try {
			// DAOの利用
			followList = followdao.selectFollow(user_id);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		// セッションスコープへの属性の設定
		request.setAttribute("followList", followList);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("follow.jsp");
		rd.forward(request, response);
		
	}

}
