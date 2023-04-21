from tkinter import *
import tkinter as tk
import mysql.connector
import os
import webbrowser
htmlstring = "start about.html"

db = mysql.connector.connect(
    host="46.17.172.154",
    user="u581004658_Group12",
    password="CP363Group12",
    database="u581004658_Group12"
)

cursor = db.cursor()
# cursor.execute("SELECT * FROM Car_Category;")
# for i in cursor.fetchall():
#     print(i)

window = Tk()
window.title("GTA Car Rentals")
window.geometry("500x500")

v = IntVar()
v1 = Radiobutton(window, text="Create Tables", variable=v, value=1)
v1.pack(anchor=N)
v2 = Radiobutton(window, text="Drop Tables", variable=v, value=2)
v2.pack(anchor=N)

v3 = Radiobutton(window, text="Populate Tables", variable=v, value=3)
v3.pack(anchor=N)

v4 = Radiobutton(window, text="Query Tables", variable=v, value=4)
v4.pack(anchor=N)

v5 = Radiobutton(window, text="About Section", variable=v, value=5)
v5.pack(anchor=N)

exit_button = Button(window, text="Done", height=5, width=40, command=window.destroy)
exit_button.pack(pady=20)

window.mainloop()

if v.get() == 1:
    window = Tk()
    window.geometry("500x500")
    window.title("Create Tables")

    e = Entry(window)
    e.pack()

    def query():
        cursor.execute(e.get())
        label = Label(window, text="Query '" + e.get() + "' executed successfully")
        label.pack()

    submit = Button(window, text="Submit Query", command=query)
    submit.pack()

    window.mainloop()

elif v.get() == 2:
    window = Tk()
    window.geometry("500x500")
    window.title("Drop Tables")

    e = Entry(window)
    e.pack()

    def query():
        cursor.execute(e.get())
        label = Label(window, text="Query '" + e.get() + "' executed successfully")
        label.pack()

    submit = Button(window, text="Submit Query", command=query)
    submit.pack()

    window.mainloop()

elif(v.get()==3):
    window = Tk()
    window.geometry("500x500")
    window.title("Populate Tables")
    e=Entry(window)
    e.pack()
    def query():
        sql_statements = e.get().split(';') # split SQL statements by semicolon
        for sql in sql_statements:
            cursor.execute(sql.strip()) # execute each statement individually
        db.commit() # commit the changes
        label = Label(window,text="Query executed successfully")
        label.pack()
    submit = Button(window,text="Submit Query",command=query)
    submit.pack()
    window.mainloop()

elif v.get() == 4:
    query1 = """SELECT b.BillNum AS BillNum, b.TotalAmount AS TotalAmount, c.FirstName AS FirstName, rc.InvoiceNum AS InvoiceNum, rc.Bill_Num AS Bill_Num FROM Repair_Customer c 
    JOIN Repair_Billing rc ON c.InvoiceNum = rc.InvoiceNum JOIN Billing b ON rc.Bill_Num = b.BillNum ORDER BY rc.InvoiceNum;"""
    query2 = """SELECT Car_Category.Car_name, AVG(Car_Category.Cost_per_Day) AS Average_Cost_Per_Day FROM Car 
    INNER JOIN Car_Category ON Car.Car_name = Car_Category.Car_name GROUP BY Car_Category.Car_name;"""
    query3 = """SELECT Employees.FName, Employees.LName, Employees.EmployeeId, DATE_FORMAT(Employees.DateOfBirth, '%Y-%m-%d') AS DateOfBirth, 
    EmployeeContact.PhoneNumber FROM Employees INNER JOIN EmployeeContact ON Employees.EmployeeId = EmployeeContact.EmployeeId;"""
    query4 = "SELECT bc.Booking_Num, c.make, c.model_name, c.Car_name FROM Booking_Customer bc JOIN Booking b ON b.Booking_Num = bc.Booking_Num JOIN Car c ON c.VIN = b.CarVin;"
    window = Tk()
    window.geometry("500x500")
    window.title("Query Tables")
    def query():
        if display.get() == 1:
            cursor.execute(query1)
            result = cursor.fetchall()
            for r in result:
                print(r)
            window.destroy
        elif display.get() == 2:
            cursor.execute(query2)
            result = cursor.fetchall()
            for r in result:
                print(r)
            window.destroy
        elif display.get() == 3:
            cursor.execute(query3)
            result = cursor.fetchall()
            for r in result:
                print(r)
            window.destroy
        elif display.get() == 4:
            cursor.execute(query4)
            result = cursor.fetchall()
            for r in result:
                print(r)
            window.destroy
        else:
            print("No query was selected")
            window.destroy
    display = IntVar()
    d1 = Radiobutton(window, text="Query 1", variable=display, value=1)
    d1.pack(anchor=N)
    d2 = Radiobutton(window, text="Query 2", variable=display, value=2)
    d2.pack(anchor=N)
    d3 = Radiobutton(window,text="Query 3",variable=display,value = 3)
    d3.pack(anchor=N)
    d4 = Radiobutton(window,text="Query 4",variable=display,value=4)
    d4.pack(anchor=N)
    submission=Button(window,text="Execute Query",command=query)
    submission.pack()
    window.mainloop()
elif (v.get()==5):
    file_path = "/Users/anmol/desktop/a9 363/about.html"
    webbrowser.open('file://' + os.path.realpath(file_path))