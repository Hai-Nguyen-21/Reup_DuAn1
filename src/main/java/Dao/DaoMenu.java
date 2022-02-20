package Dao;

import model.Menu;

public class DaoMenu extends BaseDao<Menu>{

	@Override
	public Class<Menu> getmodeclass() {
		return Menu.class;
	}

	@Override
	public String getdatabase() {
		return Menu.class.getSimpleName();
	}

}
