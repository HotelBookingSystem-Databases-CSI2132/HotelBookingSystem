package hotelDBMS;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Scanner;

public class Renting {
	
	private Connect dbConnection;
	
	Renting(Connect connection){
		dbConnection = connection;
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
	
	public void bookingToRenting(int confirmationNumber) throws SQLException{
		ResultSet result;
		
		result = dbConnection.getResultSet("Select * from hotel_db.Customer C "
				+ "INNER JOIN hotel_db.BookingInfo B ON C.id = B.customer_id where "
				+ "B.confirmation_number = "+confirmationNumber+";");
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		int confirmation_number = confirmationNumber;
		
		int customer_id = result.getInt("customer_id");
		
		int room_number = result.getInt("room_number");
		String renting_date = sdf3.format(timestamp);
		System.out.println("Enter Room Type (Single/Double/Triple/King/Queen): ");
		String room_type = result.getString("room_type");
		System.out.println("Enter Price \n "
				+ "(Single = 200, Double = 300, Triple=400, King=700, Queen=600): ");
		int price = result.getInt("price");
		
		int check_in_day = result.getInt("check_in_day"); 
		int check_in_month = result.getInt("check_in_month");
		int check_in_year = result.getInt("check_in_year");
		int check_out_day = result.getInt("check_out_day");
		int check_out_month = result.getInt("check_out_month");
		int check_out_year = result.getInt("check_out_year");
		int days_rented = result.getInt("days_rented");
		int number_of_occupants = result.getInt("number_of_occupants");
		int hotel_ID = result.getInt("hotel_ID");
		int booking = confirmationNumber;  
		String rentingInfo = (confirmation_number+","+customer_id+","+room_number+","+renting_date+","+
		room_type+","+price+","+check_in_day+","+check_in_month+","+check_in_year+","+check_out_day+","+
				check_out_month+","+check_out_year+","+days_rented+","+number_of_occupants+","+
				hotel_ID+","+booking);
		String[] query = new String[] {rentingInfo};
		dbConnection.insertInto("Renting", query);
	}
	
	public void getAvailableRooms() {

	}
	
	public void newRenting() {
//		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
//		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy");
//		SimpleDateFormat sdf3 = new SimpleDateFormat("dd");
//		SimpleDateFormat sdf4 = new SimpleDateFormat("MM");
//		
//		Scanner input = new Scanner(System.in);
//		System.out.println("Enter Information for Renting: ");
//		System.out.println("Customer ID: ");
//		String customer_id = input.nextLine();
//		String confirmation_number;
//		int room_number = input.nextInt();
//		String renting_date = sdf1.format(timestamp);
//		String room_type = input.nextLine();;
//		int price = input.nextInt();
//		int check_in_day = Integer.parseInt(sdf3.format(timestamp)); 
//		int check_in_month = Integer.parseInt(sdf4.format(timestamp));
//		int check_in_year = Integer.parseInt(sdf2.format(timestamp));
//		int check_out_day = input.nextInt();
//		int check_out_month = input.nextInt();
//		int check_out_year = input.nextInt();
//		int days_rented = input.nextInt();
//		int number_of_occupants = input.nextInt();
//		int hotel_ID = input.nextInt();
//		String booking;
//		String rentingInfo = (confirmation_number+","+customer_id+","+room_number+","+renting_date+","+
//		room_type+","+price+","+check_in_day+","+check_in_month+","+check_in_year+","+check_out_day+","+
//				check_out_month+","+check_out_year+","+days_rented+","+number_of_occupants+","+
//				hotel_ID+","+booking);
//		String[] query = new String[] {rentingInfo};
	}

}
