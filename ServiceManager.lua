local ServiceManager = {}
ServiceManager.__index = ServiceManager

function ServiceManager.CreateService(Data)
	local self = setmetatable({}, ServiceManager)
	
	self.Data = Data
	
	self.Functions = {}
	self.Variables = {}
	
	self:Init()
	
	return self
end

function ServiceManager:Init()
	if self.Data["Functions"] then
		for Name, Function in pairs(self.Data["Functions"]) do
			self.Functions[Name] = Function
		end
	end
	
	if self.Data["Variables"] then
		for Name, Value in pairs(self.Data["Variables"]) do
			self.Variables[Name] = Value
		end
	end
end

function ServiceManager:CallFunction(Name, ...)
	local Function = self.Functions[Name](...)
	return Function or nil
end

return ServiceManager
