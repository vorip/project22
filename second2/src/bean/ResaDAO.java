package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResaDAO {
	DBConnectionMgr mgr;
	ResultSet rs;
	Connection con;
	PreparedStatement ps;
	
	public ResaDAO() {
		mgr = DBConnectionMgr.getInstance();
	}
	public void insert(ResaDTO dto) {
		try {
			con = mgr.getConnection();
			
			String sql = "insert into resa values(?,?,?,?,?,?,?,?)";
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getHospital());
			ps.setString(3, dto.getAddress());
			ps.setString(4, dto.getBody());
			ps.setString(5, dto.getDoctor());
			ps.setString(6, dto.getDate());
			ps.setString(7, dto.getPrice());
			ps.setString(8, dto.getPw());
			
			
			ps.executeUpdate();

			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ps.close();
				mgr.freeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public ResaDTO select(String name, String pw){
		ResaDTO dto = null;
		
		try {
			con = mgr.getConnection();
			
			String sql = "select * from resa where name = ? and pw = ?";
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, name);
			ps.setString(2, pw);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new ResaDTO();
				
				String name1 = rs.getString(1);
				String hospital = rs.getString(2);
				String address = rs.getString(3);
				String body = rs.getString(4);
				String doctor = rs.getString(5);
				String date = rs.getString(6);
				String price = rs.getString(7);
				String pw1 = rs.getString(8);
				
				dto.setName(name1);
				dto.setHospital(hospital);
				dto.setAddress(address);
				dto.setBody(body);
				dto.setDoctor(doctor);
				dto.setDate(date);
				dto.setPrice(price);
				dto.setPw(pw1);
				
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				ps.close();
				mgr.freeConnection(con);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return dto;
	}

}
