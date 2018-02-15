package ru.sem.repository;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ru.sem.model.Note;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Admin on 08.02.2018.
 */


@Repository
@Transactional
public class NotesRepositoryImpl implements NotesRepository {

    @PersistenceContext
    private EntityManager em;

    @Override
    @Transactional(readOnly = true)
    public List<Note> getAll() {
        return em.createQuery("SELECT n FROM Note n").getResultList();
    }

    @Override
    public Note getById(int id) {
        return em.find(Note.class, id);
    }

    @Override
    public Note save(Note note) {
        if(note.isNew()){
            em.persist(note);
            return note;
        }else{
            return em.merge(note);
        }
    }

    @Override
    public boolean delete(int id) {
        return em.createNamedQuery(Note.DELETE)
                .setParameter("id", id).executeUpdate() != 0;
    }
}
