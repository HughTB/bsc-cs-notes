class BankAccount:
    def __init__(self, account_number, account_holder, account_balance = 0.0):
        self.number = account_number
        self.holder = account_holder
        self.balance = account_balance

    def deposit(self, value):
        self.balance += value
        return self.get_balance()
    
    def withdraw(self, value):
        self.balance -= value
        return self.get_balance()

    def get_balance(self):
        return self.balance
    
def main():
    account = BankAccount(123456789, "John Smith")

    print(account.deposit(100))

    print(account.withdraw(14))

main()