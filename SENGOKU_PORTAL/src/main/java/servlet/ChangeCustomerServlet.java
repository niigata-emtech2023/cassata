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

import model.dao.UserDAO;

/**
 * Servlet implementation class ChangeCustomerServlet
 */
@WebServlet("/ChangeCustomerServlet")
public class ChangeCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeCustomerServlet() {
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
		// セッションオブジェクトの取得
		HttpSession session = request.getSession();

		// リクエストパラメータの取得
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		String new_password = request.getParameter("new_password");
		String nickname = request.getParameter("nickname");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String myself = request.getParameter("myself");
		String busho_id = request.getParameter("busho_id");
		String area = request.getParameter("area");
		String birth_date = request.getParameter("birth_date");
		
		// リクエストスコープへの属性の設定
		session.setAttribute("user_id", user_id);
		session.setAttribute("password", password);
		session.setAttribute("new_password", new_password);
		session.setAttribute("nickname", nickname);
		session.setAttribute("gender", gender);
		session.setAttribute("myself", myself);
		session.setAttribute("busho_id", busho_id);
		session.setAttribute("area", area);
		session.setAttribute("birth_date", birth_date);
		
		String url = null;

		// DAOの生成
		UserDAO userdao = new UserDAO();

		int count = 0;	// 処理件数

		try {
			// DAOの利用
			count = userdao.changeProfile(user_id,new_password,nickname,gender,busho_id, birth_date, area, myself);
			
			if(count > 0) {
				url = "changeCustomerComplete.jsp";
			}else {
				url = "changeCustomer.jsp";
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("count", count);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("url");
		rd.forward(request, response);

	}

}
