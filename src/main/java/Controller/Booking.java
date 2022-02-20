package Controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import Dao.DaoCart;
import Dao.DaoTTBD;
import Dao.Daouser;
import model.GioHang;
import model.KhachHang;
import model.ThongTinBanDat;

@WebServlet({
	"/Booking",
	"/Booking/Datban",
	"/Booking/order"
})
public class Booking extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private ThongTinBanDat ttbd;
     private KhachHang kh;
     private Daouser user;
     private DaoTTBD daottbd;
     private List<ThongTinBanDat> lstttdb;
     private List<GioHang> lstgh;
     private DaoCart daocart;
     private ThongTinBanDat thongtinbandat;
     
    public Booking() {
    	this.ttbd=new ThongTinBanDat();
    	this.kh=new KhachHang();
    	this.user=new Daouser();
    	this.daottbd=new DaoTTBD();
    	this.lstttdb=new ArrayList<ThongTinBanDat>();
    	this.lstgh=new ArrayList<GioHang>();
    	this.daocart=new DaoCart();
    	this.thongtinbandat = new ThongTinBanDat();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		this.kh=(KhachHang) session.getAttribute("acountKH");
		if(this.kh == null) {
			response.sendRedirect(request.getContextPath()+"/Login?errorAccNull=1");
		} else {
			int index=this.kh.getIdkh();
			this.ttbd=this.daottbd.findttbdbystatus(this.kh);
			this.lstgh=this.daocart.FindCartbyIDDB(this.ttbd);
			request.setAttribute("inforbooking", this.ttbd);
			request.setAttribute("carts", this.lstgh);
			request.setAttribute("user", this.kh);
			request.setAttribute("iduser", index);
			request.getRequestDispatcher("/views/assets/DatBanKhach.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		this.kh=(KhachHang) session.getAttribute("acountKH");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		if(this.kh == null) {
			response.sendRedirect(request.getContextPath()+"/Login?errorAccNull=1");
		} else {
			int index=this.kh.getIdkh();
			String url=request.getRequestURL().toString();
		
			if(url.contains("order")) {
				insertbd(request, response, index);	
				this.lstttdb=this.daottbd.findTTBDbyIDkh(kh);
				response.sendRedirect(request.getContextPath()+"/Order");
			}else if(url.contains("Datban")) {
				insertbd(request, response, index);	
				response.sendRedirect(request.getContextPath()+ "/Booking");
			}
		}
		
	}

	private void insertbd(HttpServletRequest request, HttpServletResponse response,int index) {
		try {
			BeanUtils.populate(this.thongtinbandat, request.getParameterMap());
			String ngaydat=request.getParameter("dateDatBan");
			String giodat=request.getParameter("timedatban")+":00";
			Date date=Date.valueOf(ngaydat);
			Time time=Time.valueOf(giodat);
			this.thongtinbandat.setNgayDatBan(date);
			this.thongtinbandat.setGioDatBan(time);
			this.kh=this.user.findbyid(index);
			this.thongtinbandat.setKhachHang(kh);
			this.thongtinbandat.setTrang_Thai("Waitting line");
			this.daottbd.insert(this.thongtinbandat);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}