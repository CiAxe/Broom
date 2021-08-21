--[[
    --..CiAxe..--
    
    Discord: CiAxe#0001
    Twitter: @axe_ci
    Date: 8.21.2021
]]

--..Variables..--
local Broom = {};
Broom.__index = Broom;

--..Functions..--

function Broom.new()
	do
		local self = setmetatable({}, Broom)

		self._tasks = {};

		return self
	end
end

function Broom:Give(Index, Task)
	do
		if not Index then
			warn("[Broom:GiveTask]: Index is false or nil")
		end
		if not Task then
			warn("[Broom:GiveTask]: Task is false or nil")
		end
		
		if not self._tasks[Index] then
			self._tasks[Index] = Task
		end
		
		if typeof(Task) == "Instance" then
			return Task
		end
	end
end

function Broom:Sweep(Index)
	do
		if not Index then
			warn("[Broom:Sweep]: Index is false or nil")
		end
		if self._tasks[Index] then
			local Task = self._tasks[Index]
			
			self:_Toss(Task)
		end
	end
end

function Broom:SweepAll()
	do
		for Index, Task in next, self._tasks do
			self._tasks[Index] = nil
			self:_Toss(Task)
		end
		
		self = nil
	end
end

function Broom:_Toss(Task)
	do
		if type(Task) == "function" then
			Task()
		elseif typeof(Task) == "RBXScriptConnection" then
			Task:Disconnect()
		elseif Task.Destroy then
			Task:Destroy()
		end
	end
end

return Broom
