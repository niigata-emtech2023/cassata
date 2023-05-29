package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterSendServlet
 */
@WebServlet("/ProfileChangeSendServlet")
public class ProfileChangeSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileChangeSendServlet() {
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

		// リクエストパラメータの取得
		String busho_img = request.getParameter("busho_img");
		String nickname = request.getParameter("nickname");
		String password = request.getParameter("password");
		String myself = request.getParameter("myself");
		String gender = request.getParameter("gender");
		String birth_date = request.getParameter("birth_date");
		String busho_id = request.getParameter("busho_id");
		String area = request.getParameter("area");
		
		request.setAttribute("busho_img", busho_img);
		request.setAttribute("nickname", nickname);
		request.setAttribute("password", password);
		request.setAttribute("myself", myself);
		request.setAttribute("gender", gender);
		request.setAttribute("birth_date", birth_date);
		request.setAttribute("busho_id", busho_id);
		request.setAttribute("area", area);
		
		RequestDispatcher rd = request.getRequestDispatcher("changeProfileConfirm.jsp");
		rd.forward(request, response);
	}

}