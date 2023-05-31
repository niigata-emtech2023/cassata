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

import model.dao.BushoDAO;
import model.dao.UserDAO;
import model.entity.BushoBean;

/**
 * Servlet implementation class RegisterSendServlet
 */
//customer.jsp
@WebServlet("/CustomerChangeSendServlet")
public class CustomerChangeSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerChangeSendServlet() {
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
		String busho_img = request.getParameter("busho_img");
		String nickname = request.getParameter("nickname");
		String user_id = request.getParameter("user_id");
		String myself = request.getParameter("myself");
		String gender = request.getParameter("gender");
		String birth_date = request.getParameter("birth_date");
		String busho_id = request.getParameter("busho_id");
		String area = request.getParameter("area");
		
		UserDAO userDAO = new UserDAO();
		BushoDAO bushoDAO = new BushoDAO();
		List<BushoBean> bushoList = null;
		String busho_name = null;
		String password = null;
		
		try {
			bushoList = bushoDAO.selectBushoNameAll();
			busho_name = bushoDAO.selectBushoNameString(busho_id);
			password = userDAO.selectPassword(user_id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		
		request.setAttribute("busho_name", busho_name);
		request.setAttribute("bushoList", bushoList);
		
		// リクエストスコープへの属性の設定
		request.setAttribute("busho_img", busho_img);
		request.setAttribute("nickname", nickname);
		request.setAttribute("user_id", user_id);
		request.setAttribute("password", password);
		request.setAttribute("myself", myself);
		request.setAttribute("gender", gender);
		request.setAttribute("birth_date", birth_date);
		request.setAttribute("busho_id", busho_id);
		request.setAttribute("area", area);
		
		RequestDispatcher rd = request.getRequestDispatcher("changeCustomer.jsp");
		rd.forward(request, response);
	}

}
