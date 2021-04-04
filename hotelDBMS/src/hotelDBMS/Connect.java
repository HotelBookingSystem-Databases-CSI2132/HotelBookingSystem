package hotelDBMS;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Connection;

public class Connect {


//	private String hostName = "srekh085"; 
//	private String passWord = "BlackChair@2020";
//	private String url = "jdbc:postgresql://web0.site.uottawa.ca:15432/srekh085";
	private String schema = "hotel_db";
	
	private Connection dbConnection;
//	private String schema;
	
	
	Connect(String url, String hostName, String passWord) throws SQLException{
		dbConnection = DriverManager.getConnection(url, hostName, passWord);
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
	
	public Connection getConnection(Connect connect) throws SQLException{
		return connect.dbConnection;
	}
	
	public void printResultSet(ResultSet result) {
		try{
			ResultSetMetaData rsMetaData = result.getMetaData();
			int numColumns = rsMetaData.getColumnCount();
			for(int i = 1; i<=numColumns; i++) {
				System.out.println(rsMetaData.getColumnLabel(i)+"\t");
			}
			while(result.next()) {
				for(int i = 1; i<=numColumns; i++) {
					if(i%numColumns == 1) {
						System.out.println();
					}
					System.out.println(result.getString(i) + "\t");
				}
			}
			
		}catch(SQLException ex) {
			 System.out.println(ex.getMessage());
		}
	}
}
