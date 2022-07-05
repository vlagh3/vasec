#!/usr/bin/env python

import pymysql
from craft_api import settings

# test connection to mysql database

connection = pymysql.connect(host='db',
                             user='craft',
                             password='qLGockJ6G2J75O',
                             db='craft',
                             cursorclass=pymysql.cursors.DictCursor)

try: 
    with connection.cursor() as cursor:
        sql = "select * from users"
        cursor.execute(sql)
        result = cursor.fetchall()
        for i in range(len(result)):
            print(result[i])

finally:
    connection.close()

