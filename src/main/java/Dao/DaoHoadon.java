package Dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import model.HoaDon;
import model.KhachHang;
import model.ThongTinBanDat;
import utils.Connectjpa;

public class DaoHoadon extends BaseDao<HoaDon> {
	private HoaDon hoadon;
	private List<HoaDon> lsthd;
	private Connectjpa conn;
	private EntityManager manager;
	private EntityTransaction transaction;

	public DaoHoadon() {
		this.hoadon = new HoaDon();
		this.lsthd = new ArrayList<HoaDon>();
		this.conn = new Connectjpa();
	}

	@Override
	public Class<HoaDon> getmodeclass() {
		return HoaDon.class;
	}

	@Override
	public String getdatabase() {
		return HoaDon.class.getSimpleName();
	}

	
	public List<HoaDon> findHDbyIDkh(KhachHang kh){
		try {
			String hql = "SELECT h FROM HoaDon h Where h.khachHang=:id_kh ORDER BY h.idhd desc";
			this.manager = this.conn.getEntityManager();
			TypedQuery<HoaDon> query = this.manager.createQuery(hql, HoaDon.class);
			query.setParameter("id_kh", kh);
			this.lsthd = query.getResultList();
			return this.lsthd;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public HoaDon sortIDbyHD() {
		String hql = "SELECT h FROM HoaDon h ORDER BY idhd DESC";
		this.manager = this.conn.getEntityManager();
		TypedQuery<HoaDon> query = this.manager.createQuery(hql, HoaDon.class);
		this.hoadon = query.getResultList().get(0);
		return this.hoadon;
	}
	
	

}
