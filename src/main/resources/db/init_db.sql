USE test;
DROP TABLE IF EXISTS notes;
CREATE TABLE notes
(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `note_date` DATE DEFAULT NULL,
  `is_done` BOOL DEFAULT FALSE,
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 0', 'Description 0', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 1', 'Description 1', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 2', 'Description 2', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 3', 'Description 3', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 4', 'Description 4', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 5', 'Description 5', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 6', 'Description 6', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 7', 'Description 7', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 8', 'Description 8', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 9', 'Description 9', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 10', 'Description 10', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 11', 'Description 11', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 12', 'Description 12', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 13', 'Description 13', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 14', 'Description 14', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 15', 'Description 15', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 16', 'Description 16', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 17', 'Description 17', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 18', 'Description 18', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 19', 'Description 19', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 20', 'Description 20', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 21', 'Description 21', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 22', 'Description 22', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 23', 'Description 23', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 24', 'Description 24', now());
INSERT INTO `notes`(`title`, `descr`, `note_date`) VALUES ('Title 25', 'Description 25', now());






