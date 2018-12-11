DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT,
  location VARCHAR(255)
);

CREATE TABLE pets(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  nickname VARCHAR(255),
  age INT,
  admission_date VARCHAR(255),
  adoptability BOOLEAN,
  species VARCHAR(255),
  breed VARCHAR(255),
  owner_id INT REFERENCES owners(id) ON DELETE CASCADE
);
