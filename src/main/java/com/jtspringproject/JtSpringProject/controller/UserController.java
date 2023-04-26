package com.jtspringproject.JtSpringProject.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

	private static UserController instance = null;

	private UserController() {
		// private constructor to prevent instance creation from outside
	}

	public static UserController getInstance() {
		if (instance == null) {
			synchronized (UserController.class) {
				if (instance == null) {
					instance = new UserController();
				}
			}
		}
		return instance;
	}

	@GetMapping("/register")
	public String registerUser() {
		return "register";
	}

	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}

	@GetMapping("/buy")
	public String buy() {
		return "buy";
	}

	@GetMapping("/Cart")
	public String cart() {
		return "cart";
	}

	@GetMapping("/user/cartentry")
	public String cartentry() {
		return "cart";
	}

	@GetMapping("/user/logout")
	public String logout() {
		return "redirect:/";
	}

	@RequestMapping(value = "cartentry", method = RequestMethod.POST)
	public String newItemCart(@RequestParam("id") int id, @RequestParam("dish") String name,
			@RequestParam("price") int price, @RequestParam("quantity") int quantity) {
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
			PreparedStatement pst1 = con.prepareStatement("select * from cart where id=?;");
			pst1.setInt(1, id);
			ResultSet rs1 = pst1.executeQuery();
			if (rs1.next()) {
				int q = rs1.getInt("quantity");
				int p = rs1.getInt("price");
				int t = rs1.getInt("tot_price");
				q = q + quantity;
				t = t + (quantity * p);
				PreparedStatement pst = con.prepareStatement("update cart set quantity=?,tot_price=? where id=?;");
				pst.setInt(1, q);
				pst.setInt(2, t);
				pst.setInt(3, id);
				int i = pst.executeUpdate();
				System.out.println("data base updated" + i);
			} else {
				PreparedStatement pst = con
						.prepareStatement("insert into cart(id,dish,quantity,price,tot_price) values(?,?,?,?,?);");
				pst.setInt(1, id);
				pst.setString(2, name);
				pst.setInt(4, price);
				pst.setInt(3, quantity);
				pst.setInt(5, price * quantity);
				int i = pst.executeUpdate();
				System.out.println("data base updated" + i);
			}

		} catch (Exception e) {
			System.out.println("Exception:" + e);
		}
		return "redirect:/Cart";
	}

	// Delete cart Post method
	@RequestMapping(value = "deleteCart", method = RequestMethod.POST)
	public String deleteCart(@RequestParam("id") int id) {
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
			PreparedStatement pst = con.prepareStatement("delete from cart where id=?;");
			pst.setInt(1, id);
			int i = pst.executeUpdate();
			System.out.println("data base updated" + i);

		} catch (Exception e) {
			System.out.println("Exception:" + e);
		}
		return "redirect:/Cart";
	}

	@RequestMapping(value = "newuserregister", method = RequestMethod.POST)
	public String newUseRegister(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("email") String email) {
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
			PreparedStatement pst = con.prepareStatement("insert into users(username,password,email) values(?,?,?);");
			pst.setString(1, username);
			pst.setString(2, password);
			pst.setString(3, email);

			// pst.setString(4, address);
			int i = pst.executeUpdate();
			System.out.println("data base updated" + i);

		} catch (Exception e) {
			System.out.println("Exception:" + e);
		}
		return "redirect:/";
	}
}
