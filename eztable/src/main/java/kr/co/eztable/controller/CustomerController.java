package kr.co.eztable.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.eztable.model.Customer;
import kr.co.eztable.model.Pager;
import kr.co.eztable.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	final String path = "customer/";
	
	@Autowired
	CustomerService service;
	
	@GetMapping("/list")
	String list(Model model, Pager pager) {
		List<Customer> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@PostMapping("/update/{custCode}")
	String update(@PathVariable String custCode, Customer item) {
		item.setCustCode(custCode);
		
		service.update(item);
		
		return "redirect:../list";
	}
	
	
	@GetMapping("/delete/{custCode}")
	String delete(@PathVariable String custCode) {
		service.delete(custCode);
		
		return "redirect:../list";
	}
	
	
	
	
}
