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
    self.R = Spell(_R, 850)
    self.Q:SetSkillShot(0.25, 1500, 100, true)
    self.W:SetActive()
    self.E:SetSkillShot(0.25, 2100, 100, true)
    self.R:SetSkillShot(0.25, 500, 100, true)

    Callback.Add("Tick", function(...) self:OnTick(...) end)
	Callback.Add("DrawMenu", function(...) self:OnDrawMenu(...) end)
	Callback.Add("ProcessSpell", function(...) self:OnProcessSpell(...) end)

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

function Zoe:OnTick()
	if IsDead(myHero.Addr) then return end
	SetLuaCombo(true)

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
			CastSpellToPos(CastPosition.x, CastPosition.y, _Q)
			DelayAction(function() CastSpellToPos(CastPosition.x, CastPosition.z, _Q) end, 0.25)
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
	local target = self.menu_ts:GetTarget()
	if target ~= 0 then
		if self.Q:IsReady() or self.E:IsReady() and self.R:IsReady() and IsValidTarget(target, self.R.range) then
			self.R:Cast(target)
		end 
	end 
end 

