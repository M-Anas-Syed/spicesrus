package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.security.core.userdetails.User;

import com.example.domain.Customer;
import com.example.repo.CustomerRepository;



@Service
public class CustomerDetailsService implements UserDetailsService {

	@Autowired
	private CustomerRepository repo;

	@Override
	public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {

		Customer customer = repo.findByEmail(login);

		if (customer == null)
			throw new UsernameNotFoundException("User not found");
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
//		String role = agent.isSpecial() ? "ROLE_SPECIAL_AGENT" : "ROLE_ORDINARY_AGENT"; 
//		authorities.add(new SimpleGrantedAuthority(role));

		return new User(customer.getEmail(), customer.getPassword(), true, 
				true, true, true, authorities);
	}
}

