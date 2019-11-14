PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  f_name TEXT NOT NULL,
  l_name TEXT NOT NULL
  
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL, 
  body TEXT NOT NULL,
  author_id INTEGER, 
  
  FOREIGN KEY (author_id) REFERENCES users(id) 
);

CREATE TABLE questions_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL, 
  parent_id INTEGER,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_like_id INTEGER NOT NULL,
  user_like_id INTEGER,
  
  FOREIGN KEY (user_like_id) REFERENCES users(id),
  FOREIGN KEY (question_like_id) REFERENCES questions(id)
);

INSERT INTO 
  users(f_name, l_name)
VALUES
  ('Ashton', 'Miller'),
  ('Oliver', 'Chen');
INSERT INTO 
  questions(title, body, author_id)
VALUES
  ('nap time', 'What time is our nap time?', (SELECT id FROM users WHERE f_name = 'Ashton' AND l_name = 'Miller')),
  ('lunch time', 'will there be beer with lunch?', (SELECT id FROM users WHERE f_name = 'Oliver' AND l_name = 'Chen'));

INSERT INTO 
  questions_follows(question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'nap time'), (SELECT id FROM users WHERE f_name = 'Ashton' AND l_name = 'Miller')),
  ((SELECT id FROM questions WHERE title = 'lunch time'), (SELECT id FROM users WHERE f_name = 'Oliver' AND l_name = 'Chen'));

INSERT INTO 
  replies(question_id, parent_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'nap time'), NULL, ('sleep when your dead')),
  ((SELECT id FROM questions WHERE title = 'lunch time'), NULL, ('yes lots of beer and pizza'));
INSERT INTO 
  replies(question_id, parent_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'nap time'), (SELECT id FROM replies WHERE body = 'sleep when your dead'), ('just lay down instead')),
  ((SELECT id FROM questions WHERE title = 'lunch time'), (SELECT id FROM replies WHERE body = 'yes lots of beer and pizza'), ('I want ice cold beer'));
    

INSERT INTO 
  question_likes(question_like_id, user_like_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'nap time'), (SELECT id FROM users WHERE f_name = 'Ashton' AND l_name = 'Miller')),
  ((SELECT id FROM questions WHERE title = 'lunch time'), (SELECT id FROM users WHERE f_name = 'Oliver' AND l_name = 'Chen'));
  