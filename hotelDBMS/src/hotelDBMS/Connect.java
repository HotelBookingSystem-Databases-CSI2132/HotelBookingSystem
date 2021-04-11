package hotelDBMS;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Connection;

public class Connect {


	private String hostName = "srekh085"; 
	private String passWord = "SecondRent@25";
	private String url = "jdbc:postgresql://web0.site.uottawa.ca:15432/group_b02_g52";
	private String schema = "hotel_db";
	
	private Connection dbConnection;
//	private String schema;
	
	
	Connect(String url, String hostName, String passWord) throws SQLException{
		dbConnection = DriverManager.getConnection(this.url, this.hostName, this.passWord);
	}
	public void closeConnection() {
		try{
			dbConnection.close();
		}catch(SQLException ex) {
			 System.out.println(ex.getMessage());
		}
	}
	public ResultSet getResultSet(String query) throws SQLException{
		Connection db = dbConnection;
		Statement st = db.createStatement();
		return st.executeQuery(query);
	}
	
	public void insertInto(String tableName, String[] values) {
		try{
			Connection db = dbConnection;
			Statement st = db.createStatement();
			StringBuilder str = new StringBuilder();
			for(int i = 0; i < values.length; i++) {
				if(i == values.length-1) {
					str.append(values[i]);
				}
				else {
					str.append(values[i]+",");
				}
			}
			String SQL = ("INSERT INTO "+schema+"."+tableName+" VALUES "+str.toString()+";");
			st.executeQuery(SQL);
			System.out.println("Insert Complete");
			db.close();
		}catch(SQLException ex) {
			 System.out.println(ex.getMessage());
		}
	}
	public void update(String tableName, String attribute, String value, String id) {
		try{
			Connection db = dbConnection;
			Statement st = db.createStatement();
			System.out.print("UPDATE "+schema+"."+tableName+" Set "+attribute+"='"+value+"' Where id ="+id+";");
			String SQL = ("UPDATE "+schema+"."+tableName+" Set "+attribute+"='"+value+"' Where id ="+id+";");
			st.executeQuery(SQL);
			System.out.println("Insert Complete");
			db.close();
		}catch(SQLException ex) {
			 System.out.println(ex.getMessage());
		}
	}
	
	/*
	 * UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE
	 * condition;
	 */
	
	public void deleteFrom(String tableName, String id) {
		try{
			Connection db = dbConnection;
			Statement st = db.createStatement();
			String SQL = ("DELETE From "+schema+"."+tableName+" Where id="+id+";");
			st.executeQuery(SQL);
			System.out.println("Insert Complete");
			db.close();
		}catch(SQLException ex) {
			 System.out.println(ex.getMessage());
		}
	}
	
	public void deleteFromRoom(String tableName, String id) {
		try{
			Connection db = dbConnection;
			Statement st = db.createStatement();
			String SQL = ("DELETE From "+schema+"."+tableName+" Where room_number="+id+";");
			st.executeQuery(SQL);
			System.out.println("Insert Complete");
			db.close();
		}catch(SQLException ex) {
			 System.out.println(ex.getMessage());
		}
	}
	
	public void deleteFromCustomer(String tableName, String fn, String ln) {
		try{
			Connection db = dbConnection;
			Statement st = db.createStatement();
			String SQL = ("DELETE From "+schema+"."+tableName+" Where first_name='"+fn+"' and last_name='"+ln+"';");
			st.executeQuery(SQL);
			System.out.println("Insert Complete");
			db.close();
		}catch(SQLException ex) {
			 System.out.println(ex.getMessage());
		}
	}
	public Connection getConnection(Connect connect) throws SQLException{
		return connect.dbConnection;
	}
	
	public void printResultSet(ResultSet result) {
		try{
			ResultSetMetaData rsMetaData = result.getMetaData();
			int numColumns = rsMetaData.getColumnCount();
			for(int i = 1; i<=numColumns; i++) {
				System.out.print(rsMetaData.getColumnLabel(i)+"  |\t");
			}
			System.out.println();
			while(result.next()) {
				for(int i = 1; i<=numColumns; i++) {
					if(i%numColumns == 1) {
						System.out.println();
					}
					String toPrint = String.format("%1$" + rsMetaData.getColumnLabel(i).length() + "s", result.getString(i));
					System.out.print(toPrint + "  |\t");
				}
			}
			System.out.println();
			System.out.println();
			
		}catch(SQLException ex) {
			 System.out.println(ex.getMessage());
		}
	}
}
