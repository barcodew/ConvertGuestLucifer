local growid = {"WCMTWS4DDH"}
local pass = "nanta456@"
local email = {
    -- "yasiaforever488@gmail.com",
    "giengnguocnhong@gmail.com",
    "gallacherdarcy9@gmail.com"
}


RandomPW = false
RandomName = false

local bot = getBot()
bot.auto_tutorial = true
local growid = {"DEI5ZJVM8V", "297JVT2NAV", "WCMTWS4DDH"}
local a = 0
for i, bots in ipairs(getBots()) do
    a = a + 1
    if bots.name == bot.name then
        break
    end
end


local function RandomGen(LetterWorld)
    local word = ""
    local alphabet = "abcdefghijklmnopqrstuvwxyz1234567890"

    for i = 1, LetterWorld do
        local randomIndex = math.random(#alphabet)
        local randomLetter = alphabet:sub(randomIndex, randomIndex)
        word = word .. randomLetter
    end

    return word
end
print(RandomGen(10).." Nyoba ")
local randomGrowid = RandomGen(10)
print(randomGrowid)
local randomPass = RandomGen(7).."@"
print(randomPass)

sleep(1000)
bot.auto_tutorial = false

local file = io.open("resultCIDByXcoBar1.txt", "a") 
    

getBot():sendPacket(2, "action|growid")
sleep(5000)
if RandomPW and RandomName == false then
    getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|" .. growid[a] .. "\npassword|" .. pass[a] .. "\npassword_verify|" .. pass[a] .. "\nemail|" .. email[a])
elseif RandomPW == false and RandomName then
    getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|" .. randomGrowid .. "\npassword|" .. pass[a] .. "\npassword_verify|" .. pass[a] .. "\nemail|" .. email[a])
end
if RandomName and RandomPW then
    getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|" .. randomGrowid .. "\npassword|1!" .. randomPass .. "\npassword_verify|1!" .. randomPass .. "\nemail|" .. email[a])
    file:write(randomGrowid .. "|" .. randomPass .. "|" .. email[a].. "\n") 
end
if RandomPW == false and RandomName == false then
    file:write(growid[a] .. "|" .. pass .. "|" .. email[a].. "\n") 
    getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..growid[a].."\npassword|"..pass.."\npassword_verify|"..pass.. "\nemail|"..email[a])
end
    print("Successfully Created")
sleep(10000)
file:close()

-- local file = io.open("resultCIDByXcoBar.txt", "a") 
-- file:write("Done Bang \n") 
-- file:close()

