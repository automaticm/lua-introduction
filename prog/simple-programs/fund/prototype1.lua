-- 16.1, 16.2, ... 16.4
local account =
{
    balance = 0
}

function account:withdraw(v)
    if v > self.balance then error "Cannot withdraw more then account balance" end
    self.balance = self.balance - v
end

function account:deposit(v)
    self.balance = self.balance + v
end

function account:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self 
    return o
end

local account1 = account:new({balance = 100.00})
local account2 = account:new({balance = 200.00})
-- local account1 = account.new(account, {balance = 100})

account1:deposit(50.00)
print(account1.balance)
print(account2.balance)
account2:withdraw(20.00)
print(account2.balance)

--[[
    function newAccount (initialBalance)
      local self = {balance = initialBalance}
    
      local withdraw = function (v)
                         self.balance = self.balance - v
                       end
    
      local deposit = function (v)
                        self.balance = self.balance + v
                      end
    
      local getBalance = function () return self.balance end
    
      return {
        withdraw = withdraw,
        deposit = deposit,
        getBalance = getBalance
      }
    end
]]

