package kr.co.eztable.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.eztable.model.Customer;
import kr.co.eztable.model.Pager;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Customer> list(Pager pager) {
		return sql.selectList("customer.list", pager);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("customer.total", pager);
	}

	@Override
	public void update(Customer item) {
		sql.update("customer.update", item);
	}

	@Override
	public void delete(String custCode) {
		sql.delete("customer.delete", custCode);
	}

	@Override
	public void add(Customer item) {
		sql.insert("customer.add", item);
	}

}
