IncludeFile("Lib\\TOIR_SDK.lua")

Gangplank = class()


function OnLoad()
	if GetChampName(GetMyChamp()) == "Gangplank" then
		Gangplank:__init()
    end
end

function Gangplank:__init()

    WallSpots = {
        {
          x = 8260,
          y = 51,
          z = 2890,
          x2 = 8210,
          y2 = 51.75,
          z2 = 3165
        },
        {
          x = 4630,
          y = 95.7,
          z = 3020,
          x2 = 4924,
          y2 = 50.98,
          z2 = 3058
        },
        {
          x = 4924,
          y = 51,
          z = 3058,
          x2 = 4594,
          y2 = 95,
          z2 = 2964
        },
        {
          x = 8222,
          y = 51,
          z = 3158,
          x2 = 8300,
          y2 = 51,
          z2 = 2888
        },
        {
          x = 11872,
          y = -72,
          z = 4358,
          x2 = 12072,
          y2 = 51,
          z2 = 4608
        },
        {
          x = 12072,
          y = 51,
          z = 4608,
          x2 = 11818,
          y2 = -71,
          z2 = 4456
        },
        {
          x = 10772,
          y = 51,
          z = 7208,
          x2 = 10738,
          y2 = 52,
          z2 = 7450
        },
        {
          x = 10738,
          y = 52,
          z = 7450,
          x2 = 10772,
          y2 = 51,
          z2 = 7208
        },
        {
          x = 11572,
          y = 52,
          z = 8706,
          x2 = 11768,
          y2 = 51,
          z2 = 8904
        },
        {
          x = 11768,
          y = 51,
          z = 8904,
          x2 = 11572,
          y2 = 52,
          z2 = 8706
        },
        {
          x = 7972,
          y = 51,
          z = 5908,
          x2 = 8002,
          y2 = 52,
          z2 = 6208
        },
        {
          x = 7194,
          y = 51,
          z = 5630,
          x2 = 7372,
          y2 = 52,
          z2 = 5858
        },
        {
          x = 7372,
          y = 52,
          z = 5858,
          x2 = 7194,
          y2 = 51,
          z2 = 5630
        },
        {
          x = 7572,
          y = 51,
          z = 6158,
          x2 = 7718,
          y2 = 52,
          z2 = 6420
        },
        {
          x = 7024,
          y = -71,
          z = 8406,
          x2 = 7224,
          y2 = 53,
          z2 = 8556
        },
        {
          x = 7224,
          y = 53,
          z = 8556,
          x2 = 7088,
          y2 = -71,
          z2 = 8378
        },
        {
          x = 8204,
          y = -71,
          z = 6080,
          x2 = 8058,
          y2 = 51,
          z2 = 5838
        },
        {
          x = 7772,
          y = -49,
          z = 6358,
          x2 = 7610,
          y2 = 52,
          z2 = 6128
        },
        {
          x = 5774,
          y = 55,
          z = 10656,
          x2 = 5430,
          y2 = -71,
          z2 = 10640
        },
        {
          x = 5474,
          y = -71.2406,
          z = 10665,
          x2 = 5754,
          y2 = 55.9,
          z2 = 10718
        },
        {
          x = 3666,
          y = 51.8,
          z = 7430,
          x2 = 3674,
          y2 = 51.7,
          z2 = 7706
        },
        {
          x = 3672,
          y = 51.7,
          z = 7686,
          x2 = 3774,
          y2 = 51.8,
          z2 = 7408
        },
        {
          x = 3274,
          y = 52.46,
          z = 6208,
          x2 = 3086,
          y2 = 57,
          z2 = 6032
        },
        {
          x = 3086,
          y = 57,
          z = 6032,
          x2 = 3274,
          y2 = 52.46,
          z2 = 6208
        },
        {
          x = 5126,
          y = -71,
          z = 9988,
          x2 = 5130,
          y2 = -70,
          z2 = 9664
        },
        {
          x2 = 5126,
          y2 = -71,
          z2 = 9988,
          x = 5018,
          y = -70,
          z = 9734
        },
        {
          x = 10462,
          y = -71,
          z = 4352,
          x2 = 10660,
          y2 = -72,
          z2 = 4488
        },
        {
          x = 6582,
          y = 53.8,
          z = 11694,
          x2 = 6516,
          y2 = 56.4,
          z2 = 11990
        },
        {
          x = 6516,
          y = 56.4,
          z = 11990,
          x2 = 6582,
          y2 = 53.8,
          z2 = 11694
        },
        {
          x = 5231,
          y = 56.4,
          z = 12092,
          x2 = 5212,
          y2 = 56.8,
          z2 = 11794
        },
        {
          x = 5212,
          y = 56.8,
          z = 11794,
          x2 = 5231,
          y2 = 56.4,
          z2 = 12092
        },
        {
          x = 9654,
          y = 64,
          z = 3052,
          x2 = 9630,
          y2 = 49.2,
          z2 = 2794
        },
        {
          x = 9630,
          y = 49.2,
          z = 2794,
          x2 = 9654,
          y2 = 64,
          z2 = 3052
        },
        {
          x = 3324,
          y = -64,
          z = 10160,
          x2 = 3124,
          y2 = 53,
          z2 = 9956
        },
        {
          x = 3124,
          y = 53,
          z = 9956,
          x2 = 3324,
          y2 = -64,
          z2 = 10160
        },
        {
          x = 9314,
          y = -71.24,
          z = 4518,
          x2 = 9022,
          y2 = 52.44,
          z2 = 4508
        },
        {
          x = 4424,
          y = 49.11,
          z = 8056,
          x2 = 4134,
          y2 = 50.53,
          z2 = 7986
        },
        {
          x = 4134,
          y = 50.53,
          z = 7986,
          x2 = 4424,
          y2 = 49.11,
          z2 = 8056
        },
        {
          x = 2596,
          y = 51.7,
          z = 9228,
          x2 = 2874,
          y2 = 50.6,
          z2 = 9256
        },
        {
          x = 2874,
          y = 50.6,
          z = 9256,
          x2 = 2596,
          y2 = 51.7,
          z2 = 9228
        },
        {
          x = 11722,
          y = 51.7,
          z = 5024,
          x2 = 11556,
          y2 = -71.24,
          z2 = 4870
        },
        {
          x = 11556,
          y = -71.24,
          z = 4870,
          x2 = 11722,
          y2 = 51.7,
          z2 = 5024
        },
        {
          x = 2924,
          y = 53.5,
          z = 4958,
          x2 = 2894,
          y2 = 95.7,
          z2 = 4648
        },
        {
          x2 = 2924,
          y2 = 53.5,
          z2 = 4958,
          x = 2894,
          y = 95.7,
          z = 4648
        },
        {
          x = 11922,
          y = 51.7,
          z = 4758,
          x2 = 11772,
          y2 = -71.24,
          z2 = 4608
        },
        {
          x = 11772,
          y = -71.24,
          z = 4608,
          x2 = 11922,
          y2 = 51.7,
          z2 = 4758
        },
        {
          x = 11592,
          y = 52.8,
          z = 5316,
          x2 = 11342,
          y2 = -61,
          z2 = 5274
        },
        {
          x2 = 11592,
          y2 = 52.8,
          z2 = 5316,
          x = 11342,
          y = -61,
          z = 5274
        },
        {
          x = 10694,
          y = -70.24,
          z = 4526,
          x2 = 10472,
          y2 = -71.24,
          z2 = 4408
        },
        {
          x = 9722,
          y = -71.24,
          z = 4908,
          x2 = 9700,
          y2 = -72.5,
          z2 = 5198
        },
        {
          x2 = 9722,
          y2 = -71.24,
          z2 = 4908,
          x = 9700,
          y = -72.5,
          z = 5198
        },
        {
          x = 6126,
          y = 48.5,
          z = 5304,
          x2 = 6090,
          y2 = 51.7,
          z2 = 5572
        },
        {
          x2 = 6126,
          y2 = 48.5,
          z2 = 5304,
          x = 6090,
          y = 51.7,
          z = 5572
        },
        {
          x = 3388,
          y = 95.7,
          z = 4414,
          x2 = 3524,
          y2 = 54.15,
          z2 = 4708
        },
        {
          x = 3108,
          y = 51.5,
          z = 6428,
          x2 = 2924,
          y2 = 57,
          z2 = 6208
        },
        {
          x2 = 3108,
          y2 = 51.5,
          z2 = 6428,
          x = 2924,
          y = 57,
          z = 6208
        },
        {
          x2 = 2824,
          y2 = 56.4,
          z2 = 6708,
          x = 3074,
          y = 51.5,
          z = 6758
        },
        {
          x = 2824,
          y = 56.4,
          z = 6708,
          x2 = 3074,
          y2 = 51.5,
          z2 = 6758
        },
        {
          x = 11860,
          y = 52.3,
          z = 10032,
          x2 = 11914,
          y2 = 91.4,
          z2 = 10360
        },
        {
          x2 = 11860,
          y2 = 52.3,
          z2 = 10032,
          x = 11914,
          y = 91.4,
          z = 10360
        },
        {
          x2 = 12372,
          y2 = 91.4,
          z2 = 10256,
          x = 12272,
          y = 52.3,
          z = 9956
        },
        {
          x = 12372,
          y = 91.4,
          z = 10256,
          x2 = 12272,
          y2 = 52.3,
          z2 = 9956
        },
        {
          x = 11772,
          y = 54.54,
          z = 8206,
          x2 = 12072,
          y2 = 52.3,
          z2 = 8156
        },
        {
          x2 = 11772,
          y2 = 54.54,
          z2 = 8206,
          x = 12072,
          y = 52.3,
          z = 8156
        },
        {
          x2 = 11338,
          y2 = 52.2,
          z2 = 7496,
          x = 11372,
          y = 51.7,
          z = 7208
        },
        {
          x = 11338,
          y = 52.2,
          z = 7496,
          x2 = 11372,
          y2 = 51.7,
          z2 = 7208
        },
        {
          x = 12272,
          y = 51.7,
          z = 5408,
          x2 = 12034,
          y2 = 54.6,
          z2 = 5420
        },
        {
          x2 = 12272,
          y2 = 51.7,
          z2 = 5408,
          x = 12034,
          y = 54.6,
          z = 5420
        },
        {
          x = 10432,
          y = 51.9,
          z = 6768,
          x2 = 10712,
          y2 = 51.7,
          z2 = 6906
        },
        {
          x = 12272,
          y = 52.6,
          z = 5558,
          x2 = 11966,
          y2 = 53.5,
          z2 = 5592
        },
        {
          x2 = 12272,
          y2 = 52.6,
          z2 = 5558,
          x = 11966,
          y = 53.5,
          z = 5592
        },
        {
          x2 = 6824,
          y2 = -71.24,
          z2 = 8606,
          x = 6924,
          y = 52.8,
          z = 8856
        },
        {
          x = 6824,
          y = -71.24,
          z = 8606,
          x2 = 6924,
          y2 = 52.8,
          z2 = 8856
        },
        {
          x = 4908,
          y = 56.6,
          z = 11884,
          x2 = 4974,
          y2 = 56.4,
          z2 = 12102
        },
        {
          x2 = 4908,
          y2 = 56.6,
          z2 = 11884,
          x = 4974,
          y = 56.4,
          z = 12102
        },
        {
          x2 = 3474,
          y2 = -64.6,
          z2 = 9806,
          x = 3208,
          y = 51.4,
          z = 9696
        },
        {
          x = 3474,
          y = -64.6,
          z = 9806,
          x2 = 3208,
          y2 = 51.4,
          z2 = 9696
        },
        {
          x = 2574,
          y = 53,
          z = 9456,
          x2 = 2832,
          y2 = 51.2,
          z2 = 9480
        },
        {
          x2 = 2574,
          y2 = 53,
          z2 = 9456,
          x = 2832,
          y = 51.2,
          z = 9480
        },
        {
          x2 = 4474,
          y2 = -71.2,
          z2 = 10456,
          x = 4234,
          y = -71.2,
          z = 10306
        },
        {
          x = 4474,
          y = -71.2,
          z = 10456,
          x2 = 4234,
          y2 = -71.2,
          z2 = 10306
        },
        {
          x = 8086,
          y = 51.8,
          z = 9684,
          x2 = 8396,
          y2 = 50.3,
          z2 = 9672
        },
        {
          x2 = 9972,
          y2 = 52.3,
          z2 = 11756,
          x = 10278,
          y = 91.4,
          z = 11858
        },
        {
          x = 9972,
          y = 52.3,
          z = 11756,
          x2 = 10278,
          y2 = 91.4,
          z2 = 11858
        },
        {
          x2 = 10122,
          y2 = 91.4,
          z2 = 12406,
          x = 9822,
          y = 52.3,
          z = 12306
        },
        {
          x = 10122,
          y = 91.4,
          z = 12406,
          x2 = 9822,
          y2 = 52.3,
          z2 = 12306
        },
        {
          x = 4674,
          y = 95.74,
          z = 2608,
          x2 = 4974,
          y2 = 51.19,
          z2 = 2658
        },
        {
          x2 = 4674,
          y2 = 95.74,
          z2 = 2608,
          x = 4974,
          y = 51.19,
          z = 2658
        },
        {
          x = 2474,
          y = 95.74,
          z = 4708,
          x2 = 2524,
          y2 = 52.79,
          z2 = 5008
        },
        {
          x2 = 2474,
          y2 = 95.74,
          z2 = 4708,
          x = 2524,
          y = 52.79,
          z = 5008
        },
        {
          x = 9632,
          y = 52.65,
          z = 9160,
          x2 = 9192,
          y2 = 52.01,
          z2 = 9400
        },
  }

    self.EnemyMinions = minionManager(MINION_ENEMY, 2000, myHero, MINION_SORT_HEALTH_ASC)
    --Target
    self.menu_ts = TargetSelector(1750, 0, myHero, true, true, true)

    self.MissileSpellsData = {}
    self:MenuGangplank()

    self.PassiveGangplank = false


    --Spells
		self.Q = Spell(_Q, 625)
		self.W = Spell(_W, 600)
    self.E = Spell(_E, 1000)
    self.R = Spell(_R, math.huge)

    self.BarrelPred = { delay = 0.25, speed = math.huge, width = 390, range = 1000 }
    self.BarrelCount = 0
    self.Barrel = { }
    self.CT = 0


    self.Q:SetTargetted()
    self.W:SetActive()
    self.E:SetSkillShot(0.25, 1200, 90, false)
    self.R:SetSkillShot(0.25, 1200, 90, false)

		Callback.Add("Tick", function() self:OnTick() end) --Call Back Gangplank <3 by: DevkAT
		--Callback.Add("Draw", function() self:OnDraw() end)
    --Callback.Add("ProcessSpell", function(...) self:OnProcessSpell(...) end)
    Callback.Add("DrawMenu", function(...) self:OnDrawMenu(...) end)
    Callback.Add("CreateObject", function(...) self:OnCreateObject(...) end)
		Callback.Add("DeleteObject", function(...) self:OnDeleteObject(...) end)
end 

function Gangplank:MenuGangplank()
	self.menu = "Gangplank"
    self.Use_Combo_Q = self:MenuBool("Use Combo Q", true)
    self.AutoQStack = self:MenuBool("Auto Q", true)

    self.Use_Combo_W = self:MenuBool("Auto W", true)

	self.Enable_E = self:MenuBool("Enable E", true)

	self.Enable_R = self:MenuBool("Enable R", true)
    self.Use_R_Kill_Steal = self:MenuBool("Use R Kill Steal", true)
    self.HPMyhero = self:MenuSliderInt("Hero Life Auto W", 20)
    self.MinInimigo = self:MenuSliderInt("Range Heros {R}", 1)

    self.UseQClear = self:MenuBool("Use Q LaneClear", true)

	self.menu_key_combo = self:MenuKeyBinding("Combo", 32)
    self.Lane_Clear = self:MenuKeyBinding("Lane Clear", 86)
    self.ActiveR = self:MenuKeyBinding("Active R Utimate", 84)
    self.Flee = self:MenuKeyBinding("Flee {E}", 65)
    self.Last_Hit = self:MenuKeyBinding("Last Hit", 88)
    self.Harass = self:MenuKeyBinding("Harass", 67)
end

function Gangplank:OnDrawMenu()
	if Menu_Begin(self.menu) then
		if Menu_Begin("Combo") then
			self.Use_Combo_Q = Menu_Bool("Use Combo Q", self.Use_Combo_Q, self.menu)
            self.Use_Combo_W = Menu_Bool("Auto W", self.Use_Combo_W, self.menu)
            self.AutoQStack = Menu_Bool("Auto Q", self.AutoQStack, self.menu)
			self.Enable_E = Menu_Bool("Enable E", self.Enable_E, self.menu)
			self.Enable_R = Menu_Bool("Enable R", self.Enable_R, self.menu)
            self.Use_R_Kill_Steal = Menu_Bool("Use R Kill Steal", self.Use_R_Kill_Steal, self.menu)
            self.HPMyhero = Menu_SliderInt("Hero Life Auto W", self.HPMyhero, 0, 100, self.menu)
            self.MinInimigo = Menu_SliderInt("Range Heros {R}", self.MinInimigo, 0, 5, self.menu)
			Menu_End()
        end
        if Menu_Begin("LaneClear") then
            self.UseQClear = Menu_Bool("Use Q Clear", self.UseQClear, self.menu)
            Menu_End()
        end

		if Menu_Begin("Keys Gangplank") then
			self.menu_key_combo = Menu_KeyBinding("Combo", self.menu_key_combo, self.menu)
            self.Lane_Clear = Menu_KeyBinding("Lane Clear", self.Lane_Clear, self.menu)
            self.Last_Hit = Menu_KeyBinding("Last Hit", self.Last_Hit, self.menu)
            self.Harass = Menu_KeyBinding("Harass", self.Harass, self.menu)
			Menu_End()
		end
		Menu_End()
	end
end

function Gangplank:MenuBool(stringKey, bool)
	return ReadIniBoolean(self.menu, stringKey, bool)
end

function Gangplank:MenuKeyBinding(stringKey, valueDefault)
	return ReadIniInteger(self.menu, stringKey, valueDefault)
end

function Gangplank:MenuSliderInt(stringKey, valueDefault)
	return ReadIniInteger(self.menu, stringKey, valueDefault)
end

function Gangplank:IsAfterAttack()
    if CanMove() and not CanAttack() then
        return true
    else
        return false
	end
end

function GetOrigin(obj)
	return {GetPosX(obj),GetPosY(obj),GetPosZ(obj)}
end

function GetDistancePos(x,z)
	local x1 = GetPosX(myHero.Addr)
	local z1 = GetPosZ(myHero.Addr)

	return GetDistance2D(x1,z1,x,z)
end

function GetDistance2Pos(x1, z1, x2, z2)
	return GetDistance2D(x1,z1,x2,z2)
end

function Gangplank:CanQBarrel()
  local target = self.menu_ts:GetTarget()
	local delay = function() if GetLevel(myHero.Addr) >= 13 then return .5 elseif GetLevel(myHero.Addr) >= 7 and GetLevel(myHero.Addr) < 13 then return 1 elseif GetLevel(myHero.Addr) < 7 then return 2 end end
	local time = function(target) return GetDistance(target)/1700+ .25 end
	local mod = function(target) return GetHealthPoint(target) * delay() * 1000 end
	local barrelf = function() for i,object in pairs(self.Barrel) do if object ~= nil and self.CT ~= nil and (GetTickCount() - CT + time(object) * 1000 > mod(object) or GetHealthPoint(object) == 1) then return object end end end
	local barrel = barrelf()
	if barrel ~= nil then
		return barrel
	end
end

function Gangplank:CastQEnemy()
	local target = self.menu_ts:GetTarget()
	if target == 0 then return end
	local barrel = self:CanQBarrel()
	if not CanCast(E) and IsValidTarget(target, 625) and CanCast(Q) and (barrel == nil or GetDistance2Pos(GetPosX(barrel), GetPosZ(barrel), GetPosX(target), GetPosZ(target)) > 1200) and CanMove() then
		CastSpellTarget(Target, Q)
	end
end

function Gangplank:Wavetime()
	if GetBuffByName(myHero.Addr, "GangplankRUpgrade1") >= 1 then
		return 18
	else
		return 12
	end
end

function Gangplank:Combo()
  local target = self.menu_ts:GetTarget()

	if target == 0 then return end

	local barrel = self:CanQBarrel()

	if CanCast(Q) and CanCast(E) then

    if barrel ~= nil then
      
			if GetDistance(target) < 1300 and GetDistance2Pos(GetPosX(target), GetPosZ(target), GetPosX(barrel), GetPosZ(barrel)) <= 780 then
				local PredGP = VPGetCircularCastPosition(target, self.BarrelPred.delay, self.BarrelPred.width)
				if PredGP < 700 and CanMove() then
					CastSpellToPredictionPos(target, _E, PredGP)
				end
		end

		elseif barrel == nil then
			local vectornear = Vector(GetOrigin(myHero.Addr)) + (Vector(GetOrigin(target)) - Vector(GetOrigin(myHero.Addr))):Normalized() * 150
			local vectorfar = Vector(GetOrigin(myHero.Addr)) + (Vector(GetOrigin(target)) - Vector(GetOrigin(myHero.Addr))):Normalized() * 350

			if GetDistance(target) <= 650 and GetDistancePos(vectornear.x, vectornear.z) <= 650 and self.BarrelCount == 0 and CanMove() then
				CastSpellToPos(vectornear.x, vectornear.z, E)
			elseif GetDistance(target) >= 650 and GetDistancePos(vectorfar.x, vectorfar.z) <= 1000 and GetDistance(target) <= 1000 and self.BarrelCount == 0 and CanMove() then
				CastSpellToPos(vectorfar.x, vectorfar.z, E)
			end
		end
	end
end

function Gangplank:AutoW()
	local Internal_Buff				= 0
	local Aura_Buff					= 1
	local CombatEnchancer_Buff		= 2
	local CombatDehancer_Buff		= 3
	local SpellShield_Buff			= 4
	local Stun_Buff					= 5
	local Invisibility_Buff			= 6
	local Silence_Buff				= 7
	local Taunt_Buff				= 8
	local Polymorph_Buff			= 9
	local Slow_Buff					= 10
	local Snare_Buff				= 11
	local Damage_Buff				= 12
	local Heal_Buff					= 13
	local Haste_Buff				= 14
	local SpellImmunity_Buff		= 15
	local PhysicalImmunity_Buff		= 16
	local Invulnerability_Buff		= 17
	local Sleep_Buff				= 18
	local NearSight_Buff			= 19
	local Frenzy_Buff				= 20
	local Fear_Buff					= 21
	local Charm_Buff				= 22
	local Poison_Buff				= 23
	local Suppression_Buff			= 24
	local Blind_Buff				= 25
	local Counter_Buff				= 26
	local Shred_Buff				= 27
	local Flee_Buff					= 28
	local Knockup_Buff				= 29
	local Knockback_Buff			= 30
	local Disarm_Buff				= 31

	local CC = {Stun_Buff, Taunt_Buff, Snare_Buff, Fear_Buff, Charm_Buff, Suppression_Buff, Blind_Buff, Silence_Buff, Slow_Buff }

	for _,v in pairs(CC) do
		if self.W:IsReady() and CountBuffByType(myHero.Addr, v) >= 1 then
			CastSpellTarget(myHero.Addr, W)
		end
	end
	if self.W:IsReady() and (100*GetHealthPoint(myHero.Addr)/GetHealthPointMax(myHero.Addr)) <= self.HPMyhero and IsRecall(myHero.Addr) == 0 then
		CastSpellTarget(myHero.Addr, W)
	end
end


function Gangplank:OnCreateObject(unit)
	if GetObjName(unit.Addr) == "Barrel" then
		self.BarrelCount = self.BarrelCount + 1
		table.insert(self.Barrel, unit.Addr)
		if self.BarrelCount == 1 then
			self.CT = GetTickCount()
		end
	end
end

function Gangplank:OnDeleteObject(unit)
	if GetObjName(unit.Addr) == "Gangplank_Base_E_AoE_Green.troy" then
		self.BarrelCount = self.BarrelCount - 1
		if self.BarrelCount < 0 then self.BarrelCount = 0 end
		table.remove(self.Barrel, 1)
		self.CT = nil
	end
end

--[[function Gangplank:KillSteal()
	SearchAllChamp()
	local Enemies = pObjChamp
	for i, enemy in pairs(Enemies) do
		if enemy ~= 0 and IsValidTarget(enemy) then

			if CanCast(R) and GetDamage("R", enemy) > GetHealthPoint(enemy) then
				CastSpellToPos(GetPosX(enemy), GetPosZ(enemy), R)
      end
    end
  end 
end]] 

function Gangplank:OnTick()
  if IsDead(myHero.Addr) or IsTyping() or IsDodging() then return end
  
  self:AutoW()
  --self:KillSteal()

  if GetKeyPress(self.menu_key_combo) > 0 then
       self:Combo()
  end 
end 

