import pymysql

host="localhost"
id="root"
py="system"
pw="password"
db_name="company"

conn=pymysql.connect(host=host, user=id, password=pw, db=db_name, charset='utf8')
curs=conn.cursor()

#sql="insert into project values ('NewProj 1', 41, 'Seoul', 4),('NewProj 3', 43, 'Chuncheon',1)"
#curs.execute(sql)

data=(
    ('NewProj 4', 54, 'Seoul', 5),
    ('NewProj 5', 55, 'Seoul', 4),
    ('NewProj 6', 56, 'pusan', 1)
)

sql="insert into project values (%s, %s, %s, %s)"
curs.executemany(sql,data)
conn.commit()

curs.execute("select * from project")
rows=curs.fetchall()

for r in rows:
    print(r)

curs.close()


