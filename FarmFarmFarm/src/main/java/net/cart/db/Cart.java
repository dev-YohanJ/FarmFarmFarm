package net.cart.db;

public class Cart {
	//cart
	private int cart_id;
	private String cart_mem_id;
	private int cart_item_id;
	private int cart_quantity;
	
	//item
	private String item_name;
	private int item_price;
	private String item_file1;
	
	
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public String getItem_file1() {
		return item_file1;
	}
	public void setItem_file1(String item_file1) {
		this.item_file1 = item_file1;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getCart_mem_id() {
		return cart_mem_id;
	}
	public void setCart_mem_id(String cart_mem_id) {
		this.cart_mem_id = cart_mem_id;
	}
	public int getCart_item_id() {
		return cart_item_id;
	}
	public void setCart_item_id(int cart_item_id) {
		this.cart_item_id = cart_item_id;
	}
	public int getCart_quantity() {
		return cart_quantity;
	}
	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}
	
}
