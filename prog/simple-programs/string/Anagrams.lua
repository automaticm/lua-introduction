--[[
    Author: Sam
    Finds anagrams by sorting characters in words
    Demonstrates table manipulation and comparison
]]

-- Function to get sorted characters of a word (signature)
local function getSignature(word)
    word = word:lower()
    local chars = {}
    for i = 1, #word do
        table.insert(chars, word:sub(i, i))
    end
    table.sort(chars)
    return table.concat(chars)
end

-- List of words to check
local words = {
    "listen", "silent", "hello", "world",
    "evil", "vile", "act", "cat",
    "desserts", "stressed", "sun", "moon"
}

-- Group words by anagram signature
local anagrams = {}
for _, word in ipairs(words) do
    local sig = getSignature(word)
    if not anagrams[sig] then
        anagrams[sig] = {}
    end
    table.insert(anagrams[sig], word)
end

-- Print anagram groups (only groups with 2+ words)
print("\nAnagram Groups:")
for sig, group in pairs(anagrams) do
    if #group > 1 then
        print(table.concat(group, ", ") .. " (signature: " .. sig .. ")")
    end
end

-- Check if two words are anagrams
local function areAnagrams(word1, word2)
    return getSignature(word1) == getSignature(word2)
end

print("\nAnagram Checks:")
print("listen & silent: " .. tostring(areAnagrams("listen", "silent")))
print("hello & world: " .. tostring(areAnagrams("hello", "world")))
print("evil & vile: " .. tostring(areAnagrams("evil", "vile")))
print("sun & moon: " .. tostring(areAnagrams("sun", "moon")))