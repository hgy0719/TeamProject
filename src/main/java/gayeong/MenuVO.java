package gayeong;

public class MenuVO {

	private String menu_id;
	private String name;
	private int price;
	private String image;
	private int menu_type;
	private int amount;
	private int total;
	
	
	
	public MenuVO() {
		System.out.println("MenuVO 생성자 호출"); 
	}
	
	public MenuVO(String name,int price,String image, String menu_id) {
		
		this.name = name;
		this.price = price;
		this.image = image;
		this.menu_id = menu_id;
	}
	public MenuVO(String name,int price,String image, String menu_id, int amount, int total) {
		
		this.name = name;
		this.price = price;
		this.image = image;
		this.menu_id = menu_id;
		this.amount = amount;
		this.total = total;
	}

	
	public MenuVO(String menu_id, String name, int price, String image, int menu_type) {
		this.menu_id = menu_id;
		this.name = name;
		this.price = price;
		this.image = image;
		this.menu_type = menu_type;
	}
	
	
	
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getMenu_type() {
		return menu_type;
	}

	public void setMenu_type(int menu_type) {
		this.menu_type = menu_type;
	}
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
