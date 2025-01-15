CREATE TABLE respondents (
  submission_id            VARCHAR(10) NOT NULL,
  age                      VARCHAR(20),
  cups                     VARCHAR(50),
  gender                   VARCHAR(50),
  gender_specify           VARCHAR(100),
  wfh                      VARCHAR(50),
  total_spend              VARCHAR(50),
  taste                    VARCHAR(50),
  know_source              VARCHAR(50),
  most_paid                VARCHAR(50),
  most_willing             VARCHAR(50),
  value_cafe               VARCHAR(50),
  spent_equipment          VARCHAR(50),
  value_equipment          VARCHAR(50),
  education_level          VARCHAR(50),
  ethnicity_race           VARCHAR(100),
  ethnicity_race_specify   VARCHAR(100),
  employment_status        VARCHAR(50),
  number_children          VARCHAR(20),
  political_affiliation    VARCHAR(50),
  expertise                VARCHAR(50),
  style                    VARCHAR(50),
  strength                 VARCHAR(50),
  roast_level              VARCHAR(50),
  caffeine                 VARCHAR(50),
  favorite                 VARCHAR(50),
  favorite_specify         VARCHAR(100),
  PRIMARY KEY (submission_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE respondent_where_drink (
  submission_id VARCHAR(10) NOT NULL,
  where_drink   VARCHAR(255) NOT NULL,
  PRIMARY KEY (submission_id, where_drink),
  FOREIGN KEY (submission_id)
    REFERENCES respondents(submission_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE respondent_brew (
  submission_id VARCHAR(10) NOT NULL,
  brew          VARCHAR(255) NOT NULL,
  brew_other 	TEXT,
  PRIMARY KEY (submission_id, brew),
  FOREIGN KEY (submission_id) 
    REFERENCES respondents(submission_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE respondent_brew_other (
  submission_id VARCHAR(10) NOT NULL,
  brew_other    VARCHAR(255)     NOT NULL,
  PRIMARY KEY (submission_id, brew_other),
  FOREIGN KEY (submission_id) 
    REFERENCES respondents(submission_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE coffee_tasting (
  submission_id            VARCHAR(10) NOT NULL,
  coffee_label             CHAR(1)     NOT NULL, 
  bitterness               INT,
  acidity                  INT,
  personal_preference      INT,
  notes                    TEXT,
  PRIMARY KEY (submission_id, coffee_label),
  FOREIGN KEY (submission_id)
    REFERENCES respondents(submission_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE coffee_preference (
  submission_id   VARCHAR(10) NOT NULL,
  prefer_abc      VARCHAR(10),
  prefer_ad       VARCHAR(10),
  prefer_overall  VARCHAR(10),
  PRIMARY KEY (submission_id),
  FOREIGN KEY (submission_id)
    REFERENCES respondents(submission_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE respondent_purchase (
  submission_id 	VARCHAR(10) NOT NULL,
  purchase      	VARCHAR(255) NOT NULL,
  PRIMARY KEY (submission_id, purchase),
  FOREIGN KEY (submission_id)
    REFERENCES respondents(submission_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE respondent_purchase_other (
  submission_id 	VARCHAR(10) NOT NULL,
  purchase_other      	VARCHAR(255) NOT NULL,
  PRIMARY KEY (submission_id, purchase_other),
  FOREIGN KEY (submission_id)
    REFERENCES respondents(submission_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE respondent_additions (
  submission_id 	VARCHAR(10) NOT NULL,
  additions      	VARCHAR(255) NOT NULL,
  PRIMARY KEY (submission_id, additions),
  FOREIGN KEY (submission_id)
    REFERENCES respondents(submission_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE respondent_additions_other (
  submission_id 	VARCHAR(10) NOT NULL,
  additions_other      	VARCHAR(255) NOT NULL,
  PRIMARY KEY (submission_id, additions_other),
  FOREIGN KEY (submission_id)
    REFERENCES respondents(submission_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE respondent_why_drink (
  submission_id VARCHAR(10) NOT NULL,
  why_drink VARCHAR(255) NOT NULL,
  PRIMARY KEY (submission_id, why_drink),
  FOREIGN KEY (submission_id)
    REFERENCES respondents(submission_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE respondent_why_drink_other (
  submission_id VARCHAR(10) NOT NULL,
  why_drink_other VARCHAR(255) NOT NULL,
  PRIMARY KEY (submission_id, why_drink_other),
  FOREIGN KEY (submission_id)
    REFERENCES respondents(submission_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE respondent_sweetener (
  submission_id VARCHAR(10) NOT NULL,
  sweetener     VARCHAR(150) NOT NULL,
  PRIMARY KEY (submission_id, sweetener),
  FOREIGN KEY (submission_id)
    REFERENCES respondents(submission_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE respondent_dairy (
  submission_id VARCHAR(10) NOT NULL,
  dairy         VARCHAR(200) NOT NULL,
  PRIMARY KEY (submission_id, dairy),
  FOREIGN KEY (submission_id)
    REFERENCES respondents(submission_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE denormalized (
  submission_id VARCHAR(10),
  age VARCHAR(20),
  cups VARCHAR(50),
  where_drink VARCHAR(255),
  brew VARCHAR(255),
  brew_other TEXT,
  purchase VARCHAR(255),
  purchase_other VARCHAR(255),
  favorite VARCHAR(50),
  favorite_specify VARCHAR(100),
  additions VARCHAR(255),
  additions_other VARCHAR(255),
  dairy VARCHAR(200),
  sweetener VARCHAR(150),
  style VARCHAR(50),
  strength VARCHAR(50),
  roast_level VARCHAR(50),
  caffeine VARCHAR(50),
  expertise VARCHAR(50),
  coffee_a_bitterness INT,
  coffee_a_acidity INT,
  coffee_a_personal_preference INT,
  coffee_a_notes TEXT,
  coffee_b_bitterness INT,
  coffee_b_acidity INT,
  coffee_b_personal_preference INT,
  coffee_b_notes text,
  coffee_c_bitterness INT,
  coffee_c_acidity INT,
  coffee_c_personal_preference INT,
  coffee_c_notes TEXT,
  coffee_d_bitterness INT,
  coffee_d_acidity INT,
  coffee_d_personal_preference INT,
  coffee_d_notes TEXT,
  prefer_abc VARCHAR(10),
  prefer_ad VARCHAR(10),
  prefer_overall VARCHAR(10),
  wfh VARCHAR(50),
  total_spend VARCHAR(50),
  why_drink VARCHAR(255),
  why_drink_other VARCHAR(255),
  taste VARCHAR(50),
  know_source VARCHAR(50),
  most_paid VARCHAR(50),
  most_willing VARCHAR(50),
  value_cafe VARCHAR(50),
  spent_equipment VARCHAR(50),
  value_equipment VARCHAR(50),
  gender VARCHAR(50),
  gender_specify VARCHAR(100),
  education_level VARCHAR(50),
  ethnicity_race VARCHAR(100),
  ethnicity_race_specify VARCHAR(100),
  employment_status VARCHAR(50),
  number_children VARCHAR(20),
  political_affiliation VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\coffee_survey.csv'
INTO TABLE denormalized
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

INSERT INTO respondents (
  submission_id,
  age,
  cups,
  gender,
  gender_specify,
  wfh,
  total_spend,
  taste,
  know_source,
  most_paid,
  most_willing,
  value_cafe,
  spent_equipment,
  value_equipment,
  education_level,
  ethnicity_race,
  ethnicity_race_specify,
  employment_status,
  number_children,
  political_affiliation,
  expertise,
  style,
  strength,
  roast_level,
  caffeine,
  favorite,
  favorite_specify
)
SELECT
  submission_id,
  age,
  cups,
  gender,
  gender_specify,
  wfh,
  total_spend,
  taste,
  know_source,
  most_paid,
  most_willing,
  value_cafe,
  spent_equipment,
  value_equipment,
  education_level,
  ethnicity_race,
  ethnicity_race_specify,
  employment_status,
  number_children,
  political_affiliation,
  expertise,
  style,respondent_additions
  strength,
  roast_level,
  caffeine,
  favorite,
  favorite_specify
FROM denormalized
WHERE submission_id IS NOT NULL;  -- or any condition to exclude incomplete rows

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\additions.csv'
INTO TABLE respondent_additions
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\additions_other.csv'
INTO TABLE respondent_additions_other
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\brew.csv'
INTO TABLE respondent_brew
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(submission_id, brew)
SET 
    submission_id = NULLIF(submission_id, ''),
    brew = NULLIF(brew, '');
    
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\brew_other.csv'
INTO TABLE respondent_brew_other
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dairy.csv'
INTO TABLE respondent_dairy
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\purchase.csv'
INTO TABLE respondent_purchase
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\purchase_other.csv'
INTO TABLE respondent_purchase_other
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sweetener.csv'
INTO TABLE respondent_sweetener
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\where_drink.csv'
INTO TABLE respondent_where_drink
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\why_drink.csv'
INTO TABLE respondent_why_drink
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\why_drink_other.csv'
INTO TABLE respondent_why_drink_other
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

INSERT INTO coffee_preference (
  submission_id,
  prefer_abc,
  prefer_ad,
  prefer_overall
)
SELECT
  submission_id,
  prefer_abc,
  prefer_ad,
  prefer_overall
FROM denormalized
WHERE submission_id IS NOT NULL;

-- Coffee A rows
INSERT INTO coffee_tasting
  (submission_id, coffee_label, bitterness, acidity, personal_preference, notes)
SELECT
  submission_id,
  'A' AS coffee_label,
  coffee_a_bitterness,
  coffee_a_acidity,
  coffee_a_personal_preference,
  coffee_a_notes
FROM denormalized
WHERE submission_id IS NOT NULL;

-- Coffee B rows
INSERT INTO coffee_tasting
  (submission_id, coffee_label, bitterness, acidity, personal_preference, notes)
SELECT
  submission_id,
  'B',
  coffee_b_bitterness,
  coffee_b_acidity,
  coffee_b_personal_preference,
  coffee_b_notes
FROM denormalized
WHERE submission_id IS NOT NULL;

-- Coffee C
INSERT INTO coffee_tasting
  (submission_id, coffee_label, bitterness, acidity, personal_preference, notes)
SELECT
  submission_id,
  'C',
  coffee_c_bitterness,
  coffee_c_acidity,
  coffee_c_personal_preference,
  coffee_c_notes
FROM denormalized
WHERE submission_id IS NOT NULL;

-- Coffee D
INSERT INTO coffee_tasting
  (submission_id, coffee_label, bitterness, acidity, personal_preference, notes)
SELECT
  submission_id,
  'D',
  coffee_d_bitterness,
  coffee_d_acidity,
  coffee_d_personal_preference,
  coffee_d_notes
FROM denormalized
WHERE submission_id IS NOT NULL;

