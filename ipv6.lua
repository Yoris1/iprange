require "ip"

IPv6 = IP:new()

function IPv6:is_valid()
	ipv6_pattern = string.rep("%x+%:", 7).."%x+"
	if not string.match(self.string_representation, ipv6_pattern) then 
		return false
	end

	octets = self:get_octets()

	if #octets ~= 8 then
		return false
	end

	for i, octet in pairs(octets) do 
		if octet > 65536 then
			return false
		end
	end

	return true
end
function IPv6:get_octets()
	octets = {}
	for octet in string.gmatch(self.string_representation, "%x+%:?") do
		octets[#octets+1] = tonumber(string.match(octet, "%x+"), 16)
	end
	return octets
end
