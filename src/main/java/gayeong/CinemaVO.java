package gayeong;

import java.util.Date;

public class CinemaVO {
	

	private String cinema_id;
	private String cinema_name;
	private String cinema_area;
	private String cinema_image;
	private String cinema_area_type;
//	private String movie_name;
//	private int movie_age;
//	private Date movie_date;
//	private String movie_time;
	
	
	
	public CinemaVO() {
		System.out.println("MenuVO 생성자 호출"); 
	}
	
	public CinemaVO(String cinema_name, String cinema_area) {
		this.cinema_name = cinema_name;
		this.cinema_area = cinema_area;
	}
	
	public CinemaVO(String cinema_id, String cinema_name, String cinema_area, String cinema_image,String cinema_area_type) {
		this.cinema_id = cinema_id;
		this.cinema_name = cinema_name;
		this.cinema_area = cinema_area;
		this.cinema_image = cinema_image;
		this.cinema_area_type = cinema_area_type;
	}
	
	
	
	
	
	
	
	

	public String getCinema_id() {
		return cinema_id;
	}



	public void setCinema_id(String cinema_id) {
		this.cinema_id = cinema_id;
	}



	public String getCinema_name() {
		return cinema_name;
	}



	public void setCinema_name(String cinema_name) {
		this.cinema_name = cinema_name;
	}



	public String getCinema_area() {
		return cinema_area;
	}



	public void setCinema_area(String cinema_area) {
		this.cinema_area = cinema_area;
	}



	public String getCinema_image() {
		return cinema_image;
	}



	public void setCinema_image(String cinema_image) {
		this.cinema_image = cinema_image;
	}



	public String getCinema_area_type() {
		return cinema_area_type;
	}



	public void setCinema_area_type(String cinema_area_type) {
		this.cinema_area_type = cinema_area_type;
	}


//	public String getMovie_name() {
//		return movie_name;
//	}
//	public void setMovie_name(String movie_name) {
//		this.movie_name = movie_name;
//	}
//	public int getMovie_age() {
//		return movie_age;
//	}
//	public void setMovie_age(int movie_age) {
//		this.movie_age = movie_age;
//	}
//	public Date getMovie_date() {
//		return movie_date;
//	}
//	public void setMovie_date(Date movie_date) {
//		this.movie_date = movie_date;
//	}
//	public String getMovie_time() {
//		return movie_time;
//	}
//	public void setMovie_time(String movie_time) {
//		this.movie_time = movie_time;
//	}

	
	
}
