package ru.sem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.sem.model.Note;
import ru.sem.repository.NotesRepository;

import java.util.List;

/**
 * Created by Admin on 08.02.2018.
 */
@Service
public class NotesServiceImpl implements NotesService {

    @Autowired
    NotesRepository repository;

    @Override
    public List<Note> getAll() {
        return repository.getAll();
    }

    @Override
    public Note getById(int id) {
        return repository.getById(id);
    }

    @Override
    public Note save(Note note) {
        return repository.save(note);
    }

    @Override
    public boolean delete(int id) {
        return repository.delete(id);
    }
}
