class SmartMeter():
    def __init__(self, energy_balance = 1000, solar_panels = False):
        self.energy_balance = energy_balance
        self.solar_panels = solar_panels

    def get_energy(self):
        return self.energy_balance
    
    def use_energy(self, energy_needed: int):
        if self.energy_balance > -1000:
            self.energy_balance -= energy_needed

            if self.energy_balance < -500:
                print(f"You are currently {abs(self.energy_balance)}kWh overdraft. Your service will be cut off when you reach an overdraft of 1000kWh")
            elif self.energy_balance < 0:
                print(f"You have run out of energy. You are currently {abs(self.energy_balance)}kWh overdraft")
        else:
            print(f"You have been cut off. Please resolve your overdraft balance of {abs(self.energy_balance)}kWh")

def testSmartMeter():
    sm = SmartMeter()

    sm.use_energy(1000)
    print(sm.get_energy())
    sm.use_energy(532)
    print(sm.get_energy())
    sm.use_energy(400)
    print(sm.get_energy())

testSmartMeter()