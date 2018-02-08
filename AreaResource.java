package com.psl.KB.service;

import java.util.Set;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.psl.KB.DAOImpl.AreaDAOImpl;
import com.psl.KB.model.Area;

@Path("/area")
public class AreaResource {
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Set<Area> getAllArea(){
		return new AreaDAOImpl().getAllArea();
	}

}
