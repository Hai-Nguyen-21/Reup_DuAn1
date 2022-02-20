package Controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.beanutils.BeanUtils;
import Dao.DaoTTBD;
import Dao.Daouser;
import model.KhachHang;
import model.ThongTinBanDat;

/**
 * Servlet implementation class Changebooking
 */
@WebServlet("/Changebooking")
public class Changebooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private DaoTTBD daottbd;
     private ThongTinBanDat ttbd;
     private KhachHang kh;
     private Daouser daouser;
    public Changebooking() {
        this.daottbd=new DaoTTBD();
        this.ttbd=new ThongTinBanDat();
        this.daouser=new Daouser();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int index=Integer.parseInt(request.getParameter("index"));
		request.setAttribute("idttdb", index);
		this.ttbd=this.daottbd.findbyid(index);
		request.setAttribute("show", this.ttbd);
		request.getRequestDispatcher("/views/assets/EditInfoSauDatBan.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int index=Integer.parseInt(request.getParameter("index"));
		HttpSession session=request.getSession();
		this.kh=(KhachHang) session.getAttribute("acountKH");
		this.updatemember(request, response, this.kh.getIdkh());
		this.updatettdb(request, response, index);
		response.sendRedirect(request.getContextPath()+"/profilebooking");
	}

	private void updatettdb(HttpServletRequest request, HttpServletResponse response,int index) {
		String ngaydat=request.getParameter("dateDatBan");
		String giodat=request.getParameter("timedatban");
		Date date=Date.valueOf(ngaydat);
		Time time=Time.valueOf(giodat);
		int soluong = Integer.parseInt(request.getParameter("soluong"));
		String note=request.getParameter("note");
		this.daottbd.Updatelichdat(date, time, note, soluong, index);
	}
	
	private void updatemember(HttpServletRequest request, HttpServletResponse response,int id) {
		String hoten=request.getParameter("ten");
		String sdt=request.getParameter("sdt");
		this.daouser.updatettdb(id, hoten, sdt);
	}
}
