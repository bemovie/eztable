package kr.co.eztable.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.eztable.model.Customer;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Customer> list() {
		return sql.selectList("customer.list");
	}

}
