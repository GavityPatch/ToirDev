IncludeFile("Lib\\TOIR_SDK.lua")

Zoe = class()

function OnLoad()
	if GetChampName(GetMyChamp()) == "Zoe" then
		Zoe:__init()
	end
end

function Zoe:__init()

    self.menu_ts = TargetSelector(1750, 0, myHero, true, true, true)

	vpred = VPrediction(true)
    self.MissileSpellsData = {}
	self.Bolagrande = {}
	
	self.objList = {}
	self.trackList = {}
	---self.passtiveList = {["Zoe_Base_Q_Mis_Linger"]}

	self.QCasted = {}
	self.EnemyData = {}
	self.MissileSpellsData = {}
	self.QMilles = true

    self:MenuZoe()

	self.Spells =
	{
    ["katarinar"] 					= {},
    ["drain"] 						= {},
    ["consume"] 					= {},
    ["absolutezero"] 				= {},
    ["staticfield"] 				= {},
    ["reapthewhirlwind"] 			= {},
    ["jinxw"] 						= {},
    ["jinxr"] 						= {},
    ["shenstandunited"] 			= {},
    ["threshe"] 					= {},
    ["threshrpenta"] 				= {},
    ["threshq"] 					= {},
    ["meditate"] 					= {},
    ["caitlynpiltoverpeacemaker"] 	= {},
    ["volibearqattack"] 			= {},
    ["cassiopeiapetrifyinggaze"] 	= {},
    ["ezrealtrueshotbarrage"] 		= {},
    ["galioidolofdurand"] 			= {},
    ["luxmalicecannon"] 			= {},
    ["missfortunebullettime"] 		= {},
    ["infiniteduress"]				= {},
    ["alzaharnethergrasp"] 			= {},
    ["lucianq"] 					= {},
    ["velkozr"] 					= {},
    ["rocketgrabmissile"] 			= {},
	}

	self.Q = Spell(_Q, 900)
    self.W = Spell(_W, 150)
    self.E = Spell(_E, 725)
    self.R = Spell(_R, 1450)
	self.Q:SetSkillShot(0.25, 1500, 100, true)
    self.W:SetActive()
    self.E:SetSkillShot(0.25, 2100, 100, true)
    self.R:SetSkillShot(0.25, 500, 100, true)

    Callback.Add("Tick", function(...) self:OnTick(...) end)
	Callback.Add("DrawMenu", function(...) self:OnDrawMenu(...) end)
	Callback.Add("ProcessSpell", function(...) self:OnProcessSpell(...) end)
	Callback.Add("CreateObject", function(...) self:OnCreateObject(...) end)
	Callback.Add("DeleteObject", function(...) self:OnDeleteObject(...) end)

end 

function Zoe:MenuZoe()
	self.menu = "Zoe"
	self.Use_Combo_Q = self:MenuBool("Use Combo Q", true)
	self.Auto_Q_End_Dash = self:MenuBool("Use Q", true)
	self.Auto_Q_Kill_Steal = self:MenuBool("Auto Q Kill Steal", true)
	self.RangeQ = self:MenuSliderInt("Range Q + R ", 1600)

	self.Use_Combo_W = self:MenuBool("Use Combo W", false)
	self.Use_W_Anti_GapClose = self:MenuBool("Use W Anti GapClose", true)

	self.Enable_E = self:MenuBool("Enable E", true)
	self.Use_Combo_E = self:MenuBool("Use Combo E", false)
	self.UseE_Anti_GapClose = self:MenuBool("Use E Anti GapClose", true)

	self.Enable_R = self:MenuBool("Enable R", true)
	self.Auto_R_if_Hit = self:MenuSliderInt("Auto R if Hit", 2)
	self.Use_R_Kill_Steal = self:MenuBool("Use R Kill Steal", true)

	self.Combo = self:MenuKeyBinding("Combo", 32)
	self.Harass = self:MenuKeyBinding("Harass", 67)
	self.Lane_Clear = self:MenuKeyBinding("Lane Clear", 86)
	self.Last_Hit = self:MenuKeyBinding("Last Hit", 88)
	self.ACTIVER = self:MenuKeyBinding("Ative R", 65)
end

function Zoe:OnDrawMenu()
	if Menu_Begin(self.menu) then
		if Menu_Begin("Combo") then
			self.Use_Combo_Q = Menu_Bool("Use Combo Q", self.Use_Combo_Q, self.menu)
			self.Enable_E = Menu_Bool("Enable E", self.Enable_E, self.menu)
			self.Enable_R = Menu_Bool("Enable R", self.Enable_R, self.menu)
			self.RangeQ = Menu_SliderInt("Range Q + R ", self.RangeQ, 0, 1600, self.menu)
			Menu_End()
		end
		if Menu_Begin("Key Mode") then
			self.Combo = Menu_KeyBinding("Combo", self.Combo, self.menu)
			self.Harass = Menu_KeyBinding("Harass", self.Harass, self.menu)
			self.Lane_Clear = Menu_KeyBinding("Lane Clear", self.Lane_Clear, self.menu)
			self.Last_Hit = Menu_KeyBinding("Last Hit", self.Last_Hit, self.menu)
			self.ACTIVER = Menu_KeyBinding("Active {R}", self.ACTIVER, self.menu)
			Menu_End()
		end
		Menu_End()
	end
end

function Zoe:OnProcessSpell(unit, spell)
	local spellName = spell.Name:lower()
	if spell and unit.IsEnemy and IsValidTarget(unit.Addr, self.E.range) and self.E:IsReady() then
        if self.Spells[spellName] ~= nil then
        	CastSpellToPos(unit.x, unit.z, _E)
        end
    end
end 

function Zoe:IsImmobileTarget(unit)
	if (CountBuffByType(unit, 5) == 1 or CountBuffByType(unit, 11) == 1 or CountBuffByType(unit, 29) == 1 or CountBuffByType(unit, 24) == 1 or CountBuffByType(unit, 10) == 1 or CountBuffByType(unit, 29) == 1) then
		return true
	end
	return false
end


function Zoe:MenuBool(stringKey, bool)
	return ReadIniBoolean(self.menu, stringKey, bool)
end

function Zoe:MenuSliderInt(stringKey, valueDefault)
	return ReadIniInteger(self.menu, stringKey, valueDefault)
end

function Zoe:MenuKeyBinding(stringKey, valueDefault)
	return ReadIniInteger(self.menu, stringKey, valueDefault)
end

local function GetDistanceSqr(p1, p2)
    p2 = p2 or GetOrigin(myHero)
    return (p1.x - p2.x) ^ 2 + ((p1.z or p1.y) - (p2.z or p2.y)) ^ 2
end

function Zoe:CountEnemyInLine(target)
	local myHeroPos = Vector(myHero.x, myHero.y, myHero.z)
    local targetPos = Vector(target.x, target.y, target.z)
	local NH = 0
	for i, heros in ipairs(GetEnemyHeroes()) do
		if heros ~= nil then
		local hero = GetUnit(heros)
			local proj2, pointLine, isOnSegment = VectorPointProjectionOnLineSegment(myHeroPos, targetPos, Vector(hero))
		    if isOnSegment and (GetDistanceSqr(hero, proj2) <= (65) ^ 2) then
		        NH = NH + 1
		    end
		end
	end
    return NH
end

--[[function Zoe:DashEnd()
	SearchAllChamp()
	local Enemies = pObjChamp
	for idx, enemy in ipairs(Enemies) do
	  if enemy ~= 0 then
		if CanCast(_R) and GetDistance(enemy) < 260 and CanMove() and IsDashing(enemy) then
		  if not IsWall(enemy.x,enemy.y,enemy.z) then
			CastSpellToPos(enemy.x + self.R.range, enemy.z, _R)
		  end
		  if not IsWall(enemy.x,enemy.y,enemy.z + self.R.range) then
			CastSpellToPos(enemy.x, enemy.z + self.R.range, _R)
		  end
		end
	  end
	end
end]]

function Zoe:OnTick()
	if IsDead(myHero.Addr) then return end
	SetLuaCombo(true)

	if GetSpellNameByIndex(myHero.Addr, _Q) == "ZoeQRecast" then
        self.QMilles = true
    else
    	self.QMilles = false
    end

	self:KillSteal()

    if GetKeyPress(self.Combo) > 0 then	
        self:LogicQ(target)
        --self:CastW(target)
		self:LogicE(target)
        self:LogicR(target)
    end
end 


function Zoe:KillSteal()
	local TargetQ = GetTargetSelector(self.Q.range)
	if TargetQ ~= nil and IsValidTarget(TargetQ, self.Q.range) and CanCast(_Q) then
		targetQ = GetAIHero(TargetQ)

		local CastPosition, HitChance, Position = vpred:GetLineCastPosition(targetQ, self.Q.delay, self.Q.width, self.Q.range, self.Q.speed, myHero, false)
		if GetDistance(TargetQ) < self.Q.range and GetDamage("Q", targetQ) > GetHealthPoint(TargetQ) then
			CastSpellToPos(CastPosition.x, CastPosition.y, _Q)
			DelayAction(function() CastSpellToPos(CastPosition.x, CastPosition.z, _Q) end, 0.25)
		end
	end
	local TargetE = GetTargetSelector(self.E.range)
	if TargetE ~= nil and IsValidTarget(TargetE, self.Q.range) and CanCast(_E) then
		targetE = GetAIHero(TargetE)

		local CastPosition, HitChance, Position = vpred:GetLineCastPosition(targetQ, self.E.delay, self.E.width, self.E.range, self.E.speed, myHero, false)
		if GetDistance(TargetE) < self.E.range and GetDamage("E", targetE) > GetHealthPoint(TargetE) then
			CastSpellToPos(CastPosition.x, CastPosition.z, _E)
		end
	end 
end

function Zoe:LogicQ(target)
	local TargetQ = GetTargetSelector(self.Q.range)
	if CanCast(_Q) and CanMove() and TargetQ ~= 0 then
		target = GetAIHero(TargetQ)
		local CastPosition, HitChance, Position = vpred:GetLineCastPosition(target, self.Q.delay, self.Q.width, self.Q.range, self.Q.speed, myHero, false)
		local Collision = CountObjectCollision(0, target.Addr, myHero.x, myHero.z, CastPosition.x, CastPosition.z, self.Q.width, self.Q.range, 65)
		if Collision == 0 and HitChance >= 2 then
			CastSpellToPos_2(CastPosition.x, CastPosition.y, _Q)
			DelayAction(function() CastSpellToPos_2(CastPosition.x, CastPosition.z, _Q) end, 0.25)
		end
	end
end

function Zoe:LogicE(target)
	local TargetE = GetTargetSelector(self.E.range)
	if CanCast(_E) and TargetE ~= 0 then
		target = GetAIHero(TargetE)
		local CastPosition, HitChance, Position = vpred:GetLineCastPosition(target, self.E.delay, self.E.width, self.E.range, self.E.speed, myHero, false)
		local Collision = CountObjectCollision(0, target.Addr, myHero.x, myHero.z, CastPosition.x, CastPosition.z, self.E.width, self.E.range, 65)
		if Collision == 0 and HitChance >= 2 then
			CastSpellToPos(CastPosition.x, CastPosition.z, _E)
		end
	end
end

function Zoe:LogicR(target)
	local TargetR = GetTargetSelector(self.R.range)
	if CanCast(_R) and TargetR ~= 0 and self.QMilles then
		target = GetAIHero(TargetR)
		local CastPosition, HitChance, Position = vpred:GetCircularCastPosition(target, self.R.delay, self.R.width, self.R.range, self.R.speed, myHero, false)
		if HitChance >= 2 then
			CastSpellToPos(CastPosition.x, CastPosition.z, _R)
		end 
	end 
end 

function Zoe:OnCreateObject(obj)
	if string.find(obj.Name, "Zoe_Base_Q_Mis_Linger") and obj.IsValid and not IsDead(obj.Addr) then
		self.QCasted[obj.NetworkId] = obj
	end

	if obj and obj.Type == 6 then
		local missile = GetMissile(obj.Addr)

		if missile then
			if self.SpellData and self.SpellData[missile.OwnerCharName] then
				local data = self.SpellData[missile.OwnerCharName]

				if data and data[missile.Name:lower()] then
					local spell = data[missile.Name:lower()]

					local startPos = Vector(missile.SrcPos_x, missile.SrcPos_y, missile.SrcPos_z)
					local __endPos = Vector(missile.DestPos_x, missile.DestPos_y, missile.DestPos_z)
					local endPos = Vector(startPos):Extended(__endPos, missile.Range)

					table.insert(self.MissileSpellsData, {
						addr = missile.Addr,
						name = spell.name,
						slot = spell.slot,
						danger = spell.danger,
						isSkillshot = spell.isSkillshot,
						startPos = startPos,
						endPos = endPos,
						width = missile.Width,
						range = missile.Range,
						})
				end
			end
		end
	end
end

function Zoe:OnDeleteObject(obj)
	for i, Ball in pairs(self.QCasted) do
		if Ball.Addr == obj.Addr then
			table.remove(self.QCasted, i)
		end
	end

	for i, missile in pairs(self.MissileSpellsData) do
		if missile.addr == obj.Addr then
			table.remove(self.MissileSpellsData, i)
		end
	end
end
