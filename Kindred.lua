IncludeFile("Lib\\TOIR_SDK.lua")

Kindred = class()

function OnLoad()
	if GetChampName(GetMyChamp()) == "Kindred" then
		Kindred:__init()
	end
end

function Kindred:__init()

    self.menu_ts = TargetSelector(1750, 0, myHero, true, true, true)

    self:KindredMenu()

    self.Q = Spell(_Q, 340)
    self.W = Spell(_W, 500)
    self.E = Spell(_E, 500)
    self.R = Spell(_R, 500)

    self.Q:SetSkillShot(0.25, 1200, 90, false)
    self.W:SetActive()
    self.E:SetTargetted()
    self.R:SetActive()

    
     self.Count = nil
     self.Target = nil

    Callback.Add("Tick", function(...) self:OnTick(...) end)
	Callback.Add("DrawMenu", function(...) self:OnDrawMenu(...) end)
	Callback.Add("AfterAttack", function(...) self:OnAfterAttack(...) end)
	Callback.Add("BeforeAttack", function(target) self:FarmClear(target) end)
    
end 

function Kindred:KindredMenu()
	self.menu = "Kindred"
	self.Use_Combo_Q = self:MenuBool("Use Combo Q", true)
	self.Use_Combo_W = self:MenuBool("Use Combo W", true)

	self.Use_Combo_E = self:MenuBool("Use Combo E", true)

	self.Enable_R = self:MenuBool("Enable R", true)
    self.Life = self:MenuSliderInt("My Life", 50)
    self.ActiveR = self:MenuKeyBinding("Active R", 84)

	self.Combo = self:MenuKeyBinding("Combo", 32)
	self.Harass = self:MenuKeyBinding("Harass", 67)
	self.Lane_Clear = self:MenuKeyBinding("Lane Clear", 86)
	self.Last_Hit = self:MenuKeyBinding("Last Hit", 88)
	self.Flee = self:MenuKeyBinding("Flee", 65)
end

function Kindred:OnDrawMenu()
	if Menu_Begin(self.menu) then
		if Menu_Begin("Kindred Config [Q]") then
			self.Use_Combo_Q = Menu_Bool("Use Combo Q", self.Use_Combo_Q, self.menu)
			Menu_End()
		end
		if Menu_Begin("Kindred Config [W]") then
			self.Use_Combo_W = Menu_Bool("Use Combo W", self.Use_Combo_W, self.menu)
			Menu_End()
		end
		if Menu_Begin("Kindred Config [E]") then
            self.Use_Combo_E = Menu_Bool("Use Combo E", self.Use_Combo_E, self.menu)
			Menu_End()
		end
		if Menu_Begin("Kindred Config [R]") then
			self.Enable_R = Menu_Bool("Enable R", self.Enable_R, self.menu)
            self.Life = Menu_SliderInt("My Life", self.Life, 0, 100, self.menu)
            self.ActiveR = Menu_KeyBinding("Active R", self.ActiveR, self.menu )
			Menu_End()
		end
		if Menu_Begin("Keys") then
			self.Combo = Menu_KeyBinding("Combo", self.Combo, self.menu)
			self.Harass = Menu_KeyBinding("Harass", self.Harass, self.menu)
			self.Lane_Clear = Menu_KeyBinding("Lane Clear", self.Lane_Clear, self.menu)
			self.Last_Hit = Menu_KeyBinding("Last Hit", self.Last_Hit, self.menu)
			self.Flee = Menu_KeyBinding("Flee", self.Flee, self.menu)
			Menu_End()
		end
		Menu_End()
	end
end

function Kindred:OnAfterAttack(unit, target)
	if unit.IsMe then
		if CanCast(_Q) then
			self:CastQ()
		end

		if CanCast(_Q) then			
	    	local Walking = GetTargetOrb()
    		if Walking ~= nil and GetType(Walking) == 3 then
    			CastSpellToPos(GetMousePos().x,GetMousePos().z, _Q)
    		end
		end
	end
end

function Kindred:JungleClear()
    GetAllUnitAroundAnObject(myHero.Addr, 2000)
    local result = {}
    for i, minions in pairs(pUnit) do
        if minions ~= 0 and not IsDead(minions) and not IsInFog(minions) and GetType(minions) == 3 then
            table.insert(result, minions)
        end
    end

    return result
end


function Kindred:FarmClear(target)
	for i, minions in ipairs(self:JungleClear()) do
        if minions ~= 0 then
			local jungle = GetUnit(minions)
			if jungle.Type == 3 and jungle.TeamId == 300 then

	  if CanCast(_Q) then
		if jungle ~= nil and GetDistance(jungle) < self.Q.range then
			CastSpellToPos(GetMousePos().x,GetMousePos().z, _Q)
		end
	  end

	  if CanCast(_E) then
		if jungle ~= nil and GetDistance(jungle) < self.E.range then
		  self.E:Cast(jungle.Addr)
		end 
	end
  
	  if CanCast(_W) then
		if jungle ~= nil and GetDistance(jungle) < self.W.range then
		  self.W:Cast(jungle.Addr)
		end 
	   end 
	end
   end 
  end  
end

function Kindred:IsImmobile(unit)
	if CountBuffByType(unit, 5) ~= 0 or CountBuffByType(unit, 11) ~= 0 or CountBuffByType(unit, 24) ~= 0 or CountBuffByType(unit, 29) ~= 0 or IsRecall(unit) then
		return true
	end
	return false
end

function Kindred:EnemiesAround(object, range)
	return CountEnemyChampAroundObject(object, range)
end

function Kindred:GetPercentHP(target)
	return GetHealthPoint(target)/GetHealthPointMax(target) * 100
end

function Kindred:IsAfterAttack()
    if CanMove() and not CanAttack() then
        return true
    else
        return false
	end
end


function Kindred:MenuBool(stringKey, bool)
	return ReadIniBoolean(self.menu, stringKey, bool)
end

function Kindred:MenuSliderInt(stringKey, valueDefault)
	return ReadIniInteger(self.menu, stringKey, valueDefault)
end

function Kindred:MenuKeyBinding(stringKey, valueDefault)
	return ReadIniInteger(self.menu, stringKey, valueDefault)
end

function Kindred:ManualR()
    if CanCast(R) then
        CastSpellTarget(myHero.Addr, _R)
    end
end

function Kindred:FleeQ()
	if CanCast(Q) then
	    CastSpellToPos(GetMousePosX(),GetMousePosZ(),Q)
	end
end 

function Kindred:OnTick()
	if IsDead(myHero.Addr) then return end
	SetLuaCombo(true)
	
	if GetKeyPress(self.Lane_Clear) > 0 then	
        self:FarmClear()
	end

    if GetKeyPress(self.ActiveR) > 0 then	
        self:ManualR()
	end
	
	if GetKeyPress(self.Flee) > 0 then	
        self:FleeQ()
	end
	
    if GetKeyPress(self.Combo) > 0 then	
        local target = self.menu_ts:GetTarget()
        if target ~= 0 then
        self:CastQ(target)
        self:CastW(target)
		self:CastE(target)
        self:LogicR(target)
        end
    end
end 

function Kindred:CastQ(target)
    if self.Q:IsReady() and IsValidTarget(target, self.Q.range + 150) and self.Use_Combo_Q  and Setting_IsComboUseQ() and self:IsAfterAttack(target)  --[[IsMarked Kindred]] then
        CastSpellToPos(GetMousePosX(),GetMousePosZ(),Q)
    end
end

function Kindred:CastW(target)
    if self.W:IsReady() and IsValidTarget(target, self.W.range) and self.Use_Combo_W  and Setting_IsComboUseW() --[[IsMarked Kindred]] then
        CastSpellTarget(myHero.Addr, _W)
    end
end

function Kindred:CastE(target)
    if self.E:IsReady() and IsValidTarget(target, self.E.range) and self.Use_Combo_E and Setting_IsComboUseE() --[[IsMarked Kindred]] then
        CastSpellTarget(target, _E)
    end
end

function Kindred:LogicR(target)
    if CanCast(R) and GetPercentHP(myHero.Addr) < self.Life and IsValidTarget(target, 500) then
        CastSpellTarget(myHero.Addr, _R)
    end 
end 


