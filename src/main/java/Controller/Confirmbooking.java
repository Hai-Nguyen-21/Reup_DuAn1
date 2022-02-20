package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DaoCart;
import Dao.DaoTTBD;
import Dao.Daobdct;
import Dao.Daottban;
import model.Bdct;
import model.GioHang;
import model.ThongTinBanDat;
import model.TtBan;
import net.bytebuddy.asm.Advice.This;

@WebServlet({
	"/Confirmbooking",
	"/Confirmbooking/Create"
})
public class Confirmbooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DaoTTBD daottbd;
	private ThongTinBanDat ttbd;
	private Daottban daottban;
	private List<GioHang> lstgh;
	private DaoCart daocart;
	private TtBan ttban;
	private Bdct bdct;
	private Daobdct daobdct;
	private List<Bdct> lstbdct;
	
    public Confirmbooking() {
    	this.daottbd=new DaoTTBD();
    	this.ttbd=new ThongTinBanDat();
    	this.daottban=new Daottban();
    	this.daocart=new DaoCart();
    	this.ttban=new TtBan();
    	this.bdct=new Bdct();
    	this.daobdct=new Daobdct();
    	this.lstbdct=new ArrayList<Bdct>();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int index=Integer.parseInt(request.getParameter("index"));
		this.ttbd=this.daottbd.findbyid(index);
		showemptytable(request, response);
		showcardbyidkh(request, response, this.ttbd);
		request.setAttribute("infor", this.ttbd);
		request.getRequestDispatcher("/views/Staff/DetailConfirmBan.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url=request.getRequestURL().toString();
		int index=Integer.parseInt(request.getParameter("index"));
		this.ttbd=this.daottbd.findbyid(index);
		if(url.contains("Create")) {
			confirm_booking(request, response, this.ttbd);
		}
	}
	
	//Hiển thị tất cả các bàn đang trống
	private void showemptytable(HttpServletRequest request, HttpServletResponse response) {
		List<TtBan> lstemptytable=this.daottban.showemptytable();
		request.setAttribute("ban_trong", lstemptytable);
	}
	
	//Hiển thị giỏ hàng theo khách hàng
	private void showcardbyidkh(HttpServletRequest request, HttpServletResponse response,ThongTinBanDat t) {
		this.lstgh=this.daocart.FindCartbyIDDB(t);
		request.setAttribute("dsgiohang", this.lstgh);
	}
	
	//xác nhận bàn đặt cho khách
	private void confirm_booking(HttpServletRequest request, HttpServletResponse response,ThongTinBanDat t) throws IOException {
		String[] lstb =request.getParameterValues("checkboxbandat");
		//thay đổi trạng thái của thông tin bàn đặt;
		t.setTrang_Thai("Confirmed");
		this.daottbd.update(t);
		//tạo bàn đặt chi tiết
		for(String x:lstb) {
			this.bdct.setThongTinBanDat(t);
			this.ttban=this.daottban.findbyid(Integer.parseInt(x));
			this.bdct.setTtBan(ttban);
			lstbdct.add(new Bdct(0, ttban, t));
		}
		this.daobdct.insertbdct(this.lstbdct);
		response.sendRedirect(request.getContextPath()+ "/Notification");
	}
}
