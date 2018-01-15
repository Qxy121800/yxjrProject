package com.p2p.service.impl.back;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.plugins.Page;
import com.p2p.mapper.LoanMapper;
import com.p2p.pojo.Loan;
import com.p2p.service.back.LoanService;
import com.p2p.util.PageInfo;

@Transactional
@Service
public class LoanServiceImpl implements LoanService{
	@Resource
	private LoanMapper loanMapper;
	@Override
	public int addModel(Loan model) {
		return loanMapper.addModel(model);
	}

	@Override
	public Loan getModel(Loan model) {
		return loanMapper.getModel(model);
	}

	@Override
	public List<Loan> getAllModel() {
		return loanMapper.getAllModel();
	}

	@Override
	public int update(Loan model) {
		return loanMapper.update(model);
	}

	@Override
	public int delete(Loan model) {
		return loanMapper.delete(model);
	}

	@Override
	public Loan findModel(Integer id) {

		return loanMapper.findModel(id);
	}

	@Override
	public void selectPage(PageInfo pageInfo, Loan loan) {
		Page<Loan> page = new Page(pageInfo.getNowpage(),pageInfo.getSize());
		List<Loan> list = loanMapper.selectPage(page, pageInfo.getCondition(), loan);
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
	}

	@Override
	public Integer Loancount() {
		return loanMapper.loancount();
	}

	@Override
	public Loan getByemployname(String ename) {
		return loanMapper.getByemployname(ename);
	}

}