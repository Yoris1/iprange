require "ipv4"
require "ipv6"
require "usage"

if arg[1] and arg[2] then
	ip_class = IPv4
	if arg[3] then
		if arg[3] == "-ipv6" then
			ip_class = IPv6
		elseif arg[3] == "-ipv4" then
			ip_class = IPv4
		else
			print_usage()
		end
	end
	ip1 = newIP(arg[1], ip_class)
	ip2 = newIP(arg[2], ip_class)
	if ip1 and ip2 then
		print(getIPRange(ip1, ip2))
	else
		print_usage()
	end
else
	print_usage()
end