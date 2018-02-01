package bookshop.shopping;
import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class CartDao {
	private static CartDao instance;	   
    public static CartDao getInstance() {
    	if (instance == null) {	instance = new CartDao();  	}
    	return instance; 
    }
    private CartDao() {}   
    private Connection getConnection() throws Exception {
      	Connection conn=null; 	 
      	Context init = new InitialContext();
     	DataSource ds = 
     		(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
     	conn = ds.getConnection();
        return conn;
    }    
    //[��ٱ��Ͽ� ���]�� Ŭ���ϸ� ����Ǵ� ������ cart ���̺� ���ο� ���ڵ带 �߰�
    public int insertCart(Cart cart)      {
    	Connection conn = null;  PreparedStatement pstmt = null;
    	String sql="";           int result = 0;
        try {  conn = getConnection();
            sql = "insert into cart (cart_id,book_id, buyer,book_title,buy_price,buy_count,book_image)"
               + " values (cart_seq.nextval,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);            
            pstmt.setInt(1, cart.getBook_id());
            pstmt.setString(2, cart.getBuyer());
            pstmt.setString(3, cart.getBook_title());
            pstmt.setInt(4, cart.getBuy_price());
            pstmt.setInt(5, cart.getBuy_count());
            pstmt.setString(6, cart.getBook_image()); 
            
            result = pstmt.executeUpdate();
        }catch(Exception e) {System.out.println(e.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return result;
    }    
    //id�� �ش��ϴ� ���ڵ��� ���� ���� �޼ҵ�
    public int getListCount(String id)  {
        Connection conn = null;  PreparedStatement pstmt = null;
        ResultSet rs = null;     int cnt = 0;
        String sql = "select count(*) from cart where buyer=?";
        try { conn = getConnection();            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {   cnt = rs.getInt(1);	}
        } catch(Exception e) {System.out.println(e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return cnt;
    }	 
     //id�� �ش��ϴ� ���ڵ��� ����� ���� �޼ҵ�
     public ArrayList<Cart> getCart(String id) {
    	 Connection conn = null;  PreparedStatement pstmt = null;
         ResultSet rs = null;     Cart cart=null;
         String sql = "select * from cart where buyer = ?";
         ArrayList<Cart> lists = null;         
         try {	 conn = getConnection();        	 
             pstmt = conn.prepareStatement(sql);             
             pstmt.setString(1, id);
             rs = pstmt.executeQuery();             
             lists = new ArrayList<Cart>();
             while (rs.next()) {
            	 cart = new Cart();            	 
            	 cart.setCart_id(rs.getInt("cart_id"));
            	 cart.setBook_id(rs.getInt("book_id"));
            	 cart.setBook_title(rs.getString("book_title"));
            	 cart.setBuy_price(rs.getInt("buy_price"));
            	 cart.setBuy_count(rs.getInt("buy_count")); 
            	 cart.setBook_image(rs.getString("book_image"));
            	 
            	 lists.add(cart);
			 }
         }catch(Exception e) {System.out.println(e.getMessage());
         }finally {
             if (rs != null) try { rs.close(); } catch(SQLException ex) {}
             if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) try { conn.close(); } catch(SQLException ex) {}
         }
		 return lists;
     }   
     //��ٱ��Ͽ��� ������ ������ ����Ǵ� �޼ҵ�
     public int updateCount(int cart_id, int count)  {
    	 Connection conn = null;         int result = 0;
         PreparedStatement pstmt = null;  
         String sql = "update cart set buy_count=? where cart_id=?";
         try { conn = getConnection();            
             pstmt = conn.prepareStatement(sql);
             pstmt.setInt(1, count);
             pstmt.setInt(2, cart_id);                        
             result = pstmt.executeUpdate();
         }catch(Exception e) {System.out.println(e.getMessage());
         }finally {
             if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) try { conn.close(); } catch(SQLException ex) {}
         }
         return result;
     }
   
     //��ٱ��Ͽ��� cart_id������ ���ڵ带 �����ϴ� �޼ҵ�
     public int deleteList(int cart_id)   {
         Connection conn = null;   
         PreparedStatement pstmt = null;  
         int result = 0;
         String sql = "delete from cart where cart_id = ?";
         try { conn = getConnection();
             pstmt = conn.prepareStatement(sql);
             pstmt.setInt(1, cart_id);             
             result = pstmt.executeUpdate();
         }catch(Exception e) {System.out.println(e.getMessage());
         }finally {             
             if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) try { conn.close(); } catch(SQLException ex) {}
         }
         return result;
     }
     
     //id�� �ش��ϴ� ��� ���ڵ带 �����ϴ� �޼ҵ�� [��ٱ��� ����]���߸� Ŭ���� ����ȴ�.
     public int deleteAll(String id)  {
         Connection conn = null;   int result = 0;
         PreparedStatement pstmt = null;  
         String sql = "delete from cart where buyer=?";
         try { conn = getConnection();
             pstmt = conn.prepareStatement(sql);
             pstmt.setString(1, id);             
            result = pstmt.executeUpdate();
         }catch(Exception e) {System.out.println(e.getMessage());
         }finally {
             if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) try { conn.close(); } catch(SQLException ex) {}
         }
         return result;
     }
}