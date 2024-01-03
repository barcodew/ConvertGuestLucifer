local growid = {"growid"}
local pass = {"!passwordbuluk2kali"}
local email = {
    "ratkhacnhai82@gmail.com",
"nhapdongn@gmail.com",
"shelleyroberson023@gmail.com"
}
RandomPW = true 
RandomName = true 

local randomPass = {}
local randomGrowid = {}
for i, gen in iparis(10) do
    table.insert(randomGrowid,RandomGen(10))
    table.insert(randomPass,RandomGen(7).."@")
end
for i, value in ipairs(randomGrowid) do
    print(i, value)
end
for i, value in ipairs(randomPass) do
    print(i, value)
end

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

local function reconBots()
    while getBot().status ~= 1 do
        getBot():connect(true)
        sleep(10000)
    end
end


local function createId()
    sleep(1000)
    getBot():sendPacket(2, "action|growid")
    sleep(5000)
    if RandomPW and RandomName == false then 
    getBot():sendPacket(2,"action|dialog_return\ndialog_name|growid_apply\nlogon|"..growid[a].."\npassword|"..pass[a].."\npassword_verify|"..pass[a].."\nemail|"..email[a])
    elseif RandomPW == false and RandomName then 
    getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..randomGrowid[a].."\npassword|"..pass[a].."\npassword_verify|"..pass[a].."\nemail|"..email[a])
    end
    if RandomName and RandomPW then
        getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..randomGrowid[a].."\npassword|1!"..randomPass[a].."\npassword_verify|1!"..randomPass[a].."\nemail|"..email[a])
    end
    if RandomPW == false and RandomName == false then 

        getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..growid[a].."\npassword|"..pass[a].."\npassword_verify|"..pass[a].."\nemail|"..email[a])
    end
end

local function result()
    getBot():connect(true)
    if getBot().status == 6 then
        file:write("----------------------------\n")
        file:write("==== Create By Barcodew ====\n")
        file:write("----------------------------\n")
        file:write(RandomName[a]..":"..randomPass[a]..":"..email[a])
        
    end
end

local function joinWorld()
        getBot():sendPacket(2,"action|join_request\nname|" .."FAKELUMINOUS".."\ninvitedWorld|0")
end

local bot = getBot() 
bot.auto_tutorial = true 
bot.auto_tutorial = false
local file = io.open("resultCIDByXcoBar.txt", "w")





local a = 0


for i,bots in ipairs(getBots()) do
    a = a+1
    if bots.name == bot.name then
        reconBots()
        joinWorld()
        createId()
        result()
    end
end

file:close()






-- addBot("megatzyhh1","02:5F:E2:DB:4C:7C","490B702317630FCD2A7939834C096B0E");
-- addBot("megatzyh2","02:6E:B9:52:05:A4","250E8485241BC19FFC75908AF1E10FAC");
-- addBot("megatzyh3","02:2D:66:D5:84:EF","1BC41385549FB81EA225E11D26BC0E51");
