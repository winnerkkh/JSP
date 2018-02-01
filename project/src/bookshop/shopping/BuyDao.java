package bookshop.shopping;
import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class BuyDao {
	private static BuyDao instance = new BuyDao();	
	public static BuyDao getInstance() {
    	return instance;
    }   
    private BuyDao() {}   
    private Connection getConnection() throws Exception {
      	Connection conn=null; 	 
      	Context init = new InitialContext();
     		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
     		conn = ds.getConnection();
         return conn;
    }    
    // bank���̺� �ִ� ��ü ���ڵ带 ���� �޼ҵ�
    public ArrayList<String> getAccount(){
    	Connection conn = null; PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<String> accountList = null;
        String sql = "select * from bank";
        try {conn = getConnection();                        
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();            
            accountList = new ArrayList<String>();            
            while (rs.next()) {
            	String account = new String(rs.getString("account")
            	   +" "+ rs.getString("bank")+" "+rs.getString("name"));
           	 	accountList.add(account);
			 }
        }catch(Exception e) {System.out.println(e.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return accountList;
    }
    
    //���� ���̺��� buy�� ���Ÿ�� ���
    public void insertBuy(ArrayList<Cart> lists,String id, String account, String deliveryName, String deliveryTel,String deliveryAddress) 
    throws Exception {
    	Connection conn = null;  PreparedStatement pstmt = null;
        ResultSet rs = null;     Timestamp reg_date = null;
        String sql = "";         String todayDate = "";
        String compareDate = ""; int buyId = 0;       
        int nowCount ;
        try {
            conn = getConnection();
            reg_date = new Timestamp(System.currentTimeMillis());
            todayDate = reg_date.toString();
            compareDate = todayDate.substring(0, 4) + todayDate.substring(5, 7) + todayDate.substring(8, 10);
            sql = "select max(buy_id) from buy";
            pstmt = conn.prepareStatement(sql);            
            rs = pstmt.executeQuery();
            if (rs.next()) buyId =  rs.getInt(1) + 1;
            else buyId = 1;
            conn.setAutoCommit(false);
            for(int i=0; i<lists.size();i++){
            	//�ش� ���̵� ���� cart���̺� ���ڵ带�� �������� buy���̺� �߰�
            	Cart cart = (Cart)lists.get(i);
            	
            	sql = "insert into buy (buy_id,buyer,book_id,book_title,buy_price,buy_count,";
                sql += "book_image,buy_date,account,deliveryName,deliveryTel,deliveryAddress)";
                sql += " values (?,?,?,?,?,?,?,?,?,?,?,?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, buyId);
                pstmt.setString(2, id);
                pstmt.setInt(3, cart.getBook_id());
                pstmt.setString(4, cart.getBook_title());
                pstmt.setInt(5, cart.getBuy_price());
                pstmt.setInt(6, cart.getBuy_count());
                pstmt.setString(7, cart.getBook_image());
                pstmt.setTimestamp(8, reg_date);
                pstmt.setString(9, account);
                pstmt.setString(10, deliveryName);
                pstmt.setString(11, deliveryTel);
                pstmt.setString(12, deliveryAddress);

                pstmt.executeUpdate();
                
                //��ǰ�� ���ŵǾ����Ƿ� book���̺��� ��ǰ������ ��������
                pstmt.close();
                pstmt = conn.prepareStatement("select book_count from book where book_id=?");
                pstmt.setInt(1, cart.getBook_id());
                rs = pstmt.executeQuery();
                rs.next();                
                nowCount = rs.getInt(1) - cart.getBuy_count();
                
                sql = "update book set book_count=? where book_id=?";
                pstmt = conn.prepareStatement(sql);
            
                pstmt.setInt(1, nowCount);
    			pstmt.setInt(2, cart.getBook_id());
                
                pstmt.executeUpdate(); 
                buyId++;
            }
            sql = "delete from cart where buyer=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
          
            pstmt.executeUpdate();
            conn.commit();
            conn.setAutoCommit(true);
         }catch(Exception e) {System.out.println(e.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    //id�� �ش��ϴ� buy���̺��� ���ڵ���� ���� �޼ҵ�
    public int getListCount(String id) {
        Connection conn = null;  PreparedStatement pstmt = null;
        ResultSet rs = null;     int count = 0;
        try { conn = getConnection();
            String sql = "select count(*) from buy where buyer=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
               count = rs.getInt(1);
			}
        } catch(Exception e) { System.out.println(e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return count ;
    }
    
    //buy���̺��� ��ü ���ڵ���� ���� �޼ҵ�
    public int getListCount()
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("select count(*) from buy");
            rs = pstmt.executeQuery();

            if (rs.next()) {
               x= rs.getInt(1);
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }
    
    //id�� �ش��ϴ� buy���̺��� ���Ÿ���� ���� �޼ҵ�
    public ArrayList<Buy> getBuyList(String id)  {
   	    Connection conn = null;  PreparedStatement pstmt = null;
        ResultSet rs = null;     Buy buy=null;
        String sql = "";         
        ArrayList<Buy> lists = null;        
        try { conn = getConnection();       	 
       	 sql = "select * from buy where buyer = ? order by buy_id";
            pstmt = conn.prepareStatement(sql);            
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();            
            lists = new ArrayList<Buy>(); 
            while (rs.next()) {
            	 buy = new Buy();
           	 
           	     buy.setBuy_id(rs.getLong("buy_id"));
           	     buy.setBook_id(rs.getInt("book_id"));
           	     buy.setBook_title(rs.getString("book_title"));
           	     buy.setBuy_price(rs.getInt("buy_price"));
           	     buy.setBuy_count(rs.getInt("buy_count")); 
           	     buy.setBook_image(rs.getString("book_image"));
           	     buy.setSanction(rs.getString("sanction"));
           	 
           	     lists.add(buy);
			 }
        }catch(Exception e) {System.out.println(e.getMessage());
        }finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		 return lists;
    }
    
    //buy���̺��� ��ü ����� ���� �޼ҵ�
    public ArrayList<Buy> getBuyList()    {
   	    Connection conn = null;  PreparedStatement pstmt = null;
        ResultSet rs = null;     Buy buy=null;
        String sql = "select * from buy order by buy_id desc";
        ArrayList<Buy> lists = null;        
        try { conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();            
            lists = new ArrayList<Buy>();
            while (rs.next()) {
            	 buy = new Buy();
            	 
           	     buy.setBuy_id(rs.getLong("buy_id"));
           	     buy.setBuyer(rs.getString("buyer"));
           	     buy.setBook_id(rs.getInt("book_id"));
           	     buy.setBook_title(rs.getString("book_title"));
           	     buy.setBuy_price(rs.getInt("buy_price"));
           	     buy.setBuy_count(rs.getInt("buy_count")); 
           	     buy.setBook_image(rs.getString("book_image"));
           	     buy.setBuy_date(rs.getTimestamp("buy_date"));
           	     buy.setAccount(rs.getString("account"));
           	     buy.setDeliveryName(rs.getString("deliveryName"));
           	     buy.setDeliveryTel(rs.getString("deliveryTel"));
           	     buy.setDeliveryAddress(rs.getString("deliveryAddress"));
           	     buy.setSanction(rs.getString("sanction"));
           	 
           	     lists.add(buy);
			 }
        }catch(Exception e) {System.out.println(e.getMessage());
        }finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		 return lists;
    }
}