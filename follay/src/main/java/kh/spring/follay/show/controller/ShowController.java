package kh.spring.follay.show.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.follay.show.model.service.ShowService;

@Controller
@RequestMapping("/show")
public class ShowController {
	private static final Logger logger = LoggerFactory.getLogger(ShowController.class);
	
	@Autowired
	private ShowService service;

}
