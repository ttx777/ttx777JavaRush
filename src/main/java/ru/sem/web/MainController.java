package ru.sem.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import ru.sem.model.Note;
import ru.sem.service.NotesService;

import java.util.List;

/**
 * Created by Admin on 23.01.2018.
 */

@Controller
public class MainController {

    @Autowired
    NotesService service;

    private static final Logger log = LoggerFactory.getLogger("MainController");

    @RequestMapping(value = "/ta", method= RequestMethod.GET)
    public String main(){
        return "index";
    }

    @RequestMapping(value = "/ta/notes", method= RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Note> getAllNotes(){
        return service.getAll();
    }

    @RequestMapping(value = "/ta/note", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Note getNote(@RequestParam("id") int id){
        return service.getById(id);
    }

    @RequestMapping(value = "/ta/savenote", method = RequestMethod.POST)
    @ResponseBody
    public Note createItem(@RequestBody Note item){
        log.info(item.toString());
        log.info("save note");

        return service.save(item);
    }

    @RequestMapping(value = "/ta/delnote", method = RequestMethod.DELETE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Boolean deleteNote(@RequestParam("id") int id){
        return service.delete(id);
    }

}
