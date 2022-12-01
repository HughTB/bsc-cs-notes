from graphics import *;

def displayDate(day, month, year):
    months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    print(f"{day} {months[month - 1]} {year}")

