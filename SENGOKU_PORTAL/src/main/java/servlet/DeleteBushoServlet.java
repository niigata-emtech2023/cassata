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
import model.entity.BushoBean;

/**
 * Servlet implementation class DeleteBushoServlet
 */
@WebServlet("/DeleteBushoServlet")
public class DeleteBushoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBushoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String busho_id = request.getParameter("busho_id");

		// リクエストスコープへの属性の設定
		request.setAttribute("busho_id", busho_id);

		// DAOの生成
		BushoDAO bushodao = new BushoDAO();
		
		List<BushoBean> bushoList = null;
		
		try {
			// DAOの利用
			bushoList = bushodao.selectBushoAll(busho_id);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		// セッションスコープへの属性の設定
		request.setAttribute("bushoList", bushoList);

		
		int count = 0;	// 処理件数

		try {
			// DAOの利用
			count = bushodao.deleteBusho(busho_id);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("count", count);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("customer.jsp");
		rd.forward(request, response);


	}

}