CREATE TABLE IF NOT EXISTS users (
  username VARCHAR(50) NOT NULL,
  email VARCHAR(50),
  password VARCHAR(500),
  activated BOOLEAN DEFAULT FALSE,
  activationkey VARCHAR(50) DEFAULT NULL,
  resetpasswordkey VARCHAR(50) DEFAULT NULL,
  CONSTRAINT pk_user PRIMARY KEY (username),
  CONSTRAINT uc_username UNIQUE (username),
  CONSTRAINT uc_email UNIQUE (email)
  
);

CREATE TABLE IF NOT EXISTS authority (
  name VARCHAR(50) NOT NULL,
  CONSTRAINT pk_authority PRIMARY KEY (name)
);

CREATE TABLE IF NOT EXISTS user_authority (
    username VARCHAR(50) NOT NULL,
    authority VARCHAR(50) NOT NULL,
    CONSTRAINT pk_user_authority PRIMARY KEY (username, authority),
    
    CONSTRAINT fk_username FOREIGN KEY (username)
    REFERENCES users (username) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
   
    CONSTRAINT fk_authority FOREIGN KEY (authority)
    REFERENCES authority (name) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,      
    
    CONSTRAINT uc_user_authority UNIQUE (username, authority)
  
);

CREATE TABLE IF NOT EXISTS oauth_access_token (
  token_id VARCHAR(256) DEFAULT NULL,
  token bytea,
  authentication_id VARCHAR(256) DEFAULT NULL,
  user_name VARCHAR(256) DEFAULT NULL,
  client_id VARCHAR(256) DEFAULT NULL,
  authentication bytea,
  refresh_token VARCHAR(256) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS oauth_refresh_token (
  token_id VARCHAR(256) DEFAULT NULL,
  token bytea,
  authentication bytea
);

CREATE TABLE IF NOT EXISTS  oauth_client_details (
  client_id VARCHAR(255),
  resource_ids VARCHAR(255),
  client_secret VARCHAR(255),
  scope VARCHAR(255),
  authorized_grant_types VARCHAR(255),
  web_server_redirect_uri VARCHAR(255),
  authorities VARCHAR(255),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(4096),
  autoapprove VARCHAR(255),
    CONSTRAINT pk_oauth_client_details PRIMARY KEY (client_id)
);