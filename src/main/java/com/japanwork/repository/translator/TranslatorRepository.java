package com.japanwork.repository.translator;

import java.sql.Timestamp;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.japanwork.model.Translator;
import com.japanwork.model.User;

public interface TranslatorRepository extends JpaRepository<Translator, UUID>{
	public Translator findByUser(User user);
	public Translator findByUserAndDeletedAt(User user, Timestamp deletedAt);
	public Translator findByIdAndDeletedAt(UUID id, Timestamp deletedAt);
	public Page<Translator> findAllByDeletedAt(Pageable page, Timestamp deletedAt);
}
