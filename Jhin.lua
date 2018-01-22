IncludeFile("Lib\\TOIR_SDK.lua")

Jhin = class()

function OnLoad()
	if GetChampName(GetMyChamp()) == "Jhin" then
		Jhin:__init()
	end
end

function Jhin:__init()

    self.menu_ts = TargetSelector(1750, 0, myHero, true, true, true)

	vpred = VPrediction(true)
    self.MissileSpellsData = {}

    self.IsMarked = false

    self.UtiOn = false
    
    self:MenuJhin()

	self.Q = Spell(_Q, 550)
    self.W = Spell(_W, 2550)
    self.E = Spell(_E, 725)
    self.R = Spell(_R, 3500)
	self.Q:SetTargetted()
    self.W:SetSkillShot(0.25, 1500, 100, true)
    self.E:SetSkillShot(0.25, 2100, 100, true)
    self.R:SetSkillShot(0.25, 500, 100, true)

    Callback.Add("Tick", function(...) self:OnTick(...) end)
	Callback.Add("DrawMenu", function(...) self:OnDrawMenu(...) end)
	Callback.Add("Draw", function(...) self:OnDraw(...) end)
    --Callback.Add("DoCast", function(...) self:OnDoCast(...) end)
    Callback.Add("UpdateBuff", function(...) self:OnUpdateBuff(...) end)
    Callback.Add("RemoveBuff", function(...) self:OnRemoveBuff(...) end)
	--Callback.Add("ProcessSpell", function(...) self:OnProcessSpell(...) end)
	--Callback.Add("CreateObject", function(...) self:OnCreateObject(...) end)
	--Callback.Add("DeleteObject", function(...) self:OnDeleteObject(...) end)

end 

function Jhin:MenuJhin()
	self.menu = "Jhin"
    self.AfterQ = self:MenuBool("Use After Attack Q", true)
	self.Auto_Q_Kill_Steal = self:MenuBool("Auto Q Kill Steal", true)

	self.Use_Combo_W = self:MenuBool("Use Combo W", false)
	self.Use_W_Anti_GapClose = self:MenuBool("Use W Anti GapClose", true)

	self.Enable_E = self:MenuBool("Enable E", true)
	self.Use_Combo_E = self:MenuBool("Use Combo E", false)
	self.UseE_Anti_GapClose = self:MenuBool("Use E Anti GapClose", true)

	self.Enable_R = self:MenuBool("Enable R", true)

	self.Combo = self:MenuKeyBinding("Combo", 32)
	self.Harass = self:MenuKeyBinding("Harass", 67)
	self.Lane_Clear = self:MenuKeyBinding("Lane Clear", 86)
	self.Last_Hit = self:MenuKeyBinding("Last Hit", 88)
	self.Ativasao_da_utimate = self:MenuKeyBinding("Active R", 65)
end

function Jhin:OnDrawMenu()
	if Menu_Begin(self.menu) then
		if Menu_Begin("Combo") then
			self.AfterQ = Menu_Bool("Use Combo Q", self.AfterQ, self.menu)
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
			self.Ativasao_da_utimate = Menu_KeyBinding("Active {R}", self.Ativasao_da_utimate, self.menu)
			Menu_End()
		end
		Menu_End()
	end
end


function Jhin:IsImmobileTarget(unit)
	if (CountBuffByType(unit, 5) == 1 or CountBuffByType(unit, 11) == 1 or CountBuffByType(unit, 29) == 1 or CountBuffByType(unit, 24) == 1 or CountBuffByType(unit, 10) == 1 or CountBuffByType(unit, 29) == 1) then
		return true
	end
	return false
end


function Jhin:MenuBool(stringKey, bool)
	return ReadIniBoolean(self.menu, stringKey, bool)
end

function Jhin:MenuSliderInt(stringKey, valueDefault)
	return ReadIniInteger(self.menu, stringKey, valueDefault)
end

function Jhin:MenuKeyBinding(stringKey, valueDefault)
	return ReadIniInteger(self.menu, stringKey, valueDefault)
end

local function GetDistanceSqr(p1, p2)
    p2 = p2 or GetOrigin(myHero)
    return (p1.x - p2.x) ^ 2 + ((p1.z or p1.y) - (p2.z or p2.y)) ^ 2
end

function Jhin:OnDraw()
	if self.W:IsReady() then
		DrawCircleGame(myHero.x , myHero.y, myHero.z, self.W.range, Lua_ARGB(255,255,0,0))
	end
	if self.R:IsReady() then
		DrawCircleGame(myHero.x , myHero.y, myHero.z, self.R.range, Lua_ARGB(255,0,0,255))
	end
end

function Jhin:CountEnemyInLine(target)
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

function Jhin:OnUpdateBuff(unit, buff)
    if unit.IsEnemy and buff.Name == "jhinespotteddebuff" then
        self.IsMarked = true
    end
end

function Jhin:OnRemoveBuff(unit, buff)
    if unit.IsEnemy and buff.Name == "jhinespotteddebuff" then
        self.IsMarked = false
    end
end

--[[function Jhin:CastR()
    local TargetR = GetTargetSelector(self.R.range)
	if TargetR ~= nil and IsValidTarget(TargetR, self.R.range) and CanCast(_R) then
        targetR = GetAIHero(TargetR)

     if GetSpellNameByIndex(myHero.Addr, _R) == "JhinR" then
        local CastPosition, HitChance, Position = vpred:GetLineCastPosition(targetR, self.R.delay, self.R.width, self.R.range, self.R.speed, myHero, false)

        
end ]]

function Jhin:OnTick()
	if IsDead(myHero.Addr) then return end
	SetLuaCombo(true)

    self:KillSteal()
	self:AutoWIsMarked()
	self:UtimateJhin()

    if GetSpellNameByIndex(myHero.Addr, _R) == "JhinRShot" then
        self.UtiOn = true
    else
    	self.UtiOn = false
    end
    
    if GetKeyPress(self.Ativasao_da_utimate) > 0 then	
        self:AtivandoUti()
    end 

	if GetKeyPress(self.Combo) > 0 then	
		self:LogicQ()
        self:LogicW()
		self:LogicE()
        --self:LogicR()
    end
end 


function Jhin:IsAfterAttack()
    if CanMove() and not CanAttack() then
        return true
    else
        return false
	end
end

function Jhin:AutoWIsMarked()
	local TargetW = GetTargetSelector(self.W.range)
	if TargetW ~= nil and self.IsMarked and IsValidTarget(TargetW, self.W.range) and CanCast(_W) then
        targetW = GetAIHero(TargetW)
        local CastPosition, HitChance, Position = vpred:GetLineCastPosition(targetW, self.W.delay, self.W.width, self.W.range, self.W.speed, myHero, false)
        if HitChance >= 2 then
			CastSpellToPos(CastPosition.x, CastPosition.z, _W)
		end
	end
end


function Jhin:KillSteal()
	local TargetW = GetTargetSelector(self.W.range)
	if TargetW ~= nil and IsValidTarget(TargetW, self.W.range) and CanCast(_W) and not self.UtiOn then
		targetW = GetAIHero(TargetW)

		local CastPosition, HitChance, Position = vpred:GetLineCastPosition(targetW, self.W.delay, self.W.width, self.W.range, self.W.speed, myHero, false)
		if GetDistance(TargetW) < self.W.range and GetDamage("W", targetW) > GetHealthPoint(TargetW) then
			CastSpellToPos(CastPosition.x, CastPosition.z, _W)
		end
    end

    local TargetQ = GetTargetSelector(self.Q.range)
	if TargetQ ~= nil and IsValidTarget(TargetQ, self.Q.range) and CanCast(_Q) then
        targetQ = GetAIHero(TargetQ)
        if GetDistance(TargetQ) < self.Q.range and GetDamage("Q", targetQ) > GetHealthPoint(TargetQ) then
			CastSpellTarget(target.Addr, _Q)
		end
    end
end 

function Jhin:LogicQ()
	local target = self.menu_ts:GetTarget()
	if target ~= 0 then
	if self.Q:IsReady() and IsValidTarget(target, self.Q.range) then
		self.Q:Cast(target)
	end
	end
end  


function Jhin:LogicW()
        local TargetW = GetTargetSelector(self.W.range)
        if TargetW ~= nil and IsValidTarget(TargetW, self.W.range) and CanCast(_W) and self:IsAfterAttack(target) then
            targetW = GetAIHero(TargetW)
            local CastPosition, HitChance, Position = vpred:GetLineCastPosition(targetW, self.W.delay, self.W.width, self.W.range, self.W.speed, myHero, false)
            if HitChance >= 2 then
            CastSpellToPos(CastPosition.x, CastPosition.z, _W)
        end
    end  
end 

function Jhin:LogicE(target)
	local TargetE = GetTargetSelector(self.E.range)
	if CanCast(_E) and TargetE ~= 0 then
		target = GetAIHero(TargetE)
		local CastPosition, HitChance, Position = vpred:GetLineCastPosition(target, self.E.delay, self.E.width, self.E.range, self.E.speed, myHero, false)
		if HitChance >= 2 then
			CastSpellToPos(CastPosition.x, CastPosition.z, _E)
		end
	end
end

function Jhin:UtimateJhin(target)
	local TargetR = GetTargetSelector(self.R.range)
	if self.UtiOn and CanCast(_R) and TargetR ~= 0 then
		target = GetAIHero(TargetR)
		local CastPosition, HitChance, Position = vpred:GetLineCastPosition(target, self.R.delay, self.R.width, self.R.range, self.R.speed, myHero, false)
		if HitChance >= 2 then
			CastSpellToPos(CastPosition.x, CastPosition.z, _R)
		end
	end
end

function Jhin:AtivandoUti()
    if GetSpellNameByIndex(myHero.Addr, _R) == "JhinR" then
        local TargetR = GetTargetSelector(self.R.range)
       if CanCast(_R) and TargetR ~= 0 then
        target = GetAIHero(TargetR)
        local CastPosition, HitChance, Position = vpred:GetLineCastPosition(target, self.R.delay, self.R.width, self.R.range, self.R.speed, myHero, false)
		if HitChance >= 2 then
			CastSpellToPos(CastPosition.x, CastPosition.z, _R)
		  end
	   end
    end
end 

