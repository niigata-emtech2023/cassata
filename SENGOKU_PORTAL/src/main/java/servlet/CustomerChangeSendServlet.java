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
import model.dao.PeriodDAO;
import model.entity.BushoBean;
import model.entity.PeriodBean;

/**
 * Servlet implementation class RegisterSendServlet
 */
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
		// TODO Auto-generated method stub
		// リクエストオブジェクトのエンコーディング方式の指定
		request.setCharacterEncoding("UTF-8");

		String busho_id = request.getParameter("busho_id");

		List<BushoBean> bushoList = null;
		List<BushoBean> bushoNameList = null;
		List<PeriodBean> periodList = null;

		BushoDAO bushoDAO = new BushoDAO();
		PeriodDAO periodDAO = new PeriodDAO();

		try {
			bushoList = bushoDAO.selectBushoAll(busho_id);
			bushoNameList = bushoDAO.selectBushoNameAll();
			periodList = periodDAO.selectPeriodAll();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		request.setAttribute("bushoList", bushoList);
		request.setAttribute("bushoNameList", bushoNameList);
		request.setAttribute("periodList", periodList);

		RequestDispatcher rd = request.getRequestDispatcher("changeCustomer.jsp");
		rd.forward(request, response);


	}
}