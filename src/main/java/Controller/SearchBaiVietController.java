package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.NhanVienDao;
import Dao.baiVietDao;
import model.BaiViet;
import model.Staff;

/**
 * Servlet implementation class SearchBaiVietController
 */
@WebServlet("/SearchBaiVietController")
public class SearchBaiVietController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private baiVietDao dao;
	private BaiViet bv;
	private NhanVienDao daonv;

	private List<BaiViet> lst;
	private Staff f;
    public SearchBaiVietController() {
    	this.dao = new baiVietDao();
		this.daonv = new NhanVienDao();
		this.bv = new BaiViet();
		this.lst = new ArrayList<BaiViet>();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		lst=dao.findName(name);
		request.setAttribute("listBV", lst);
		request.getRequestDispatcher("views/Staff/QuanLyBaiVietStaff.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
