from faker import Faker
import pandas as pd
import numpy as np

fake = Faker()

def fake_names(length=10):
    return [fake.name() for _ in range(length)]

def fake_emails(length=10):
    return [fake.email() for _ in range(length)]

def fake_addresses(length=10):
    return [fake.address() for _ in range(length)]

def fake_passwords(length=10):
    return [fake.password(length = 8, special_chars = False, upper_case = False) for _ in range(length)]

def fake_phone_number(length=10):
    return [fake.phone_number() for _ in range(length)]

def fake_birthday(length=10):
    return [fake.date() for _ in range(length)]

def main():
    print(fake_names(10))
    print(fake_emails(10))
    print(fake_addresses(10))
    print(fake_passwords(10))
    print(fake_phone_number(10))
    print(fake_birthday(10))

if __name__ == '__main__':
    main()