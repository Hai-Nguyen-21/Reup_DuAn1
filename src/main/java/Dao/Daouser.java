package Dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import model.KhachHang;
import model.Staff;
import utils.Connectjpa;

public class Daouser extends BaseDao<KhachHang>{
	private KhachHang user;
	private Connectjpa conn;
	private EntityManager manager;
	private EntityTransaction transaction;
	private List<KhachHang> lst;
	public Daouser() {
		this.user= new KhachHang();
		this.conn=new Connectjpa();
		this.lst=new ArrayList<KhachHang>();
	}	
	@Override
	public Class<KhachHang> getmodeclass() {
		return KhachHang.class;
	}
	
	public List<KhachHang> findbyidkh(int id){
		String hql="SELECT k FROM KhachHang k WHERE idkh=:ky_hoc";
		this.manager=this.conn.getEntityManager();
		TypedQuery<KhachHang> query=this.manager.createQuery(hql,KhachHang.class);
		query.setParameter("ky_hoc", id);
		this.lst=query.getResultList();
		return this.lst;
	}
	
	public void changepassworduser(int id,String newpass) {
		this.manager = this.conn.getEntityManager();
		this.transaction=manager.getTransaction();
		try {
			this.manager.getTransaction().begin();
			manager.flush(); manager.clear();
			String hql = "UPDATE KhachHang k SET password=:new_pass WHERE idkh=:id_kh";
			Query query = this.manager.createQuery(hql);
			query.setParameter("new_pass", newpass);
			query.setParameter("id_kh",id);
			query.executeUpdate();
			this.transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateprofileuser(KhachHang k) {
		this.manager = this.conn.getEntityManager();
		this.transaction=manager.getTransaction();
		try {
			this.manager.getTransaction().begin();
			manager.flush(); manager.clear();
			String hql = "UPDATE KhachHang k SET hoTen=:ho_ten , gmail=:mail , sdt=:so_dt WHERE idkh=:id_kh";
			Query query = this.manager.createQuery(hql);
			query.setParameter("ho_ten", k.getHoTen());
			query.setParameter("mail",k.getGmail());
			query.setParameter("so_dt",k.getSdt());
			query.setParameter("id_kh",k.getIdkh());
			query.executeUpdate();
			this.transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public KhachHang login(String username,String password) {
		try {
			this.manager = this.conn.getEntityManager();
			String sql = "SELECT k FROM KhachHang k WHERE username = :userName AND password=:ps";
			TypedQuery<KhachHang> query = manager.createQuery(sql, KhachHang.class);
			query.setParameter("userName", username);
			query.setParameter("ps", password);
			this.user = query.getResultList().get(0);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return user;
	}
	

	public List<KhachHang> findEmail(String username, String gmail) {
		KhachHang kh = new KhachHang();
		try {
			manager = conn.getEntityManager();
			String sql = "select u from KhachHang u where u.username=:user_name and u.gmail=:mail";
			TypedQuery<KhachHang> query = manager.createQuery(sql, KhachHang.class);
			query.setParameter("user_name", username);
			query.setParameter("mail", gmail);
			lst = query.getResultList();
			for(KhachHang list: lst) {
				if(username.equals(list.getUsername())&& gmail.equals(list.getGmail())) {
					return lst;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public KhachHang checkAcc(String username) {
		this.manager = this.conn.getEntityManager();
		KhachHang khach = new KhachHang();
		try {
			String hql = "SELECT k FROM KhachHang k WHERE username = :user_name";
			TypedQuery<KhachHang> query = this.manager.createQuery(hql, KhachHang.class);
			query.setParameter("user_name", username);
			khach = query.getSingleResult();
		} catch (NoResultException e) {
			e.printStackTrace();
			return null;
		}
		return khach;
	}
	
	public void updatettdb(int id,String name,String sdt) {
		this.manager=this.conn.getEntityManager();
		this.transaction=this.manager.getTransaction();
		try {
			this.manager.getTransaction().begin();
			manager.flush(); manager.clear();
			String hql="Update KhachHang k SET ho_ten=:ten, sdt=:sodt WHERE idkh=:id";
			Query query=this.manager.createQuery(hql);
			query.setParameter("ten", name);
			query.setParameter("sodt", sdt);
			query.setParameter("id", id);
			query.executeUpdate();
			this.transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			this.transaction.rollback();
		}
	}
	
	// kiểm tra số tài khoản đã tồn tại không (class liên quan:Notification)
	public KhachHang showuserbyphone(String phone) {
		this.manager = this.conn.getEntityManager();
		KhachHang khach = new KhachHang();
		try {
			String hql = "SELECT A FROM KhachHang A WHERE sdt = :phone_number";
			TypedQuery<KhachHang> query = this.manager.createQuery(hql, KhachHang.class);
			query.setParameter("phone_number", phone);
			khach = query.getSingleResult();
		} catch (NoResultException e) {
			e.printStackTrace();
			return null;
		}
		return khach;
	}
	public List<KhachHang> findMemberByAjax(String name){
		this.manager = this.conn.getEntityManager();
		String hql = "SELECT k FROM KhachHang k WHERE hoTen LIKE :key";
		TypedQuery<KhachHang> query=this.manager.createQuery(hql,KhachHang.class);
		query.setParameter("key","%" + name + "%");
		List<KhachHang> list = query.getResultList();
		return list;
	}
	
	@Override
	public String getdatabase() {
		return KhachHang.class.getSimpleName();
	}
	
	public void changepass(int id,String pw) {
		this.manager=this.conn.getEntityManager();
		
	}

}
