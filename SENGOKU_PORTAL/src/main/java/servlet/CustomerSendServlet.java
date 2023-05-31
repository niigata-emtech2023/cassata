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

import model.dao.BushoDAO;
import model.entity.BushoBean;

/**
 * Servlet implementation class RegisterSendServlet
 */
@WebServlet("/CustomerSendServlet")
public class CustomerSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see  HttpServlet#HttpServlet()
     */
    public CustomerSendServlet() {
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
		// リクエストオブジェクトのエンコーディング方式の指定
		request.setCharacterEncoding("UTF-8");

		// リクエストパラメータの取得
		String user_id = request.getParameter("user_id");
		String busho_name = request.getParameter("busho_name");
		String busho_img = request.getParameter("busho_img");
		String nickname = request.getParameter("nickname");
		String new_password_1 = request.getParameter("new_password_1");
		String new_password_2 = request.getParameter("new_password_2");
		String myself = request.getParameter("myself");
		String gender = request.getParameter("gender");
		String birth_date = request.getParameter("birth_date");
		String area = request.getParameter("area");
		
		String error="";
		/**
		 * パスワードのチェック
		 */
		Boolean passwordCheck = false;
		
		
		/**
		 * 新しいパスワードが一致しているかチェック
		 */

		if(new_password_1.equals(new_password_2)) {
			passwordCheck = true;
			
			if(new_password_1.equals("") || new_password_2.equals("")) {
				error = "新しいパスワードが空白です";
				passwordCheck = false;
			}
			
			if(new_password_1.equals(" ") || new_password_2.equals(" ")) {
				error = "新しいパスワードが空白です";
				passwordCheck = false;
			}
			
		} else {
			passwordCheck = false;
			error = "新しいパスワードが一致していません";
		}
		
		
		/**
		 * パスワードが一致していた場合の処理
		 */
		
		if(passwordCheck) {
			
			//武将の画像の取得
			BushoDAO bushoDAO = new BushoDAO();
			
			String busho_id = null;
			
			/**
			 * 推しの武将が未設定の場合は画像を取得しない
			 */
			if(!busho_name.equals("null")) {
			
				try {
					busho_id = bushoDAO.selectBushoIDString(busho_name);
				} catch (ClassNotFoundException | SQLException e1) {
					// TODO 自動生成された catch ブロック
					e1.printStackTrace();
				}
				
				try {
					busho_img = bushoDAO.selectBushoImageString(busho_id);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}
				
			} else {
				busho_img = "null";
			}
			
			request.setAttribute("user_id", user_id);
			request.setAttribute("busho_img", busho_img);
			request.setAttribute("nickname", nickname);
			request.setAttribute("password", new_password_1);
			request.setAttribute("myself", myself);
			request.setAttribute("gender", gender);
			request.setAttribute("birth_date", birth_date);
			request.setAttribute("busho_id", busho_id);
			request.setAttribute("busho_name", busho_name);
			request.setAttribute("area", area);
			
			RequestDispatcher rd = request.getRequestDispatcher("changeCustomerConfirm.jsp");
			rd.forward(request, response);
		
		/**
		 * 一致してない場合
		 */
		} else {
			
			BushoDAO bushoDAO = new BushoDAO();
			List<BushoBean> bushoList = null;
			
			if(!busho_name.equals("null")) {
				String busho_id = null;
				
				try {
					busho_id = bushoDAO.selectBushoIDString(busho_name);
					busho_img = bushoDAO.selectBushoImageString(busho_id);
				} catch (ClassNotFoundException | SQLException e1) {
					// TODO 自動生成された catch ブロック
					e1.printStackTrace();
				}
			} else {
				busho_img = "null";
			}
			
			try {
				bushoList = bushoDAO.selectBushoNameAll();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
			
					
			request.setAttribute("busho_name", busho_name);
			request.setAttribute("bushoList", bushoList);
			
			// リクエストスコープへの属性の設定
			request.setAttribute("busho_img", busho_img);
			request.setAttribute("nickname", nickname);
			request.setAttribute("user_id", user_id);
			request.setAttribute("myself", myself);
			request.setAttribute("gender", gender);
			request.setAttribute("birth_date", birth_date);
			request.setAttribute("area", area);
			
			request.setAttribute("error", error);
			
			RequestDispatcher rd = request.getRequestDispatcher("changeCustomer.jsp");
			rd.forward(request, response);
		}
	}

}