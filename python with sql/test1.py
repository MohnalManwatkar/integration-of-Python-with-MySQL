import mysql.connector as conn

# mydb is a connection variable
# very first line to establish a communication
mydb = conn.connect(host= 'localhost', user='root', passwd= "Swapnil@0401")
print(mydb)

# printing query using python
# creating pointer variable cursor

# second line to create cursor. Cursor is a pointer variable which is used to point
cursor = mydb.cursor()

#  third line to write a query and execute it
cursor.execute("write your queries here ")

# fourth line to show the executed query
print(cursor.fetchall())