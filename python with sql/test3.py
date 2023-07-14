'''inserting the values in created table P_S_practice.ineuron'''

import mysql.connector as conn

mydb = conn.connect(host='localhost', user='root', passwd='Swapnil@0401')

cursor = mydb.cursor()

s = "insert into P_S_practice.ineuron values(101, 'sudhanshu', 'sudhanshu@gmail.com', 50)"
cursor.execute(s)

m = "insert into P_S_practice.ineuron values(100, 'kumar', 'kumar@gmail.com', 55)"
cursor.execute(m)

mydb.commit()

cursor.execute("select * from P_S_practice.ineuron;")

# to check the information in python interpreter as output
for i in cursor.fetchall():
    print(i)

