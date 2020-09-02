-- userテーブル
CREATE TABLE user (
  id                   INTEGER PRIMARY KEY AUTO_INCREMENT,
  name                 VARCHAR(100) NOT NULL,
  mail                 VARCHAR(100) NOT NULL,
  password             VARCHAR(100) NOT NULL,
  introduction         VARCHAR(1000),
  businessphone_number VARCHAR(13),
  cellphone_number     VARCHAR(13),
  is_deleted           CHAR(1) DEFAULT '0' NOT NULL,
  created_at           DATETIME NOT NULL,
  updated_at           TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- chatテーブル
CREATE TABLE chat (
  id                         INTEGER PRIMARY KEY AUTO_INCREMENT,
  name                       VARCHAR(100) NOT NULL,
  overview                   VARCHAR(1000),
  is_permission_send_file    CHAR(1) DEFAULT '1' NOT NULL,
  is_direct_chat             CHAR(1) DEFAULT '0' NOT NULL,
  is_deleted                 CHAR(1) DEFAULT '0' NOT NULL,
  create_user_id             INTEGER REFERENCES user(id),
  created_at                 DATETIME NOT NULL,
  update_user_id             INTEGER REFERENCES user(id),
  updatad_at                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- postテーブル
CREATE TABLE post (
  id             INTEGER PRIMARY KEY AUTO_INCREMENT,
  content        VARCHAR(1000) NOT NULL,
  file_name      VARCHAR(100),
  chat_id        INTEGER REFERENCES chat(id),
  is_deleted     CHAR(1) DEFAULT '0' NOT NULL,
  create_user_id INTEGER REFERENCES user(id),
  created_at     DATETIME NOT NULL,
  update_user_id INTEGER REFERENCES user(id),
  updated_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- taskテーブル
CREATE TABLE task (
  id             INTEGER PRIMARY KEY AUTO_INCREMENT,
  content        VARCHAR(1000) NOT NULL,
  main_user_id   INTEGER REFERENCES user(id),
  chat_id        INTEGER REFERENCES chat(id),
  dead_line      DATETIME,
  is_completed   CHAR(1) DEFAULT '0' NOT NULL,
  is_deleted     CHAR(1) DEFAULT '0' NOT NULL,
  create_user_id INTEGER REFERENCES user(id),
  created_at     DATETIME NOT NULL,
  update_user_id INTEGER REFERENCES user(id),
  updated_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- chat_participantテーブル
CREATE TABLE chat_participant (
  user_id    INTEGER REFERENCES user(id),
  chat_id    INTEGER REFERENCES chat(id),
  created_at DATETIME NOT NULL,
  PRIMARY KEY (user_id, chat_id)
);
