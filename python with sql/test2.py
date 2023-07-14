'''database create and table create  '''

import mysql.connector as conn

mydb = conn.connect(host='localhost', user='root', passwd='Swapnil@0401')

cursor = mydb.cursor()

'''execute the code one by one'''

q1= cursor.execute("create database P_S_practice")

# create table DatabaseName.TableName()
q2= cursor.execute("create table P_S_practice.ineuron(employee_id int, emp_name varchar(50), emp_mail varchar(80), emp_slary int(3))")

q3= cursor.execute("select * from P_S_practice.ineuron;")

print(q3)




