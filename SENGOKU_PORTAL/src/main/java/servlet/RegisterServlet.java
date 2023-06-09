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
import model.dao.UserDAO;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
				String user_id = request.getParameter("user_id");
				String password = request.getParameter("password");
				String nickname = request.getParameter("nickname");

				// セッションスコープへの属性の設定
				request.setAttribute("user_id", user_id);
				request.setAttribute("password", password);
				request.setAttribute("nickname", nickname);

				// DAOの生成
				RegisterDAO registerdao = new RegisterDAO();

				int count = 0;	// 処理件数

				try {
					// DAOの利用

					count = registerdao.register(user_id, password, nickname);
					
					if(count != 0) {
						session.setAttribute("user_id", user_id);
						session.setAttribute("password", password);
						session.setAttribute("nickname", nickname);
						
						UserDAO userDAO = new UserDAO();
						int authority = 1;
						try {
							authority = userDAO.selectAuthority(user_id);
	
						} catch (ClassNotFoundException | SQLException e) {
							// TODO 自動生成された catch ブロック
							e.printStackTrace();
						}
						session.setAttribute("authority", authority);
						
						String busho_img = null;
						busho_img = userDAO.selectUserIcon(user_id);
						session.setAttribute("busho_img", busho_img);
					}


				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				
				// リクエストスコープへの属性の設定
				request.setAttribute("count", count);

				// リクエストの転送
				RequestDispatcher rd = request.getRequestDispatcher("registerComplete.jsp");
				rd.forward(request, response);

			}

		}
