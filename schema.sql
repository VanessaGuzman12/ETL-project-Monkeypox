
CREATE TABLE individual (
  id INT PRIMARY KEY,
  Status TEXT,
  Location INT,
  City TEXT, 
  Country TEXT,
  Age TEXT,
  Gender TEXT,
  Date_onset DATE,
  Date_confirmation DATE, 
  Symptoms TEXT,
  isHospitalized TEXT, 
  Date_hospitalisation DATE,
  isIsolated TEXT,
  Date_isolation DATE, 
  Outcome TEXT, 
  Contact_comment TEXT,
  Contact_ID TEXT,
  Contact_location TEXT,
  hasTravelHistory	TEXT,
  Travel_history_entry DATE,
  Country_ISO3 TEXT
);

CREATE TABLE daily (
  id INT PRIMARY KEY,
  Country TEXT,
  Date_confirmation DATE,
  Confirmed_Cases INT
);


CREATE TABLE worldwide (
  id INT PRIMARY KEY,
  Country TEXT,
  Confirmed_Cases INT, 
  Suspected_Cases INT, 
  Hospitalized INT, 
  Travel_History_Yes INT,
  Travel_History_No INT
);


CREATE TABLE casedetection (
  id INT PRIMARY KEY,
  Date_confirmation DATE,
  Country TEXT,
  City TEXT, 
  Age TEXT, 
  Gender TEXT, 
  Symptoms TEXT,
  isHospitalized TEXT,
  isIsolated TEXT,
  hasTravelHistory TEXT
);