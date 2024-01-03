local growid = {"growid"}
local pass = {"!passwordbuluk2kali"}
local email = {
    "hthuoungiep@gmail.com",
"chohuthuoc@gmail.com",
"khailuudang@gmail.com"
}

totalBot = 3
webhookUrl = "https://discord.com/api/webhooks/1192237650254508112/BTSgzX-8ebX4oOCU3SDGBpWSBV8JugQMLnboGy0U7mXk4hF5UPNGaokWdFegeEEGrIdZ"
RandomPW = true 
RandomName = true 

local file = io.open("resultCIDByXcoBar.txt", "w")
local bot = getBot() 
bot.auto_tutorial = true 
local a = 0
for i,bots in ipairs(getBots()) do
    a = a+1
    if bots.name == bot.name then
        break
    end
end

local function reconBots(reconnect)
    if getBot().status ~= 1 then
        sleep(10000)
        getBot().connext(true)
    end
end
local function reconAAP(checkAAP)
    if getBot().status ~= "AAP" then
        sleep(10000)
        getBot().connext(true)
    end
    if getBot().status ~= "AAP" then
        sleep(10000)
        getBot().connext(true)
    end
    if getBot().status ~= "AAP" then
        sleep(10000)
        getBot().connext(true)
    end
end

function webhookSend(growid,pass,mail)
    local script = [[
            $webHookUrl = "]]..webhookUrl..[["
            $fieldArray = @(
                @{
                    name = "]]..getBot().name:upper()..[["
                    value = ":computer: Information Bot : ]]..log..[[`r<a:arrowz:1038444769141063850> Username Bot : ]]..growid..[[`r:lock: Password Bot : ]]..pass..[[`r:green_circle: Status Bot : ]]..getBot().status..[[`r:envelope: Email Bot : ]]..mail..[["
                    inline = "true"
                }
            )
            $embedObject = @{
                title = "<a:bot:1038446548821999616>Cid Gen By Barcodew<a:bot:1038446548821999616>"
                description = "**<a:warn:1083966616523509893>INFORMATION BOT ]]..getBot().name..[[<a:warn:1083966616523509893>**"
                color = "15413489"
                fields = $fieldArray
            }
            $embedArray = @($embedObject)
            $payload = @{
                embeds = $embedArray
            }
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
            Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Patch -ContentType 'application/json'
        ]]
    local pipe = io.popen("powershell -command -", "w")
    pipe:write(script)
    pipe:close()
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
    local randomGrowid = RandomGen(10)
    local randomPass = RandomGen(7).."@";
    getBot():sendPacket(2, "action|growid")
    sleep(5000)
    if RandomPW and RandomName == false then 
    getBot():sendPacket(2,"action|dialog_return\ndialog_name|growid_apply\nlogon|"..growid[a].."\npassword|"..pass[a].."\npassword_verify|"..pass[a].."\nemail|"..email[a])
    elseif RandomPW == false and RandomName then 
    getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..randomGrowid.."\npassword|"..pass[a].."\npassword_verify|"..pass[a].."\nemail|"..email[a])
    end
    if RandomName and RandomPW then
    getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..randomGrowid.."\npassword|1!"..randomPass.."\npassword_verify|1!"..randomPass.."\nemail|"..email[a])
    end
    if RandomPW == false and RandomName == false then 

        getBot():sendPacket(2, "action|dialog_return\ndialog_name|growid_apply\nlogon|"..growid[a].."\npassword|"..pass[a].."\npassword_verify|"..pass[a].."\nemail|"..email[a])
    end



reconBots()
reconAAP()
if getBot().status == "AAP" then
    webhookSend(randomGrowid,randomPass,email[a])
end

