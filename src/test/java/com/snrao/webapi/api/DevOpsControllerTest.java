package com.snrao.webapi.api;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import com.snrao.webapi.entity.Applications;
import com.snrao.webapi.service.ApplicationService;

@SpringBootTest
public class DevOpsControllerTest {
	@Autowired
	DevOpsController fDevOpsController;

	@MockBean
	ApplicationService fApplicationService;

	@Test
	public void checkIfApplicationReturnsAllData(){
		List<Applications> applicationsList = new ArrayList<>();
		applicationsList.add(Applications.builder().fUUID(UUID.randomUUID()).name("app1").build());
		when(fApplicationService.getApplications()).thenReturn(applicationsList);
		List<Applications> resultApps = fDevOpsController.getDevOpsApplication();
		assertThat(resultApps.size()).isEqualTo(1);
	}
	
	@Test
	public void thisTestRunsSuccessful(){
		assertThat(true);
	}
	
}
