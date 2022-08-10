package net.cart.db;

public class Cart {
	private int cart_id;
	private String cart_mem_id;
	private int cart_item_id;
	private int cart_quantity;
	
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
