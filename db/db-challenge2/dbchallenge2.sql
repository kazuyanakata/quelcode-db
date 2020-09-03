-- userテーブル
CREATE TABLE user (
  id                   INTEGER PRIMARY KEY AUTO_INCREMENT,
  name                 VARCHAR(100) NOT NULL,
  mail                 VARCHAR(100) NOT NULL,
  password             VARCHAR(100) NOT NULL,
  introduction         VARCHAR(1000),
  businessphone_number VARCHAR(13),
  cellphone_number     VARCHAR(13),
  is_deleted           TINYINT(1) DEFAULT 0 NOT NULL,
  created_at           DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at           TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
) ENGINE = INNODB;

-- chatテーブル
CREATE TABLE chat (
  id                         INTEGER PRIMARY KEY AUTO_INCREMENT,
  name                       VARCHAR(100) NOT NULL,
  overview                   VARCHAR(1000),
  is_file_sendable           TINYINT(1) DEFAULT 1 NOT NULL,
  is_direct_chat             TINYINT(1) DEFAULT 0 NOT NULL,
  is_deleted                 TINYINT(1) DEFAULT 0 NOT NULL,
  create_user_id             INTEGER NOT NULL REFERENCES user(id),
  created_at                 DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  update_user_id             INTEGER NOT NULL REFERENCES user(id),
  updatad_at                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
) ENGINE = INNODB;

-- postテーブル
CREATE TABLE post (
  id             INTEGER PRIMARY KEY AUTO_INCREMENT,
  content        VARCHAR(1000) NOT NULL,
  file_name      VARCHAR(100),
  chat_id        INTEGER NOT NULL REFERENCES chat(id),
  is_deleted     TINYINT(1) DEFAULT 0 NOT NULL,
  create_user_id INTEGER NOT NULL REFERENCES user(id),
  created_at     DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  update_user_id INTEGER NOT NULL REFERENCES user(id),
  updated_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
) ENGINE = INNODB;

-- taskテーブル
CREATE TABLE task (
  id                 INTEGER PRIMARY KEY AUTO_INCREMENT,
  content            VARCHAR(1000) NOT NULL,
  assigned_user_id   INTEGER NOT NULL REFERENCES user(id),
  chat_id            INTEGER NOT NULL REFERENCES chat(id),
  dead_line          DATETIME,
  is_completed       TINYINT(1) DEFAULT 0 NOT NULL,
  is_deleted         TINYINT(1) DEFAULT 0 NOT NULL,
  create_user_id     INTEGER NOT NULL REFERENCES user(id),
  created_at         DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  update_user_id     INTEGER NOT NULL REFERENCES user(id),
  updated_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
) ENGINE = INNODB;

-- chat_participantテーブル
CREATE TABLE chat_participant (
  user_id    INTEGER NOT NULL REFERENCES user(id),
  chat_id    INTEGER NOT NULL REFERENCES chat(id),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY (user_id, chat_id)
) ENGINE = INNODB;
