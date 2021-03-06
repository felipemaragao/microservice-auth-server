package br.com.mv.microservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.mv.microservice.model.Authority;

public interface AuthorityRepository extends JpaRepository<Authority, String>{
	
	Authority findByName(String name);
	
}