package com.japanwork.payload.response;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.japanwork.model.Company;

public class JobResponse {
	private UUID id;
	
	private Company company;
	
	private String name;

	@JsonProperty("business_ids")
	private Set<UUID> businessIds = new HashSet<>();
	
	@JsonProperty("contract_id")
	private UUID contractId;
	
	@JsonProperty("level_id")
	private UUID levelId;
	
	@JsonProperty("japanese_level")
	private int japaneseLevel;
	
	@JsonProperty("required_education")
	private String requiredEducation;
	
	
	@JsonProperty("required_experience")
	private String requiredExperience;
	
	@JsonProperty("required_language")
	private String requiredLanguage;
	
	private String desc;
	
	@JsonProperty("city_id")
	private UUID cityId;
	
	@JsonProperty("district_id")
	private UUID districtId;
	
	private String address;
	
    @JsonProperty("expiring_date")
    private Date applicationDeadline;
    
	@JsonProperty("min_salary")
	private float minSalary;
	
	@JsonProperty("max_salary")
	private float maxSalary;
	
	private String benefits;	
	
	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<UUID> getBusinessIds() {
		return businessIds;
	}

	public void setBusinessIds(Set<UUID> businessIds) {
		this.businessIds = businessIds;
	}

	public UUID getContractId() {
		return contractId;
	}

	public void setContractId(UUID contractId) {
		this.contractId = contractId;
	}

	public UUID getLevelId() {
		return levelId;
	}

	public void setLevelId(UUID levelId) {
		this.levelId = levelId;
	}

	public int getJapaneseLevel() {
		return japaneseLevel;
	}

	public void setJapaneseLevel(int japaneseLevel) {
		this.japaneseLevel = japaneseLevel;
	}

	public String getRequiredEducation() {
		return requiredEducation;
	}

	public void setRequiredEducation(String requiredEducation) {
		this.requiredEducation = requiredEducation;
	}

	public String getRequiredExperience() {
		return requiredExperience;
	}

	public void setRequiredExperience(String requiredExperience) {
		this.requiredExperience = requiredExperience;
	}

	public String getRequiredLanguage() {
		return requiredLanguage;
	}

	public void setRequiredLanguage(String requiredLanguage) {
		this.requiredLanguage = requiredLanguage;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public UUID getCityId() {
		return cityId;
	}

	public void setCityId(UUID cityId) {
		this.cityId = cityId;
	}

	public UUID getDistrictId() {
		return districtId;
	}

	public void setDistrictId(UUID districtId) {
		this.districtId = districtId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getApplicationDeadline() {
		return applicationDeadline;
	}

	public void setApplicationDeadline(Date applicationDeadline) {
		this.applicationDeadline = applicationDeadline;
	}

	public float getMinSalary() {
		return minSalary;
	}

	public void setMinSalary(float minSalary) {
		this.minSalary = minSalary;
	}

	public float getMaxSalary() {
		return maxSalary;
	}

	public void setMaxSalary(float maxSalary) {
		this.maxSalary = maxSalary;
	}

	public String getBenefits() {
		return benefits;
	}

	public void setBenefits(String benefits) {
		this.benefits = benefits;
	}

	public JobResponse(UUID id, Company company, String name, Set<UUID> businessIds, UUID contractId, UUID levelId,
			int japaneseLevel, String requiredEducation, String requiredExperience, String requiredLanguage,
			String desc, UUID cityId, UUID districtId, String address, Date applicationDeadline, float minSalary,
			float maxSalary, String benefits) {
		super();
		this.id = id;
		this.company = company;
		this.name = name;
		this.businessIds = businessIds;
		this.contractId = contractId;
		this.levelId = levelId;
		this.japaneseLevel = japaneseLevel;
		this.requiredEducation = requiredEducation;
		this.requiredExperience = requiredExperience;
		this.requiredLanguage = requiredLanguage;
		this.desc = desc;
		this.cityId = cityId;
		this.districtId = districtId;
		this.address = address;
		this.applicationDeadline = applicationDeadline;
		this.minSalary = minSalary;
		this.maxSalary = maxSalary;
		this.benefits = benefits;
	}
}
