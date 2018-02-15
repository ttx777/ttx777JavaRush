package ru.sem.model;


import javax.persistence.*;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Admin on 08.02.2018.
 */

@NamedQueries({


        @NamedQuery(name = Note.GET_ALL,
                query = "SELECT n FROM Note n"),

        @NamedQuery(name = Note.DELETE, query = "DELETE FROM Note n WHERE n.id=:id")

})

@Entity
@Table(name = "notes")
public class Note {

    public static final String GET_ALL= "GetAll";
    public static final String DELETE= "DeleteById";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    @Column(name="title")
    private String title;

    @Column(name="descr")
    private String description;


    @Column(name = "note_date")
    @Temporal(TemporalType.DATE)
    private Date noteDate;

    @Column(name="is_done")
    private boolean isDone;

    public Note(){
        noteDate = Calendar.getInstance().getTime();
    }

    public Note(String title, String description, Date noteDate) {
        this.title = title;
        this.description = description;
        this.noteDate = noteDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public Date getNoteDate() {
        return noteDate;
    }

    public void setNoteDate(Date noteDate) {
        this.noteDate = noteDate;
    }

    public boolean isNew(){
        return id==null;
    }

    public boolean isDone() {
        return isDone;
    }

    public void setDone(boolean done) {
        isDone = done;
    }

    @Override
    public String toString() {
        return "Note{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", noteDate=" + noteDate +
                ", isDone=" + isDone +
                '}';
    }
}
