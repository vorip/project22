package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

	String url = "jdbc:mysql://localhost:3306/hos";
	String user = "root";
	String password = "1234";
	
	DBConnectionMgr pool;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public MemberDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public void insert(MemberDTO dto) throws Exception {

		con = pool.getConnection();

		String sql = "insert into member values(?,?,?,?,?,default,?)";

		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getName());
		ps.setString(2, dto.getPw());
		ps.setInt(3, dto.getAge());
		ps.setString(4, dto.getGender());
		ps.setString(5, dto.getTel());
		ps.setString(6, dto.getAddr());

		ps.executeUpdate();

		ps.close();
		con.close();

	}
	
	public void delete(MemberDTO dto) throws Exception {
		
		con = pool.getConnection();

		String sql = "delete from member where name = ? and pw = ?";

		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getName());
		ps.setString(2, dto.getPw());

		ps.executeUpdate();

		ps.close();
		con.close();
	}
	
	
	public void update(MemberDTO dto) throws Exception {
		
		con = pool.getConnection();

		String sql = "update member set age = ?, tel = ?, addr = ? where name = ? and pw = ?";

		ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getAge());
		ps.setString(2, dto.getAddr());
		ps.setString(3, dto.getAddr());
		ps.setString(4, dto.getName());
		ps.setString(5, dto.getPw());

		ps.executeUpdate();

		ps.close();
		con.close();
		
	}
	
	public void select(MemberDTO dto) throws Exception {
		
		con = pool.getConnection();

		String sql = "select * from member where name = ? and unum = ?";
		
		ps= con.prepareStatement(sql);
		ps.setString(1, dto.getName());
		ps.setInt(2, dto.getUnum());
		
		rs = ps.executeQuery();

		while (rs.next()) {
			
			String name = rs.getString(1);
			String pw = rs.getString(2);
			int age = rs.getInt(3);
			String gender = rs.getString(4);
			String tel = rs.getString(5);
			int unum = rs.getInt(6);
			String addr = rs.getString(7);

			System.out.println(name + pw + age + gender + tel + unum + addr);
		}
		
		rs.close();
		ps.close();
		con.close();
		
	
	}
	
	public boolean loginCheck(String name, String pw) throws Exception {
		
		con = pool.getConnection();

		String sql = "select * from member where name = ? and pw = ?";

		ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, pw);
		rs = ps.executeQuery();
		
		boolean check = false;
		
		if (rs.next() == true) {
			check = true;
		}else {
			check = false;
		}
		
		rs.close();
		ps.close();
		con.close();
		
		return check;
	}
	
	
	public void pwCheck(MemberDTO dto) throws Exception {
		
		con = pool.getConnection();

		String sql = "select * from member where pw = ? and name = ?";

		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getPw());
		ps.setString(2, dto.getName());
		
		rs = ps.executeQuery();
		
		if (rs.next() == true) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		rs.close();
		ps.close();
		con.close();
		
		
	}
}
