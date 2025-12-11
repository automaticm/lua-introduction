function add(a, b)
  local result = a + b
  local output = a.. " + " ..b.. " = " ..result
  return output, result
end

function subtract(a, b)
  local result = a - b
  local output = a.. " - " ..b.. " = " ..result
  return output, result
end

function multiply(a, b)
  local result = a * b
  local output = a.. " x " ..b.. " = " ..result
  return output, result
end

function divide(a, b)
  if b == 0 then
    print("error, cannot divide by 0")
    return --exits the function
  end
  local result = a / b
  local output = a.. " / " ..b.. " = " ..result
  return output, result
end


local boolean = true
while (boolean == true) do 

    -- show the display to the user
    print("-------------------------")
    print("| select an operation  |")
    print("| 1) Add               |")
    print("| 2) Subtract          |")
    print("| 3) Multiply          |")
    print("| 4) Divide            |")
    print("| 5) Quit              |")
    print("-------------------------")

    local choice 
    while true do 
        io.write("Please enter a choice: ")
        choice = io.read()

        if choice == "1" or choice =="2" or choice == "3" or choice =="4" or choice == "5" then 
            break
        end

        print("Warning: Not a valid choice ")
    end

    -- handle the quit operation
    if choice == "5" then
        print("\nNow ending...")
        boolean = false
        break
    end

    --get some numbers from the user
    io.write("Please enter your first number: ")
    local a = tonumber(io.read())
    io.write("Please enter your second number: ")
    local b = tonumber(io.read())

    local output, result

    if choice == "1" then 
        output, result = add(a,b)
    elseif choice == "2" then
        output, result = subtract(a,b)
    elseif choice == "3" then
        output, result = multiply(a,b)
    elseif choice == "4" then
        output, result = divide(a,b)
    end

    print(output)

end
