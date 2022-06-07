IP = {octets = {}, string_representation = "", numeric_representation = 0}
function IP:new() 
	obj = {}
	setmetatable(obj, {__index = self})
	return obj
end

IPv4 = IP:new()

function IPv4:new(string_representation)
	obj = {}
	setmetatable(obj, {__index = self})

	obj.string_representation = string_representation

	if not obj:is_valid() then
		return nil
	end

	obj.octets = obj:get_octets()
	obj.numeric_representation = obj:combine_octets()
	return obj
end

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

function IP:combine_octets()
	value = 0
	for i, octet in pairs(self.octets) do
		exponent = (#self.octets-i)*8
		value = value + octet*2^exponent
	end
	return math.floor(value)
end

if arg[1] and arg[2] then
	ip1 = IPv4:new(arg[1])
	ip2 = IPv4:new(arg[2])
	if ip1 and ip2 then
		print(ip2.numeric_representation-ip1.numeric_representation)
	end
end