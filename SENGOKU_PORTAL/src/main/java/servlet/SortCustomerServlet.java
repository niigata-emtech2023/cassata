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

import model.dao.UserDAO;
import model.entity.UserBean;

/**
 * Servlet implementation class SortCustomerServlet
 */
@WebServlet("/SortCustomerServlet")
public class SortCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortCustomerServlet() {
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
		
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");
		
		List<UserBean> userList = null;

		// DAOの生成
		UserDAO userdao = new UserDAO();

		try {
			// DAOの利用
			userList = userdao.selectAllUserSort(sort, order);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		// セッションスコープへの属性の設定
		request.setAttribute("userList", userList);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("customer.jsp");
		rd.forward(request, response);
	}

}
