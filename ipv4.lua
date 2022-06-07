require "ip"

IPv4 = IP:new()

function IPv4:is_valid()
	if not string.match(self.string_representation, "%d+%.%d+%.%d+%.%d+") then 
		return false
	end

	octets = self:get_octets(a)

	if #octets ~= 4 then
		return false
	end

	for i, octet in pairs(octets) do 
		if octet > 255 then
			return false
		end
	end

	return true
end

function IPv4:get_octets()
	octets = {}
	for octet in string.gmatch(self.string_representation, "%d+%.?") do 
		octets[#octets+1] = tonumber(string.match(octet, "%d+"))
	end
	return octets
end