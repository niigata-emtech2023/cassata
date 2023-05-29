package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.PeriodDAO;

/**
 * Servlet implementation class BushoSendServlet
 */
@WebServlet("/BushoSendServlet")
public class BushoSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BushoSendServlet() {
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
		request.setCharacterEncoding("UTF-8");

		// リクエストパラメータの取得
		String busho_name_img = request.getParameter("busho_name_img");
		String busho_name = request.getParameter("busho_name");
		String period_name = request.getParameter("period_name");
		String birth_date = request.getParameter("birth_date");
		String commentary = request.getParameter("commentary");	
		
		/**
		 * period_nameからperiod_idを特定する
		 */
		PeriodDAO periodDAO = new PeriodDAO();
		String period_id;
		try {
			period_id = periodDAO.selectPeriodID(period_name);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		
		request.setAttribute("busho_name_img", busho_name_img);
		request.setAttribute("busho_name",busho_name );
		request.setAttribute("period_id",period_id );
		request.setAttribute("birth_date",birth_date);
		request.setAttribute("commentary",commentary);
		
		RequestDispatcher rd = request.getRequestDispatcher("changeBushoListConfilm");
		rd.forward(request, response);
	}

}
