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

import model.dao.ChatDAO;
import model.entity.ChatBean;

/**
 * Servlet implementation class ShowChatServlet
 */
@WebServlet("/ShowChatServlet")
public class ShowChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowChatServlet() {
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

		List<ChatBean> chatList = null;

		// DAOの生成
		ChatDAO chatdao = new ChatDAO();

		try {
			// DAOの利用
			chatList = chatdao.selectChat();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		// セッションスコープへの属性の設定
		request.setAttribute("chatList", chatList);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("chat.jsp");
		rd.forward(request, response);
		
	}

}
