User = {
    name = "admin",
    password = "123",
    email = "admin123@gmail.com"
}

function User:setName(name)
    self.name = name
end

function User:setPassword(pass)
    self.password = pass
end

function User:setEmail(email)
    self.email = email
end

NewUser = User
-- User = nil
-- print(newUser[1] .. " " .. newUser[2] " "  .. newUser[3])

NewUser:setName("pablo")
NewUser:setEmail("pablostinks123@gmail.com")
NewUser:setPassword("123456789")
print(NewUser.name .. " " .. NewUser.password .. " "  .. NewUser.email)
-- print(User.name .. " " .. User.password .. " "  .. User.email)
