package Controller;

import java.io.IOException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DaoHDCT;
import Dao.DaoHoadon;
import Services.WriteExcel;
import model.Hdct;
import model.HoaDon;
import model.KhachHang;
import model.ThongTinBanDat;

@WebServlet({ "/Controller_Bill", "/Controller_Bill/inHD", "/Controller_Bill/Back", "/Controller_Bill/pay" })
public class Controller_Bill extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoHoadon dao_HD;
	private HoaDon hd;
	private List<HoaDon> listHD;
	private List<Hdct> listHDCT;
	private DaoHDCT dao_HDCT;
	private WriteExcel writeExcel;

	public Controller_Bill() {
		super();
		this.dao_HD = new DaoHoadon();
		this.hd = new HoaDon();
		this.listHD = new ArrayList<HoaDon>();
		this.listHDCT = new ArrayList<Hdct>();
		this.dao_HDCT = new DaoHDCT();
		this.writeExcel = new WriteExcel();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.hd = this.dao_HD.sortIDbyHD();
		ThongTinBanDat ttbd = this.hd.getThongTinBanDat();
		int idBD = ttbd.getIdBd();
		request.setAttribute("idBD", idBD);

		Time timeBD = ttbd.getGioDatBan();
		request.setAttribute("timeBD", timeBD);

		int idHD = this.hd.getIdhd() + 1;
		request.setAttribute("idHD", idHD);

		Time timeKT = hd.getthoiGianKT();
		request.setAttribute("timeKT", timeKT);

		Float sum = hd.getTong_Tien();
		request.setAttribute("sum", sum);

		Float sale = hd.getKhuyen_mai();
		request.setAttribute("sale", sale);

		KhachHang kh = this.hd.getKhachHang();
		String name = kh.getHoTen();
		request.setAttribute("name", name);

		int id_HD = 2;
		this.hd = this.dao_HD.findbyid(id_HD);
		this.listHDCT = this.dao_HDCT.findhdctbyidhd(this.hd);
		request.setAttribute("hdct", this.listHDCT);
		request.getRequestDispatcher("/views/Staff/ThongTinHoaDon.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("inHD")) {
			this.writeExcel.exportExcel(response);
			doGet(request, response);
			//response.sendRedirect(request.getContextPath() + "/Controller_Bill");
		} else if (url.contains("Back")) {
			response.sendRedirect(request.getContextPath() + "/Lienhe");
		} else if (url.contains("pay")) {
			response.sendRedirect(request.getContextPath() + "/Menu");
		}
	}

}
