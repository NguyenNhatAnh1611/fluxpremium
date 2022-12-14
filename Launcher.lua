local HttpService = game:GetService"HttpService"
local Player = game:GetService"Players".LocalPlayer
local CoreGui = game:GetService"CoreGui"
local TweenService = game:GetService"TweenService"
local Connected = false
delay(30, function()
    if Connected == false then
        Player:Kick("Unable to connect to Flux Database Server \n (Error Code: 405)")
    end
end)
local Response = syn.request({
    Url = "https://fluxdatabase.nguyennhatanh16.repl.co/verify",
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    }, 
    Body = HttpService:JSONEncode({['key'] = _G.Key} )
})

local Screen = Instance.new("ScreenGui")
Screen.Name = "Flux"
Screen.Parent = CoreGui

local Notifications = Instance.new("Frame")
Notifications.Name = "ScriptNotification"
Notifications.BackgroundTransparency = 1
Notifications.Size = UDim2.new(0.182, 0, 1, 0)
Notifications.Position = UDim2.new(0.818, 0, 0, 0)
Notifications.Parent = Screen
local NotificationsList = Instance.new("UIListLayout")
NotificationsList.Parent = Notifications
NotificationsList.SortOrder = Enum.SortOrder.LayoutOrder
NotificationsList.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotificationsList.Padding = UDim.new(0, 5)

function ScriptNotification(text, time)
    local notif = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local logo = Instance.new("TextLabel")
    local UIGradient = Instance.new("UIGradient")
    local content = Instance.new("TextLabel")
    local counter = Instance.new("Frame")

    notif.Name = "notif"
    notif.Parent = Notifications
    notif.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    notif.Position = UDim2.new(-0.00114206225, 0, 0.916703701, 0)
    notif.BackgroundTransparency = 1
    notif.Size = UDim2.new(0.991, 0, 0.081, 0)
    TweenService:Create(notif, TweenInfo.new(1), {
        ["BackgroundTransparency"] = 0
    }):Play()

    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = notif

    logo.Name = "logo"
    logo.Parent = notif
    logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    logo.BackgroundTransparency = 1.000
    logo.Position = UDim2.new(0.0222841222, 0, 0.0747049227, 0)
    logo.Size = UDim2.new(0, 207, 0, 18)
    logo.Font = Enum.Font.FredokaOne
    logo.Text = "Flux Premium"
    logo.TextColor3 = Color3.fromRGB(255, 255, 255)
    logo.TextScaled = true
    logo.TextSize = 14.000
    logo.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    logo.TextWrapped = true
    logo.TextXAlignment = Enum.TextXAlignment.Left

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(85, 255, 0)), ColorSequenceKeypoint.new(0.65, Color3.fromRGB(85, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
    UIGradient.Parent = logo

    content.Name = "content"
    content.Parent = notif
    content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    content.BackgroundTransparency = 1.000
    content.Position = UDim2.new(0.0250000004, 0, 0.379999995, 0)
    content.Size = UDim2.new(0, 343, 0, 36)
    content.Font = Enum.Font.SourceSansSemibold
    content.Text = text
    content.TextColor3 = Color3.fromRGB(255, 255, 255)
    content.TextSize = 16.000
    content.TextXAlignment = Enum.TextXAlignment.Left
    content.TextYAlignment = Enum.TextYAlignment.Top

    counter.Name = "counter"
    counter.Parent = notif
    counter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    counter.Position = UDim2.new(0.0529999994, 0, 0.939999998, 0)
    counter.Size = UDim2.new(0.89693594, 0, 0.0298819691, 0)
    TweenService:Create(counter, TweenInfo.new(time), {
        ["Size"] = UDim2.new(0, 0, 0.03, 0),
        ["Position"] = UDim2.new(0.5, 0, 0.94, 0)
    }):Play()
    delay(time + 1, function()
        TweenService:Create(notif, TweenInfo.new(0.5), {
            ["BackgroundTransparency"] = 1
        }):Play()
        TweenService:Create(logo, TweenInfo.new(0.5), {
            ["BackgroundTransparency"] = 1
        }):Play()
        TweenService:Create(content, TweenInfo.new(0.5), {
            ["BackgroundTransparency"] = 1
        }):Play()
        TweenService:Create(counter, TweenInfo.new(0.5), {
            ["BackgroundTransparency"] = 1
        }):Play()
    end)
    delay(time + 1.5, function()
        notif:Destroy()
    end)
end

repeat wait() until Response.Body ~= nil
local Status = HttpService:JSONDecode(Response.Body)
if Status["VAILD"] == true and Status["HWID"] == _G.Key and Status["USER_ID"] ~= nil and Status["IP"] ~= nil then
    Connected = true
    ScriptNotification("Verification Success!", 5)
else
    Player:Kick("\n Invaild HWID \n (Error Code: 1)")
end
