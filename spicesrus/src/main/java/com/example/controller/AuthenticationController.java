package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.Customer;
import com.example.repo.CustomerRepository;
import com.example.repo.BasketItemRepository;

@Controller
public class AuthenticationController {
	
	@Autowired
	private CustomerRepository custrepo;
	@Autowired
	private CustomerRepository itemrepo;

	@Autowired
	private PasswordEncoder passe;
	
	@RequestMapping("login-form")
	public String login(Model model) {
		model.addAttribute("totalitems", itemrepo.count());
		return "security/login";
	}
	
	@RequestMapping(value = "/success-login", method = RequestMethod.GET)
	public String successLogin(Model model) {
		model.addAttribute("totalitems", itemrepo.count());
		return "redirect:/products";
	}
	
	@RequestMapping(value = "/access-denied", method = RequestMethod.GET)
	public String error(Model model) {
		model.addAttribute("totalitems", itemrepo.count());
		return "security/denied";
	}
	
	@RequestMapping("register")
	public String register(Model model) {
		model.addAttribute("totalitems", itemrepo.count());
		return "security/registration";
	}
	
	@RequestMapping("logout-form")
	public String logout(Model model) {
		model.addAttribute("totalitems", itemrepo.count());
		return "security/logout";
	}
	
	@RequestMapping(value = "success-register", method = RequestMethod.POST)
	public String registerationComplete(Model model, String email, String firstname, String lastname, String password) {
		model.addAttribute("totalitems", itemrepo.count());
		Customer c = new Customer();
		c.setEmail(email);
		c.setFirstname(firstname);
		c.setLastname(lastname);
		c.setPassword(passe.encode(password));
		
		custrepo.save(c);
		
		return "redirect:/products";
	}

}
