package com.psl.KB.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;
import com.psl.KB.DAO.AreaDAO;
import com.psl.KB.connection.ConnectionFactory;
import com.psl.KB.model.Area;

public class AreaDAOImpl implements AreaDAO{
	
	Area area = new Area();
	Set<Area> areaSet = new HashSet<Area>();
	Connection connection;
	PreparedStatement prepairedStatement;
	Statement statement;
	ResultSet resultset;
	int rowResulted;
	boolean isResultSetExists;
	
	final String SELECT_AREA_BY_AREA_ID_QUERY = "SELECT area_id, area_name FROM area_table WHERE area_id = ?";
	final String SELECT_AREA_BY_AREA_NAME_QUERY = "SELECT area_id, area_name FROM area_table WHERE area_name LIKE ?";
	final String SELECT_ALL_AREA_QUERY = "SELECT area_id, area_name FROM area_table";
	final String INSERT_AREA_QUERY = "INSERT INTO area_table (area_name) VALUES (?)";
	
	public Area getAreaById(int AreaId) {
		connection = ConnectionFactory.createConnection();
		try {
			prepairedStatement = connection.prepareStatement(SELECT_AREA_BY_AREA_ID_QUERY);
			prepairedStatement.setInt(1, AreaId);
			resultset = prepairedStatement.executeQuery();
			while(resultset.next()) {
				area.setAreaId(resultset.getInt(1));
				area.setAreaName(resultset.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return area;
	}

	public Area getAreaByName(String AreaName) {
		connection = ConnectionFactory.createConnection();
		try {
			prepairedStatement = connection.prepareStatement(SELECT_AREA_BY_AREA_NAME_QUERY);
			prepairedStatement.setString(1, "%"+AreaName+"%");
			resultset = prepairedStatement.executeQuery();
			while(resultset.next()) {
				area.setAreaId(resultset.getInt(1));
				area.setAreaName(resultset.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return area;
	}

	public boolean isAreaExist(String AreaName) {
		connection = ConnectionFactory.createConnection();
		try {
			prepairedStatement = connection.prepareStatement(SELECT_AREA_BY_AREA_NAME_QUERY);
			prepairedStatement.setString(1, "%"+AreaName+"%");
			resultset = prepairedStatement.executeQuery();
			if(resultset.next()) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean addArea(String AreaName) {
		connection = ConnectionFactory.createConnection();
		try {
			prepairedStatement = connection.prepareStatement(INSERT_AREA_QUERY);
			prepairedStatement.setString(1, AreaName);
			rowResulted = prepairedStatement.executeUpdate();
			if(rowResulted > 0) {
				return true;
			}else {
				return false;
			}
		}catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e) {
			System.out.println("Ignored Insert : '"+AreaName+"' due to Duplicate entry...");
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public Set<Area> getAllArea() {
		connection = ConnectionFactory.createConnection();
		try {
			statement = connection.createStatement();
			resultset = statement.executeQuery(SELECT_ALL_AREA_QUERY);
			while(resultset.next()) {
				area.setAreaId(resultset.getInt(1));
				area.setAreaName(resultset.getString(2));
				areaSet.add(area);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return areaSet;
	}

}
