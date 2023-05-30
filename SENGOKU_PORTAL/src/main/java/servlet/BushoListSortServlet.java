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

import model.dao.BushoDAO;
import model.dao.UserDAO;
import model.entity.BushoBean;

/**
 * Servlet implementation class BushoListSortServlet
 */
@WebServlet("/BushoListSortServlet")
public class BushoListSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BushoListSortServlet() {
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
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		/**
		 * ソート要素を受け取る
		 */
		
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");

		List<BushoBean> bushoList = null;

		// DAOの生成
		BushoDAO bushodao = new BushoDAO();
		UserDAO userdao = new UserDAO();
		String url = null;

		try {
			// DAOの利用
			bushoList = bushodao.selectBushoAllSort(sort, order);
			int authority = userdao.selectAuthority(user_id);
			if(authority == 1) {
				url = "bushoList.jsp";
			}else {
				url = "adminBushoList.jsp";
			}
		} catch (SQLException | ClassNotFoundException e) { 
			e.printStackTrace();
		}
		
		// セッションスコープへの属性の設定
		request.setAttribute("bushoList", bushoList);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
