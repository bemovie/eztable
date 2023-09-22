package kr.co.eztable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.eztable.dao.CustomerDao;
import kr.co.eztable.model.Customer;
import kr.co.eztable.model.Pager;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDao dao;
	
	@Override
	public List<Customer> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public void update(Customer item) {
		dao.update(item);
	}

	@Override
	public void delete(String custCode) {
		dao.delete(custCode);
	}

	@Override
	public void add(Customer item) {
		dao.add(item);
	}



}
