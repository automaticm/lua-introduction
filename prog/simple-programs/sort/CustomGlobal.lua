function ToString(array)
    -- force given variable into being an array
    if type(array) ~= "table" then
        array = {array}
    end

    local toString = ""
    local checkNil = 2; -- because arrays in Lua start at index 1 instead of index 0 like most other languages
    for _, n in ipairs(array) do
        if array[checkNil] == nil then
            toString = toString..n
            return toString
        end
        toString = toString..n..", "
        checkNil = checkNil + 1
    end
    return toString
end


function SortByBubble(array)
    -- force given variable into being an array
    if type(array) ~= "table" then
        array = {array}
    end

    local swapped = false
    for n=0, (#(array)-1) do
        for i=0, (#(array)-n-1) do
            if array[i] > array[i+1] then
                local old = array[i]
                array[i] = array[i+1]
                array[i+1] = old
                swapped = true
            end
        end
        if swapped == false then
            return array
        end
    end

    return array
end

function inc(n)
    n = n + 1
    return n
end

function dec(n)
    n = n - 1
    return n
end

thing = 1