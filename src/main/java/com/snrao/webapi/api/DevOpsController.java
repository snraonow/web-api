package com.snrao.webapi.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.snrao.webapi.entity.Applications;
import com.snrao.webapi.service.ApplicationService;

@RestController
@RequestMapping("api/v1/devops")
public class DevOpsController {

	@Autowired
	ApplicationService fApplicationService;

	@GetMapping("apps")
	List<Applications> getDevOpsApplication(){

		return fApplicationService.getApplications();
	}
}
