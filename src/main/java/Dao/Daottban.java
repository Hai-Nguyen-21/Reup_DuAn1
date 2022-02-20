package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.TtBan;
import utils.Connectjpa;

public class Daottban extends BaseDao<TtBan>{

	private Connectjpa conn;
	private TtBan ttban;
	private List<TtBan> lstttb;
	private EntityManager manager;
	public Daottban() {
		this.conn=new Connectjpa();
	}
	@Override
	public Class<TtBan> getmodeclass() {
		return TtBan.class;
	}

	@Override
	public String getdatabase() {
		return TtBan.class.getSimpleName();
	}
	
	//hiển thị bàn đang trống
	public List<TtBan> showemptytable(){
		try {
			this.manager=this.conn.getEntityManager();
			String hql="SELECT t FROM TtBan t WHERE t.IDBan NOT IN "
					+ "(SELECT b.ttBan FROM Bdct b where thongTinBanDat IN"
					+ "(SELECT d.idBd FROM ThongTinBanDat d WHERE d.trang_Thai=:status or d.trang_Thai=:tt))";
			TypedQuery<TtBan> query=this.manager.createQuery(hql,TtBan.class);
			query.setParameter("status", "Confirmed");
			query.setParameter("tt", "Is active");
			this.lstttb=query.getResultList();
			return this.lstttb;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
