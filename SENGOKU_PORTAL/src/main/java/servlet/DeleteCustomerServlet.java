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

import model.dao.UserDAO;
import model.entity.UserBean;

/**
 * Servlet implementation class DeleteCustomerServlet
 */
@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCustomerServlet() {
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

				UserDAO userdao = new UserDAO();
				
				List<UserBean> userList = null;
				
				try {
					// DAOの利用
					userList = userdao.selectProfile(user_id);
				} catch (SQLException | ClassNotFoundException e) {
					e.printStackTrace();
				}
				
				// セッションスコープへの属性の設定
				request.setAttribute("userList", userList);

				// DAOの生成
				

				int count = 0;	// 処理件数

				try {
					// DAOの利用
					count = userdao.deleteProfile(user_id);

				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				

				// リクエストスコープへの属性の設定
				request.setAttribute("count", count);
				request.setAttribute("userList", userList);

				// リクエストの転送
				RequestDispatcher rd = request.getRequestDispatcher("deleteCustomerComplete.jsp");
				rd.forward(request, response);

			}

		}
