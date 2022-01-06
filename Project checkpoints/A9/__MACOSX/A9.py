import sys, os, cx_Oracle, A9data
from getpass import getpass

#clear = lambda: os.system('clear')
def clear():
    if sys.platform == 'win32':
        return os.system('cls')
    else:
        return os.system('clear')

def currentDirFile(filename):
    return (os.path.join(os.path.dirname(os.path.abspath(__file__)), filename))

def dropTables(cursor):
    for table in A9data.tablesDrop:
        statement = "drop table " + table + " cascade constraints"
        try:
            cursor.execute(statement)
        except cx_Oracle.DatabaseError:
            print("No tables to be dropped")
            break
        else:
            print("Dropped 1 table")

def createTables(cursor):
    sql = open(currentDirFile("create.sql"), "r")
    commands = sql.read().split(";")
    for command in commands[:len(commands)-1]:
        try:
            cursor.execute(command)
        except cx_Oracle.DatabaseError:
            print("Tables already exist")
            break
        else:
            print("Created 1 table")

def populateTables(cursor):
    for table in A9data.tablesDict.keys():
        bind = [ ':' + str(i+1) for i in range(len(A9data.tablesDict[table][0])) ]
        bind = "(" + ", ".join(bind) + ")"
        statement = "insert into " + table + " values " + bind
        try:
            cursor.executemany(statement, A9data.tablesDict[table])
        except cx_Oracle.IntegrityError:
            print(table, "table already populated with current data")
            continue
        else:
            print(cursor.rowcount, "rows inserted into", table, "table")

def queries(cursor):
    """
    #Query all tables
    for table in A9data.tablesDict.keys():
        print(table)
        print("--------")
        for row in cursor.execute("select * from " + table):
            print(row)
    """

    sql = open(currentDirFile("queries.sql"), "r")
    commands = sql.read().split(";")

    for command in commands[:len(commands)-1]:
        try:
            cursor.execute(command)
        except cx_Oracle.DatabaseError:
            print("Cannot query: one or more tables do not exist")
            continue
        else:
            print('==================================================================')
            print(command.split("*/")[0].strip().strip("/* "))
            print('==================================================================')
            header = []
            for column in cursor.description:
                header.append(column[0])
            print(header)
            print('-------------------------------')
            for row in cursor.fetchall():
                if len(row) == 1:
                    print(row[0])
                else:
                    print(row)
            print()

def menu():
    print("=================================================================")
    print("| Oracle All Inclusive Tool |")
    print("| Main Menu - Select Desired Operation(s): |")
    print("-----------------------------------------------------------------")
    print("1) Drop Tables")
    print("2) Create Tables")
    print("3) Populate Tables")
    print("4) Query Tables\n")
    print("E) End/Exit")

print("Log into DB")
username = input("Username: ")
pw = getpass()
print("Connecting...")

if sys.platform == 'win32':
    # Change to where your Instant Client is
    cx_Oracle.init_oracle_client(lib_dir=os.environ.get("HOMEPATH") + "\\Desktop\\instantclient_21_3")
else:
    # Tested on Mac
    cx_Oracle.init_oracle_client(lib_dir=os.environ.get("HOME") + "/Downloads/instantclient_19_8")

dsn = cx_Oracle.makedsn("oracle.scs.ryerson.ca", 1521, "orcl")
connection = cx_Oracle.connect(
    user=username,
    password=pw,
    dsn=dsn
)

print("Connected")
clear()

cursor = connection.cursor()
done = True
while done:
    menu()
    choice = input("Choose: ")
    if choice == "1":
        dropTables(cursor)
        clear()
    elif choice == "2":
        createTables(cursor)
        clear()
    elif choice == "3":
        populateTables(cursor)
        clear()
    elif choice == "4":
        queries(cursor)
    elif choice == "E" or choice == "e":
        done = False
    else:
        print("Invalid choice")

connection.commit()
clear()