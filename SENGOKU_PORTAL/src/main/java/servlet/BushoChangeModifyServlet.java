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
 * Servlet implementation class BushoChangeModifyServlet
 */
@WebServlet("/BushoChangeModifyServlet")
public class BushoChangeModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BushoChangeModifyServlet() {
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
		// リクエストオブジェクトのエンコーディング方式の指定をする
		request.setCharacterEncoding("UTF-8");

		// リクエストパラメータの取得
		String busho_id = request.getParameter("busho_id");
		String busho_name = request.getParameter("busho_name");
		String period_id = request.getParameter("period_id");
		String period_name = request.getParameter("period_name");
		String commentary = request.getParameter("commentary");
		String birth_date = request.getParameter("birth_date");
		String busho_img = request.getParameter("busho_img");
		
		BushoDAO bushoDAO = new BushoDAO();
		PeriodDAO periodDAO = new PeriodDAO();
		
		List<BushoBean> bushoList = null;
		List<BushoBean> bushoNameList = null;
		List<PeriodBean> periodList = null;
		
		try {
			bushoList = bushoDAO.selectBushoAll(busho_id);
			bushoNameList = bushoDAO.selectBushoNameAll();
			periodList = periodDAO.selectPeriodAll();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("busho_id", busho_id);
		request.setAttribute("busho_name", busho_name);
		request.setAttribute("period_id", period_id);
		request.setAttribute("period_name", period_name);
		request.setAttribute("commentary", commentary);
		request.setAttribute("birth_date", birth_date);
		request.setAttribute("busho_img", busho_img);
		
		request.setAttribute("bushoList", bushoList);
		request.setAttribute("bushoNameList", bushoNameList);
		request.setAttribute("periodList", periodList);
		
		RequestDispatcher rd = request.getRequestDispatcher("changeBushoListModify.jsp");
		rd.forward(request, response);
		
	}

}
