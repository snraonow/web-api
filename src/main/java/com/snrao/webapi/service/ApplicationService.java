package com.snrao.webapi.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.jvnet.hk2.annotations.Service;
import org.springframework.stereotype.Component;

import com.snrao.webapi.entity.Applications;

@Service
@Component
public class ApplicationService {

	public List<Applications> getApplications(){
		List<Applications> applications = new ArrayList<>();
		applications.add( Applications.builder().name("app1").fUUID(UUID.randomUUID()).build());
		return applications;
	}

}
