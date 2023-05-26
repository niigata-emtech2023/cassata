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

import model.entity.BushoBean;

/**
 * Servlet implementation class ShowBushoListServlet
 */
@WebServlet("/ShowBushoListServlet")
public class ShowBushoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowBushoListServlet() {
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
		String busho_id = request.getParameter("busho_id");
		String busho_name = request.getParameter("busho_name");
		String period_id = request.getParameter("period_id");
		String commentary = request.getParameter("commentary");
		String birth_date = request.getParameter("birth_date");
		String busho_img = request.getParameter("busho_img");

		// リクエストスコープへの属性の設定
		session.setAttribute("busho_id", busho_id);
		session.setAttribute("busho_name", busho_name);
		session.setAttribute("period_id", period_id);
		session.setAttribute("commentary", commentary);
		session.setAttribute("birth_date",birth_date);
		session.setAttribute("busho_img", busho_img);

		List<BushoBean> bushoList = null;

		// DAOの生成
		BushoDAO bushodao = new BushoDAO();

		try {
			// DAOの利用
			bushoList = bushodao.selectProfile();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		// セッションスコープへの属性の設定
		session.setAttribute("bushoList", bushoList);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("bushoList.jsp");
		rd.forward(request, response);
		
	}

}
