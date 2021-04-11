package hotelDBMS;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Random;
import java.util.Scanner;


public class UserInterface {
	private Scanner input = new Scanner(System.in);
	private Connect connection;
	private Renting renting;
	private Random rand = new Random();
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
	
	private void rentingProcess(UserInterface UI) {
		try{
			renting = new Renting(connection);
			System.out.println("Does customer have booking? (Y/N)");
			System.out.println("Or type B to go back.");
			String fromBooking = input.nextLine();
			switch(fromBooking) {
			case "Y":
				renting.bookingToRenting();
				break;
			case "N":
				renting.getHotelsByCity();
				renting.getAvailableRooms();
				System.out.println();
				renting.newRenting();
				break;
			case "B": 
				repeat(UI);
				break;
			default: 
				rentingProcess(UI);
				break;
			}
		}catch(SQLException ex) {
			System.out.println(ex.getMessage());
			repeat(UI);
		}
	}
	
	private void bookingProcess(UserInterface UI) {
		try{
			renting = new Renting(connection);
			renting.getHotelsByCity();
			renting.getAvailableRooms();
			renting.newBooking();
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
			repeat(UI);
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
				System.out.println("Navigate to Booking a room by typing 'booking'");
				System.out.println("Enter command for Admin functions or renting.");
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
//						flag=false;
						rentingProcess(UI);
						break;
					case "insert hotel":
						int id = 100000 + rand.nextInt(900000);
						
						System.out.println("Please enter the id of the hotel");
						String name = input.nextLine(); 
						
						System.out.println("Please enter the hotel chain (brand) of the hotel");
						String hotelChain = input.nextLine(); 
						
						System.out.println("Please enter the email address of the hotel");
						String email_address = input.nextLine(); 
						
						System.out.println("Please enter the street the hotel is located at");
						String street = input.nextLine(); 
						
						System.out.println("Please enter the city the hotel is located in");
						String city = input.nextLine(); 
						
						System.out.println("Please enter the province the hotel is located in");
						String province = input.nextLine(); 
					
						System.out.println("Please enter the zip code of the hotel");
						String zipCode = input.nextLine(); 
						
						System.out.println("Please enter the # of rooms available at the hotel");
						String number_of_rooms = input.nextLine(); 
						
						System.out.println("Please enter the phone number of the hotel in the format (123-456-7890)");
						String phone_number = input.nextLine(); 
						
						System.out.println("Please enter the rating of the hotel (# 1-5)");
						String rating= input.nextLine(); 
						connection.insertInto("Hotel", new String[] {"("+id+",'"+name+"',"+hotelChain+",'"+email_address+"','"+street+"','"+city+"','"+province+"','"+zipCode+"',"+number_of_rooms+",'"+phone_number+"',"+rating+")"});
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
						
					case "insert employee":
						int empid = 100000 + rand.nextInt(900000); 
						
						System.out.println("Please enter the id of the hotel the employee work at");
						String hotel = input.nextLine(); 
						
						System.out.println("Please enter the employee's first name");
						String fName = input.nextLine(); 
						
						System.out.println("Please enter the employee's last name");
						String lName = input.nextLine(); 
						
						System.out.println("Please enter the email address of the employee");
						String email = input.nextLine(); 
						
						System.out.println("Please enter the street the employee is located at");
						String streetEmp = input.nextLine(); 
						
						System.out.println("Please enter the city the employee is located in");
						String cityEmp = input.nextLine(); 
						
						System.out.println("Please enter the province the employee is located in");
						String provinceEmp = input.nextLine(); 
					
						System.out.println("Please enter the zip code of the employee");
						String zipCodeEmp = input.nextLine(); 
						
						System.out.println("Please enter the postion title of the employee");
						String title = input.nextLine(); 
						
						System.out.println("Please enter the start date of the employee");
						String startD = input.nextLine(); 
						
						System.out.println("Please enter the end date of the employee");
						String endD= input.nextLine(); 
						
						System.out.println("Please enter the salary of the employee");
						String salary= input.nextLine(); 
						
						connection.insertInto("Employee", new String[] {"("+empid+","+hotel+",'"+fName+"','"+lName+"','"+email+"','"+streetEmp+"','"+cityEmp+"','"+provinceEmp+"','"+zipCodeEmp+"','"+title+"','"+startD+"','"+endD+"',"+salary+")"});
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
						
					case "insert customer":
						int custid = 100000 + rand.nextInt(900000); 

						System.out.println("Please enter the customer's first name");
						String fNameC = input.nextLine(); 
						
						System.out.println("Please enter the customer last name");
						String lNameC = input.nextLine(); 
						
						System.out.println("Please enter the registeration date of the customer");
						String regD = input.nextLine(); 
						
						System.out.println("Please enter the street the customer is located at");
						String streetC = input.nextLine(); 
						
						System.out.println("Please enter the city the customer is located in");
						String cityC = input.nextLine(); 
						
						System.out.println("Please enter the province the province is located in");
						String provinceC = input.nextLine(); 
					
						System.out.println("Please enter the zip code of the customer");
						String zipCodeC = input.nextLine(); 
						
						System.out.println("Please enter the security code of the customer's credit card");
						String secCode = input.nextLine(); 
						
						System.out.println("Please enter the card type of the customer's credit card");
						String cardType = input.nextLine(); 
						
						System.out.println("Please enter the card number of the customer's credit card");
						String cardNum= input.nextLine(); 
						
						System.out.println("Please enter the expiration month of the customer's credit card");
						String expMonth= input.nextLine(); 
						
						System.out.println("Please enter the expiration year of the customer's credit card");
						String expYear= input.nextLine(); 
						
						System.out.println("Please enter the phone number of the customer");
						String phoneNum= input.nextLine(); 
						
						connection.insertInto("Customer", new String[] {"("+custid+",'"+fNameC+"','"+lNameC+"','"+regD+"','"+streetC+"','"+cityC+"','"+provinceC+"','"+zipCodeC+"',"+secCode+",'"+cardType+"','"+cardNum+"',"+expMonth+","+expYear+",'"+phoneNum+"')"});
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
						
						
					case "insert room":
						int roomNum = 100 + rand.nextInt(900); 
						
						System.out.println("Please enter the id of the hotel where you want to add the room");
						String hotelR = input.nextLine(); 
						
						System.out.println("Please enter the price of renting the room");
						String price = input.nextLine(); 
						
						System.out.println("Please mention if the room can be extended or not ('true' or 'false')");
						String isExtendable = input.nextLine(); 
						
						System.out.println("Please mention if the room has a sea view or not ('true' or 'false')");
						String seaView = input.nextLine(); 
						
						System.out.println("Please mention if room has a mountain view or not ('true' or 'false')");
						String mountainView = input.nextLine(); 
						
						System.out.println("Please enter the capcity of the hotel room (1 to 7)");
						String capacity = input.nextLine(); 
						
						System.out.println("Please enter the id of the amenities of the room");
						String amenitiesID = input.nextLine(); 
					
						connection.insertInto("HotelRoom", new String[] {"("+roomNum+","+hotelR+","+price+","+isExtendable+","+seaView+","+mountainView+","+capacity+","+amenitiesID+")"});
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
						
					case "delete hotel":
						System.out.println("Please enter the id # of the hotel");
						String hotelId = input.nextLine();
						connection.deleteFrom("Hotel", hotelId);
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
						
					case "delete customer":
						System.out.println("Please enter the first name the customer");
						String firstNameC = input.nextLine();
						System.out.println("Please enter the last name of the customer");
						String lastNameC = input.nextLine();
						connection.deleteFromCustomer("Customer", firstNameC, lastNameC);
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
						
					case "delete room":
						System.out.println("Please enter the id # of the room");
						String roomID = input.nextLine();
						connection.deleteFromRoom("HotelRoom", roomID);
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
						
					case "delete employee":
						System.out.println("Please enter the first name the employee");
						String firstName = input.nextLine();
						System.out.println("Please enter the last name of the employee");
						String lastName = input.nextLine();
						connection.deleteFromCustomer("Employee", firstName, lastName);
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
						
					case "update hotel":
						System.out.println("Please enter the id # of the hotel instance you would like to update");
						String hotelIdU = input.nextLine();
						
						System.out.println("Please enter the attribute of hotel you would like to update from the following list");
						System.out.println("\n-name\n-hotelChain\n-email_address\n-street\n-city\n-province\n-zipCode\n-number_of_rooms\n-phone_number\n-rating\n");
						String attribute = input.nextLine();
						
						System.out.println("Please enter the updated value of that attribute");
						String value = input.nextLine();
						
						connection.update("Hotel", attribute, value, hotelIdU);
						System.out.println("Press \"ENTER\" to continue...");
						input.nextLine(); 
						break;
					case "booking":
//						flag = false;
						bookingProcess(UI);
						break;
					case "logout":
						flag=false;
						UI.closeConnection();
						UI.repeat(UI);
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
