package Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import Dao.Dao_Staff;
import model.KhachHang;
import model.Staff;

/**
 * Servlet implementation class ProfileStaff
 */
@MultipartConfig
@WebServlet({ 
	"/ProfileStaff", 
	"/ProfileStaff/Update_profile_staff",
	"/ProfileStaff/Changepass_staff" 
	})
public class ProfileStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Staff staff;
	private Dao_Staff dao;

	public ProfileStaff() {
		this.staff = new Staff();
		this.dao = new Dao_Staff();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.staff = this.dao.findbyid(2);
		request.setAttribute("staff", this.staff);

		request.getRequestDispatcher("/views/Staff/ThongTinCaNhanStaff.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		String name = request.getParameter("name");
		String sdt = request.getParameter("phone");
		String email = request.getParameter("email");
		String mkcu = request.getParameter("pass_cu");
		String mkmoi = request.getParameter("pass_moi");
		String xacnhan = request.getParameter("xacnhan_pass");
		this.staff = this.dao.findbyid(2);
		int index = this.staff.getIdnv();

		String url = request.getRequestURL().toString();
		if (url.contains("Changepass_staff")) {
			if (mkcu.equals(this.staff.getPassword())) {
				this.dao.changepassstaff(index, mkmoi);
				System.out.println("TC");
				response.sendRedirect(request.getContextPath() + "/ProfileStaff?" + "succes=5");
			} else {
				System.out.println("TB");
				response.sendRedirect(request.getContextPath() + "/ProfileStaff?" + "error=5");
			}
		} else if (url.contains("Update_profile_staff")) {
			try {
				String realpath = request.getServletContext().getRealPath("/img");
				Path path = Paths.get(realpath);
				if (!Files.exists(path)) {
					Files.createDirectory(path);
				}
				Part part = request.getPart("image");
				String filenameUpload = part.getSubmittedFileName();
				if (!"".equals(filenameUpload)) {
					String namefile = Path.of(filenameUpload).getFileName().toString();
					part.write(Paths.get(realpath.toString(), namefile).toString());
					this.staff.setImg(namefile);
				}
				
				this.staff.setIdnv(index);
				this.staff.setHoTen(name);
				this.staff.setSdt(sdt);
				this.staff.setEmail(email);
				this.dao.updateprofilestaff(staff);
				System.out.println("TC");
				response.sendRedirect(request.getContextPath() + "/ProfileStaff?" + "succes=6");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}