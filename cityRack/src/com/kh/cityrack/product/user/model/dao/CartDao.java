package com.kh.cityrack.product.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;

import static com.kh.cityrack.common.JDBCTemplet.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.product.user.model.dto.Cart;
import com.kh.cityrack.product.user.model.dto.Product;

public class CartDao {
	private Properties prop = new Properties();
	
	public CartDao() {
		
		//fileName에 member-query.properties 파일의 위치를 넣어준다.
			String fileName = PcategoryDao.class.getResource("/sql/user/product/product-query.properties").getPath();
					
			try {
			//prop객체에 member-query.properties 파일위치를 넣어준다.
			prop.load(new FileReader(fileName));
			} catch (IOException e) {
			// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
	// 장바구니 전체 조회
	public  ArrayList<Cart> selectCart(Connection con, Member m) {
		
		Cart c = null;
		ArrayList<Cart> cart = new ArrayList<Cart>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		try {
			String query = prop.getProperty("selectCart");
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, m.getM_no());			
			
			System.out.println(query);			
			
			rset = pstmt.executeQuery();
		
			
			while(rset.next()) {
				
				c = new Cart();
				/*SELECT  P.P_PIC1, P.P_NAME, M.M_NO , P.P_PRICE , COUNT (C.CART_AMOUNT)
				 * FROM CART C JOIN PRODUCT P ON(P.P_CODE = C.P_CODE)
				 * JOIN MEMBER M ON (C.M_NO = M.M_NO) GROUP BY (P.P_PIC1,P.P_NAME, M.M_NO , P.P_PRICE);*/
				
				/*private int cart_no; // 장바구니_번호
					private int m_no; // 회원_번호
					private String product_code; // 상품_코드
					private int cart_amount; // 장바구니_상품수량
					private String pic1; //
					private double discount;
					private int price;*/
				
				c.setM_no(rset.getInt("m_no"));
				c.setPic1(rset.getString("p_pic1"));
				c.setCart_amount(rset.getInt("CART_AMOUNT"));
				c.setpName(rset.getString("p_name"));
				c.setProduct_code(rset.getString("p_code"));
				c.setDiscount(rset.getDouble("p_discount"));
				c.setPrice(rset.getInt("p_price"));
				
			
				cart.add(c);
								

			}
			
			System.out.println( "cartList @Dao : "+ cart);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return cart;
		
	}
	
	// 장바구니에 물건 담기 
	public int insertCart( Map foodname, Map foodamount, Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertCart");
				
		   
           System.out.println("foodname @DAO: "  + foodname);   
           System.out.println("foodamount @DAO: "  + foodamount);  
           
           int size = 0;
           if(foodname.size() == foodamount.size()) {
        	   size = foodamount.size();
        	   System.out.println("같다!");
           }
           
           
           
           
           try {
        		 
        			   
        			   for(int i = 0 ; i<size;i++) {
        				   
        				   pstmt = con.prepareStatement(query);
        				   
        				   pstmt.setInt(1, m.getM_no());
        				   pstmt.setInt(2, (int) foodname.get("foodname"+i) );
        				   pstmt.setInt(3, (int) foodamount.get("amount"+i));
        				   
        				   result = pstmt.executeUpdate();
        			   }
        		   
        		   
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
				
			}
	           
	
		
	
		return result;
		



}


	// 카트 물품 삭제
	public int deleteCart(String[] list, Member m, Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteCart");
		System.out.println("deleteCart : " + query);
			
			try {
					for(int i = 0;i<list.length;i++) {
						pstmt = con.prepareStatement(query);
						pstmt.setInt(1, m.getM_no());
						pstmt.setString(2, list[i]);
						
						/*DELETE 
						FROM (SELECT  P.P_PIC1, P.P_NAME, M.M_NO , P.P_PRICE ,  P.P_DISCOUNT, COUNT(C.CART_AMOUNT)
						      FROM CART C JOIN PRODUCT P ON(P.P_CODE = C.P_CODE) JOIN MEMBER M ON (C.M_NO = M.M_NO)
						      GROUP BY P.P_PIC1, P.P_NAME, M.M_NO, P.P_PRICE, P.P_DISCOUNT)
						WHERE M.M_NO=? AND P.P_NAME=?*/
						
						
						result = pstmt.executeUpdate();
					}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		
		
		return result;
	}


	// 카트 업데이트
	public int updateCart(ArrayList<Cart> cartList, Member m, Connection con) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query=prop.getProperty("updateCart");
		System.out.println("수정 쿼리 : " + query);	
		
	
		/*updateCart=UPDATE TABLE CART SET CART_AMOUNT=? WHERE P_CODE=? AND M_NO=?*/
		try {
			for(int i = 0; i<cartList.size();i++) {
				
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, cartList.get(i).getCart_amount());
				pstmt.setString(2, cartList.get(i).getProduct_code());
				pstmt.setInt(3, m.getM_no());
				
				result = pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	


}
