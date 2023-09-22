package kr.co.eztable.service;

import java.util.List;

import kr.co.eztable.model.Customer;
import kr.co.eztable.model.Pager;

public interface CustomerService {

	List<Customer> list(Pager pager);

	void update(Customer item);

	void delete(String custCode);

	void add(Customer item);
}
