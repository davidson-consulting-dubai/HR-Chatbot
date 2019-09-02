

from flask import Flask, request, jsonify
from flask_restful import Resource, Api
#from sqlalchemy import create_engine

from DBOperations import createNewDepartment, getAllDepartments, getAllEmployees, createNewEmployee, getLeaves, createNewNocReq, getJobOpenings

from json import dumps
import psycopg2

app = Flask(__name__)
app.config["DEBUG"] = True

USER_AGENT = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36'}

## Create a new Department
## Usage: http://127.0.0.1:5002/CreateDepartment/?deptname=deptName
@app.route('/CreateDepartment/', methods=['GET'])
def create_New_Dept():  

    status = "Success"

    try:
        deptName = request.args.get('deptname')
        createNewDepartment(deptName)

    except:
       status = "Error"
       print("An Error has occured.")


    return status

## Get all the data in the table: Department
# http://127.0.0.1:5002/GetAllDepartments/
@app.route('/GetAllDepartments/', methods=['GET'])
def get_All_Dept():   


    try:
        data = getAllDepartments()

    except:
       print("An Error has occured")

    return jsonify(data)


## Create a new Employee
## Usage: http://127.0.0.1:5002/CreateEmployee/?fname=fname&lname=lname&phone=phone&email=email&st_date=st_date&role=1&location=1&dept=1
@app.route('/CreateEmployee/', methods=['GET'])
def create_New_Emp():  

    status = "Success"

    try:
        fname = request.args.get('fname')
        lname = request.args.get('lname')
        phone = request.args.get('phone')
        email = request.args.get('email')
        st_date = request.args.get('st_date')
        role = request.args.get('role')
        location = request.args.get('location')
        dept = request.args.get('dept')

        createNewEmployee(fname, lname, phone, email, st_date, role, location, dept)

    except:
       status = "Error"
       print("An Error has occured.")

    return status

## Get all the data in the table: Employee
# http://127.0.0.1:5002/GetAllEmployees/
@app.route('/GetAllEmployees/', methods=['GET'])
def get_All_Emp():   

    try:
        data = getAllEmployees()

    except:
       print("Error")

    
    return jsonify(data)



## get leaves info
## Usage: http://127.0.0.1:5002/GetLeaves/?epmloyeeid=epmloyeeid
@app.route('/GetLeaves/', methods=['GET'])
def get_Leaves():  

    try:
        epmloyeeID = request.args.get('epmloyeeid')
        data = getLeaves(epmloyeeID)

    except:
       print("An Error has occured.")


    return jsonify(data)


## Create a new NOC request
## Usage: http://127.0.0.1:5002/CreateNocReq/?req-purpose=req-purpose&noc-id=noc-id&emp-id=emp-id
@app.route('/CreateNocReq/', methods=['GET'])
def create_New_NOC_Req():  

    status = "Success"

    try:
        req_purpose = request.args.get('req-purpose')
        noc_ID   = request.args.get('noc-id')
        emp_ID  = request.args.get('emp-id')


        createNewNocReq(req_purpose  , noc_ID  , emp_ID )

    except:
       status = "Error"
       print("An Error has occured.")

    return status


## get openings info
## Usage: http://127.0.0.1:5002/GetJobOpenings
@app.route('/GetJobOpenings/', methods=['GET'])
def get_Job_Openings():  

    try:
        data = getJobOpenings()

    except:
       print("An Error has occured.")


    return jsonify(data)


if __name__ == '__main__':
     app.run(port='5002')

     # Test the application by using the following URL:
     # http://127.0.0.1:5002/GetAllEmployees/



