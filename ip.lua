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

function getIPRange(ip1, ip2) 
	range = 0
	for i,octet1 in pairs(ip1.octets) do
		octet2 = ip2.octets[i]
		diff = octet2-octet1
		print(i.." "..octet1..":"..octet2.." diff: "..diff)
		
		exponent = (#ip1.octets-i)*(#ip1.octets*2)
		diff = math.floor(diff*2^exponent)
		range = range+diff
	end
	return range
end
-- issue with IP validation: can have .... at the end and it will still validate.
