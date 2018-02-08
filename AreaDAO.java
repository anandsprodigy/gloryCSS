package com.psl.KB.DAO;

import java.util.Set;

import com.psl.KB.model.Area;

public interface AreaDAO {
	public Area getAreaById(int AreaId);

	public Area getAreaByName(String AreaName);

	public boolean isAreaExist(String AreaName);

	public boolean addArea(String AreaName);

	public Set<Area> getAllArea();
}
