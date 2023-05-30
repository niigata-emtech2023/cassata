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
import model.entity.UserBean;

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

		request.setAttribute("busho_img", busho_img);
		request.setAttribute("nickname", nickname);
		request.setAttribute("user_id", user_id);
		request.setAttribute("myself", myself);
		request.setAttribute("gender", gender);
		request.setAttribute("birth_date", birth_date);
		request.setAttribute("busho_id", busho_id);
		request.setAttribute("area", area);
		
		
		
		List<UserBean> userList = null;
		List<BushoBean> bushoList = null;
		List<BushoBean> bushoNameList = null;
		
		UserDAO userDAO = new UserDAO();
		BushoDAO bushoDAO = new BushoDAO();
		

		try {
			userList = userDAO. selectAllUser();
			bushoList = bushoDAO.selectBushoAll(busho_id);
			bushoNameList = bushoDAO.selectBushoNameAll();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		
		request.setAttribute("userList", userList);
		request.setAttribute("bushoList", bushoList);
		request.setAttribute("bushoNameList", bushoNameList);

		RequestDispatcher rd = request.getRequestDispatcher("changeCustomer.jsp");
		rd.forward(request, response);
	}

}
