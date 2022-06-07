require "ipv4"
if arg[1] and arg[2] then
	ip1 = newIP(arg[1], IPv4)
	ip2 = newIP(arg[2], IPv4)
	if ip1 and ip2 then
		print(ip2.numeric_representation-ip1.numeric_representation)
	end
end