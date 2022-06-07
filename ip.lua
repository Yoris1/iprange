IP = {octets = {}, string_representation = "", numeric_representation = 0}

function IP:new()
	obj = {}
	setmetatable(obj, {__index = self})
	return obj
end

function IP:combine_octets()
	value = 0
	for i, octet in pairs(self.octets) do
		exponent = (#self.octets-i)*8
		value = value + octet*2^exponent
	end
	return math.floor(value)
end

function newIP(string_representation, parent)
	obj = {}
	setmetatable(obj, {__index = parent})
	obj.string_representation = string_representation
	if not obj:is_valid() then
		return nil
	end

	obj.octets = obj:get_octets()
	obj.numeric_representation = obj:combine_octets()

	return obj
end