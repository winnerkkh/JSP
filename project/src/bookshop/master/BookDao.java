package bookshop.master;
import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class BookDao {
    private static BookDao instance;
    public static BookDao getInstance() {
    	if (instance==null) {	instance = new BookDao();  	}
        return instance;
    }    
    private BookDao() {}    
    private Connection getConnection() throws Exception {
        Connection conn=null; 	 
      	Context init = new InitialContext();
     		DataSource ds = 
     			(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
     		conn = ds.getConnection();
         return conn;
    }    
    //  ������ ���� �޼ҵ�
    public int managerCheck(String id, String passwd) {
		Connection conn = null;   PreparedStatement pstmt = null;
		ResultSet rs= null;       String dbpasswd="";		int x=-1;        
		try { conn = getConnection();            
            pstmt = conn.prepareStatement(
            	"select managerPasswd from manager where managerId=?");
            pstmt.setString(1, id);            
            rs= pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("managerPasswd"); 
				if(dbpasswd.equals(passwd))		x= 1; //���� ����
				else			x= 0; //��й�ȣ Ʋ��
			}else				x= -1;//�ش� ���̵� ����			
        } catch(Exception e) {System.out.println(e.getMessage());
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
	}
    
    //å ��� �޼ҵ�
    public int insertBook(Book book) {
        Connection conn = null;     int result = 0;
        PreparedStatement pstmt = null;      
        try {  conn = getConnection();
            String str ="insert into book values ("
            	+ "book_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(str);
         //   pstmt.setInt(1,book.getBook_id());
            pstmt.setString(1, book.getBook_kind());
            pstmt.setString(2, book.getBook_title());
            pstmt.setInt(3, book.getBook_price());
            pstmt.setInt(4, book.getBook_count());
            pstmt.setString(5, book.getAuthor());
            pstmt.setString(6, book.getPublishing_com());
			pstmt.setString(7, book.getPublishing_date());
			pstmt.setString(8, book.getBook_image());
			pstmt.setString(9, book.getBook_content());
			pstmt.setInt(10,book.getDiscount_rate());
			pstmt.setDate(11, book.getReg_date());
			
            result = pstmt.executeUpdate();
            
        } catch(Exception e) { System.out.println(e.getMessage());
           
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return result;
    }
    
    //�̵̹�ϵ� å�� ����
	public int registedBookconfirm(String kind, String bookName, String author) 
	throws Exception {
		Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs= null;
		int x=-1;
        
		try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select book_name from book where book_kind = ? and book_name = ? and author = ?");
            pstmt.setString(1, kind);
            pstmt.setString(2, bookName);
            pstmt.setString(3, author);
            
            rs= pstmt.executeQuery();

			if(rs.next())
				x= 1; //�ش� å�� �̹� ��ϵǾ� ����
			else
				x= -1;//�ش� å�� �̹� ��ϵǾ� ���� ����	
			
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
	}
    
	// ��ü��ϵ� å�� ���� ���� �޼ҵ�
	public int getBookCount()   {
        Connection conn = null; PreparedStatement pstmt = null;
        ResultSet rs = null;    int x=0;
        try { conn = getConnection();            
            pstmt = conn.prepareStatement("select count(*) from book");
            rs = pstmt.executeQuery();
            if (rs.next()) {   x = rs.getInt(1);}
        } catch(Exception e) { System.out.println(e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }
	
	// �з����Ǵ� ��ü��ϵ� å�� ������ ���� �޼ҵ�
	public ArrayList<Book> getBooks(String book_kind) {
        Connection conn = null;     PreparedStatement pstmt = null;
        ResultSet rs = null;        
        ArrayList<Book> bookList=null;  
        String sql1="select * from book order by reg_date desc";
        String sql2 = "select * from book where " +
        		"book_kind = ? order by reg_date desc";
        try { conn = getConnection();           
            if(book_kind.equals("all")){
            	 pstmt = conn.prepareStatement(sql1);
            }else{
                pstmt = conn.prepareStatement(sql2);
                pstmt.setString(1, book_kind);
            }
        	rs = pstmt.executeQuery();

            if (rs.next()) {
                bookList = new ArrayList<Book>();
                do{
                     Book book= new Book();
                     book.setBook_id(rs.getInt("book_id"));
                     book.setBook_kind(rs.getString("book_kind"));
                     book.setBook_title(rs.getString("book_title"));
                     book.setBook_price(rs.getInt("book_price"));
                     book.setBook_count(rs.getInt("book_count"));
                     book.setAuthor(rs.getString("author"));
                     book.setPublishing_com(rs.getString("publishing_com"));
                     book.setPublishing_date(rs.getString("publishing_date"));
                     book.setBook_image(rs.getString("book_image"));
                     book.setDiscount_rate(rs.getInt("discount_rate"));
                     book.setReg_date(rs.getDate("reg_date"));
                    
                     bookList.add(book);
			    }while(rs.next());
			}
        } catch(Exception e) {System.out.println(e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return bookList;
    }
	
	// ���θ� ���ο� ǥ���ϱ� ���ؼ� ����ϴ� �з��� �Ű�å����� ���� �޼ҵ�
	public Book[] getBooks(String book_kind,int count) {
        Connection conn = null;  PreparedStatement pstmt = null;
        ResultSet rs = null;
        Book bookList[]=null;       int i = 0;        
        try { conn = getConnection();           
            pstmt = conn.prepareStatement(
               "select * from (select * from book where book_kind" +
            	" = ? order by reg_date desc) where rownum <= ?");
            pstmt.setString(1, book_kind);
            pstmt.setInt(2, count);          
        	rs = pstmt.executeQuery();
            if (rs.next()) {
                bookList = new Book[count];
                do{  Book book= new Book();
                     book.setBook_id(rs.getInt("book_id"));
                     book.setBook_kind(rs.getString("book_kind"));
                     book.setBook_title(rs.getString("book_title"));
                     book.setBook_price(rs.getInt("book_price"));
                     book.setBook_count(rs.getInt("book_count"));
                     book.setAuthor(rs.getString("author"));
                     book.setPublishing_com(rs.getString("publishing_com"));
                     book.setPublishing_date(rs.getString("publishing_date"));
                     book.setBook_image(rs.getString("book_image"));
                     book.setDiscount_rate(rs.getInt("discount_rate"));
                     book.setReg_date(rs.getDate("reg_date"));
                     bookList[i]=book;
                     i++;
			    }while(rs.next());
			}
        } catch(Exception e) { System.out.println(e.getMessage());  } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return bookList;
    }
	
	// bookId�� �ش��ϴ� å�� ������ ���� �޼ҵ�� ,��ϵ� å�� �����ϱ� ���� ���������� �о����̱� ���� �޼ҵ�
	public Book getBook(int bookId) {
        Connection conn = null;     PreparedStatement pstmt = null;
        ResultSet rs = null;        Book book=null; 
        String sql = "select * from book where book_id = ?";
        try { conn = getConnection();            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bookId); rs = pstmt.executeQuery();
            if (rs.next()) {
                book = new Book();                
                book.setBook_kind(rs.getString("book_kind"));
                book.setBook_title(rs.getString("book_title"));
                book.setBook_price(rs.getInt("book_price"));
                book.setBook_count(rs.getInt("book_count"));
                book.setAuthor(rs.getString("author"));
                book.setPublishing_com(rs.getString("publishing_com"));
                book.setPublishing_date(rs.getString("publishing_date"));
                book.setBook_image(rs.getString("book_image"));
                book.setBook_content(rs.getString("book_content"));
                book.setDiscount_rate(rs.getInt("discount_rate"));
			}
        } catch(Exception e) { System.out.println(e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return book;
    }
    
    // ��ϵ� å�� ������ ������ ����ϴ� �޼ҵ�
    public int updateBook(Book book, int bookId) {
        Connection conn = null;    PreparedStatement pstmt = null;
        String sql, sql1;                int result = 0;        
        try { conn = getConnection();            
            sql = "update book set book_kind=?,book_title=?,book_price=?,book_count=?,author=? ";
            sql += ",publishing_com=?,publishing_date=?,book_image=?,book_content=?,discount_rate=?";
            sql += " where book_id=?";  
            
            sql1 = "update book set book_kind=?,book_title=?,book_price=?,book_count=?,author=? ";
            sql1 += ",publishing_com=?,publishing_date=?,book_content=?,discount_rate=?";
            sql1 += " where book_id=?"; 
            if (book.getBook_image()==null) {
            	pstmt = conn.prepareStatement(sql1);
    			pstmt.setString(8, book.getBook_content());
    			pstmt.setInt(9, book.getDiscount_rate());
    			pstmt.setInt(10, bookId);
            } else {
            	pstmt = conn.prepareStatement(sql);
            	pstmt.setString(8, book.getBook_image());
    			pstmt.setString(9, book.getBook_content());
    			pstmt.setInt(10, book.getDiscount_rate());
    			pstmt.setInt(11, bookId);
            }            
            pstmt.setString(1, book.getBook_kind());
            pstmt.setString(2, book.getBook_title());
            pstmt.setInt(3, book.getBook_price());
            pstmt.setInt(4, book.getBook_count());
            pstmt.setString(5, book.getAuthor());
            pstmt.setString(6, book.getPublishing_com());
			pstmt.setString(7, book.getPublishing_date());			
            
            result = pstmt.executeUpdate();
            
        } catch(Exception e) {System.out.println(e.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return result;
    }
     
    // bookId�� �ش��ϴ� å�� ������ ������ ����ϴ� �޼ҵ�
    public int deleteBook(int bookId)   {
        Connection conn = null;  PreparedStatement pstmt = null;
        int result = 0;  
        String sql = "delete from book where book_id=?";
        try { 
        	conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bookId);            
            result = pstmt.executeUpdate();            
        } catch(Exception e) {System.out.println(e.getMessage()); 
        } finally {           
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn  != null) try { conn.close();  } catch(SQLException ex) {}
        }
        return result;
    }
}