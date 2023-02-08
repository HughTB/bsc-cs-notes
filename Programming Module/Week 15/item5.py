# Item 5 (In-Class test, Wed 8th Feb 2023)

class BankAccount():
    def __init__(self):
        self.balance = 100.0

    def getBalance(self):
        return self.balance
    
    def processTransaction(self, amount: float):
        self.balance -= amount
        
        if self.balance <= 0:
            print("You are no longer in credit. Please see the bank manager.")

class BankAccount2():
    def __init__(self):
        self.balance = 100.0
        self.overdraftUsed = False

    def getBalance(self):
        return self.balance
    
    def processTransaction(self, amount: float):
        if self.overdraftUsed and self.balance - amount >= -50:
            self.balance -= amount
        elif self.balance - amount >= 0:
            self.balance -= amount
        else:
            print("Payment not authorized. You do not have enough money for that")

    def arrangeOverdraft(self):
        self.overdraftUsed = True

def testBankAccount():
    account = BankAccount()

    account.processTransaction(70)
    print(account.getBalance())
    account.processTransaction(40)
    print(account.getBalance())

def testBankAccount2():
    account = BankAccount2()

    account.processTransaction(70)
    print(account.getBalance())
    account.processTransaction(40)
    print(account.getBalance())
    account.arrangeOverdraft()
    account.processTransaction(40)
    print(account.getBalance())

print("=== Task 1 ===")
testBankAccount()
print("\n=== Task 2 ===")
testBankAccount2()