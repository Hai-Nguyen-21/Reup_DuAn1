package Dao;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import model.KhachHang;
import model.ThongTinBanDat;
import utils.Connectjpa;

public class DaoTTBD extends BaseDao<ThongTinBanDat>{
	private ThongTinBanDat ttbd;
	private List<ThongTinBanDat> lstttbd;
	private Connectjpa conn;
	private EntityManager manager;
	private EntityTransaction transaction;
	public DaoTTBD() {
		this.ttbd=new ThongTinBanDat();
		this.lstttbd=new ArrayList<ThongTinBanDat>();
		this.conn=new Connectjpa();
	}
	@Override
	public Class<ThongTinBanDat> getmodeclass() {
		return ThongTinBanDat.class;
	}

	@Override
	public String getdatabase() {
		return ThongTinBanDat.class.getSimpleName();
	}
	
	public List<ThongTinBanDat> findTTBDbyIDkh(KhachHang kh){
		String hql="Select t From ThongTinBanDat t Where khachHang=:id_kh ORDER BY idBd desc";
		this.manager=this.conn.getEntityManager();
		TypedQuery<ThongTinBanDat> query=this.manager.createQuery(hql, ThongTinBanDat.class);
		query.setParameter("id_kh", kh);
		this.lstttbd=query.getResultList();
		return this.lstttbd;
	}
	
	public ThongTinBanDat findttbdbystatus(KhachHang kh){
		try {
			String hql="Select t From ThongTinBanDat t Where khachHang=:id_kh and trang_Thai=:status or trang_Thai=:tt";
			this.manager=this.conn.getEntityManager();
			TypedQuery<ThongTinBanDat> query=this.manager.createQuery(hql, ThongTinBanDat.class);
			query.setParameter("id_kh", kh);
			query.setParameter("status", "Waitting line");
			query.setParameter("tt", "Confirmed");
			this.ttbd=query.getSingleResult();
			return this.ttbd;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public void Updatelichdat(Date ngay,Time giodat,String note,int so_luong,int id) {
		this.manager=this.conn.getEntityManager();
		this.transaction=this.manager.getTransaction();
		try {
			
			this.manager.getTransaction().begin();
			manager.flush(); manager.clear();
			String hql="Update ThongTinBanDat t SET ngayDatBan=:ngay, gioDatBan=:gio, so_Luong_Nguoi=:soluong, ghi_Chu=:note WHERE idBd=:index";
		
			Query query=this.manager.createQuery(hql);
			query.setParameter("ngay", ngay);
			query.setParameter("gio", giodat);
			query.setParameter("note", note);
			query.setParameter("soluong", so_luong);
			query.setParameter("index", id);
			query.executeUpdate();
			this.transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			this.transaction.rollback();
		}
	
}
	// hiển thị thông tin bàn đặt với trạng thái là waitting line (class liên quan:Notification)
	public List<ThongTinBanDat> showttbdbywl(){
		try {
			String hql="Select t From ThongTinBanDat t Where t.trang_Thai=:status";
			this.manager=this.conn.getEntityManager();
			TypedQuery<ThongTinBanDat> query=this.manager.createQuery(hql, ThongTinBanDat.class);
			query.setParameter("status", "waitting line");
			this.lstttbd=query.getResultList();
			return this.lstttbd;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// hiển thị thông tin bàn đặt với trạng thái là Confirmed (class liên quan:Notification)
		public List<ThongTinBanDat> showttbdbycf(){
			try {
				String hql="Select t From ThongTinBanDat t Where t.trang_Thai=:status";
				this.manager=this.conn.getEntityManager();
				TypedQuery<ThongTinBanDat> query=this.manager.createQuery(hql, ThongTinBanDat.class);
				query.setParameter("status", "Confirmed");
				this.lstttbd=query.getResultList();
				return this.lstttbd;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		
		// hiển thị thông tin bàn đặt với trạng thái là Cancelled (class liên quan:Notification)
		public List<ThongTinBanDat> showttbdbycancel(){
			try {
				String hql="Select t From ThongTinBanDat t Where t.trang_Thai=:status";
				this.manager=this.conn.getEntityManager();
				TypedQuery<ThongTinBanDat> query=this.manager.createQuery(hql, ThongTinBanDat.class);
				query.setParameter("status", "Cancelled");
				this.lstttbd=query.getResultList();
				return this.lstttbd;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		
		public void deletebd(int id) {
			this.manager=this.conn.getEntityManager();
			this.transaction=this.manager.getTransaction();
			try {
				this.manager.getTransaction().begin();
				manager.flush(); manager.clear();
				String hql="Update ThongTinBanDat t WHERE idBd=:id";
				Query query=this.manager.createQuery(hql);
				query.setParameter("id", id);
				query.executeUpdate();
				this.transaction.commit();
			}catch (Exception e) {
				e.printStackTrace();
				this.transaction.rollback();
			}
		}
		
		//tìm kiếm bản ghi mới nhất theo khách hàng(class liên quan: Notification)
		public ThongTinBanDat findttbdbyuserdesc(KhachHang k) {
			try {
				String hql="Select t From ThongTinBanDat t WHERE t.khachHang=:khach_hang ORDER BY idBd DESC";
				this.manager=this.conn.getEntityManager();
				TypedQuery<ThongTinBanDat> query=this.manager.createQuery(hql, ThongTinBanDat.class);
				query.setParameter("khach_hang", k);
				this.ttbd=query.getResultList().get(0);
				return this.ttbd;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
}
