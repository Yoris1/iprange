require "ip"

IPv4 = IP:new()

function IPv4:is_valid()
	ipv4_pattern = "^"..string.rep("%d+%.", 3).."%d+$"
	if not string.match(self.string_representation, ipv4_pattern) then 
		return false
	end

	octets = self:get_octets()

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