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

import model.dao.ChatDAO;

/**
 * Servlet implementation class SendChatServlet
 */
@WebServlet("/SendChatServlet")
public class SendChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendChatServlet() {
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
		int chat_id = Integer.parseInt(request.getParameter("chat_id"));
		String user_id = request.getParameter("user_id");
		String created_at = request.getParameter("created_at");
		String message = request.getParameter("message");

		// リクエストスコープへの属性の設定
		request.setAttribute("chat_id", chat_id);
		request.setAttribute("user_id", user_id);
		request.setAttribute("created_at", created_at);
		request.setAttribute("message", message);

		// DAOの生成
		ChatDAO chatdao = new ChatDAO();

		int count = 0;	// 処理件数

		try {
			// DAOの利用
			count = chatdao.sendChat (user_id,message);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("count", count);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("chat.jsp");
		rd.forward(request, response);

	}

}
