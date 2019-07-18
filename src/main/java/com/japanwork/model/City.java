package com.japanwork.model;

import java.sql.Timestamp;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
@Entity
@Table(name = "city")
public class City {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
	private UUID id;
	
    @JsonProperty("country_code")
    @Column(name="country_code")
	private String countryCode;
	
	@Column(name="name_vi")
    private String vi;
    
    @Column(name="name_ja")
    private String ja;
    
    @Column(name="description")
    private String desc;
    
    @JsonIgnore
    @Column(name="created_at")
    private Timestamp createdAt;
    
    @JsonIgnore
    @Column(name="updated_at")
    private Timestamp updatedAt;
    
    @JsonIgnore
    @Column(name="deleted_at")
    private Timestamp deletedAt;

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getVi() {
		return vi;
	}

	public void setVi(String vi) {
		this.vi = vi;
	}

	public String getJa() {
		return ja;
	}

	public void setJa(String ja) {
		this.ja = ja;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Timestamp getDeletedAt() {
		return deletedAt;
	}

	public void setDeletedAt(Timestamp deletedAt) {
		this.deletedAt = deletedAt;
	}

	public City(UUID id, String countryCode, String vi, String ja, String desc, Timestamp createdAt,
			Timestamp updatedAt, Timestamp deletedAt) {
		this.id = id;
		this.countryCode = countryCode;
		this.vi = vi;
		this.ja = ja;
		this.desc = desc;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.deletedAt = deletedAt;
	}

	public City(UUID id) {
		this.id = id;
	}
	
	public City() {

	}
}
