local function sleep(sec)
    os.execute("sleep " .. sec)
end

function slowprint(text, delay)
    for i = 1, #text do
        io.write(text:sub(i, i))
        io.flush() -- makes it write immediately
        sleep(delay)
    end
    print() 
end

slowprint("hello world", 1)
