package com.kh.cityrack.product.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.product.user.model.dao.PcategoryDao;
import com.kh.cityrack.product.user.model.dto.Pcategory;
import static com.kh.cityrack.common.JDBCTemplet.*;

public class PcategoryService {

	public ArrayList<Pcategory> selectAllCategory() {
		Connection con = getConnection();
		
		ArrayList<Pcategory> cList = new PcategoryDao().selectAllCategory(con);
		
		close(con);
		
		return cList;
	}

}
