package br.com.mv.microservice.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.mv.microservice.model.Users;

public interface UserRepository extends JpaRepository<Users, String> {
	
	@Query("SELECT u FROM Users u WHERE LOWER(u.username) = LOWER(:username)")
    Optional<Users> findByUsername(@Param("username") String username);
	
}