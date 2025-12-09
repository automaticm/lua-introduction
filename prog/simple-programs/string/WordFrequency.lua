--[[
    Author: Sam
    Counts word frequencies in text and displays them sorted
    Demonstrates string splitting, table manipulation, and sorting
]]

-- Text to analyze
local text = "lua is great lua is powerful lua patterns are great lua is really really really cool"

-- Split text into words
local words = {}
for word in text:gmatch("%w+") do
    table.insert(words, word)
end

-- Count word frequencies
local frequencies = {}
for _, word in ipairs(words) do
    if frequencies[word] then
        frequencies[word] = frequencies[word] + 1
    else
        frequencies[word] = 1
    end
end

-- Convert to sortable table format
local wordList = {}
for word, count in pairs(frequencies) do
    table.insert(wordList, {word = word, count = count})
end

-- Sort by frequency (highest first)
table.sort(wordList, function(a, b)
    return a.count > b.count
end)

-- Display results
print("\nWord Frequencies:")
print(string.format("%8s | %s", "Word", "Count"))
print("---------+-------")
for _, item in ipairs(wordList) do
    print(string.format("%8s | %d", item.word, item.count))
end

-- Show statistics
print("\nStatistics:")
print("Total words: " .. #words)
print("Unique words: " .. #wordList)
print("Most frequent: " .. wordList[1].word .. " (" .. wordList[1].count .. " times)")