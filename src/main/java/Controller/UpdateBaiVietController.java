package Controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Dao.NhanVienDao;
import Dao.baiVietDao;
import model.BaiViet;
import model.Staff;

@MultipartConfig
@WebServlet({ "/UpdateBaiVietController", "/UpdateBaiVietController/update" })
public class UpdateBaiVietController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private baiVietDao dao;
	private BaiViet bv;
	private NhanVienDao daonv;

	private List<BaiViet> lst;
	private Staff f;

	public UpdateBaiVietController() {
		this.dao = new baiVietDao();
		this.daonv = new NhanVienDao();
		this.bv = new BaiViet();
		this.lst = new ArrayList<BaiViet>();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		try {

			int id = Integer.parseInt(request.getParameter("id"));
			bv = this.dao.findbyid(id);
			request.setAttribute("bv", bv);
			Part imagePath = request.getPart("img");
//			String imageFile = Path.of(imagePath.getSubmittedFileName()).getFileName().toString();
//			request.setAttribute(imageFile, imageFile);
			//bv.setImg(imageFile);

		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("views/Staff/EditBaiViet.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			Staff staff = (Staff) session.getAttribute("acountKH");
			f = daonv.findbyid(1);
			String realpath = request.getServletContext().getRealPath("/img");
			Path path = Paths.get(realpath);
			if (!Files.exists(path)) {
				Files.createDirectory(path);
			}
			Part part = request.getPart("img");
			String namefile = Path.of(part.getSubmittedFileName()).getFileName().toString();
			part.write(Paths.get(realpath.toString(), namefile).toString());
			String mota = request.getParameter("noidung");
			String tieude = request.getParameter("tieude");
			String link = request.getParameter("link");
			bv.setTen_tieu_de(tieude);
			bv.setLink(link);
			bv.setNoi_dung(mota);
			bv.setStaff(f);
			dao.update(bv);
			response.sendRedirect(request.getContextPath() + "/HomeStaffController");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
