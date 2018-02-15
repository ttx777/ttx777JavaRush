package ru.sem.repository;

import ru.sem.model.Note;

import java.util.List;

/**
 * Created by Admin on 08.02.2018.
 */
public interface NotesRepository {

    List<Note> getAll();

    Note getById(int id);

    Note save(Note note);

    boolean delete(int id);
}
