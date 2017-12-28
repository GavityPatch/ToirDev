local Path = SCRIPT_PATH .. "\\Lib\\TOIR_SDK.lua"
local C = { "LeBlanc", "Thresh", "Cassiopeia" } -- "Yasuo", -- Katarina, -- Lux, -- MF...


local function PrintChat(msg)
	return __PrintTextGame("<b><font color=\"#ffffff\">[ChupGoleAIO] </font></b> </font><font color=\"#c5eff7\"> " .. msg .. " </font><b><font color=\"#ffffff\"></font></b> </font>")
end

local function FileExists(path)
	local f = io.open(path, "r")

	if f then 
		io.close(f) 
		return true 
	else 
		return false 
	end
end

function OnLoad()
	if FileExists(Path) then
		IncludeFile("Lib\\TOIR_SDK.lua")

		if SDK_VERSION and type(SDK_VERSION) == "number" then
			if SDK_VERSION == 0.4 then
				PrintChat("TOIR_SDK.lua loaded (v" .. SDK_VERSION .. ")")
			else
				PrintChat("You are used outdated TOIR_SDK.lua, please update it.")
				return
			end
		else
			PrintChat("Redownload TOIR_SDK.lua")
		end
	else
		function OnTick() end
		PrintChat("TOIR_SDK.lua was not found.")
		return 
	end

	local enemyData = {}

	for i, enemy in pairs(GetEnemyHeroes()) do
		if enemy then
			if enemyData ~= {} then
				enemyData[GetId(enemy)] = { Addr = enemy, CharName = GetChampName(enemy), Id = GetId(enemy) }
			end
		end
	end

	ChupGoleAIO_LeBlanc = class()
	ChupGoleAIO_Thresh = class()
	ChupGoleAIO_Cassiopeia = class()
    
    -- LeBlanc
    function ChupGoleAIO_LeBlanc:__init()
		SetLuaCombo(true)

		--Main Menu
		self.menu = menuInst.addItem(SubMenu.new("LeBlanc", Lua_ARGB(255, 100, 250, 50)))

		--TS
		self.menu_ts = TargetSelector(1750, 1, myHero, true, self.menu, true)

		--Combo Menu
		self.menu_combo = self.menu.addItem(SubMenu.new("Combo"))
		self.menu_combo_q = self.menu_combo.addItem(MenuBool.new("Use Q", true))
		self.menu_combo_w = self.menu_combo.addItem(MenuBool.new("Use W", true))
        self.menu_combo_e = self.menu_combo.addItem(MenuBool.new("Use E", true))
        self.menu_combo_r = self.menu_combo.addItem(MenuBool.new("Use R", true))
		self.menu_combo_e_mode = self.menu_combo.addItem(MenuStringList.new("R Mode", { "R + Q  ", "R + W", "R + E " }, 1))
		self.menu_combo_prio = self.menu_combo.addItem(MenuStringList.new("Spell Priority", { "Q ", "W ", "E " }, 3))

		--Key Menu
		self.menu_key = self.menu.addItem(SubMenu.new("Keybinds"))
		self.menu_key_combo = self.menu_key.addItem(MenuKeyBind.new("Combo", 32))

		--Spells
		self.Q = Spell(_Q, 700)
		self.W = Spell(_W, 600)
		self.E = Spell(_E, 925)

		self.Q:SetTargetted()
		self.W:SetSkillShot(0.30, 1600, 80, true)
		self.E:SetSkillShot()

		local UltiOn = false
		local RWReturn, WReturn, Passive = false, false, {}
		local ETick, RTick, T, RT, Tick  = 0, 0, 0, 0, 0
		local RW,NW = {}, {}

		--Callbacks
		Callback.Add("CreateObject", function(...) self:OnCreateObject(...) end)
		Callback.Add("DeleteObject", function(...) self:OnDeleteObject(...) end)
		Callback.Add("UpdateBuff", function(...) self:OnUpdateBuff(...) end)
		Callback.Add("RemoveBuff", function(...) self:OnRemoveBuff(...) end)


		PrintChat("LeBlanc loaded.")
	end
	
	function ChupGoleAIO_LeBlanc:OnUpdateBuff(unit, buff)
		if not unit or not buff then return end
		
			if unit.isMe then
				if buff.Name == "LeblancR"  then UltiOn   = true end
		
				if buff.Name == "LeblancW"  then WReturn  = true end
		
				if buff.Name == "LeblancRW" then RWReturn = true end
			end
		end

	function ChupGoleAIO_LeBlanc:OnRemoveBuff(unit, buff)
		if not unit or not buff then return end
		
			if unit.isMe then
				if buff.Name == "LeblancR"  then UltiOn   = false end
		
				if buff.Name == "LeblancW"  then WReturn  = false end
		
				if buff.Name == "LeblancRW" then RWReturn = false end
			end
		end

	function ChupGoleAIO_LeBlanc:OnCreateObject(Obj)
		if not Obj then return end
		
			if Obj.name == "LeBlanc_Base_W_return_indicator.troy" and not Obj.dead then
				table.insert(NW, Obj)
				T = GetTickCount()
			end
		
			if Obj.name == "LeBlanc_Base_RW_return_indicator.troy" and not Obj.dead then
				table.insert(RW, Obj)
				RT = GetTickCount()
			end
		
			if Obj.name == "LeBlanc_Base_P_Tar_Mark.troy" and not Obj.dead then
				DelayAction(function() table.insert(Passive, Obj) end, 1.5)
			end
		end

	function ChupGoleAIO_LeBlanc:OnDeleteObject(Obj)
		if not Obj then return end
		
			for _, W in pairs(NW) do
				if W == Obj then
					table.remove(NW, _)
					T = 0
				end
			end
		
			for _, W in pairs(RW) do
				if W == Obj then
					table.remove(RW, _)
					RT = 0
				end
			end
		
			for _, P in pairs(Passive) do
				if P == Obj then
					table.remove(Passive, _)
				end
			end
		end

	function ChupGoleAIO_Thresh:__init()

		self.menu = menuInst.addItem(SubMenu.new("Thresh", Lua_ARGB(255, 100, 250, 50)))
		
		--TS
		self.menu_ts = TargetSelector(1500, 1, myHero, true, self.menu, true)
		
		--Combo
		self.menu_combo = self.menu.addItem(SubMenu.new("Combo"))
		self.menu_combo_q = self.menu_combo.addItem(MenuBool.new("Use Q", true))
		self.menu_combo_w = self.menu_combo.addItem(MenuBool.new("Use W", true))
		self.menu_combo_e = self.menu_combo.addItem(MenuBool.new("Use E", true))
		self.menu_combo_r = self.menu_combo.addItem(MenuBool.new("Use R", true))

		--Draw
		self.menu_draw = self.menu.addItem(SubMenu.new("Drawings"))
		self.menu_draw_q = self.menu_draw.addItem(MenuBool.new("Draw Q Range", true))
		self.menu_draw_w = self.menu_draw.addItem(MenuBool.new("Draw W Range", true))
		self.menu_draw_e = self.menu_draw.addItem(MenuBool.new("Draw E Range", true))
		self.menu_draw_disable = self.menu_draw.addItem(MenuBool.new("Disable All Drawings", false))

		self.Q = Spell(_Q, 1075)
		self.W = Spell(_W, 950)
		self.E = Spell(_E, 400)
		self.R = Spell(_R, 450)
		self.Q:SetSkillShot()
		self.W:SetSkillShot()
		self.E:SetSkillShot()
		self.R:SetActive()

		Callback.Add("Draw", function() self:OnDraw() end)

		PrintChat("Thresh loaded.")

	end

	function ChupGoleAIO_Thresh:OnDraw()
		if self.menu_draw_disable.getValue() then return end

        	if self.menu_draw_q.getValue() and CanCast(_Q) then
        		DrawCircleGame(myHero.x, myHero.y, myHero.z, self.Q.range, Lua_ARGB(255, 100, 100, 100))
        	end

        	if self.menu_draw_w.getValue() and CanCast(_W) then
        		DrawCircleGame(myHero.x, myHero.y, myHero.z, self.W.range, Lua_ARGB(255, 100, 100, 100))
        	end

        	if self.menu_draw_e.getValue() and CanCast(_E) then
        		DrawCircleGame(myHero.x, myHero.y, myHero.z, self.E.range, Lua_ARGB(255, 100, 100, 100))
        	end
	end


	function ChupGoleAIO_Cassiopeia:__init()
		
		self.menu = menuInst.addItem(SubMenu.new("Cassiopeia", Lua_ARGB(255, 100, 250, 50)))
				
				--TS
		self.menu_ts = TargetSelector(1500, 1, myHero, true, self.menu, true)
				
				--Combo
		self.menu_combo = self.menu.addItem(SubMenu.new("Combo"))
		self.menu_combo_q = self.menu_combo.addItem(MenuBool.new("Use Q", true))
		self.menu_combo_w = self.menu_combo.addItem(MenuBool.new("Use W", true))
		self.menu_combo_e = self.menu_combo.addItem(MenuBool.new("Use E", true))
		self.menu_combo_r = self.menu_combo.addItem(MenuBool.new("Use R", true))
		
		self.menu_combo = self.menu.addItem(SubMenu.new("Jungle and Lane = Clear"))
		self.menu_combo_q = self.menu_combo.addItem(MenuBool.new("Use Q", true))
		self.menu_combo_w = self.menu_combo.addItem(MenuBool.new("Use W", true))
		self.menu_combo_e = self.menu_combo.addItem(MenuBool.new("Use E", true))

				--Draw
		self.menu_draw = self.menu.addItem(SubMenu.new("Drawings"))
		self.menu_draw_q = self.menu_draw.addItem(MenuBool.new("Draw Q Range", true))
		self.menu_draw_w = self.menu_draw.addItem(MenuBool.new("Draw W Range", true))
		self.menu_draw_e = self.menu_draw.addItem(MenuBool.new("Draw E Range", true))
		self.menu_draw_disable = self.menu_draw.addItem(MenuBool.new("Disable All Drawings", false))
		
		self.Q = Spell(_Q, 850)
		self.W = Spell(_W, 800)
		self.E = Spell(_E, 700)
		self.R = Spell(_R, 825)
		self.Q:SetSkillShot()
		self.W:SetSkillShot()
		self.E:SetSkillShot()
		self.R:SetSkillShot()
		
		Callback.Add("Draw", function() self:OnDraw() end)
			--Callback.Add("Tick", function() self:OnTick() end)

			-- Combo Download Sucess: Me gitHub Combo download!
		
		PrintChat("Cassipeia loaded.")
		
	end
		
	function ChupGoleAIO_Cassiopeia:OnDraw()
			if self.menu_draw_disable.getValue() then return end
		
			if self.menu_draw_q.getValue() and CanCast(_Q) then
				DrawCircleGame(myHero.x, myHero.y, myHero.z, self.Q.range, Lua_ARGB(255, 100, 100, 100))
			end
		
			if self.menu_draw_w.getValue() and CanCast(_W) then
				DrawCircleGame(myHero.x, myHero.y, myHero.z, self.W.range, Lua_ARGB(255, 100, 100, 100))
			end
		
			if self.menu_draw_e.getValue() and CanCast(_E) then
				DrawCircleGame(myHero.x, myHero.y, myHero.z, self.E.range, Lua_ARGB(255, 100, 100, 100))
				end
			end


		
if table.contains(C, myHero.CharName) then
    if _G["ChupGoleAIO_" .. myHero.CharName] then
        _G["ChupGoleAIO_" .. myHero.CharName]()
    end
end

menuInstSep.setValue("ChupGoleAIO")
menuInst.addItem(MenuSeparator.new("LoL Version: 7.24"))
end

