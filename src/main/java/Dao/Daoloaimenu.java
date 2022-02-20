package Dao;

import model.LoaiMenu;

public class Daoloaimenu extends BaseDao<LoaiMenu> {

	@Override
	public Class<LoaiMenu> getmodeclass() {
		return LoaiMenu.class;
	}

	@Override
	public String getdatabase() {
		return LoaiMenu.class.getSimpleName();
	}

}
