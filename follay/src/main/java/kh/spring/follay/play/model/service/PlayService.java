package kh.spring.follay.play.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.follay.play.model.dao.PlayDao;

@Service
public class PlayService {

	@Autowired
	private PlayDao dao;
	
}
