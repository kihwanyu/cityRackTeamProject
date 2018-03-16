package com.kh.cityrack.product.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.cityrack.product.admin.model.dto.Product;
import com.kh.cityrack.product.admin.model.dto.ProductSearch;

import static com.kh.cityrack.common.JDBCTemplet.*;

public class ProductDao {
/**/
	private Properties prop = null;
	public ProductDao(){
		//prop 객체 인스턴스화
		prop = new Properties();
		
		//fileName에 member-query.properties 파일의 위치를 넣어준다.
		String fileName = StockDao.class.getResource("/sql/admin/product/product-query.properties").getPath();
		
		try {
			//prop객체에 member-query.properties 파일위치를 넣어준다.
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int productInsert(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("productInsert");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, Integer.parseInt(p.getCa_code()));
			pstmt.setString(2, p.getP_8constitution());
			pstmt.setString(3, p.getP_name());
			pstmt.setInt(4, p.getP_price());
			pstmt.setString(5, p.getP_event());
			pstmt.setDouble(6, p.getP_discount());
			pstmt.setString(7, p.getP_pic1());
			pstmt.setString(8, p.getP_pic2());
			pstmt.setString(9, p.getP_status());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Product> productGetAll(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> pList = null;
		
		
		String query = prop.getProperty("productGetAll");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			pList = new ArrayList<Product>();
			
			while(rset.next()){
				Product p = new Product();
				p.setP_code(String.valueOf(rset.getInt("P_CODE")));
				p.setP_resisterDate(rset.getDate("P_RESISTERDATE"));
				p.setCa_name(rset.getString("CA_NAME"));
				p.setP_8constitution(rset.getString("P_8CONSTITUTION"));
				p.setP_name(rset.getString("P_NAME"));
				p.setP_price(rset.getInt("P_PRICE"));
				p.setP_event(rset.getString("P_EVENT"));
				p.setP_discount(rset.getDouble("P_DISCOUNT"));
				p.setP_status(rset.getString("P_STATUS"));
				pList.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pList;
	}
	
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				listCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return listCount;
	}
	public Product productGet(Connection conn, String pcode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		
		String query = prop.getProperty("productGet");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, Integer.parseInt(pcode));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				p = new Product();
				p.setP_code(String.valueOf(rset.getInt("P_CODE")));
				p.setCa_code(String.valueOf(rset.getInt("CA_NO")));
				p.setP_resisterDate(rset.getDate("P_RESISTERDATE"));
				p.setP_8constitution(rset.getString("P_8CONSTITUTION"));
				p.setP_name(rset.getString("P_NAME"));
				p.setP_price(rset.getInt("P_PRICE"));
				p.setP_event(rset.getString("P_EVENT"));
				p.setP_discount(rset.getDouble("P_DISCOUNT"));
				p.setP_pic1(rset.getString("P_PIC1"));
				p.setP_pic2(rset.getString("P_PIC2"));
				p.setP_status(rset.getString("P_STATUS"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return p;
	}
	public int productUpdate(Connection conn, Product p) {
		PreparedStatement pstmt = null;		
		int result = 0;
		
		String query = prop.getProperty("productUpdate");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, Integer.parseInt(p.getCa_code()));
			pstmt.setString(2, p.getP_8constitution());
			pstmt.setString(3, p.getP_name());
			pstmt.setInt(4, p.getP_price());
			pstmt.setString(5, p.getP_event());
			pstmt.setDouble(6, p.getP_discount());
			pstmt.setString(7, p.getP_pic1());
			pstmt.setString(8, p.getP_pic2());
			pstmt.setString(9, p.getP_status());
			pstmt.setInt(10, Integer.parseInt(p.getP_code()));
			
			result = pstmt.executeUpdate();
			/*P_CODE
			CA_NO
			P_RESISTERDATE
			P_8CONSTITUTION
			P_NAME
			P_PRICE
			P_EVENT
			P_DISCOUNT
			P_PIC1
			P_PIC2
			P_STATUS*/
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int productDelete(Connection conn, String pcode) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = prop.getProperty("productDelete");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(pcode));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	public ArrayList<Product> productSearchGetAll(Connection conn, int currentPage, int limit, ProductSearch pSearch, String[] searchTypeArr, String orderType) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> pList = null;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT RNUM, P_CODE, P_RESISTERDATE ,CA_NAME, P_8CONSTITUTION, P_NAME, P_PRICE, P_EVENT, P_DISCOUNT, P_STATUS "
				+ "FROM(SELECT ROWNUM RNUM, P_CODE, P_RESISTERDATE ,CA_NAME, P_8CONSTITUTION, P_NAME, P_PRICE, P_EVENT, P_DISCOUNT, P_STATUS "
				+ "FROM(SELECT P.P_CODE, P.P_RESISTERDATE ,C.CA_NAME, P.P_8CONSTITUTION, P.P_NAME, P.P_PRICE,P.P_EVENT, P.P_DISCOUNT, P.P_STATUS "
				+ "FROM PRODUCT P JOIN CATEGORY C ON(P.CA_NO=C.CA_NO) WHERE ");
		
		for(int i = 0; i < searchTypeArr.length; i++){
			switch (searchTypeArr[i]) {
			case "searchCheackedpCode":
				sb.append("P.P_CODE=?");
				break;
			case "searchCheackedRdate": 
				if(pSearch.getAfterDate().getTime() == pSearch.getBeforeDate().getTime()){
					sb.append("P.P_RESISTERDATE LIKE ?");
				} else {
					sb.append("P.P_RESISTERDATE BETWEEN ? AND ?");
				}
				break;
			case "searchCheackedPcategory":
				sb.append("C.CA_NAME=?");
				break;
			case "searchCheackedConstitution":
				sb.append("P.P_8CONSTITUTION=?");
				break;
			case "searchCheackedPname":
				sb.append("P.P_NAME LIKE ?");
				break;
			case "searchCheackedStatus":
				sb.append("P.P_STATUS=?");
				break;
			default: //searchCheackedEvent
				sb.append("P.P_EVENT=?");
				break;
			}
			if(i < searchTypeArr.length-1) {
				sb.append(" AND ");
			} 
		}
		sb.append(" ORDER BY ");
		System.out.println("DAO orderType : " + orderType);
		if(orderType.equals("searchCheackedpCodeOrder")){
			sb.append("P.P_CODE " + pSearch.getPcode_order());
		}
		else {
			sb.append("P.P_NAME " + pSearch.getPname_order());
		}
			
		sb.append(")) WHERE RNUM BETWEEN ? AND ?");
		System.out.println(sb.toString());
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			int j = 1;
			
			for(int i = 0; i < searchTypeArr.length; i++){
				switch (searchTypeArr[i]) {
				case "searchCheackedpCode":
					pstmt.setInt(j, Integer.parseInt(pSearch.getSearch_pcode()));
					j++;
					break;
				case "searchCheackedRdate": 
					if(pSearch.getAfterDate().getTime() == pSearch.getBeforeDate().getTime()){
						pstmt.setDate(j, pSearch.getBeforeDate());
						j++;
					} else {
						pstmt.setDate(j, pSearch.getBeforeDate());
						j++;
						pstmt.setDate(j, pSearch.getAfterDate());
						j++;
					}
					
					break;
				case "searchCheackedPcategory":
					pstmt.setString(j, pSearch.getSearch_pcname());
					j++;
					break;
				case "searchCheackedConstitution":
					pstmt.setString(j, pSearch.getSearch_constitution());
					j++;
					break;
				case "searchCheackedPname":
					pstmt.setString(j, "%"+pSearch.getSearch_pname()+"%");
					j++;
					break;
				case "searchCheackedStatus":
					pstmt.setString(j, pSearch.getSearch_status());
					j++;
					break;
				default: //searchCheackedEvent
					pstmt.setString(j, pSearch.getEvent());
					j++;
					break;
				}
			}
			
			pstmt.setInt(j, startRow);
			j++;
			pstmt.setInt(j, endRow);
			
			rset = pstmt.executeQuery();
			
			pList = new ArrayList<Product>();
			
			while(rset.next()){
				Product p = new Product();
				p.setP_code(String.valueOf(rset.getInt("P_CODE")));
				p.setP_resisterDate(rset.getDate("P_RESISTERDATE"));
				p.setCa_name(rset.getString("CA_NAME"));
				p.setP_8constitution(rset.getString("P_8CONSTITUTION"));
				p.setP_name(rset.getString("P_NAME"));
				p.setP_price(rset.getInt("P_PRICE"));
				p.setP_event(rset.getString("P_EVENT"));
				p.setP_discount(rset.getDouble("P_DISCOUNT"));
				p.setP_status(rset.getString("P_STATUS"));
				pList.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pList;
	}
	public int getListSearchCount(Connection conn, ProductSearch pSearch, String[] searchTypeArr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int pListCount = 0;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT COUNT(*) FROM PRODUCT P JOIN CATEGORY C ON(P.CA_NO=C.CA_NO) WHERE ");
				
		for(int i = 0; i < searchTypeArr.length; i++){
			switch (searchTypeArr[i]) {
			case "searchCheackedpCode":
				sb.append("P.P_CODE=?");
				break;
			case "searchCheackedRdate": 
				if(pSearch.getAfterDate().getTime() == pSearch.getBeforeDate().getTime()){
					sb.append("P.P_RESISTERDATE LIKE ?");
				} else {
					sb.append("P.P_RESISTERDATE BETWEEN ? AND ?");
				}
				break;
			case "searchCheackedPcategory":
				sb.append("C.CA_NAME=?");
				break;
			case "searchCheackedConstitution":
				sb.append("P.P_8CONSTITUTION=?");
				break;
			case "searchCheackedPname":
				sb.append("P.P_NAME LIKE ?");
				break;
			case "searchCheackedStatus":
				sb.append("P.P_STATUS=?");
				break;
			default: //searchCheackedEvent
				sb.append("P.P_EVENT=?");
				break;
			}
			if(i < searchTypeArr.length-1) {
				sb.append(" AND ");
			} 
		}
		
		System.out.println(sb.toString());
		
		try {
			int j = 1;
			
			pstmt = conn.prepareStatement(sb.toString());
					
			for(int i = 0; i < searchTypeArr.length; i++){
				
				//switch case문으로 할 시 날짜에서 searchTypeArr을 한개 초과한 값을 꺼내는 오류 발생
				switch (searchTypeArr[i]) {
				case "searchCheackedpCode":
					pstmt.setInt(j, Integer.parseInt(pSearch.getSearch_pcode()));
					j++;
					break;
				case "searchCheackedRdate": 
					if(pSearch.getAfterDate().getTime() == pSearch.getBeforeDate().getTime()){
						pstmt.setDate(j, pSearch.getBeforeDate());
						j++;
						pstmt.setDate(j, pSearch.getAfterDate());
						j++;
					}
					break;
				case "searchCheackedPcategory":
					pstmt.setString(j, pSearch.getSearch_pcname());
					j++;
					break;
				case "searchCheackedConstitution":
					pstmt.setString(j, pSearch.getSearch_constitution());
					j++;
					break;
				case "searchCheackedPname":
					pstmt.setString(j, "%"+pSearch.getSearch_pname()+"%");
					j++;
					break;
				case "searchCheackedStatus":
					pstmt.setString(j, pSearch.getSearch_status());
					j++;
					break;
				default: //searchCheackedEvent
					pstmt.setString(j, pSearch.getEvent());
					j++;
					break;
				}
				if(i < searchTypeArr.length-1) {
					sb.append(" AND ");
				} 
			}
						
			rset = pstmt.executeQuery();
						
			if(rset.next()){
				pListCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pListCount;
	}

}
