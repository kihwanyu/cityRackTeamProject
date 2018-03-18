package com.kh.cityrack.order.admin.model.dao;

import static com.kh.cityrack.common.JDBCTemplet.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import org.apache.tomcat.jdbc.pool.interceptor.ResetAbandonedTimer;

import com.kh.cityrack.order.admin.model.dto.Order;
import com.kh.cityrack.order.admin.model.dto.OrderSearch;
import com.kh.cityrack.order.admin.model.dto.Product;

import oracle.net.aso.i;

public class OrderDao {
	private Properties prop = null;
	
	public OrderDao(){
		//prop 객체 인스턴스화
		prop = new Properties();
		
		//fileName에 member-query.properties 파일의 위치를 넣어준다.
		String fileName = OrderDao.class.getResource("/sql/admin/order/order-query.properties").getPath();
		
		try {
			//prop객체에 member-query.properties 파일위치를 넣어준다.
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int orderListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int result = 0;
		String query = prop.getProperty("orderListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}
	public ArrayList<Order> orderListGetAll(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Order> olist = null;
		Order o = null;
		
		String query = prop.getProperty("orderListGetAll");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			olist = new ArrayList<Order>();
			
			while (rset.next()) {
				o = new Order();
				o.setO_ono(rset.getString("O_ONO"));
				o.setO_orderDate(rset.getDate("O_ORDERDATE"));
				o.setM_email(rset.getString("M_EMAIL"));
				o.setP_name(rset.getString("P_NAME"));
				o.setPa_amount(rset.getInt("AMOUNT"));
				o.setO_state(rset.getString("O_STATE"));
				
				olist.add(o);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(olist);
		return olist;
	}
	public int orderSearchListCount(Connection conn, OrderSearch oSearch, String[] searchTypeArr, String orderType) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT COUNT(*) FROM(SELECT DISTINCT O_ONO, O_ORDERDATE, M_EMAIL, P_NAME, AMOUNT, O_STATE "
				+ "FROM(SELECT DISTINCT O_ONO, O_ORDERDATE, M_EMAIL, P_CODE ,P_NAME, AMOUNT, O_STATE "
				+ "FROM(SELECT O.O_ONO, O.O_ORDERDATE, M.M_EMAIL, P.P_CODE ,P.P_NAME, PA.AMOUNT, O.O_STATE "
				+ "FROM ORDERS O JOIN MEMBER M ON(O.M_NO=M.M_NO) JOIN PRODUCT P ON(O.P_CODE=P.P_CODE) JOIN PAYMENT PA ON(O.PAY_NO=PA.NO) "
				+ "WHERE O.O_LEVEL=1 AND ");
				
		for(int i = 0; i < searchTypeArr.length; i++){
			switch (searchTypeArr[i]) {
			case "searchCheackedOono":
				sb.append("O.O_ONO=?");
				break;
			case "searchCheackedEmail": 
				sb.append("M.M_EMAIL LIKE ?");
				break;
			case "searchCheackedOdate":
				if(oSearch.getBeforeDate().getTime() == oSearch.getAfterDate().getTime()){
					sb.append("O.O_ORDERDATE BETWEEN LIKE ?");
				} else {
					sb.append("O.O_ORDERDATE BETWEEN ? AND ?");
				}
				
				break;
			case "searchCheackedPname":
				sb.append("P.P_NAME LIKE ?");
				break;
			default: //searchCheackedStatus
				sb.append("O.O_STATE=?");
				break;
			}
			if(i < searchTypeArr.length-1) {
				sb.append(" AND ");
			} 
		}
		
		sb.append(")))");
		
		System.out.println(sb.toString());
		
		try {
			int j = 1;
			
			pstmt = conn.prepareStatement(sb.toString());
					
			for(int i = 0; i < searchTypeArr.length; i++){
				
				//switch case문으로 할 시 날짜에서 searchTypeArr을 한개 초과한 값을 꺼내는 오류 발생
				switch (searchTypeArr[i]) {
				case "searchCheackedOono":
					pstmt.setString(j, oSearch.getSearch_oono());
					j++;
					break;
				case "searchCheackedEmail": 
					pstmt.setString(j, oSearch.getSearch_email());
					j++;
					break;
				case "searchCheackedOdate":
					if(oSearch.getBeforeDate().getTime() == oSearch.getAfterDate().getTime()){
						pstmt.setDate(j, oSearch.getBeforeDate());
						j++;
					} else {
						pstmt.setDate(j, oSearch.getBeforeDate());
						j++;
						pstmt.setDate(j, oSearch.getAfterDate());
						j++;
					}
					break;
				case "searchCheackedPname":
					pstmt.setString(j, oSearch.getSearch_pname());
					j++;
					break;
				default: //searchCheackedEvent
					pstmt.setString(j, oSearch.getSearch_status());
					j++;
					break;
				}
				if(i < searchTypeArr.length-1) {
					sb.append(" AND ");
				} 
			}
						
			rset = pstmt.executeQuery();
						
			if(rset.next()){
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	public ArrayList<Order> orderListSearchGetAll(Connection conn, int currentPage, int limit, OrderSearch oSearch,
			String[] searchTypeArr, String orderType) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Order> oList = null;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT RNUM, O_ONO, O_ORDERDATE, M_EMAIL, P_CODE ,P_NAME, AMOUNT, O_STATE "
				+ "FROM(SELECT ROWNUM RNUM, O_ONO, O_ORDERDATE, M_EMAIL, P_CODE ,P_NAME, AMOUNT, O_STATE "
				+ "FROM(SELECT DISTINCT O_NO ,O_ONO, O_ORDERDATE, M_EMAIL, P_CODE ,P_NAME, AMOUNT, O_STATE "
				+ "FROM (SELECT O.O_NO, O.O_ONO, O.O_ORDERDATE, M.M_EMAIL, P.P_CODE ,P.P_NAME, PA.AMOUNT, O.O_STATE "
				+ "FROM ORDERS O JOIN MEMBER M ON(O.M_NO=M.M_NO) JOIN PRODUCT P ON(O.P_CODE=P.P_CODE) JOIN PAYMENT PA ON(O.PAY_NO=PA.NO) "
				+ "WHERE O.O_LEVEL=1 AND ");
		
		for(int i = 0; i < searchTypeArr.length; i++){
			switch (searchTypeArr[i]) {
			case "searchCheackedOono":
				sb.append("O.O_ONO=?");
				break;
			case "searchCheackedEmail": 
				sb.append("M.M_EMAIL LIKE ?");
				break;
			case "searchCheackedOdate":
				if(oSearch.getBeforeDate().getTime() == oSearch.getAfterDate().getTime()){
					sb.append("O.O_ORDERDATE LIKE ?");
				} else {
					sb.append("O.O_ORDERDATE BETWEEN ? AND ?");
				}
				
				break;
			case "searchCheackedPname":
				sb.append("P.P_NAME LIKE ?");
				break;
			default: //searchCheackedStatus
				sb.append("O.O_STATE=?");
				break;
			}
			if(i < searchTypeArr.length-1) {
				sb.append(" AND ");
			} 
		}
		sb.append(") ORDER BY ");
		if(orderType.equals("searchCheackedOonoOrder")){
			sb.append("O_ONO " + oSearch.getOono_order());
		} else if(orderType.equals("searchCheackedEmailOrder")) {
			sb.append("M_EMAIL " + oSearch.getEmail_order());
		} else { //searchCheackedPnameOrder
			sb.append("P_NAME " + oSearch.getPname_order());
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
				case "searchCheackedOono":
					pstmt.setString(j, oSearch.getSearch_oono());
					j++;
					break;
				case "searchCheackedEmail": 
					pstmt.setString(j, "%"+oSearch.getSearch_email()+"%");
					j++;
					break;
				case "searchCheackedOdate":
					if(oSearch.getBeforeDate().getTime() == oSearch.getAfterDate().getTime()){
						pstmt.setDate(j, oSearch.getBeforeDate());
						j++;
					} else {
						pstmt.setDate(j, oSearch.getBeforeDate());
						j++;
						pstmt.setDate(j, oSearch.getAfterDate());
						j++;
					}
					break;
				case "searchCheackedPname":
					pstmt.setString(j, "%"+oSearch.getSearch_pname()+"%");
					j++;
					break;
				default: //searchCheackedStatus
					pstmt.setString(j, oSearch.getSearch_status());
					j++;
					break;
				}
			}
			
			pstmt.setInt(j, startRow);
			j++;
			pstmt.setInt(j, endRow);
			
			rset = pstmt.executeQuery();
			
			oList = new ArrayList<Order>();
			
			while(rset.next()){
				Order o = new Order();
				o = new Order();
				o.setO_ono(rset.getString("O_ONO"));
				o.setO_orderDate(rset.getDate("O_ORDERDATE"));
				o.setM_email(rset.getString("M_EMAIL"));
				o.setP_name(rset.getString("P_NAME"));
				o.setPa_amount(rset.getInt("AMOUNT"));
				o.setO_state(rset.getString("O_STATE"));
				
				oList.add(o);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return oList;
	}
	public Order orderDetailGet(Connection conn, String ono) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		Order o = null;
		String query = prop.getProperty("orderDetailGet");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1,ono);
			
			rset = pstmt.executeQuery();
						
			if(rset.next()){
				o = new Order();
				o.setO_ono(rset.getString("O_ONO"));
				o.setO_orderDate(rset.getDate("O_ORDERDATE"));
				o.setM_email(rset.getString("M_EMAIL"));
				o.setO_state(rset.getString("O_STATE"));
				o.setC_discount(rset.getDouble("C_DISCOUNT"));
				o.setPa_amount(rset.getInt("AMOUNT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return o;
	}
	public ArrayList<Product> orderProductGetAll(Connection conn, String ono) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Product> pList = null;
		Product p = null;
		
		String query = prop.getProperty("orderProductGetAll");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, ono);
			
			rset = pstmt.executeQuery();
			
			pList = new ArrayList<Product>();
			
			while (rset.next()) {
				p = new Product();
				p.setP_code(rset.getString("P_CODE"));
				p.setP_name(rset.getString("P_NAME"));
				p.setP_discount(rset.getDouble("P_DISCOUNT"));
				p.setP_price(rset.getInt("P_PRICE"));
				p.setO_amount(rset.getInt("O_AMOUNT"));
				
				pList.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("OrderDao :" + pList);
		return pList;
	}
	public ArrayList<Order> orderListGetPcount(Connection conn, int currentPage, int limit, ArrayList<Order> oList) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		String query = prop.getProperty("orderListGetPcount");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			int i = 0;
			while(rset.next()) {
				oList.get(i).setpCount(rset.getInt("PCOUNT"));
				System.out.println(oList.get(i).getpCount());
				i++;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return oList;
	}
	public ArrayList<Order> orderListSearchGetPcount(Connection conn, int currentPage, int limit, OrderSearch oSearch,
			String[] searchTypeArr, String orderType, ArrayList<Order> oList) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT RNUM, PCOUNT "
				+ "FROM(SELECT ROWNUM RNUM, O_ONO, PCOUNT "
				+ "FROM(SELECT O_ONO, COUNT(*) PCOUNT FROM(SELECT O_NO, O_ONO, O_ORDERDATE, M_EMAIL, P_CODE , P_NAME, AMOUNT, O_STATE "
				+ "FROM(SELECT O.O_NO, O.O_ONO, O.O_ORDERDATE, M.M_EMAIL, P.P_CODE ,P.P_NAME, PA.AMOUNT, O.O_STATE "
				+ "FROM ORDERS O JOIN MEMBER M ON(O.M_NO=M.M_NO) JOIN PRODUCT P ON(O.P_CODE=P.P_CODE) JOIN PAYMENT PA ON(O.PAY_NO=PA.NO) WHERE ");
		
		for(int i = 0; i < searchTypeArr.length; i++){
			switch (searchTypeArr[i]) {
			case "searchCheackedOono":
				sb.append("O.O_ONO=?");
				break;
			case "searchCheackedEmail": 
				sb.append("M.M_EMAIL LIKE ?");
				break;
			case "searchCheackedOdate":
				sb.append("O.O_ORDERDATE BETWEEN ? AND ?+1");
				break;
			case "searchCheackedPname":
				sb.append("P.P_NAME LIKE ?");
				break;
			default: //searchCheackedStatus
				sb.append("O.O_STATE=?");
				break;
			}
			if(i < searchTypeArr.length-1) {
				sb.append(" AND ");
			} 
		}
		sb.append(" ))GROUP BY O_ONO ORDER BY ");
		if(orderType.equals("searchCheackedOonoOrder")){
			sb.append("O_ONO " + oSearch.getOono_order());
		} 
		else if(orderType.equals("searchCheackedEmailOrder")) {
			sb.append("M_EMAIL " + oSearch.getEmail_order());
		} else { //searchCheackedPnameOrder
			sb.append("P_NAME " + oSearch.getPname_order());
		}
		sb.append(" )) WHERE RNUM BETWEEN ? AND ?");
		System.out.println(sb.toString());
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			int j = 1;
			
			for(int i = 0; i < searchTypeArr.length; i++){
				switch (searchTypeArr[i]) {
				case "searchCheackedOono":
					pstmt.setString(j, oSearch.getSearch_oono());
					j++;
					break;
				case "searchCheackedEmail": 
					pstmt.setString(j, "%"+oSearch.getSearch_email()+"%");
					j++;
					break;
				case "searchCheackedOdate":
					pstmt.setDate(j, oSearch.getBeforeDate());
					j++;
					pstmt.setDate(j, oSearch.getAfterDate());
					j++;
					break;
					//
				case "searchCheackedPname":
					pstmt.setString(j, "%"+oSearch.getSearch_pname()+"%");
					j++;
					break;
				default: //searchCheackedStatus
					pstmt.setString(j, oSearch.getSearch_status());
					j++;
					break;
				}
			}
			
			pstmt.setInt(j, startRow);
			j++;
			pstmt.setInt(j, endRow);
			
			rset = pstmt.executeQuery();
			int i = 0;		
			while(rset.next()){
				
				oList.get(i).setpCount(rset.getInt("PCOUNT"));
				i++;
				System.out.println("i : " + i);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return oList;
	}

}
