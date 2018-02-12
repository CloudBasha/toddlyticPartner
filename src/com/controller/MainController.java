package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class MainController {

	@RequestMapping(value = { "/", "/login", "/index" }, method = RequestMethod.GET)
	public String index(HttpServletRequest request) {
		// return "school_login";
		System.out.println("Partner index page");
		return "static/index.html";
	}
}
