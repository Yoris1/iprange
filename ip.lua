IP = {octets = {}, string_representation = ""}

function IP:new()
	obj = {}
	setmetatable(obj, {__index = self})
	return obj
end

function newIP(string_representation, parent)
	obj = {}
	setmetatable(obj, {__index = parent})
	obj.string_representation = string_representation
	if not obj:is_valid() then
		return nil
	end

	obj.octets = obj:get_octets()

	return obj
end

function IP:range_to(ip2) 
	range = 0
	for i,octet1 in pairs(self.octets) do
		octet2 = ip2.octets[i]
		diff = octet2-octet1
		exponent = (#self.octets-i)*(#self.octets*2)
		diff = math.floor(diff*2^exponent)
		range = range+diff
	end
	return range
end
