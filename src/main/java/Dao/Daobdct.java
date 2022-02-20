package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import model.Bdct;
import utils.Connectjpa;

public class Daobdct extends BaseDao<Bdct>{

	private EntityManager manager;
	private EntityTransaction transaction;
	private Connectjpa conn;
	
	public Daobdct() {
		this.conn=new Connectjpa();
	}
	
	@Override
	public Class<Bdct> getmodeclass() {
		return Bdct.class;
	}

	@Override
	public String getdatabase() {
		return Bdct.class.getSimpleName();
	}

	//tạo nhiều bàn đặt chi tiết(class liên quan: Confirmbooking)
	public void insertbdct(List<Bdct> lst) {
		try {
			this.manager=this.conn.getEntityManager();
			this.transaction=this.manager.getTransaction();
			transaction.begin();
			for(int i=0;i<lst.size();i++) {
				Bdct b=lst.get(i);
				this.manager.persist(b);
			}
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
	}
	
}
