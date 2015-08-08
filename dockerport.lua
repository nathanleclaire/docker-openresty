local containername = ""

function get_subdomain(host)
    local subdomain = ""
    for c in string.gmatch(host, ".") do
        if c == "." then break end
        subdomain = subdomain .. tostring(c)
    end
    return subdomain
end

-- Get the subdomain for corresponding container name

local container_name = get_subdomain(ngx.var.http_host)
local handle = io.popen("/docker port " .. container_name .. " | awk '{ print $3; }' | tr -d '\n'")
local address = handle:read("*a")
local rc = {handle:close()}
local zeroexit = rc[1]
if zeroexit then
    ngx.status = 404
    ngx.say("404 container not found")
end

ngx.var.target = address
