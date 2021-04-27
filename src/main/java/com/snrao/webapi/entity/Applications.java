package com.snrao.webapi.entity;

import java.util.UUID;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Applications {
	private String name;
	private UUID fUUID;
}
