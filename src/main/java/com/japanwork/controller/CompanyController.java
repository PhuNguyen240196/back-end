package com.japanwork.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
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

import com.japanwork.constant.MessageConstant;
import com.japanwork.constant.UrlConstant;
import com.japanwork.payload.request.CompanyRequest;
import com.japanwork.payload.response.BaseDataMetaResponse;
import com.japanwork.payload.response.BaseDataResponse;
import com.japanwork.payload.response.BaseMessageResponse;
import com.japanwork.security.CurrentUser;
import com.japanwork.security.UserPrincipal;
import com.japanwork.service.CompanyService;
import com.japanwork.service.UserService;

@Controller
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	@Autowired
	private UserService userService;
	
	
	@GetMapping(UrlConstant.URL_COMPANY)
	@ResponseBody
	public BaseDataMetaResponse listCompany(@RequestParam(defaultValue = "1", name = "page") int page, @RequestParam(defaultValue = "25", name = "paging") int paging) {
		return companyService.findAllByIsDelete(page, paging);
	}
	
	@PostMapping(UrlConstant.URL_COMPANY)
	@ResponseBody
	public BaseDataResponse create(@Valid @RequestBody CompanyRequest companyRequest, @CurrentUser UserPrincipal userPrincipal) {
		
		if(companyService.checkCompanyByUser(userService.findById(userPrincipal.getId()))) {
			BaseMessageResponse baseMessageResponse = new BaseMessageResponse(MessageConstant.INVALID_INPUT, MessageConstant.COMPANY_ALREADY);
			BaseDataResponse baseDataResponse = new BaseDataResponse(baseMessageResponse);
			return baseDataResponse;
		}
		
		return companyService.save(companyRequest, userPrincipal);
	}
	
	@GetMapping(UrlConstant.URL_COMPANY_ID)
	@ResponseBody
	public BaseDataResponse findCompanyByIdAndIsDelete(@PathVariable UUID id){		
		return companyService.findByIdAndIsDelete(id);
	}
	
	@PatchMapping(UrlConstant.URL_COMPANY_ID)
	@ResponseBody
	public BaseDataResponse update(@Valid @RequestBody CompanyRequest companyRequest, @PathVariable UUID id, @CurrentUser UserPrincipal userPrincipal, HttpServletResponse httpServletResponse){		
		return companyService.update(companyRequest, id, userPrincipal, httpServletResponse);
	}
	
	@DeleteMapping(UrlConstant.URL_COMPANY_ID)
	@ResponseBody
	public BaseDataResponse isDel(@PathVariable UUID id) {		
		return companyService.isDel(id);
	}
	
	@GetMapping(UrlConstant.URL_COMPANY_UNDEL_ID)
	@ResponseBody
	public BaseDataResponse unDel(@PathVariable UUID id) {		
		return companyService.unDel(id);
	}
	
	@DeleteMapping(UrlConstant.URL_COMPANY_DEL_ID)
	@ResponseBody
	public BaseDataResponse del(@PathVariable UUID id) {		
		return companyService.del(id);
	}
}
