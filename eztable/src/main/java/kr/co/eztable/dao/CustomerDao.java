package kr.co.eztable.dao;

import java.util.List;

import kr.co.eztable.model.Customer;
import kr.co.eztable.model.Pager;

public interface CustomerDao {

	List<Customer> list(Pager pager);

	int total(Pager pager);

	void update(Customer item);

	void delete(String custCode);

	void add(Customer item);

}
