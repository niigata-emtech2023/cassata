package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangeProfileServletr
 */
@WebServlet("/ChangeProfileServletr")
public class ChangeProfileServletr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeProfileServletr() {
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
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		Date created_at = request.getParameter("created_at");
		Date updated_at = request.getParameter("updated_at");
		int authority = Integer.parseInt(request.getParameter("authority"));
		String user_id = request.getParameter("user_id");
		- gender : int
		String user_id = request.getParameter("user_id");
		- myself : String
		String user_id = request.getParameter("user_id");
		- busho_id : String
		String user_id = request.getParameter("user_id");
		- birth_date : Date
		String user_id = request.getParameter("user_id");
		- area_id : String
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String section = request.getParameter("section");

		EmployeeBean employee = new EmployeeBean();
		employee.setCode(code);
		employee.setName(name);
		employee.setAge(age);
		employee.setSection(section);

		// DAOの生成
		EmployeeDAO dao = new EmployeeDAO();

		int count = 0;	// 処理件数

		try {
			// DAOの利用
			count = dao.insert(employee);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("count", count);
		request.setAttribute("employee", employee);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("employee-registration-result.jsp");
		rd.forward(request, response);

	}

}
