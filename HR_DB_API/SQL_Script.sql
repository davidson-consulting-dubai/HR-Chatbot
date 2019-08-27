
-- An Organisation has different Roles
CREATE TABLE IF NOT EXISTS Department 
(
   dept_ID Serial NOT NULL,
   dept_name VARCHAR(50) NOT NULL,
   PRIMARY KEY (dept_ID),
   UNIQUE (dept_ID),
   UNIQUE (dept_name)
);


-- An Organisation has different Roles
CREATE TABLE IF NOT EXISTS Role 
(
  role_ID Serial NOT NULL,
  role_name varchar(50) NOT NULL,
  PRIMARY KEY (role_ID),
  UNIQUE (role_ID),
  UNIQUE (role_name)
);


-- An Organisation has different Roles
CREATE TABLE IF NOT EXISTS Location 
(
  location_ID Serial NOT NULL,
  location_name varchar(50) NOT NULL,
  PRIMARY KEY (Location_ID),
  UNIQUE (location_ID),
  UNIQUE (location_name)
);


CREATE TABLE IF NOT EXISTS Employee 
(
   emp_ID Serial NOT NULL,
   emp_fname VARCHAR(50) NOT NULL,
   emp_lname VARCHAR(50) NOT NULL,
   emp_phone VARCHAR(50) NOT NULL UNIQUE,
   emp_email VARCHAR(50) NOT NULL,
   emp_start_date Date NOT NULL,
   role_ID integer NOT NULL,
   location_ID integer NOT NULL,
   dept_ID integer NOT NULL,
   PRIMARY KEY (emp_ID), 
   UNIQUE (emp_ID),
   CONSTRAINT location_ID FOREIGN KEY (location_ID) REFERENCES Location (location_ID) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT role_ID FOREIGN KEY (role_ID) REFERENCES Role (role_ID) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT dept_ID FOREIGN KEY (dept_ID) REFERENCES Department (dept_ID) ON DELETE CASCADE ON UPDATE CASCADE
);




-- Create TABLE SKILL
CREATE TABLE IF NOT EXISTS Skill
(
  skill_ID Serial NOT NULL,
  skill_name varchar(50) NOT NULL,
  emp_ID integer NOT NULL,
  PRIMARY KEY (skill_ID),
  UNIQUE (skill_ID),
  UNIQUE (skill_name), 
  CONSTRAINT emp_ID FOREIGN KEY (emp_ID) REFERENCES Employee (emp_ID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Create TABLE Education
CREATE TABLE IF NOT EXISTS Education
(
  ed_ID Serial NOT NULL,
  degree_title varchar(50) NOT NULL,
  school_name varchar(50) NOT NULL,
  emp_ID integer NOT NULL,
  PRIMARY KEY (ed_ID),
  UNIQUE (ed_ID), 
  CONSTRAINT emp_ID FOREIGN KEY (emp_ID) REFERENCES Employee (emp_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create TABLE SalaryHistory
CREATE TABLE IF NOT EXISTS SalaryHistory
(
  sal_ID Serial NOT NULL,
  Sal_effective_date Date NOT NULL,
  salary integer NOT NULL,
  emp_ID integer NOT NULL,
  PRIMARY KEY (sal_ID),
  UNIQUE (sal_ID), 
  CONSTRAINT emp_ID FOREIGN KEY (emp_ID) REFERENCES Employee (emp_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create TABLE Leaves
CREATE TABLE IF NOT EXISTS Leaves
(
  leaves_ID Serial NOT NULL,
  leaves_entitled integer NOT NULL,
  leaves_taken integer NOT NULL,
  leaves_left integer NOT NULL,
  leaves_expire DATE NOT NULL,
  emp_ID integer NOT NULL,
  PRIMARY KEY (leaves_ID),
  UNIQUE (leaves_ID), 
  CONSTRAINT emp_ID FOREIGN KEY (emp_ID) REFERENCES Employee (emp_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create TABLE LeavesRequest
CREATE TABLE IF NOT EXISTS LeavesRequest
(
  req_ID Serial NOT NULL,
  leaves_requested integer NOT NULL,
  effective_start_date Date NOT NULL,
  leaves_granted integer NOT NULL, 
  emp_ID integer NOT NULL,
  PRIMARY KEY (req_ID),
  UNIQUE (req_ID), 
  CONSTRAINT emp_ID FOREIGN KEY (emp_ID) REFERENCES Employee (emp_ID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Create TABLE NOCType
CREATE TABLE IF NOT EXISTS NOCType
(
  noc_ID integer NOT NULL,
  noc_type integer NOT NULL,
  PRIMARY KEY (noc_ID),
  UNIQUE (noc_ID), 
  UNIQUE (noc_type)
);

-- Create TABLE NOCRequest
CREATE TABLE IF NOT EXISTS NOCRequest
(
  req_ID Serial NOT NULL,
  req_purpose varchar(50) NOT NULL,
  noc_ID integer NOT NULL,
  emp_ID integer NOT NULL,
  PRIMARY KEY (req_ID),
  UNIQUE (req_ID), 
  CONSTRAINT noc_ID FOREIGN KEY (noc_ID) REFERENCES NOCType(noc_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT emp_ID FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Create TABLE JOBS
CREATE TABLE IF NOT EXISTS JOBOpenings
(
  job_ID Serial NOT NULL,
  last_day_apply Date NOT NULL,
  dept_id integer NOT NULL,
  role_ID integer NOT NULL,
  location_ID integer NOT NULL,
  PRIMARY KEY (job_ID),
  UNIQUE (job_ID), 
  CONSTRAINT location_ID FOREIGN KEY (location_ID) REFERENCES Location (location_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT role_ID FOREIGN KEY (role_ID) REFERENCES Role (role_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT dept_ID FOREIGN KEY (dept_ID) REFERENCES Department (dept_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS JOBApplications
(
  app_ID Serial NOT NULL,
  full_name varchar(50) NOT NULL,
  years_of_exp varchar(50) NOT NULL,
  current_salary integer NOT NULL,
  expected_salary integer NOT NULL,
  job_ID integer NOT NULL,
  PRIMARY KEY (app_ID),
  UNIQUE (app_ID), 
  CONSTRAINT job_ID FOREIGN KEY (job_ID) REFERENCES JOBOpenings (job_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- UAELawEntity
CREATE TABLE IF NOT EXISTS UAELawEntity
(
  entity_ID Serial NOT NULL,
  entity_Name varchar(50) NOT NULL,  -- for example Maternity Leaves, National Holidays, Gratuity Leaves
  PRIMARY KEY (entity_ID),
  UNIQUE (entity_ID), 
  UNIQUE (entity_Name)
);

-- UAELawEntityDetails
CREATE TABLE IF NOT EXISTS UAELawEntityDetails
(
  entityDetail_ID Serial NOT NULL,
  law_date Date NOT NULL,
  law_details varchar(200) NOT NULL,
  is_active integer NOT NULL,
  entity_ID integer not NULL,
  PRIMARY KEY (entityDetail_ID),
  UNIQUE (entityDetail_ID), 
  CONSTRAINT entity_ID FOREIGN KEY (entity_ID) REFERENCES UAELawEntity (entity_ID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- FAQEntity
CREATE TABLE IF NOT EXISTS FAQEntity
(
  entity_ID Serial NOT NULL,
  entity_Name varchar(100) NOT NULL,  -- for example Company's Number of Employees
  PRIMARY KEY (entity_ID),
  UNIQUE (entity_ID), 
  UNIQUE (entity_Name)
);

-- FAQEntityDetails
CREATE TABLE IF NOT EXISTS FAQEntityDetails
(
  entityDetail_ID Serial NOT NULL,
  entity_detail Date NOT NULL,
  entity_ID integer not NULL,
  PRIMARY KEY (entityDetail_ID),
  UNIQUE (entityDetail_ID), 
  CONSTRAINT entity_ID FOREIGN KEY (entity_ID) REFERENCES FAQEntity (entity_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- VisaTypes
CREATE TABLE IF NOT EXISTS VisaTypes
(
  visa_ID Serial NOT NULL,
  visa_type varchar(100) NOT NULL,  -- for example Employee, Spouse, business etc
  PRIMARY KEY (visa_ID),
  UNIQUE (visa_ID), 
  UNIQUE (visa_type)
);

-- VisaApplications
CREATE TABLE IF NOT EXISTS VisaApplications
(
  visaAPP_ID Serial NOT NULL,
  applied_on Date NOT NULL,
  status varchar(100) NOT NULL,
  visa_ID integer NOT NULL,
  emp_ID integer NOT NULL,
  PRIMARY KEY (visaAPP_ID),
  UNIQUE (visaAPP_ID), 
  CONSTRAINT visa_ID FOREIGN KEY (visa_ID) REFERENCES VisaTypes (visa_ID) ON DELETE CASCADE ON UPDATE CASCADE, 
  CONSTRAINT emp_ID FOREIGN KEY (emp_ID) REFERENCES Employee (emp_ID) ON DELETE CASCADE ON UPDATE CASCADE
);


insert into Department(dept_name) values ('Data Science');
insert into Department(dept_name) values ('HR');

insert into Role(role_name) values ('Data Scientist');
insert into Role(role_name) values ('Senior Data Scientist');
insert into Role(role_name) values ('Project Manager');
insert into Role(role_name) values ('Business Developement Manager');

insert into Location(location_name) values ('Dubai');

insert into employee(emp_fname, emp_lname, emp_phone, emp_email, emp_start_date, role_ID, location_ID, dept_ID)
values('Hassaan', 'Raffique', '0558352060', 'muhammad-hassaan.rafique@davidson.ae', '01-08-2017', 1, 1, 1);

insert into employee(emp_fname, emp_lname, emp_phone, emp_email, emp_start_date, role_ID, location_ID, dept_ID)
values('Aizaz', 'Anwar', '0558352061', 'aizaz.anwar@davidson.ae', '01-08-2018', 1, 1, 1);

insert into employee(emp_fname, emp_lname, emp_phone, emp_email, emp_start_date, role_ID, location_ID, dept_ID)
values('Mohammed', 'Osman', '0558352062', 'mohammed.osman@davidson.ae', '01-08-2018', 1, 1, 1);

insert into employee(emp_fname, emp_lname, emp_phone, emp_email, emp_start_date, role_ID, location_ID, dept_ID)
values('Muhammad', 'Adnan', '0558352063', 'muhammad.adnan@davidson.ae', '01-09-2017', 2, 1, 1);

insert into employee(emp_fname, emp_lname, emp_phone, emp_email, emp_start_date, role_ID, location_ID, dept_ID)
values('Vida', 'ElZufari', '0558352064', 'vida.el-zufari@davidson.ae', '01-09-2017', 3, 1, 1);
