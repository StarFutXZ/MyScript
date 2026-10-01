local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local CollectionService = game:GetService("CollectionService")
local localPlayer = Players.LocalPlayer
local enemies = Workspace:WaitForChild("Enemies")
local map = Workspace:FindFirstChild("Map")
local attribute = Workspace:GetAttribute("MAP")
local flag = attribute == "Sea1"
local flag2 = attribute == "Sea2"
local flag3 = attribute == "Sea3"

if game:GetService("ReplicatedStorage").PrivateServerOwnerId.Value ~= 0 then
	return
end

local request_ = nil

if syn and syn.request then
	request_ = syn.request
elseif http_request then
	request_ = http_request
elseif http and http.request then
	request_ = http.request
else
	request_ = request or httprequest or request_
end

local function fn(arg)
	if not request_ then
		warn("[QO] No HTTP function found!")
		return nil
	end
	return request_(arg)
end

local str = "https://api.quantumonyx.cc"
local str2 = "secretkey-wqe231weqweqweqweqweqwe"
local str3 = "QnTmOnyX"

IsReady = function(arg)
	return arg and arg:FindFirstChild("Humanoid") and arg:FindFirstChild("HumanoidRootPart") and arg.Humanoid.Health > 0
end

local function fn2(arg)
	local worldOrigin = Workspace:FindFirstChild("_WorldOrigin")
	worldOrigin = worldOrigin and worldOrigin:FindFirstChild("Locations")
	local tikiOutpost = nil

	if worldOrigin then
		tikiOutpost = worldOrigin:FindFirstChild("Tiki Outpost")
	end

	if not tikiOutpost and map then
		tikiOutpost = map:FindFirstChild("Tiki Outpost") or map:FindFirstChild("TikiOutpost")
	end

	if not tikiOutpost then
		tikiOutpost = nil
	elseif typeof(tikiOutpost) == "CFrame" then
		tikiOutpost = tikiOutpost.Position
	elseif typeof(tikiOutpost) ~= "Vector3" then
		if tikiOutpost:IsA("Model") then
			tikiOutpost = tikiOutpost.PrimaryPart and tikiOutpost.PrimaryPart.Position or tikiOutpost:GetPivot().Position
		else
			tikiOutpost = tikiOutpost.Position
		end
	end

	if not arg then
		arg = nil
	elseif typeof(arg) == "CFrame" then
		arg = arg.Position
	elseif typeof(arg) ~= "Vector3" then
		if arg:IsA("Model") then
			arg = arg.PrimaryPart and arg.PrimaryPart.Position or arg:GetPivot().Position
		else
			arg = arg.Position
		end
	end

	if not tikiOutpost or not arg then
		return nil
	end
	return math.floor((arg - tikiOutpost).Magnitude)
end

local tbl = {
	["15124425041"] = "Rocket",
	["15123685330"] = "Spin",
	["15123613404"] = "Blade",
	["15123689268"] = "Spring",
	["15123595806"] = "Bomb",
	["15123677932"] = "Smoke",
	["15124220207"] = "Spike",
	["121545956771325"] = "Flame",
	["15123635706"] = "Ice",
	["15123673019"] = "Sand",
	["15123618591"] = "Dark",
	["77885466312115"] = "Eagle",
	["104164258044308"] = "Eagle",
	["115703817807141"] = "Eagle",
	["92330877901374"] = "Eagle",
	["140412727763638"] = "Eagle",
	["116175797994934"] = "Eagle",
	["125929650313762"] = "Eagle",
	["15112600534"] = "Diamond",
	["15123640714"] = "Light",
	["15123668008"] = "Rubber",
	["15123662036"] = "Ghost",
	["15123645682"] = "Magma",
	["15123659223"] = "Quake",
	["15123606541"] = "Buddha",
	["15100313696"] = "Buddha",
	["15123643097"] = "Love",
	["116828771482820"] = "Creation",
	["115462995299384"] = "Creation",
	["137656801165733"] = "Creation",
	["108425658611774"] = "Creation",
	["111759706483783"] = "Creation",
	["97124048109653"] = "Creation",
	["70881482165206"] = "Creation",
	["15123681598"] = "Spider",
	["15123679712"] = "Sound",
	["15123654553"] = "Phoenix",
	["15123656798"] = "Portal",
	["15123670514"] = "Lightning",
	["15123652069"] = "Pain",
	["15123587371"] = "Blizzard",
	["15123633312"] = "Gravity",
	["15123648309"] = "Mammoth",
	["14661837634"] = "Mammoth",
	["15694681122"] = "T-Rex",
	["15123624401"] = "Dough",
	["15123675904"] = "Shadow",
	["10773719142"] = "Venom",
	["118054805452821"] = "Gas",
	["104856271432800"] = "Gas",
	["11911905519"] = "Spirit",
	["94006198119776"] = "Tiger",
	["80670192030381"] = "Tiger",
	["132341855488805"] = "Tiger",
	["79732160844822"] = "Tiger",
	["116028810606047"] = "Tiger",
	["121749335304244"] = "Tiger",
	["99049288828561"] = "Tiger",
	["73861360346938"] = "Tiger",
	["118911296874650"] = "Tiger",
	["139071042378135"] = "Tiger",
	["119072421589354"] = "Tiger",
	["78523331136291"] = "Tiger",
	["95633780504600"] = "Tiger",
	["15123638064"] = "Tiger",
	["115276580506154"] = "Yeti",
	["101378450824208"] = "Yeti",
	["15487764876"] = "Kitsune",
	["15482881956"] = "Kitsune",
	["15482881888"] = "Kitsune",
	["15482881962"] = "Kitsune",
	["15482881967"] = "Kitsune",
	["15482881910"] = "Kitsune",
	["15482881907"] = "Kitsune",
	["121982453080224"] = "Control",
	["91364186483184"] = "Control",
	["89745128079512"] = "Control",
	["78720366879931"] = "Control",
	["127508816572084"] = "Control",
	["113083898554637"] = "Control",
	["119304463491572"] = "Control",
	["90545150537446"] = "Control",
	["115917455020832"] = "Control",
	["87568890802647"] = "Control",
	["121332674491298"] = "Control",
	["81733441695721"] = "Control",
	["112993897514368"] = "Control",
	["70787028184100"] = "Control",
	["90340382070779"] = "Control",
	["76533257082993"] = "Control",
	["106034479309709"] = "Control",
	["133003579772395"] = "Control",
	["107443979453792"] = "Control",
	["78841069420154"] = "Control",
	["104845568970309"] = "Control",
	["130002991386896"] = "Control",
	["93043841632966"] = "Control",
	["116461547625166"] = "Control",
	["132635844357070"] = "Control",
	["107388226920083"] = "Control",
	["94578806515177"] = "Control",
	["102115204234236"] = "Control",
	["15123616275"] = "Control",
	["95749033139458"] = "Dragon East",
	["95746827929258"] = "Dragon East",
	["96238290310071"] = "Dragon East",
	["106721528646960"] = "Dragon West",
	["130723287037570"] = "Dragon West",
	["122911500223006"] = "Dragon West",
	["82028055099848"] = "Dragon West",
	["84013034085846"] = "Dragon West",
	["106354002177250"] = "Dragon West",
}

for k, v in pairs(tbl) do
	tbl["rbxassetid://" .. k] = v
end

local obj = setmetatable({}, { __mode = "k" })

local function fn3(arg)
	if type(arg) ~= "string" then
		return nil
	end
	return arg:match("%d+")
end

local function fn4(arg)
	if not arg or arg == "" then
		return nil
	end

	if tbl[arg] then
		return tbl[arg]
	end
	local v = fn3(arg)
	if v and tbl[v] then
		return tbl[v]
	end

	if v and tbl["rbxassetid://" .. v] then
		return tbl["rbxassetid://" .. v]
	end
	return nil
end

local function fn5(arg)
	if not arg or not arg.Parent then
		return "Fruit [Spawned]"
	end
	local name = arg.Name
	if name ~= "Fruit " and name ~= "Fruit" and name ~= "" then
		return name
	end

	if obj[arg] then
		return obj[arg]
	end

	for _, v in ipairs({ "OriginalName", "FruitName", "Fruit", "DisplayName", "ItemName" }) do
		local attribute2 = arg:GetAttribute(v)

		if type(attribute2) == "string" and #attribute2 > 0 and attribute2 ~= "Fruit " and attribute2 ~= "Fruit" then
			local str4 = "Fruit [" .. attribute2 .. "] Spawned"
			obj[arg] = str4
			return str4
		end
	end

	local descendants = arg:GetDescendants()

	for _, descendant in ipairs(descendants) do
		if descendant:IsA("Animation") then
			local v = fn4(descendant.AnimationId)

			if v then
				local str4 = "Fruit [" .. v .. "] Spawned"
				obj[arg] = str4
				return str4
			end
		end
	end

	for _, descendant in ipairs(descendants) do
		if descendant:IsA("MeshPart") then
			local v = fn4(descendant.MeshId) or fn4(descendant.TextureID)

			if v then
				local str4 = "Fruit [" .. v .. "] Spawned"
				obj[arg] = str4
				return str4
			end

			continue
		end

		if descendant:IsA("SpecialMesh") then
			local v = fn4(descendant.MeshId) or fn4(descendant.TextureId)

			if v then
				local str4 = "Fruit [" .. v .. "] Spawned"
				obj[arg] = str4
				return str4
			end

			continue
		end

		if descendant:IsA("Decal") or descendant:IsA("Texture") then
			local v = fn4(descendant.Texture)

			if v then
				local str4 = "Fruit [" .. v .. "] Spawned"
				obj[arg] = str4
				return str4
			end
		end
	end

	for _, descendant in ipairs(descendants) do
		local name2 = descendant.Name

		if name2:find("Fruit") and name2 ~= "Fruit " and name2 ~= "Fruit" then
			local str4 = "Fruit [" .. (name2:match("^(.-)%s*Fruit") or name2) .. "] Spawned"
			obj[arg] = str4
			return str4
		end
	end

	return "Fruit di ko alam [Spawned]"
end

local n = 200

local function fn6(arg)
	local players = Players:GetPlayers()
	local tbl2 = {}

	for _, player in ipairs(players) do
		if player ~= localPlayer then
			local character = player.Character
			character = character and character:FindFirstChild("HumanoidRootPart")

			if character then
				local n2 = math.floor((character.Position - arg).Magnitude)

				if n2 <= n then
					table.insert(tbl2, { name = player.Name, distance = n2 })
				end
			end
		end
	end

	table.sort(tbl2, function(arg2, arg3)
		return arg2.distance < arg3.distance
	end)

	return tbl2
end

local function fn7(arg, arg2)
	if localPlayer.Character then
		localPlayer.Character:FindFirstChild("HumanoidRootPart")
	end

	local characters = Workspace:FindFirstChild("Characters")

	for _, descendant in ipairs(arg:GetDescendants()) do
		if descendant:IsA("Model") and (descendant.Name == "Fruit " or descendant.Name:sub(1, 6) == "Fruit ") then
			local humanoidRootPart = descendant:FindFirstChild("HumanoidRootPart") or descendant.PrimaryPart

			if humanoidRootPart then
				local name = nil

				if characters then
					local parent = descendant.Parent

					while true do
						local flag4 = parent and parent ~= Workspace
						name = nil

						if flag4 then
							if parent.Parent == characters then
								name = parent.Name
								break
							else
								parent = parent.Parent
								continue
							end
						end

						break
					end
				end

				if not (name ~= nil and localPlayer.Character ~= nil and name == localPlayer.Character.Name) then
					local position = humanoidRootPart.Position
					local v = fn5(descendant)
					local v2 = fn6(position)

					table.insert(arg2, {
						name = v,
						position = string.format("%.0f, %.0f, %.0f", position.X, position.Y, position.Z),
						nearbyPlayers = v2,
						onCharacter = name,
						sea = flag and "Sea 1" or flag2 and "Sea 2" or flag3 and "Sea 3" or "Unknown",
					})
				end
			end
		end
	end
end

local function fn8()
	local tbl2 = {}
	fn7(Workspace, tbl2)
	local characters = Workspace:FindFirstChild("Characters")

	if characters then
		fn7(characters, tbl2)
	end

	if #tbl2 > 0 then
		return tbl2
	end
	return nil
end

local function fn9(arg)
	if map then
		local v = map:FindFirstChild(arg)
		if v then
			return v
		end
	end

	local worldOrigin = Workspace:FindFirstChild("_WorldOrigin")
	worldOrigin = worldOrigin and worldOrigin:FindFirstChild("Locations")

	if worldOrigin then
		local v = worldOrigin:FindFirstChild(arg)
		if v then
			return v
		end
	end

	return nil
end

local function fn10()
	if flag3 then
		local sky = Lighting:FindFirstChild("Sky")
		return sky and sky.MoonTextureId
	end
	local sky = Lighting:FindFirstChildWhichIsA("Sky")
	return sky and sky.MoonTextureId
end

local str4 = "http://www.roblox.com/asset/?id=9709149431"
local str5 = "http://www.roblox.com/asset/?id=9709149052"

local function fn11()
	local v = fn10()
	if v == str4 then
		return "Full Moon"
	end

	if v == str5 then
		return "Next Night"
	end
	return "Bad Moon"
end

local function fn12()
	local clockTime = Lighting.ClockTime
	return clockTime >= 6 and clockTime < 18 and "Day" or "Night"
end

local function fn13()
	local v = fn11()
	local clockTime = Lighting.ClockTime
	local n2 = math.floor(clockTime)

	if v == "Full Moon" then
		if clockTime <= 5 then
			return string.format("%d:00 (Will End Moon In %d min)", n2, math.floor(5 - clockTime))
		end

		if clockTime < 12 then
			return string.format("%d:00 (Fake Moon)", n2)
		end

		if clockTime < 18 then
			return string.format("%d:00 (Will Full Moon In %d min)", n2, math.floor(18 - clockTime))
		end
		return string.format("%d:00 (Will End Moon In %d min)", n2, math.floor(30 - clockTime))
	end

	if v == "Next Night" then
		if clockTime < 12 then
			return string.format("%d:00 (Will Full Moon In %d min)", n2, math.floor(18 - clockTime))
		end
		return string.format("%d:00 (Will Full Moon In %d min)", n2, math.floor(30 - clockTime))
	end

	return tostring(n2) .. ":00"
end

local function fn14()
	local clockTime = Lighting.ClockTime
	if fn11() == "Next Night" and (clockTime >= 17 and clockTime < 18 or clockTime < 5) then
		return true
	end
	return false
end

local function fn15()
	local commF = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_")
	if not commF then
		return nil
	end

	local ok, result = pcall(function()
		return commF:InvokeServer("LegendarySwordDealer", "1")
	end)

	if ok and result and type(result) == "string" then
		return result
	end
	return nil
end

local tbl2 = { ["Snow White"] = true, ["Pure Red"] = true, ["Winter Sky"] = true }

local function fn16()
	local commF = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_")
	if not commF then
		return nil
	end

	local ok, result = pcall(function()
		return commF:InvokeServer("ColorsDealer", "1")
	end)

	if not ok then
		return nil
	end

	if result == 1 then
		return nil
	end

	if not result or type(result) ~= "string" then
		return nil
	end

	if tbl2[result] then
		return result
	end
	return nil
end

GetConnectMon = function(arg, arg2)
	local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
	local flag4 = type(arg) == "table"
	local flag5 = type(arg) == "string"
	if arg2 and not humanoidRootPart then
		return nil
	end
	local huge = math.huge
	local v = nil

	for _, v2 in ipairs({ enemies, ReplicatedStorage }) do
		for _, child in ipairs(v2:GetChildren()) do
			if flag5 then
				if child.Name ~= arg then
					continue
				end

				if IsReady(child) then
					if not arg2 then
						return child
					end
					local humanoidRootPart2 = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart

					if humanoidRootPart2 then
						local magnitude = (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude

						if magnitude < huge then
							huge = magnitude
							v = child
						end
					end

					continue
				end

				continue
			end

			if flag4 then
				if arg[child.Name] == true then
					if IsReady(child) then
						if not arg2 then
							return child
						end
						local humanoidRootPart2 = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart

						if humanoidRootPart2 then
							local magnitude = (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude

							if magnitude < huge then
								huge = magnitude
								v = child
							end
						end

						continue
					end

					continue
				end

				if table.find(arg, child.Name) == nil then
					continue
				end

				if IsReady(child) then
					if not arg2 then
						return child
					end
					local humanoidRootPart2 = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart

					if humanoidRootPart2 then
						local magnitude = (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude

						if magnitude < huge then
							huge = magnitude
							v = child
						end
					end
				end
			end
		end
	end

	return v
end

local function fn17(arg, arg2)
	return (arg + ("QnTmOnyX"):byte((arg2 - 1) % #str3 + 1) + arg2) % 32
end

local function fn18(arg)
	local tbl3 = {}

	for i = 1, #arg do
		local v = arg:byte(i)
		local v2 = fn17(v % 32, i)
		local v3 = fn17(math.floor(v / 32), i + 100)
		table.insert(tbl3, ("kQ9mZ2xW7nR4vB1jY6tF3hD8pL5cG0sA"):sub(v2 + 1, v2 + 1))
		table.insert(tbl3, ("kQ9mZ2xW7nR4vB1jY6tF3hD8pL5cG0sA"):sub(v3 + 1, v3 + 1))
	end

	local str6 = table.concat(tbl3)
	local tbl4 = {}

	for i = 1, #str6 do
		table.insert(tbl4, str6:sub(i, i))

		if i % 4 == 0 and i ~= #str6 then
			local v = ("kQ9mZ2xW7nR4vB1jY6tF3hD8pL5cG0sA"):byte((i * 7 + 13) % 32 + 1)
			table.insert(tbl4, string.char(v))
		end
	end

	return "." .. table.concat(tbl4) .. "."
end

local tbl3 = {
	fullmoon = 0,
	nearfullmoon = 0,
	greybeard = 60,
	darkbeard = 60,
	cursedcaptain = 60,
	ripindra = 60,
	soulreaper = 60,
	cakeprince = 60,
	doughking = 60,
	tyrant = 60,
	factory = 60,
	pirate = 60,
	elites = 10,
	prehistoric = 10,
	mirage = 10,
	kitsune = 10,
	legendarysword = 10,
	legendaryhaki = 10,
	berry = 10,
	fourhours = 20,
	fruit = 10,
}

local tbl4 = {
	fullmoon = "/api/fullmoon",
	nearfullmoon = "/api/nearfullmoon",
	greybeard = "/api/greybeard",
	darkbeard = "/api/darkbeard",
	cursedcaptain = "/api/cursedcaptain",
	ripindra = "/api/ripindra",
	soulreaper = "/api/soulreaper",
	cakeprince = "/api/cakeprince",
	doughking = "/api/doughking",
	tyrant = "/api/tyrant",
	factory = "/api/factory",
	pirate = "/api/pirate",
	elites = "/api/elites",
	mirage = "/api/mirage",
	prehistoric = "/api/prehistoric",
	kitsune = "/api/kitsune",
	legendarysword = "/api/legendarysword",
	legendaryhaki = "/api/legendaryhaki",
	berry = "/api/berry",
	fourhours = "/api/fourhours",
	fruit = "/api/fruit",
}

local function fn19(arg, arg2)
	local v = tbl4[arg]
	if not v then
		return false
	end

	local ok, result = pcall(function()
		local tbl5 = {
			placeId = tostring(game.PlaceId),
			jobId = fn18(tostring(game.JobId)),
			players = #Players:GetPlayers(),
			maxPlayers = 12,
		}

		if arg2 and type(arg2) == "table" then
			for k, v2 in pairs(arg2) do
				tbl5[k] = v2
			end
		end

		local v2 = fn({
			Url = str .. v,
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json", ["x-qo-token"] = str2 },
			Body = HttpService:JSONEncode(tbl5),
		})

		if v2 and v2.StatusCode and v2.StatusCode >= 200 and v2.StatusCode < 300 then
			return true
		end
		return false
	end)

	if not ok then
		return false
	end
	return result
end

local tbl5 = {}
local tbl6 = {}

local function fn20(arg, arg2)
	local n2 = tbl3[arg] or 0
	local flag4

	if n2 == 0 then
		flag4 = tbl5[arg] ~= nil
	else
		flag4 = tbl5[arg] ~= nil

		if flag4 then
			local v = tbl5[arg]
			flag4 = os.clock() - v < n2
		end
	end

	if flag4 then
		return false
	end

	if tbl6[arg] == arg2 then
		return false
	end
	return true
end

local function fn21(arg, arg2)
	tbl5[arg] = os.clock()
	tbl6[arg] = arg2

	if tbl3[arg] < 300 then
		tbl3[arg] = 300
	end
end

Checkelites = function()
	for _, v in ipairs({ "Urban", "Deandre", "Diablo" }) do
		if GetConnectMon(v) then
			return v
		end
	end
end

local function fn22()
	for _, v in ipairs(CollectionService:GetTagged("BerryBush")) do
		if v and v.Parent then
			for _, v2 in pairs(v:GetAttributes()) do
				if typeof(v2) == "string" and v2 ~= "" then
					return v2
				end
			end
		end
	end

	return nil
end

local tbl7 = {
	{
		key = "fullmoon",
		check = function()
			if not flag3 then
				return false
			end
			local v = fn11()
			if v ~= "Full Moon" then
				return false
			end
			local clockTime = Lighting.ClockTime
			if not (clockTime > 18 or clockTime < 5) then
				return false
			end
			return true, { moonStatus = v, cycleInfo = fn13(), timeOfDay = fn12() }
		end,
	},
	{
		key = "nearfullmoon",
		check = function()
			if not flag3 then
				return false
			end

			if not fn14() then
				return false
			end
			local clockTime = Lighting.ClockTime

			return true, {
				moonStatus = fn11(),
				cycleInfo = string.format("%d:00 (Will Full Moon In %d min)", math.floor(clockTime), clockTime < 18 and math.floor(18 - clockTime) or math.floor(30 - clockTime)),
				timeOfDay = fn12(),
			}
		end,
	},
	{
		key = "greybeard",
		check = function()
			if GetConnectMon("Greybeard") then
				return true, "Greybeard"
			end
			return false
		end,
	},
	{
		key = "darkbeard",
		check = function()
			if GetConnectMon("Darkbeard") then
				return true, "Darkbeard"
			end
			return false
		end,
	},
	{
		key = "cursedcaptain",
		check = function()
			if GetConnectMon("Cursed Captain") then
				return true, "Cursed Captain"
			end
			return false
		end,
	},
	{
		key = "ripindra",
		check = function()
			if GetConnectMon("rip_indra True Form") then
				return true, "rip_indra"
			end
			return false
		end,
	},
	{
		key = "elites",
		check = function()
			if Checkelites() then
				return true, "Elite Hunter"
			end
			return false
		end,
	},
	{
		key = "soulreaper",
		check = function()
			if GetConnectMon("Soul Reaper") then
				return true, "Soul Reaper"
			end
			return false
		end,
	},
	{
		key = "cakeprince",
		check = function()
			if GetConnectMon("Cake Prince") then
				return true, "Cake Prince"
			end
			return false
		end,
	},
	{
		key = "doughking",
		check = function()
			if GetConnectMon("Dough King") then
				return true, "Dough King"
			end
			return false
		end,
	},
	{
		key = "tyrant",
		check = function()
			if GetConnectMon("Tyrant of the Skies") then
				return true, "Tyrant"
			end
			return false
		end,
	},
	{
		key = "mirage",
		check = function()
			local MysticIsland = fn9("MysticIsland") or fn9("Mirage Island")
			if not MysticIsland then
				return false
			end
			return true, { timeOfDay = fn12(), distanceFromTiki = fn2(MysticIsland) }
		end,
	},
	{
		key = "prehistoric",
		check = function()
			local PrehistoricIsland = fn9("PrehistoricIsland") or fn9("Prehistoric Island")
			if not PrehistoricIsland then
				return false
			end
			return true, { timeOfDay = fn12(), distanceFromTiki = fn2(PrehistoricIsland) }
		end,
	},
	{
		key = "kitsune",
		check = function()
			local KitsuneIsland = fn9("KitsuneIsland") or fn9("Kitsune Island")
			if not KitsuneIsland then
				return false
			end
			return true, { timeOfDay = fn12(), distanceFromTiki = fn2(KitsuneIsland) }
		end,
	},
	{
		key = "factory",
		check = function()
			local children = localPlayer.PlayerGui.Notifications:GetChildren()

			for _, child in pairs(children) do
				for _, child2 in pairs(child:GetChildren()) do
					if child2:IsA("TextLabel") and string.find(child2.Text, "We are breaching the factory in 30 seconds") then
						return true, child2.Text
					end
				end
			end

			return false
		end,
	},
	{
		key = "pirate",
		check = function()
			local children = localPlayer.PlayerGui.Notifications:GetChildren()

			for _, child in pairs(children) do
				for _, child2 in pairs(child:GetChildren()) do
					if child2:IsA("TextLabel") and string.find(child2.Text, "Pirates have been spotted approaching the castle") then
						return true, child2.Text
					end
				end
			end

			return false
		end,
	},
	{
		key = "fruit",
		check = function()
			local v = fn8()
			if v then
				return true, { fruits = v }
			end
			return false
		end,
	},
	{
		key = "legendarysword",
		check = function()
			local v = fn15()
			if v then
				return true, { sword = v }
			end
			return false
		end,
	},
	{
		key = "legendaryhaki",
		check = function()
			local v = fn16()
			if v then
				return true, { haki = v }
			end
			return false
		end,
	},
	{
		key = "fourhours",
		check = function()
			if not (flag2 or flag3) then
				return false
			end
			local locations = Workspace:FindFirstChild("_WorldOrigin") and Workspace._WorldOrigin:FindFirstChild("Locations")
			if not locations then
				return false
			end
			local v = nil

			for _, child in ipairs(locations:GetChildren()) do
				local attribute2 = child:GetAttribute("TimeIn")

				if attribute2 and attribute2 > 1.7e9 then
					if v == nil or attribute2 < v then
						v = attribute2
					end
				end
			end

			if not v then
				return false
			end
			local n2 = os.time() - v
			local n3 = math.floor(n2 / 3600)
			if n3 ~= 4 then
				return false
			end
			local n4 = math.floor(n2 % 3600 / 60)
			local n5 = math.floor(n2 % 60)
			return true, { uptime = string.format("%dh %dm %ds", n3, n4, n5), sea = flag2 and "2" or "3" }
		end,
	},
}

task.spawn(function()
	while true do
		for _, v in ipairs(tbl7) do
			local v2, v3 = v.check()

			if v2 and fn20(v.key, v3) then
				if fn19(v.key, v3) then
					fn21(v.key, v3)
				end
			end
		end

		local v = fn22()

		if v and fn20("berry", v) then
			if fn19("berry", { berry = v }) then
				fn21("berry", v)
			end
		end

		task.wait(10)
	end
end)
