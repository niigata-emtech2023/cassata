package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.RegisterDAO;

/**
 * Servlet implementation class BushoInsertServlet
 */
@WebServlet("/BushoInsertServlet")
public class BushoInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BushoInsertServlet() {
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
		String busho_name_img = request.getParameter("busho_name_img");
		String busho_name = request.getParameter("busho_name");
		String period_id = request.getParameter("period_id");
		String birth_date = request.getParameter("birth_date");
		String commentary = request.getParameter("commentary");	
		
		request.setAttribute("busho_id", busho_id);
		request.setAttribute("busho_name_img", busho_name_img);
		request.setAttribute("busho_name",busho_name );
		request.setAttribute("period_id",period_id );
		request.setAttribute("birth_date",birth_date);
		request.setAttribute("commentary",commentary);

		// DAOの生成
		RegisterDAO registerdao = new RegisterDAO();

		int count = 0;	// 処理件数

		try {
			// DAOの利用

			count = registerdao.bushoRegister(busho_id,busho_name_img,busho_name,period_id,birth_date,commentary);
			
			if(count != 0) {
				session.setAttribute("busho_id", busho_id);
				session.setAttribute("busho_name_img", busho_name_img);
				session.setAttribute("busho_name",busho_name );
				session.setAttribute("period_id",period_id );
				session.setAttribute("birth_date",birth_date);
				session.setAttribute("commentary",commentary);
			}
			count = registerdao.bushoRegister(busho_id,busho_name_img,busho_name,period_id,birth_date,commentary);


		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("count", count);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("bushoInsertCompletep.jsp");
		rd.forward(request, response);
	}
}
