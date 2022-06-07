require "ipv4"
require "ipv6"

if arg[1] and arg[2] then
	ip_class = IPv4
	if arg[3] and arg[3] == "-ipv6" then
		ip_class = IPv6
	end
	ip1 = newIP(arg[1], ip_class)
	ip2 = newIP(arg[2], ip_class)
	if ip1 and ip2 then
		print("hi")
		print(getIPRange(ip1, ip2))
	end
end