package com.psl.KB.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psl.KB.DAOImpl.AreaDAOImpl;

public class TestUtility extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public TestUtility() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().
		append("Served at: ").
		append(request.getContextPath()).
		append(new AreaDAOImpl().getAreaById(1).toString()).
		append(new AreaDAOImpl().getAreaByName("General").toString()).
		append(String.valueOf(new AreaDAOImpl().addArea("Analysis Method"))).
		append(new AreaDAOImpl().getAllArea().toString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
