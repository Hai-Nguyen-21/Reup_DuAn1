package Controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import Dao.DaoHoadon;
import Dao.DaoTTBD;
import Dao.Daouser;
import model.Hdct;
import model.HoaDon;
import model.KhachHang;
import model.ThongTinBanDat;

@WebServlet({ "/Profile", "/Profile/Changepass", "/Profile/Updateprofile" })
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Daouser daouser;
	private KhachHang user;
	private List<KhachHang> lst;
	private DaoTTBD daottbd;
	private DaoHoadon daohd;
	private List<ThongTinBanDat> lstttbd;
	private List<HoaDon> lsthd;
	private List<Hdct> lsthdct;

	public Profile() {
		this.daouser = new Daouser();
		this.user = new KhachHang();
		this.lst = new ArrayList<KhachHang>();
		this.lstttbd = new ArrayList<ThongTinBanDat>();
		this.lsthd = new ArrayList<HoaDon>();
		this.daohd = new DaoHoadon();
		this.daottbd = new DaoTTBD();
		this.lsthdct = new ArrayList<Hdct>();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		this.user = (KhachHang) session.getAttribute("acountKH");
		int id = this.user.getIdkh();
		request.setAttribute("iduser", id);
		profile(request, response, id);
		request.getRequestDispatcher("/views/assets/QuanLyThongTinMember.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		this.user = (KhachHang) session.getAttribute("acountKH");
		int index = this.user.getIdkh();

		String url = request.getRequestURL().toString();
		if (url.contains("Changepass")) {
			String oldpass = request.getParameter("oldpassword");
			String newpass = request.getParameter("newpass");
			if (oldpass.equals(this.user.getPassword().trim())) {
				this.daouser.changepassworduser(index, newpass);
				response.sendRedirect(request.getContextPath() + "/Profile?id=" + index + "&&successChangePass=1");
			} else {
				response.sendRedirect(request.getContextPath() + "/Profile?id=" + index + "&&errorChangePass=1");
			}
		} else if (url.contains("Updateprofile")) {
			try {
				System.out.println(index);

				BeanUtils.populate(this.user, request.getParameterMap());
				this.user.setIdkh(index);
				this.daouser.updateprofileuser(this.user);
				response.sendRedirect(request.getContextPath() + "/Profile?id=" + index + "&&sucssec=2");
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}

		}
	}

	private void profile(HttpServletRequest request, HttpServletResponse response, int id) {
		this.user = this.daouser.findbyid(id);
		request.setAttribute("profile", this.user);
		profilebooking(request, response, this.user);
	}

	private void profilebooking(HttpServletRequest request, HttpServletResponse response, KhachHang kh) {
		this.lstttbd = this.daottbd.findTTBDbyIDkh(kh);
		request.setAttribute("lstbandat", this.lstttbd);
		hoadon(request, response, kh);
	}

	private void hoadon(HttpServletRequest request, HttpServletResponse response, KhachHang kh) {

		this.lsthd = this.daohd.findHDbyIDkh(kh);
		request.setAttribute("lsthoadon", this.lsthd);
	}
}
