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

import com.kh.cityrack.member.user.model.dto.Member;
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
	public HashMap<String, ArrayList<Cart>> selectCart(Connection con) {
		HashMap<String, ArrayList<Cart>> hmap = null;
		Cart c = null;
		ArrayList<Cart> cartList = null;
		ResultSet rset = null;
		Statement stmt = null;
		
		try {
			stmt = con.createStatement();
			
			String query = prop.getProperty("selectCart");
			
			System.out.println(query);
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				
				c = new Cart();
			
				/*SELECT P.P_PIC1, P.P_NAME, P.P_PRICE ,CART_AMOUNT, P.P_PRICE*P.P_DISCOUNT FROM CART C JOIN PRODUCT P ON(P.P_CODE = C.P_CODE)*/
				c.setPic1(rset.getString("p_pic1"));
				c.setCart_amount(rset.getInt("cart_amount"));
				c.setProduct_code(rset.getString("p_name"));
				c.setDiscount(rset.getDouble("p_discount"));
				c.setPrice(rset.getInt("p_price"));
				
			
				cartList.add(c);
				
				hmap.put(c.getProduct_code(), cartList);

			}
			
			System.out.println( "cartList @Dao : "+ cartList);
			System.out.println("hmap @Dao : "+hmap);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return hmap;
		
	}
	
	// 장바구니에 물건 담기 
	public int insertCart(Map map, Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertCart");
		/*INSERT INTO CART VALUES(CANO.NEXTVAL, ?,?,?)*/
	
		/*M_NO
		P_CODE
		CART_AMOUNT*/
		

		//entrySet을 통해 맵을 set에 담음.
		Set s = map.entrySet();	
		//이터레이터에 s 담기
		Iterator it = s.iterator();

		//받아온 Map의 밸류 확인
		//Map.Entry인 entry 생성
		Map.Entry<String, String[]> entry = null;
		
		//foodprice에 담을 맵,  foodname에 담을 맵 생성.
		HashMap<String, Integer> foodprice= new HashMap<String, Integer>();
		HashMap<String, Integer> foodname= new HashMap<String, Integer>();
		
		while(it.hasNext()){
			 
            entry = (Map.Entry<String , String[]>)it.next();

            //키와 밸류를 각자 제너릭에 저장.
            String key = entry.getKey();
            String[] value = entry.getValue();

            //키값이 'foodprice'로 시작하면 맵에 담기.
            if(key.contains("price")) {
            	
            	if(value.length>1) {
            		for(int i = 0; i<value.length;i++) {
            			foodprice.put(key, Integer.parseInt(value[i]));
            		}
            	} else {
            		foodprice.put(key, Integer.parseInt(value[0]));
            	}
            	
            	
            } else if(key.contains("name") ){
            	if(value.length>1) {
            		for(int i =0; i<value.length;i++) {
            			foodname.put(key, Integer.parseInt(value[i]));
            		}
            	} else {
            		foodname.put(key, Integer.parseInt(value[0]));
            	}
            }

		   System.out.println("foodprice @DAO: " + foodprice);
           System.out.println("foodname @DAO: "  + foodname);
           
           
           
           try {
			
        	while(true) {
        		pstmt = con.prepareStatement(query);
        		
        		
        		
        		result = pstmt.executeUpdate();
        		
        		
        	}
			
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	           
		
	
	
		
	}
		return result;
		



}
	


}
