package com.yolo.util;
import java.sql.*;
public class DBUtil {
	static{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() throws SQLException{
		return DriverManager.getConnection(
				"jdbc:oracle:thin:@127.0.0.1:1521:XE", "kdn", "kdn");
	}
	public static void close(Connection con){
		if(con !=null){
			try {	con.close();	} catch (Exception e) {			}
		}
	}
	public static void close(PreparedStatement stmt){
		if(stmt !=null){
			try {	stmt.close();	} catch (Exception e) {			}
		}
	}
	public static void close(ResultSet rs){
		if(rs !=null){
			try {	rs.close();	} catch (Exception e) {			}
		}
	}
	public static void rollback(Connection con){
		if(con !=null){
			try {	con.rollback();;	} catch (Exception e) {			}
		}
	}
}
