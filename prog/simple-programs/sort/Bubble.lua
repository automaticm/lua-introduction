require("CustomGlobal")

math.randomseed(os.time())
math.random() math.random() math.random()
local mess = {}
for n = 0, math.random(1, 30) do
    mess[n] = math.random(1, 100);
end

print("Mess of a list: ")
print(ToString(mess).."\n")

local clean = SortByBubble(mess)
print("Cleaned up list: ")
print(ToString(clean))