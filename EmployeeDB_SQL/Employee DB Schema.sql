
CREATE TABLE "Employees" (
    "emp_no" INT  PRIMARY KEY,
    "emp_title_id" VARCHAR(10)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(70)   NOT NULL,
    "last_name" VARCHAR(70)   NOT NULL,
    "sex" VARCHAR(8)   NOT NULL,
    "hire_date" DATE  NOT NULL   
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(10) PRIMARY KEY,
    "dept_name" VARCHAR(40)   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
	PRIMARY KEY (emp_no, salary)
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(10) PRIMARY KEY,
    "title" VARCHAR(40)  NOT NULL

);

CREATE TABLE "DepartmentManagers" (
    
    "dept_no" VARCHAR(10)   NOT NULL,
	"emp_no" INT   NOT NULL,
	PRIMARY KEY (dept_no, emp_no)
    
);

CREATE TABLE "DepartmentEmployees" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    PRIMARY KEY (emp_no, dept_no)
);


ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "DepartmentManagers" ADD CONSTRAINT "fk_DepartmentManagers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "DepartmentManagers" ADD CONSTRAINT "fk_DepartmentManagers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "DepartmentEmployees" ADD CONSTRAINT "fk_DepartmentEmployees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "DepartmentEmployees" ADD CONSTRAINT "fk_DepartmentEmployees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

