package kr.co.eztable.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.eztable.model.Customer;
import kr.co.eztable.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	final String path = "customer/";
	
	@Autowired
	CustomerService service;
	
	@GetMapping("/list")
	String list(Model model) {
		List<Customer> list = service.list();
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	
	
}
