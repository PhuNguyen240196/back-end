package com.japanwork.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@Entity
@Table(name="company")
public class Company {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
	private UUID id;
    
    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;
    
    @Column(name="name")
    private String name;
    
    @ManyToMany
    @JoinTable(name = "company_business", 
      joinColumns = { @JoinColumn(name = "company_id") }, 
      inverseJoinColumns = {@JoinColumn(name = "business_id") })
    private Set<Business> businesses = new HashSet<>();
    
    @Column(name="scale")
    private int scale;
    
    @ManyToOne
    @JoinColumn(name = "city_id")
    private City city;

    @ManyToOne
    @JoinColumn(name = "district_id")   
    private District district;
    
    @Column(name="address")
    private String address;
    
    @Column(name="logo_url")
    private String logoUrl;
    
    @Column(name="cover_image_url")
    private String coverImageUrl;
    
    @Column(name="introduction")
    private String introduction;
    
    @Column(name="status")
    private String status;
    
    @Column(name="created_at")
    private Timestamp createdAt;
    
    @Column(name="updated_at")
    private Timestamp updatedAt;
    
    @Column(name="deleted_at")
    private Timestamp deletedAt;

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Business> getBusinesses() {
		return businesses;
	}

	public void setBusinesses(Set<Business> businesses) {
		this.businesses = businesses;
	}

	public int getScale() {
		return scale;
	}

	public void setScale(int scale) {
		this.scale = scale;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	public String getCoverImageUrl() {
		return coverImageUrl;
	}

	public void setCoverImageUrl(String coverImageUrl) {
		this.coverImageUrl = coverImageUrl;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public Company() {

	}
	
	public Company(UUID id, User user, String name, Set<Business> businesses, int scale, City city, District district,
			String address, String logoUrl, String coverImageUrl, String introduction, String status,
			Timestamp createdAt, Timestamp updatedAt, Timestamp deletedAt) {
		super();
		this.id = id;
		this.user = user;
		this.name = name;
		this.businesses = businesses;
		this.scale = scale;
		this.city = city;
		this.district = district;
		this.address = address;
		this.logoUrl = logoUrl;
		this.coverImageUrl = coverImageUrl;
		this.introduction = introduction;
		this.status = status;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.deletedAt = deletedAt;
	}

	public Company(UUID id) {
		this.id = id;

	}
}
