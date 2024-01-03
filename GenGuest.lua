local growid = {"growid"}
local pass = {"!passwordbuluk2kali"}
local email = {
    "ratkhacnhai82@gmail.com",
"shanecreighton03@gmail.com",
"dhattrua@gmail.com"
}
RandomPW = true 
RandomName = true 
local bot = getBot() 
bot.auto_tutorial = true 
local a = 0
for i,bots in ipairs(getBots()) do
    a = a+1
    if bots.name == bot.name then
        break
    end
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
  sleep(1000)
  bot.auto_tutorial = false
getBot():sendPacket(2, "action|growid")
sleep(5000)
if RandomPW and RandomName == false then 
getBot():sendPacket(2,"action|dialog_return\ndialog_name|growid_apply\nlogon|"..growid[a].."\npassword|"..pass[a].."\npassword_verify|"..pass[a].."\nemail|"..email[a])
elseif RandomPW == false and RandomName then 
getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..RandomGen(10).."\npassword|"..pass[a].."\npassword_verify|"..pass[a].."\nemail|"..email[a])
end
if RandomName and RandomPW then
getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..RandomGen(10).."\npassword|1!"..RandomGen(7).."\npassword_verify|1!"..RandomGen(7).."\nemail|"..email[a])
end
if RandomPW == false and RandomName == false then 

    getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..growid[a].."\npassword|"..pass[a].."\npassword_verify|"..pass[a].."\nemail|"..email[a])
end
