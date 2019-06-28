package com.japanwork.controller;

import java.util.UUID;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.japanwork.common.CommonFunction;
import com.japanwork.constant.UrlConstant;
import com.japanwork.payload.request.JobFilterRequest;
import com.japanwork.payload.request.JobRequest;
import com.japanwork.payload.response.BaseDataMetaResponse;
import com.japanwork.payload.response.BaseDataResponse;
import com.japanwork.security.CurrentUser;
import com.japanwork.security.UserPrincipal;
import com.japanwork.service.JobService;

@Controller
public class JobController {
	@Autowired
	private JobService jobService;
	
	
	@GetMapping(UrlConstant.URL_JOB)
	@ResponseBody
	public BaseDataMetaResponse listJob(@RequestParam(defaultValue = "1", name = "page") int page, 
			@RequestParam(defaultValue = "25", name = "paging") int paging,
			@RequestParam(defaultValue = "", name = "job_name") String jobName,
			@RequestParam(defaultValue = "", name = "company_name") String companyName,
			@RequestParam(defaultValue = "", name = "business_ids") String businessIds,
			@RequestParam(defaultValue = "", name = "contract_ids") String contractIds,
			@RequestParam(defaultValue = "", name = "level_ids") String levelIds,
			@RequestParam(defaultValue = "", name = "city_ids") String cityIds,
			@RequestParam(defaultValue = "0", name = "min_salary") int minSalary,
			@RequestParam(defaultValue = "", name = "post_time") String postTime) {	
		
		JobFilterRequest jobFilterRequest = new JobFilterRequest();
		jobFilterRequest.setJobName(jobName);
		jobFilterRequest.setCompanyName(companyName);
		jobFilterRequest.setBusinessIds(CommonFunction.listParam(businessIds));
		jobFilterRequest.setCityIds(CommonFunction.listParam(cityIds));
		jobFilterRequest.setContractIds(CommonFunction.listParam(contractIds));
		jobFilterRequest.setLevelIds(CommonFunction.listParam(levelIds));
		jobFilterRequest.setMinSalary(minSalary);
		jobFilterRequest.setPostTime(postTime);
		return jobService.findAllByIsDelete(jobFilterRequest, page, paging);
	}
	
	@GetMapping(UrlConstant.URL_COMPANY_ID_JOB)
	@ResponseBody
	public BaseDataMetaResponse listJobByCompny(@RequestParam(defaultValue = "1", name = "page") int page, 
			@RequestParam(defaultValue = "25", name = "paging") int paging, @PathVariable UUID id) {		
		return jobService.findAllByCompanyIdAndIsDelete(page, paging, id);
	}
	
	@PostMapping(UrlConstant.URL_JOB)
	@ResponseBody
	public BaseDataResponse create(@Valid @RequestBody JobRequest jobRequest, @CurrentUser UserPrincipal userPrincipal) {		
		return jobService.save(jobRequest, userPrincipal);
	}
	
	@GetMapping(UrlConstant.URL_JOB_ID)
	@ResponseBody
	public BaseDataResponse findJobByIdAndIsDelete(@PathVariable UUID id){		
		return jobService.findByIdAndIsDelete(id);
	}
	
	@PatchMapping(UrlConstant.URL_JOB_ID)
	@ResponseBody
	public BaseDataResponse update(@Valid @RequestBody JobRequest jobRequest, @PathVariable UUID id, 
			@CurrentUser UserPrincipal userPrincipal) {		
		return jobService.update(jobRequest, id, userPrincipal);
	}
	
	@DeleteMapping(UrlConstant.URL_JOB_ID)
	@ResponseBody
	public BaseDataResponse del(@PathVariable UUID id, @CurrentUser UserPrincipal userPrincipal) {		
		return jobService.isDel(id, userPrincipal, true);
	}
	
	@GetMapping(UrlConstant.URL_JOB_UNDEL)
	@ResponseBody
	public BaseDataResponse unDel(@PathVariable UUID id, @CurrentUser UserPrincipal userPrincipal) {		
		return jobService.isDel(id, userPrincipal, false);
	}
}
