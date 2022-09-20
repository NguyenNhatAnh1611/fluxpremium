local Response = syn.request({
    Url = "https://fluxdatabase.nguyennhatanh16.repl.co/verify",
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    }, 
    Body = {
        ['key'] = _G.Key
    }
})
print(Response.Body)