-- userテーブル
CREATE TABLE user (
  user_id              INTEGER PRIMARY KEY AUTO_INCREMENT,
  user_name            VARCHAR(100) NOT NULL UNIQUE,
  user_mailadress      VARCHAR(100) NOT NULL UNIQUE,
  user_password        VARCHAR(100) NOT NULL,
  user_introduction    VARCHAR(1000),
  businessphone_number VARCHAR(13) CHECK (businessphone_number LIKE '%-%'),
  cellphone_number     VARCHAR(13) CHECK (cellphone_number LIKE '%-%'),
  delete_flg           CHAR(1) DEFAULT '0' NOT NULL,
  created_at           DATETIME NOT NULL,
  updeted_at           TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)

-- chatテーブル
CREATE TABLE chat (
  chat_id         INTEGER PRIMARY KEY AUTO_INCREMENT,
  chat_name       VARCHAR(100) NOT NULL,
  chat_overview   VARCHAR(1000),
  file_send_flg   CHAR(1) DEFAULT '1' NOT NULL,
  direct_chat_flg CHAR(1) DEFAULT '0' NOT NULL,
  delete_flg      CHAR(1) DEFAULT '0' NOT NULL,
  create_user_id  INTEGER REFERENCES user(user_id),
  created_at      DATETIME NOT NULL,
  update_user_id  INTEGER REFERENCES user(user_id),
  updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)

-- postテーブル
CREATE TABLE post (
  post_id        INTEGER PRIMARY KEY AUTO_INCREMENT,
  post_content   VARCHAR(1000) NOT NULL,
  file_name      VARCHAR(100),
  chat_id        INTEGER REFERENCES chat(chat_id),
  delete_flg     CHAR(1) DEFAULT '0' NOT NULL,
  create_user_id INTEGER REFERENCES user(user_id),
  created_at     DATETIME NOT NULL,
  update_user_id INTEGER REFERENCES user(user_id),
  updated_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)

-- taskテーブル
CREATE TABLE task (
  task_id        INTEGER PRIMARY KEY AUTO_INCREMENT,
  task_content   VARCHAR(1000) NOT NULL,
  main_user_id   INTEGER REFERENCES user(user_id),
  chat_id        INTEGER REFERENCES chat(chat_id),
  dead_line      DATETIME,
  complete_flg   CHAR(1) DEFAULT '0' NOT NULL,
  delete_flg     CHAR(1) DEFAULT '0' NOT NULL,
  create_user_id INTEGER REFERENCES user(user_id),
  created_at     DATETIME NOT NULL,
  update_user_id INTEGER REFERENCES user(user_id),
  updated_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)

-- chat_participantテーブル
CREATE TABLE chat_participant (
  user_id    INTEGER REFERENCES user(user_id),
  chat_id    INTEGER REFERENCES chat(chat_id),
  created_at DATETIME NOT NULL,
  PRIMARY KEY (user_id, chat_id)
)
