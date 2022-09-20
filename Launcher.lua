local HttpService = game:GetService"HttpService"
local Response = syn.request({
    Url = "https://fluxdatabase.nguyennhatanh16.repl.co/verify",
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    }, 
    Body = HttpService:JSONEncode({['key'] = _G.key} )
})
print(Response.Body)
