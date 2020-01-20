import psycopg2

try:
    connection = psycopg2.connect(user="postgres",
                                  password="mysecretpassword",
                                  host="127.0.0.1",
                                  port="5432",
                                  database="postgres")

    cursor = connection.cursor()

    # Print PostgreSQL version
    cursor.execute("SELECT version();")
    record = cursor.fetchone()
    print("You are connected to - ", record, "\n")

    cursor.execute(''' CREATE TABLE IF NOT EXISTS orders 
    ( ID serial NOT NULL PRIMARY KEY,
      info json NOT NULL
    );''')

    cursor.execute('''INSERT INTO orders (info)
    VALUES
    (
        '{ "customer": "Lily", "items": {"product": "Water","qty": 24}}'
    ),
    (
        '{ "customer": "Josh", "items": {"product": "Toy Car","qty": 1}}'
    ),
    (
        '{ "customer": "Mary", "items": {"product": "Toy Train","qty": 2}}'
    ); ''')

    connection.commit()

    cursor.execute(''' SELECT info FROM orders;''')

    order_records = cursor.fetchall()
    print(order_records, "\n")

    cursor.execute(''' SELECT
    info ->> 'customer' AS customer
    FROM orders; ''')

    customer_records = cursor.fetchall()
    print(customer_records, "\n")

    cursor.execute(''' SELECT
    info -> 'items' ->> 'product' as product
    FROM orders; ''')
    product_records = cursor.fetchall()
    print(product_records, "\n")

except (Exception, psycopg2.Error) as error:
    print("Error while connecting to PostgreSQL", error)

finally:
    if connection:
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
