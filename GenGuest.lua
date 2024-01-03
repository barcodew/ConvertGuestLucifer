local growid = {"growid"}
local pass = {"!passwordbuluk2kali"}
local email = {
    "ratkhacnhai82@gmail.com",
"fatimacoco65@gmail.com",
"shelleyroberson023@gmail.com"
}
RandomPW = true 
RandomName = true 




local function RandomGen(LetterWorld)
        local word = ""
    local alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    for i = 1, LetterWorld do
      local randomIndex = math.random(#alphabet)
      local randomLetter = alphabet:sub(randomIndex, randomIndex)
      word = word .. randomLetter
    end
    
    return word    
end

local file = io.open("resultCIDByXcoBar.txt", "w")
local randomPass = RandomGen(7).."@"
local randomGrowid = RandomGen(10)
local function createId()
    sleep(1000)
    bot.auto_tutorial = false
    getBot():sendPacket(2, "action|growid")
    sleep(5000)
    if RandomPW and RandomName == false then 
    getBot():sendPacket(2,"action|dialog_return\ndialog_name|growid_apply\nlogon|"..growid[a].."\npassword|"..pass[a].."\npassword_verify|"..pass[a].."\nemail|"..email[a])
    elseif RandomPW == false and RandomName then 
    getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..randomGrowid.."\npassword|"..pass[a].."\npassword_verify|"..pass[a].."\nemail|"..email[a])
    end
    if RandomName and RandomPW then
        print(getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..randomGrowid.."\npassword|1!"..randomPass.."\npassword_verify|1!"..randomPass.."\nemail|"..email[a]))
        getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..randomGrowid.."\npassword|1!"..randomPass.."\npassword_verify|1!"..randomPass.."\nemail|"..email[a])
        print(getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..randomGrowid.."\npassword|1!"..randomPass.."\npassword_verify|1!"..randomPass.."\nemail|"..email[a]))
    end
    if RandomPW == false and RandomName == false then 

        getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..growid[a].."\npassword|"..pass[a].."\npassword_verify|"..pass[a].."\nemail|"..email[a])
    end
end


local bot = getBot() 
bot.auto_tutorial = true 
local a = 0
for i,bots in ipairs(getBots()) do
    a = a+1
    if bots.name == bot.name then
        createId()
        getBots():connect(true)
        break
    end
end


if getBot().status == "AAP" then
    file:write("----------------------------\n")
    file:write("==== Create By Barcodew ====\n")
    file:write("----------------------------\n")
    file:write(RandomName..":"..randomPass..":"..email[a])
    
end


file:close()
