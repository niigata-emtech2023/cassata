package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
 * Servlet implementation class ChangeProfileServlet
 */
@WebServlet("/ChangeProfileServlet")
public class ChangeProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeProfileServlet() {
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

		//  リクエストオブジェクトのエンコーディング方式の指定
		request.setCharacterEncoding("UTF-8");

		// リクエストパラメータの取得
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String birth_date = request.getParameter("birth_date");
		String myself = request.getParameter("myself");
		String busho_id = request.getParameter("busho_id");
		String area = request.getParameter("area");
		
		HttpSession session = request.getSession();
		
		//自己紹介が空白の場合、nullを設定する
		if(myself.equals("")) {
			myself = null;
		}
		
		//誕生日が空白の場合、nullを設定する
		java.sql.Date datesql = null;
		
		if(!birth_date.equals("")) {
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			Date date = null;
			try {
				date = format1.parse(birth_date);
				
		        SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		        String formattedDate = format2.format(date);
		        datesql = java.sql.Date.valueOf(formattedDate);
			} catch (ParseException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			} catch (ClassCastException e) {
				datesql = null;
			}			

		}
	
			// DAOの生成
			UserDAO userdao = new UserDAO();

		int count = 0;	// 処理件数

		try {
			// DAOの利用
			count = userdao.changeProfile(password, nickname, gender, busho_id, datesql, area, myself, user_id );
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		List<UserBean> userList = null;
		
		try {
			userList = userdao.selectProfile(user_id);
			
			//武将の画像を変更
			String update_busho_img = userdao.selectUserIcon(user_id);
			session.setAttribute("busho_img", update_busho_img);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		// リクエストスコープへの属性の設定
		request.setAttribute("count", count);
		request.setAttribute("userList", userList);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("changeProfileComplete.jsp");
		rd.forward(request, response);

	}

}
