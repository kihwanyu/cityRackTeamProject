package com.kh.cityrack.product.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.product.admin.model.dao.PcategoryDao;
import com.kh.cityrack.product.admin.model.dto.Pcategory;

import static com.kh.cityrack.common.JDBCTemplet.*;
public class PcategoryService {

	public int categoryInsert(String category_name) {
		Connection conn = getConnection();
		
		int result = new PcategoryDao().categoryInsert(conn, category_name);
		
		if(result > 0){
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Pcategory> categoryGetAll() {
		Connection conn = getConnection();
		
		ArrayList<Pcategory> cList = new PcategoryDao().categoryGetAll(conn);
		
		close(conn);
		
		return cList;
	}

	public int categoryUpdate(Pcategory pc) {
		Connection conn = getConnection();
		
		int result = 0;
				
		result = new PcategoryDao().categoryUpdate(conn, pc);
		
		if(result > 0){
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int categoryDelete(String cano) {
		Connection conn = getConnection();
				
		int result = new PcategoryDao().categoryDelete(conn, cano);
		
		if(result > 0){
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
