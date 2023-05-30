package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BushoInsertSendServlet
 */
@WebServlet("/BushoInsertSendServlet")
public class BushoInsertSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BushoInsertSendServlet() {
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
//				String busho_id = request.getParameter("busho_id");
//				String busho_name_img = request.getParameter("busho_name_img");
//				String busho_name = request.getParameter("busho_name");
//				String period_id = request.getParameter("period_id");
//				String birth_date = request.getParameter("birth_date");
//				String commentary = request.getParameter("commentary");	
//				
//				request.setAttribute("busho_id", busho_id);
//				request.setAttribute("busho_name_img", busho_name_img);
//				request.setAttribute("busho_name",busho_name );
//				request.setAttribute("period_id",period_id );
//				request.setAttribute("birth_date",birth_date);
//				request.setAttribute("commentary",commentary);
				
				RequestDispatcher rd = request.getRequestDispatcher("bushoInsert");
				rd.forward(request, response);
	}
}
