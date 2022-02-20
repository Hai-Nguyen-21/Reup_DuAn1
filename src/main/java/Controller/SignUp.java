package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Daouser;
import model.KhachHang;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private Daouser dao;
	public SignUp() {
		this.dao=new Daouser();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/assets/HomeKhachHang.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("user");
		String password = request.getParameter("password");
		String repeatpassword = request.getParameter("repeatpassword");
		String hoten = request.getParameter("hoten");
		String sdt = request.getParameter("sdt");
		String gmail = request.getParameter("gmail");

		if (dao.checkAcc(username) != null) {
			System.out.println("Username da ton tai");
			response.sendRedirect(request.getContextPath() + "/SignUp" + "?errorSignUp=1");
			return;
		}

		KhachHang kh = new KhachHang(0, gmail, hoten, password, sdt, username);
		dao.insert(kh);

		response.sendRedirect(request.getContextPath() + "/SignUp" + "?succesSignUp=1");
	}

}
