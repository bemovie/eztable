package kr.co.eztable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.eztable.dao.CustomerDao;
import kr.co.eztable.model.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDao dao;
	
	@Override
	public List<Customer> list() {
		return dao.list();
	}

}
