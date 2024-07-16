package www.silver.vo;

public class TravelFoodVO {

	private String username = null;
	private String place = null;
	private String restaurant = null;
	private String review = null;
	private String in_date = null;
	private int no = 0;
	private String pw =null;
	private int love =0;
	private String[] filename=null;



	
	public String[] getFilename() {
		return filename;
	}

	public void setFilename(String[] filename) {
		this.filename = filename;
	}

	
	
	
	
	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getLove() {
		return love;
	}

	public void setLove(int love) {
		this.love = love;
	}

	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getRestaurant() {
		return restaurant;
	}

	@Override
	public String toString() {
		return "TravelFoodVO [username=" + username + ", place=" + place + ", restaurant=" + restaurant + ", review="
				+ review + ", in_date=" + in_date + ", no=" + no + "]";
	}

	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getIn_date() {
		return in_date;
	}

	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

}
