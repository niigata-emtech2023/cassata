package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BushoDAO;

/**
 * Servlet implementation class ChangeBushoServlet
 */
@WebServlet("/ChangeBushoServlet")
public class ChangeBushoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeBushoServlet() {
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
		String busho_id = request.getParameter("busho_id");
		String busho_name = request.getParameter("busho_name");
		String period_id = request.getParameter("period_id");
		String period_name = request.getParameter("period_name");
		String commentary = request.getParameter("commentary");
		String birth_date = request.getParameter("birth_date");
		String busho_img = request.getParameter("busho_img");

		// リクエストスコープへの属性の設定
		request.setAttribute("busho_id", busho_id);
		request.setAttribute("busho_name", busho_name);
		request.setAttribute("period_id", period_id);
		request.setAttribute("period_name", period_name);
		request.setAttribute("commentary", commentary);
		request.setAttribute("birth_date", birth_date);
		request.setAttribute("busho_img", busho_img);
		

		// DAOの生成
		BushoDAO bushodao = new BushoDAO();
		
		int count = 0;	// 処理件数

		try {
			// DAOの利用
			count = bushodao.changeBusho (busho_id, busho_name, period_id, commentary, birth_date);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("count", count);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("changeBushoListComplete.jsp");
		rd.forward(request, response);


	}

}