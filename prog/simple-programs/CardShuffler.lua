require("CustomGlobal")

function Shuffler(deck)
    math.randomseed(os.time())
    math.random() math.random() math.random()
    for n=0, 100 do
        local rand = math.random(1,52)
        local rand2 = math.random(1,52)
        local old = deck[rand]
        deck[rand] = deck[rand2]
        deck[rand2] = old
    end
    return deck
end

--Suits and Ranks arrays the populate the deck
local suits = {"H", "D", "C", "S"}
local rank = {"A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"}

--Populate the deck with cards
local deck = {}
for n=0, 52 do
    deck[n] = rank[(n%13)+1]..suits[(n%4)+1]
end

print("\nDeck of cards:")
print(ToString(deck).."\n")

--shuffle and print the shuffled deck
print("Shuffled deck1:")
print(ToString(Shuffler(deck)).."\n")

print("Shuffled deck2:")
print(ToString(Shuffler(deck)).."\n")
