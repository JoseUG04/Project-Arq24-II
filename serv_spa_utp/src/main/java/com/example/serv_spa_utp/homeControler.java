package com.example.serv_spa_utp;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class homeControler {
	
	@GetMapping("/")
	public String home() {
		return "redirect:/indexInicio.html";
	}
	
}
