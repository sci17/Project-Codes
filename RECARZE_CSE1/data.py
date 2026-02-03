import mysql.connector
from faker import Faker
import random
from datetime import datetime, timedelta

# Initialize Faker
fake = Faker()

# Connect to MySQL database
db_connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Spledelyn1704",
    database="rental"
)
cursor = db_connection.cursor()

# Configuration
NUM_PURCHASE_STATUS_CODES = 5
NUM_ITEM_TYPES = 10
NUM_ITEMS = 50
NUM_TRANSACTION_TYPES = 5
NUM_PAYMENT_METHODS = 5
NUM_CUSTOMERS = 100
NUM_ACCOUNTS = 50
NUM_PURCHASES = 100
NUM_RENTALS = 50
NUM_TRANSACTIONS = 100

# Helper function for random dates
def random_date(start, end):
    return start + timedelta(days=random.randint(0, (end - start).days))

# Insert data into PURCHASE_STATUS_CODES
for i in range(NUM_PURCHASE_STATUS_CODES):
    purchase_status_code = i + 1
    description = fake.word().capitalize()
    cursor.execute("INSERT INTO PURCHASE_STATUS_CODES (purchase_status_code, description) VALUES (%s, %s)", (purchase_status_code, description))

# Insert data into INVENTORY_ITEM_TYPES
for i in range(NUM_ITEM_TYPES):
    item_type_code = i + 1
    description = fake.word().capitalize()
    cursor.execute("INSERT INTO INVENTORY_ITEM_TYPES (item_type_code, description) VALUES (%s, %s)", (item_type_code, description))

# Insert data into INVENTORY_ITEMS
for i in range(NUM_ITEMS):
    item_id = i + 1
    item_type_code = random.randint(1, NUM_ITEM_TYPES)
    description = fake.word().capitalize()
    number_in_stocks = random.randint(1, 100)
    rental_sale_both = random.choice(['rental', 'sale', 'both'])
    rental_daily_rate = random.randint(5, 50) if rental_sale_both in ['rental', 'both'] else None
    sale_price = random.randint(100, 1000)
    cursor.execute("""
        INSERT INTO INVENTORY_ITEMS (item_id, item_type_code, description, number_in_stocks, rental_sale_both, rental_daily_rate, sale_price)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """, (item_id, item_type_code, description, number_in_stocks, rental_sale_both, rental_daily_rate, sale_price))

# Insert data into TRANSACTION_TYPES
for i in range(NUM_TRANSACTION_TYPES):
    transaction_type_code = i + 1
    description = fake.word().capitalize()
    cursor.execute("INSERT INTO TRANSACTION_TYPES (transaction_type_code, description) VALUES (%s, %s)", (transaction_type_code, description))

# Insert data into PAYMENT_METHODS
for i in range(NUM_PAYMENT_METHODS):
    payment_method_code = i + 1
    description = fake.word().capitalize()
    cursor.execute("INSERT INTO PAYMENT_METHODS (payment_method_code, description) VALUES (%s, %s)", (payment_method_code, description))

# Insert data into CUSTOMERS
for _ in range(NUM_CUSTOMERS):
    customer_id = random.randint(1000, 9999)
    first_name = fake.first_name()
    last_name = fake.last_name()
    address = fake.address()
    phone_number = fake.phone_number()
    cell_mobile = fake.phone_number()
    email_address = fake.email()
    other_details = fake.sentence(nb_words=6) if random.random() > 0.5 else None
    cursor.execute("""
        INSERT INTO CUSTOMERS (customer_id, first_name, last_name, address, phone_number, cell_mobile, email_address, other_details)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    """, (customer_id, first_name, last_name, address, phone_number, cell_mobile, email_address, other_details))

# Insert data into ACCOUNTS
for i in range(NUM_ACCOUNTS):
    account_id = i + 1
    account_name = fake.company()
    payment_method_code = random.randint(1, NUM_PAYMENT_METHODS)
    customer_id = random.randint(1000, 9999)
    account_details = fake.sentence(nb_words=8)
    cursor.execute("""
        INSERT INTO ACCOUNTS (account_id, account_name, payment_method_code, customer_id, account_details)
        VALUES (%s, %s, %s, %s, %s)
    """, (account_id, account_name, payment_method_code, customer_id, account_details))

# Insert data into CUSTOMER_ITEM_PURCHASES
for i in range(NUM_PURCHASES):
    purchase_id = i + 1
    purchase_status_code = random.randint(1, NUM_PURCHASE_STATUS_CODES)
    customer_id = random.randint(1000, 9999)
    item_id = random.randint(1, NUM_ITEMS)
    purchase_date = random_date(datetime(2020, 1, 1), datetime(2023, 12, 31))
    purchase_quantity = random.randint(1, 10)
    amount_due = round(random.uniform(50, 500), 2)
    cursor.execute("""
        INSERT INTO CUSTOMER_ITEM_PURCHASES (purchase_id, purchase_status_code, customer_id, item_id, purchase_date, purchase_quanity, amount_due)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """, (purchase_id, purchase_status_code, customer_id, item_id, purchase_date, purchase_quantity, amount_due))

# Insert data into CUSTOMER_ITEM_RENTALS
for i in range(NUM_RENTALS):
    item_rental_id = i + 1
    customer_id = random.randint(1000, 9999)
    item_id = random.randint(1, NUM_ITEMS)
    rental_date_out = random_date(datetime(2020, 1, 1), datetime(2023, 12, 31))
    rental_date_returned = rental_date_out + timedelta(days=random.randint(1, 30))
    amount_due = round(random.uniform(20, 200), 2)
    other_details = fake.sentence(nb_words=6)
    cursor.execute("""
        INSERT INTO CUSTOMER_ITEM_RENTALS (item_rental_id, customer_id, item_id, rental_date_out, rental_date_returned, amount_due, other_details)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """, (item_rental_id, customer_id, item_id, rental_date_out, rental_date_returned, amount_due, other_details))

# Insert data into FINANCIAL_TRANSACTIONS
for i in range(NUM_TRANSACTIONS):
    transaction_id = i + 1
    account_id = random.randint(1, NUM_ACCOUNTS)
    item_rental_id = random.choice([None, random.randint(1, NUM_RENTALS)])
    purchase_id = random.choice([None, random.randint(1, NUM_PURCHASES)])
    previous_transaction_id = random.choice([None, random.randint(1, i)]) if i > 1 else None
    transaction_date = random_date(datetime(2020, 1, 1), datetime(2023, 12, 31))
    transaction_type_code = random.randint(1, NUM_TRANSACTION_TYPES)
    transaction_amount = round(random.uniform(50, 1000), 2)
    comment = fake.sentence(nb_words=10)
    cursor.execute("""
        INSERT INTO FINANCIAL_TRANSACTIONS (transaction_id, account_id, item_rental_id, purchase_id, previous_transaction_id, transaction_date, transaction_type_code, transaction_amount, comment)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
    """, (transaction_id, account_id, item_rental_id, purchase_id, previous_transaction_id, transaction_date, transaction_type_code, transaction_amount, comment))

# Commit changes and close the connection
db_connection.commit()
cursor.close()
db_connection.close()

print("Fake data inserted successfully.")
