--[[
    Author: Sam
    Showcases Lua's pattern matching capabilities for parsing text
    Demonstrates extracting data from strings using find and match
]]

-- Parse a simple CSV line
local csvLine = "Sam,shad,CS354"
local name, team, course = csvLine:match("([^,]+),([^,]+),([^,]+)")
print("\nCSV Parse: " .. name .. " | " .. team .. " | " .. course)

-- Extract email from text
local text = "Contact us at support@example.com for help"
local email = text:match("[%w%.]+@[%w%.]+")
print("\nEmail found: " .. email)

-- Extract numbers from a string
local data = "The temperature is 72.5°F and the humidity is 45%"
local temp = data:match("(%d+%.%d+)°F")
local humidity = data:match("(%d+)%%")
print("\nTemperature: " .. temp .. "°F\nHumidity: " .. humidity .. "%")

-- Parse a simple markdown link [text](url)
local markdown = "Click [here](https://example.com/) to visit"
local linkText, url = markdown:match("%[([^%]]+)%]%(([^%)]+)%)")
print("\nLink: " .. linkText .. " -> " .. url)

-- Find all numbers in a string
local numbers = "I have three numbers. They are 42, 81, and also 999."
print()
for num in numbers:gmatch("%d+") do
    print("Found number: " .. num)
end

-- Parse key=value pairs
local config = "host=localhost&port=8080&debug=true"
print()
for key, value in config:gmatch("([%w_]+)=([%w_%.]+)") do
    print("Config: " .. key .. " = " .. value)
end