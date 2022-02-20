package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.Dao_Staff;
import Dao.Daouser;
import model.KhachHang;
import model.Staff;

@WebServlet("/Login")
@MultipartConfig
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Daouser daouser;
	private Dao_Staff daoStaff;

	public Login() {
		this.daoStaff = new Dao_Staff();
		this.daouser = new Daouser();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("views/assets/HomeKhachHang.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		KhachHang kh = this.daouser.login(username, password);
		Staff st = this.daoStaff.login(username, password);
		if (kh != null) {
			HttpSession session = request.getSession();
			session.setAttribute("acountKH", kh);
			response.sendRedirect(request.getContextPath() + "/HomeKhachHangServlet");
		} else {
			
			if (st != null) {
				if (st.getChucVu().equals("Staff")) {
					HttpSession session = request.getSession();
					session.setAttribute("acountST", st);
					response.sendRedirect(request.getContextPath() + "/Menu");
				} else if (st.getChucVu().equals("Manager")) {
					HttpSession session = request.getSession();
					session.setAttribute("acountST", st);
					response.sendRedirect(request.getContextPath() + "/HomeKhachHangServlet");
				}
			} else {
				response.sendRedirect(request.getContextPath()+"/Login?errorAccWrong=1");
				//request.setAttribute("errorAccWrong", "Password or UserName is wrong");
				//doGet(request, response);
			}

		}

	}
}