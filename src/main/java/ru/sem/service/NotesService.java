package ru.sem.service;

import ru.sem.model.Note;

import java.util.List;

/**
 * Created by Admin on 23.01.2018.
 */
public interface NotesService {

    List<Note> getAll();

    Note getById(int id);

    Note save(Note note);

    boolean delete(int id);
}
