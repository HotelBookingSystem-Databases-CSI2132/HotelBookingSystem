package hotelDBMS;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class UserInterface {
	private Scanner input = new Scanner(System.in);
	private Connect connection;
	private String[] givenQueries = new String[] {
			"Select r.* from hotel_db.hotelroom r, hotel_db.Availability a where r.room_number = a.room_number and a.isAvailable = FALSE",
			
			"Create view CustomerListView as Select DISTINCT c.id, c.first_name, c.last_name, c.registeration_date, c.street, "
			+ "c.city, c.province, c.zipCode, c.securityCode, c.card_type, c.card_number, c.expiration_month, c.experation_year, "
			+ "c.phone_number, h.hotelChain "
			+ "From hotel_db.customer c, hotel_db.Renting r, hotel_db.hotel h "
			+ "Where r.customer_id = c.id and h.id = r.hotel_ID "
			+ "group by c.id, c.first_name, c.last_name, c.registeration_date, c.street, "
			+ "c.city, c.province, c.zipCode, c.securityCode, c.card_type, c.card_number, c.expiration_month, c.experation_year, "
			+ "c.phone_number, h.hotelChain "
			+ "order by h.hotelChain;"
			+ "Select * from hotel_db.CustomerListView",
			
			"Select r.* from hotel_db.hotelroom r, hotel_db.hotel h where r.hotel = h.id and price = (select min(r2.price) from hotel_db.hotelroom r2)",
			
			"Select r.*, h.name, h.rating from hotel_db.hotelroom r, hotel_db.hotel h where r.hotel = h.id and h.city = 'Ottawa' order by h.rating desc, r.price asc",
			
			"Select * from hotel_db.renting c where c.check_in_day=10 and c.check_in_month=4",
			
			"Update hotel_db.customer set phone_number='456-123-7790' where id=2;",
			
			"SELECT RATING AS preferred_category FROM "
			+ "(SELECT rating, COUNT(hotel_id) AS hotel_num From hotel_db.Hotel H, hotel_db.BookingInfo B  "
			+ "WHERE B.hotel_id = H.id "
			+ "GROUP BY rating) AS TABLEA "
			+ " "
			+ "WHERE TABLEA.hotel_num = (SELECT MAX(hotel_num) FROM "
			+ "(SELECT rating, COUNT(hotel_id) AS hotel_num From hotel_db.Hotel H, hotel_db.BookingInfo B  "
			+ "WHERE B.hotel_id = H.id "
			+ "GROUP BY rating) AS TABLEB);",
			
			"SELECT Max(Salary) AS second_max_salary FROM (SELECT Salary From hotel_db.Employee "
			+ "EXCEPT (SELECT MAX(Salary) FROM hotel_db.Employee)) as SalaryTable;"
	};
	private void closeConnection() {
		connection.closeConnection();
	}
	private void askCredentials(UserInterface UI) {
			try{
				String password = "";
				String hostName = "";
				String url = "";
				while(url == "") {
					System.out.println("Enter URL for Database (Include :port/databaseGroup): \n "
							+ "Example: jdbc:postgresql://web0.site.uottawa.ca:15432/group_b02_g52");
					url=input.nextLine();
				}
				while(hostName == "") {
					System.out.println("Enter login id for Database:");
					hostName=input.nextLine();
				}
				while(password == "") {
					System.out.println("Enter password: ");
					password=input.nextLine();
				}
				
				connection = new Connect(url, hostName, password);
			}catch(SQLException ex) {
				 System.out.println(ex.getMessage());
				 askCredentials(UI);
			}
			
	}
	
	private void executeGivenQuery(int num) throws SQLException{
		ResultSet res;
		switch(num) {
			case 0:
				res = connection.getResultSet(givenQueries[num]);
				connection.printResultSet(res);
				break;
			case 1:
				res = connection.getResultSet(givenQueries[num]);
				connection.printResultSet(res);
				break;
			case 2:
				res = connection.getResultSet(givenQueries[num]);
				connection.printResultSet(res);
				break;
			case 3:
				res = connection.getResultSet(givenQueries[num]);
				connection.printResultSet(res);
				break;
			case 4:
				res = connection.getResultSet(givenQueries[num]);
				connection.printResultSet(res);
				break;
			case 5:
				res = connection.getResultSet(givenQueries[num]);
				connection.printResultSet(res);
				break;
			case 6:
				res = connection.getResultSet(givenQueries[num]);
				connection.printResultSet(res);
				break;
			case 7:
				res = connection.getResultSet(givenQueries[num]);
				connection.printResultSet(res);
				break;
			default:
				System.out.println("Invalid query requested");
				break;
		}
	}
	
	private void repeat(UserInterface UI){
		Boolean flag = true;
		try {
			while(flag) {
				System.out.println("You have the following options: ");
				System.out.println("Execute Given Queries 1 to 8 by typing 'query *queryNum*'");
				System.out.println("Navigate to Renting a room (Directly/Fom booking) by typing 'rent'");
				System.out.println("Type 'logout' to log out.");
				String userIn = input.nextLine();
				switch (userIn) {
					case "query 1":
						UI.executeGivenQuery(0);
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
					case "query 2":
						UI.executeGivenQuery(1);
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
					case "query 3":
						UI.executeGivenQuery(2);
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
					case "query 4":
						UI.executeGivenQuery(3);
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
					case "query 5":
						UI.executeGivenQuery(4);
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
					case "query 6":
						UI.executeGivenQuery(5);
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
					case "query 7":
						UI.executeGivenQuery(6);
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
					case "query 8":
						UI.executeGivenQuery(7);
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
					case "rent":
						flag=false;
						break;
					case "logout":
						flag=false;
						UI.closeConnection();
						UI.askCredentials(UI);
						break;
				}
			}
		}catch (SQLException ex) {
			System.out.println(ex.getMessage());
			repeat(UI);
		}
		
	}
	

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		UserInterface UI = new UserInterface();
		System.out.println("***********Welcome to Hotel Management System***********");
		System.out.println("Please Enter Credentials to connect to database.");
		UI.askCredentials(UI);
		UI.repeat(UI);
	}

}
