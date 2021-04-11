package hotelDBMS;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Random;
import java.util.Scanner;

public class Renting {
	private Connect dbConnection;
	private Random rand;
	
	Renting(Connect connection){
		dbConnection = connection;
		rand = new Random();
	}
	
	public void getBookingInfo(String firstName, String lastName) throws SQLException {
		ResultSet result;
		result = dbConnection.getResultSet("Select customer_id, confirmation_number, "
				+ "first_name, last_name booking_date, room_type, price, days_booked "
				+ "from hotel_db.Customer C INNER JOIN hotel_db.BookingInfo B "
				+ "ON C.id = B.customer_id where "
				+ "C.first_name = '"+firstName+"', C.last_name = '"+lastName+"';");
		dbConnection.printResultSet(result);
	}
	
	public void bookingToRenting() throws SQLException{
		ResultSet result;
		Scanner input = new Scanner(System.in);
		System.out.println("Enter First Name: ");
		String fName = input.nextLine();
		System.out.println("Enter Last Name: ");
		String lName = input.nextLine();
		System.out.println("Booings for Provided Information: ");
		result = dbConnection.getResultSet("Select confirmation_number, "
				+ "customer_id, first_name, last_name, booking_date, days_booked "
				+ "from hotel_db.BookingInfo B INNER JOIN hotel_db.Customer C "
				+ "on B.customer_id = c.id WHERE first_name = '"+fName+"' and "
						+ "last_name = '"+lName+"';" );
		dbConnection.printResultSet(result);
		System.out.println();
		System.out.println("Enter Confirmation Number for Booking to Confirm Renting: ");
		int confirmationNumber = input.nextInt();
		
		result = dbConnection.getResultSet("SELECT * from hotel_db.BookingInfo WHERE "
				+ "confirmation_number = "+confirmationNumber+";");
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");
		result.next();
		int confirmation_number = confirmationNumber;
		int customer_id = result.getInt("customer_id");
		int room_number = result.getInt("room_number");
		String renting_date = sdf3.format(timestamp);
		String room_type = result.getString("room_type");
		int price = result.getInt("price");
		
		int check_in_day = result.getInt("check_in_day"); 
		int check_in_month = result.getInt("check_in_month");
		int check_in_year = result.getInt("check_in_year");
		int check_out_day = result.getInt("check_out_day");
		int check_out_month = result.getInt("check_out_month");
		int check_out_year = result.getInt("check_out_year");
		int days_rented = result.getInt("days_booked");
		int number_of_occupants = result.getInt("number_of_occupants");
		int hotel_ID = result.getInt("hotel_ID");
		int booking = confirmationNumber;  
		String rentingInfo = ("("+confirmation_number+","+customer_id+","+room_number+", '"+renting_date+"','"+
		room_type+"',"+price+","+check_in_day+","+check_in_month+","+check_in_year+","+check_out_day+","+
				check_out_month+","+check_out_year+","+days_rented+","+number_of_occupants+","+
				hotel_ID+","+booking+")");
		String[] query = new String[] {rentingInfo};
		dbConnection.insertInto("Renting", query);
		System.out.println("Following Information was Added: ");
		System.out.println();
		result = dbConnection.getResultSet("Select * from hotel_db.Renting"
				+ " WHERE confirmation_number = "+confirmationNumber+";");
		dbConnection.printResultSet(result);
	}
	public void getHotelsByCity(){
		try{
			Scanner input = new Scanner(System.in);
			System.out.println("Enter City to Search for Hotels: ");
			String city = input.nextLine();
			ResultSet result = dbConnection.getResultSet("Select id, name, city, province, "
					+ "rating from hotel_db.Hotel WHERE city = '"+city+"';");
			dbConnection.printResultSet(result);
			System.out.println();
		}catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
	}
	public void getAvailableRooms(){
		Scanner input = new Scanner(System.in);
		try{
			System.out.println("Enter Id for Hotel: ");
			int hotelID = input.nextInt();
			ResultSet result = dbConnection.getResultSet("Select H.room_number, price, can_be_extended, sea_view"
					+ ", mountain_view, capacity, tv, minibar, fridge, airconditioner, wifi"
					+ ", others from hotel_db.Availability A INNER JOIN hotel_db.HotelRoom H "
					+ "ON A.room_number = H.room_number INNER JOIN hotel_db.Amenities B ON H.room_number = "
					+ "B.amenities_roomkey where A.isAvailable = true and A.hotel_id = "+hotelID+";");
			dbConnection.printResultSet(result);
		}catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
				
	}
	
	public void newBooking() throws SQLException{
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
//		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy");
//		SimpleDateFormat sdf3 = new SimpleDateFormat("dd");
//		SimpleDateFormat sdf4 = new SimpleDateFormat("MM");
		
		Scanner input = new Scanner(System.in);
		int customer_id = 0;
		int confirmation_number = 100000 + rand.nextInt(900000);
		System.out.println("Enter Information for Renting: ");
		System.out.println("Enter id for Hotel of stay: ");
		System.out.println();
		String hotelID = input.nextLine();
		System.out.println("Are you a New Customer?(Y/N)");
		String response = input.nextLine();
		switch (response) {
		case "N":
			try {
				System.out.println("Customer ID: ");
				String cid = input.nextLine();
				customer_id = Integer.parseInt(cid);
				ResultSet res = dbConnection.getResultSet("Select * from hotel_db.Customer"
						+ " where id="+customer_id+";");
				dbConnection.printResultSet(res);
			}catch(SQLException ex) {
				System.out.println(ex.getMessage());
				System.out.println("Please Try Again: ");
				newRenting();
			}
			break;
		case "Y":
			try {
				System.out.println("Enter Customer Information: ");
				customer_id = 100 + rand.nextInt(900);
				System.out.println("Enter Customer's First Name: ");
				String first_name = input.nextLine();
				System.out.println("Enter CUstomer's Last Name: ");
				String last_name = input.nextLine();
				String registration_date = sdf1.format(timestamp);
				System.out.println("Enter Billing Address: ");
				System.out.println("\t Enter Street: ");
				String street = input.nextLine();
				System.out.println("\t Enter City: ");
				String city = input.nextLine();
				System.out.println("\t Enter province: ");
				String province = input.nextLine();
				System.out.println("\t Enter Zipcode: ");
				String zipcode = input.nextLine();
				System.out.println("Enter Card Details: ");
				System.out.println("Enter Security Code: ");
				String security_code = input.nextLine();
				System.out.println("\t Enter Card type:");
				String card_type = input.nextLine();
				System.out.println("\t Enter Card Number");
				System.out.println("Format: XXXX-XXXX-XXXX-XXXX");
				String card_number = input.nextLine();
				System.out.println("\t Enter Expiration Month (MM): ");
				String expiration_month = input.nextLine();
				System.out.println("\t Enter Expiration Month (YY): ");
				String expiration_year = input.nextLine();
				System.out.println("ENter Phone Number: ");
				System.out.println("Format: XXX-XXX-XXXX");
				String phone_number = input.nextLine();
				String SQL = ("("+customer_id+", '"+first_name+"', '"+last_name+"', '"+registration_date
						+"', '"+street+"', '"+city+"', '"+province+"', '"+zipcode+"', "+security_code+", '"+card_type+"', '"+card_number
						+"', "+expiration_month+", "+expiration_year+", '"+phone_number+"')");
				System.out.println(SQL);
				dbConnection.insertInto("Customer", new String[] {SQL});
				ResultSet res = dbConnection.getResultSet("Select * from hotel_db.Customer"
						+ "where id="+customer_id+";");
				System.out.println("Customer Information added: ");
				dbConnection.printResultSet(res);
			}catch(SQLException ex) {
				System.out.println(ex.getMessage());
				System.out.println("Please Try Again: ");
				newBooking();
			}
			break;
			default:
				break;
		}
		System.out.println("Enter Room Number: ");
		String room_number = input.nextLine();
		System.out.println("Enter Room Type (Single/Double/Triple/King/Queen): ");
		String room_type = input.nextLine();
		int price = 200;
		switch(room_type) {
		case("Single"):
			break;
		case("Double"):
			price = 500;
			break;
		case("Triple"):
			price = 10000;
		case("Queen"):
			price = 2000;
			break;
		case("King"):
			price = 3000;
		}
		String booking_date = sdf1.format(timestamp);
		System.out.println("Enter Check in Day (dd): ");
		int check_in_day = input.nextInt(); 
		System.out.println("Enter check in month (MM): ");
		int check_in_month = input.nextInt();
		System.out.println("Enter Check in year (YYYY): ");
		int check_in_year = input.nextInt();
		System.out.println("Enter Checkout Day (dd): ");
		int check_out_day = input.nextInt();
		System.out.println("Enter Checkout Month (MM): ");
		int check_out_month = input.nextInt();
		System.out.println("Enter Checkout year (YYYY): ");
		int check_out_year = input.nextInt();
		System.out.println("Enter Number of days Booked: ");
		int days_booked = input.nextInt();
		System.out.println("Enter number of Occupants: ");
		int number_of_occupants = input.nextInt();
		String rentingInfo = ("("+confirmation_number+","+customer_id+","+room_number+", '"+booking_date+"' , '"+
		room_type+"' ,"+price+","+check_in_day+","+check_in_month+","+check_in_year+","+check_out_day+","+
				check_out_month+","+check_out_year+","+days_booked+","+number_of_occupants+","+
				hotelID+")");
		String[] query = new String[] {rentingInfo};
//		System.out.println(rentingInfo);
		dbConnection.insertInto("BookingInfo", query);
	}
	
	public void newRenting() throws SQLException{
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
//		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy");
//		SimpleDateFormat sdf3 = new SimpleDateFormat("dd");
//		SimpleDateFormat sdf4 = new SimpleDateFormat("MM");
		
		Scanner input = new Scanner(System.in);
		int confirmation_number = 100000 + rand.nextInt(900000);
		System.out.println("Enter Information for Renting: ");
		System.out.println("Enter id for Hotel of stay: ");
		System.out.println();
		String hotelID = input.nextLine();
		System.out.println("Is Customer in the System?(Y/N)");
		String response = input.nextLine();
		int customer_id = 0;
		switch (response) {
		case "Y":
			try {
				System.out.println("Customer ID: ");
				String cid = input.nextLine();
				customer_id = Integer.parseInt(cid);
				ResultSet res = dbConnection.getResultSet("Select * from hotel_db.Customer"
						+ " where id = "+customer_id+";");
				dbConnection.printResultSet(res);
			}catch(SQLException ex) {
				System.out.println(ex.getMessage());
				System.out.println("Please Try Again: ");
				newRenting();
			}
			break;
		case "N":
			try {
				System.out.println("Enter Customer Information: ");
				customer_id = 100 + rand.nextInt(900);
				System.out.println("Enter Customer's First Name: ");
				String first_name = input.nextLine();
				System.out.println("Enter CUstomer's Last Name: ");
				String last_name = input.nextLine();
				String registration_date = sdf1.format(timestamp);
				System.out.println("Enter Billing Address: ");
				System.out.println("\t Enter Street: ");
				String street = input.nextLine();
				System.out.println("\t Enter City: ");
				String city = input.nextLine();
				System.out.println("\t Enter province: ");
				String province = input.nextLine();
				System.out.println("\t Enter Zipcode: ");
				String zipcode = input.nextLine();
				System.out.println("Enter Card Details: ");
				System.out.println("Enter Security Code: ");
				String security_code = input.nextLine();
				System.out.println("\t Enter Card type:");
				String card_type = input.nextLine();
				System.out.println("\t Enter Card Number");
				System.out.println("Format: XXXX-XXXX-XXXX-XXXX");
				String card_number = input.nextLine();
				System.out.println("\t Enter Expiration Month (MM): ");
				String expiration_month = input.nextLine();
				System.out.println("\t Enter Expiration Year (YYYY): ");
				String expiration_year = input.nextLine();
				System.out.println("ENter Phone Number: ");
				System.out.println("Format: XXX-XXX-XXXX");
				String phone_number = input.nextLine();
				String SQL = ("("+customer_id+", '"+first_name+"', '"+last_name+"', '"+registration_date
						+"', '"+street+"', '"+city+"', '"+province+"', '"+zipcode+"', "+security_code+", '"+card_type+"', '"+card_number
						+"', "+expiration_month+", "+expiration_year+", '"+phone_number+"')");
				System.out.println(SQL);
				dbConnection.insertInto("Customer", new String[] {SQL});
				ResultSet res = dbConnection.getResultSet("Select * from hotel_db.Customer"
						+ " WHERE id = "+customer_id+";");
				System.out.println("Customer Information added: ");
				dbConnection.printResultSet(res);
			}catch(SQLException ex) {
				System.out.println(ex.getMessage());
				System.out.println("Please Try Again: ");
				newBooking();
			}
			break;
			default:
				break;
		}
		System.out.println("Enter Room Number: ");
		String room_number = input.nextLine();
		System.out.println("Enter Room Type (Single/Double/Triple/King/Queen): ");
		String room_type = input.nextLine();
		System.out.println("Enter Price \n "
				+ "(Single = 200, Double = 300, Triple=400, King=700, Queen=600): ");
		int price = input.nextInt();
		System.out.println("Enter Check in Day (dd): ");
		int check_in_day = input.nextInt(); 
		System.out.println("Enter check in month (MM): ");
		int check_in_month = input.nextInt();
		System.out.println("Enter Check in year (YYYY): ");
		int check_in_year = input.nextInt();
		System.out.println("Enter Checkout Day (dd): ");
		int check_out_day = input.nextInt();
		System.out.println("Enter Checkout Month (MM): ");
		int check_out_month = input.nextInt();
		System.out.println("Enter Checkout year (YYYY): ");
		int check_out_year = input.nextInt();
		System.out.println("Enter Number of days Rented: ");
		int days_rented = input.nextInt();
		System.out.println("Enter number of Occupants: ");
		int number_of_occupants = input.nextInt();
		String renting_date = sdf1.format(timestamp);
		String rentingInfo = ("("+confirmation_number+","+customer_id+","+room_number+", '"+renting_date+"' , '"+
		room_type+"' ,"+price+","+check_in_day+","+check_in_month+","+check_in_year+","+check_out_day+","+
				check_out_month+","+check_out_year+","+days_rented+","+number_of_occupants+","+
				hotelID+","+"NULL )");
		String[] query = new String[] {rentingInfo};
		dbConnection.insertInto("Renting", query);
	}

}
