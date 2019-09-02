
from config import config
from json import dumps
import psycopg2

## Insert a new Department
def createNewDepartment(deptName):

    params = config()
    connection = psycopg2.connect(**params)
    
    sql = "insert into Department (dept_name) values ('" + deptName + "')"

    cursor = connection.cursor()
    cursor.execute(sql)

    connection.commit()

## Get all the data from the table: Department
def getAllDepartments():
    params = config()
    sql = "Select * from Department"

    connection = psycopg2.connect(**params)

    data = []
    cursor = connection.cursor()
    cursor.execute(sql)

    results = cursor.fetchall()

    for result in results:
        data.append(result)

    return data

## Insert a new Employee
def createNewEmployee(emp_fname, emp_lname, emp_phone, emp_email, emp_start_date, role_ID, location_ID, dept_ID):

    params = config()
    connection = psycopg2.connect(**params)
    
    sql = "insert into Employee (emp_fname, emp_lname, emp_phone, emp_email, emp_start_date, role_ID, location_ID, dept_ID) values ('" + emp_fname + "','" + emp_lname + "','" + emp_phone + "','" + emp_email + "','" + emp_start_date + "'," + role_ID + "," + location_ID + "," + dept_ID + ")" 

    cursor = connection.cursor()
    cursor.execute(sql)

    connection.commit()

## Get all the data from the table: Employee
def getAllEmployees():

    params = config()
    sql = "Select * from leaves where emp_id = "

    connection = psycopg2.connect(**params)

    data = []
    cursor = connection.cursor()
    cursor.execute(sql)

    results = cursor.fetchall()

    for result in results:
        data.append(result)

    return data


## Get leaves info from the leaves table 
def getLeaves(epmloyeeID):

    params = config()
    sql = "Select * from leaves where emp_id =  ('" + epmloyeeID + "')"

    connection = psycopg2.connect(**params)

    data = []
    cursor = connection.cursor()
    cursor.execute(sql)

    results = cursor.fetchall()

    for result in results:
        data.append(result)

    return data


## Insert a new NOC request
def createNewNocReq(req_purpose  , noc_ID  , emp_ID ):

    params = config() 
    connection = psycopg2.connect(**params)
    
    sql = "insert into nocrequest (req_purpose  , noc_ID  , emp_ID )values('"+  req_purpose + "'," + noc_ID + "," + emp_ID + ")"


    cursor = connection.cursor()
    cursor.execute(sql)

    connection.commit()

    ## Get info from the jobopenings table 
def getJobOpenings():

    params = config()
    sql = "Select * from jobopenings"

    connection = psycopg2.connect(**params)

    data = []
    cursor = connection.cursor()
    cursor.execute(sql)

    results = cursor.fetchall()

    for result in results:
        data.append(result)

    return data