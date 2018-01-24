IncludeFile("Lib\\TOIR_SDK.lua")

Olaf = class()

function OnLoad()
	if GetChampName(GetMyChamp()) == "Olaf" then
		Olaf:__init()
    end
end

function Olaf:__init()
    W_SPELLS = { -- Yea boiz and grillz its all right here.......
    ["FizzMarinerDoom"]                      = {Spellname ="FizzMarinerDoom",Name = "Fizz", Spellslot =_R},
    ["AatroxE"]                      = {Spellname ="AatroxE",Name= "Aatrox", Spellslot =_E},
    ["AhriOrbofDeception"]                      = {Spellname ="AhriOrbofDeception",Name = "Ahri", Spellslot =_Q},
    ["AhriFoxFire"]                      = {Spellname ="AhriFoxFire",Name = "Ahri", Spellslot =_W},
    ["AhriSeduce"]                      = {Spellname ="AhriSeduce",Name = "Ahri", Spellslot =_E},
    ["AhriTumble"]                      = {Spellname ="AhriTumble",Name = "Ahri", Spellslot =_R},
    ["FlashFrost"]                      = {Spellname ="FlashFrost",Name = "Anivia", Spellslot =_Q},
    ["Anivia2"]                      = {Spellname ="Frostbite",Name = "Anivia", Spellslot =_E},
    ["Disintegrate"]                      = {Spellname ="Disintegrate",Name = "Annie", Spellslot =_Q},
    ["Volley"]                      = {Spellname ="Volley",Name ="Ashe", Spellslot =_W},
    ["EnchantedCrystalArrow"]                      = {Spellname ="EnchantedCrystalArrow",Name ="Ashe", Spellslot =_R},
    ["BandageToss"]                      = {Spellname ="BandageToss",Name ="Amumu",Spellslot =_Q},
    ["RocketGrabMissile"]                      = {Spellname ="RocketGrabMissile",Name ="Blitzcrank",Spellslot =_Q},
    ["BrandBlaze"]                      = {Spellname ="BrandBlaze",Name ="Brand", Spellslot =_Q},
    ["BrandWildfire"]                      = {Spellname ="BrandWildfire",Name ="Brand", Spellslot =_R},
    ["BraumQ"]                      = {Spellname ="BraumQ",Name ="Braum",Spellslot =_Q},
    ["BraumRWapper"]                      = {Spellname ="BraumRWapper",Name ="Braum",Spellslot =_R},
    ["CaitlynPiltoverPeacemaker"]                      = {Spellname ="CaitlynPiltoverPeacemaker",Name ="Caitlyn",Spellslot =_Q},
    ["CaitlynEntrapment"]                      = {Spellname ="CaitlynEntrapment",Name ="Caitlyn",Spellslot =_E},
    ["CaitlynAceintheHole"]                      = {Spellname ="CaitlynAceintheHole",Name ="Caitlyn",Spellslot =_R},
    ["CassiopeiaMiasma"]                      = {Spellname ="CassiopeiaMiasma",Name ="Cassiopiea",Spellslot =_W},
    ["CassiopeiaTwinFang"]                      = {Spellname ="CassiopeiaTwinFang",Name ="Cassiopiea",Spellslot =_E},
    ["PhosphorusBomb"]                      = {Spellname ="PhosphorusBomb",Name ="Corki",Spellslot =_Q},
    ["MissileBarrage"]                      = {Spellname ="MissileBarrage",Name ="Corki",Spellslot =_R},
    ["DianaArc"]                      = {Spellname ="DianaArc",Name ="Diana",Spellslot =_Q},
    ["InfectedCleaverMissileCast"]                      = {Spellname ="InfectedCleaverMissileCast",Name ="DrMundo",Spellslot =_Q},
    ["dravenspinning"]                      = {Spellname ="dravenspinning",Name ="Draven",Spellslot =_Q},
    ["DravenDoubleShot"]                      = {Spellname ="DravenDoubleShot",Name ="Draven",Spellslot =_E},
    ["DravenRCast"]                      = {Spellname ="DravenRCast",Name ="Draven",Spellslot =_R},
    ["EliseHumanQ"]                      = {Spellname ="EliseHumanQ",Name ="Elise",Spellslot =_Q},
    ["EliseHumanE"]                      = {Spellname ="EliseHumanE",Name ="Elise",Spellslot =_E},
    ["EvelynnQ"]                      = {Spellname ="EvelynnQ",Name ="Evelynn",Spellslot =_Q},
    ["EzrealMysticShot"]                      = {Spellname ="EzrealMysticShot",Name ="Ezreal",Spellslot =_Q,},
    ["EzrealEssenceFlux"]                      = {Spellname ="EzrealEssenceFlux",Name ="Ezreal",Spellslot =_W},
    ["EzrealArcaneShift"]                      = {Spellname ="EzrealArcaneShift",Name ="Ezreal",Spellslot =_R},
    ["GalioRighteousGust"]                      = {Spellname ="GalioRighteousGust",Name ="Galio",Spellslot =_E},
    ["GalioResoluteSmite"]                      = {Spellname ="GalioResoluteSmite",Name ="Galio",Spellslot =_Q},
    ["Parley"]                      = {Spellname ="Parley",Name ="Gangplank",Spellslot =_Q},
    ["GnarQ"]                      = {Spellname ="GnarQ",Name ="Gnar",Spellslot =_Q},
    ["GravesClusterShot"]                      = {Spellname ="GravesClusterShot",Name ="Graves",Spellslot =_Q},
    ["GravesChargeShot"]                      = {Spellname ="GravesChargeShot",Name ="Graves",Spellslot =_R},
    ["HeimerdingerW"]                      = {Spellname ="HeimerdingerW",Name ="Heimerdinger",Spellslot =_W},
    ["IreliaTranscendentBlades"]                      = {Spellname ="IreliaTranscendentBlades",Name ="Irelia",Spellslot =_R},
    ["HowlingGale"]                      = {Spellname ="HowlingGale",Name ="Janna",Spellslot =_Q},
    ["JayceToTheSkies"]                      = {Spellname ="JayceToTheSkies" or "jayceshockblast",Name ="Jayce",Spellslot =_Q},
    ["jayceshockblast"]                      = {Spellname ="JayceToTheSkies" or "jayceshockblast",Name ="Jayce",Spellslot =_Q},
    ["JinxW"]                      = {Spellname ="JinxW",Name ="Jinx",Spellslot =_W},
    ["JinxR"]                      = {Spellname ="JinxR",Name ="Jinx",Spellslot =_R},
    ["KalistaMysticShot"]                      = {Spellname ="KalistaMysticShot",Name ="Kalista",Spellslot =_Q},
    ["KarmaQ"]                      = {Spellname ="KarmaQ",Name ="Karma",Spellslot =_Q},
    ["NullLance"]                      = {Spellname ="NullLance",Name ="Kassidan",Spellslot =_Q},
    ["KatarinaR"]                      = {Spellname ="KatarinaR",Name ="Katarina",Spellslot =_R},
    ["LeblancChaosOrb"]                      = {Spellname ="LeblancChaosOrb",Name ="Leblanc",Spellslot =_Q},
    ["LeblancSoulShackle"]                      = {Spellname ="LeblancSoulShackle" or "LeblancSoulShackleM",Name ="Leblanc",Spellslot =_E},
    ["LeblancSoulShackleM"]                      = {Spellname ="LeblancSoulShackle" or "LeblancSoulShackleM",Name ="Leblanc",Spellslot =_E},
    ["BlindMonkQOne"]                      = {Spellname ="BlindMonkQOne",Name ="Leesin",Spellslot =_Q},
    ["LeonaZenithBladeMissle"]                      = {Spellname ="LeonaZenithBladeMissle",Name ="Leona",Spellslot =_E},
    ["LissandraE"]                      = {Spellname ="LissandraE",Name ="Lissandra",Spellslot =_E},
    ["LucianR"]                      = {Spellname ="LucianR",Name ="Lucian",Spellslot =_R},
    ["LuxLightBinding"]                      = {Spellname ="LuxLightBinding",Name ="Lux",Spellslot =_Q},
    ["LuxLightStrikeKugel"]                      = {Spellname ="LuxLightStrikeKugel",Name ="Lux",Spellslot =_E},
    ["MissFortuneBulletTime"]                      = {Spellname ="MissFortuneBulletTime",Name ="Missfortune",Spellslot =_R},
    ["DarkBindingMissile"]                      = {Spellname ="DarkBindingMissile",Name ="Morgana",Spellslot =_Q},
    ["NamiR"]                      = {Spellname ="NamiR",Name ="Nami",Spellslot =_R},
    ["JavelinToss"]                      = {Spellname ="JavelinToss",Name ="Nidalee",Spellslot =_Q},
    ["NocturneDuskbringer"]                      = {Spellname ="NocturneDuskbringer",Name ="Nocturne",Spellslot =_Q},
    ["Pantheon_Throw"]                      = {Spellname ="Pantheon_Throw",Name ="Pantheon",Spellslot =_Q},
    ["QuinnQ"]                      = {Spellname ="QuinnQ",Name ="Quinn",Spellslot =_Q},
    ["RengarE"]                      = {Spellname ="RengarE",Name ="Rengar",Spellslot =_E},
    ["rivenizunablade"]                      = {Spellname ="rivenizunablade",Name ="Riven",Spellslot =_R},
    ["Overload"]                      = {Spellname ="Overload",Name ="Ryze",Spellslot =_Q},
    ["SpellFlux"]                      = {Spellname ="SpellFlux",Name ="Ryze",Spellslot =_E},
    ["SejuaniGlacialPrisonStart"]                      = {Spellname ="SejuaniGlacialPrisonStart",Name ="Sejuani",Spellslot =_R},
    ["SivirQ"]                      = {Spellname ="SivirQ",Name ="Sivir",Spellslot =_Q},
    ["SivirE"]                      = {Spellname ="SivirE",Name ="Sivir",Spellslot =_E},
    ["SkarnerFractureMissileSpell"]                      = {Spellname ="SkarnerFractureMissileSpell",Name ="Skarner",Spellslot =_E},
    ["SonaCrescendo"]                      = {Spellname ="SonaCrescendo",Name ="Sona",Spellslot =_R},
    ["SwainDecrepify"]                      = {Spellname ="SwainDecrepify",Name ="Swain",Spellslot =_Q},
    ["SwainMetamorphism"]                      = {Spellname ="SwainMetamorphism",Name ="Swain",Spellslot =_R},
    ["SyndraE"]                      = {Spellname ="SyndraE",Name ="Syndra",Spellslot =_E},
    ["SyndraR"]                      = {Spellname ="SyndraR",Name ="Syndra",Spellslot =_R},
    ["TalonRake"]                      = {Spellname ="TalonRake",Name ="Talon",Spellslot =_W},
    ["TalonShadowAssault"]                      = {Spellname ="TalonShadowAssault",Name ="Talon",Spellslot =_R},
    ["BlindingDart"]                      = {Spellname ="BlindingDart",Name ="Teemo",Spellslot =_Q},
    ["Thresh"]                      = {Spellname ="ThreshQ",Name ="Thresh",Spellslot =_Q},
    ["BusterShot"]                      = {Spellname ="BusterShot",Name ="Tristana",Spellslot =_R},
    ["VarusQ"]                      = {Spellname ="VarusQ",Name ="Varus",Spellslot =_Q},
    ["VarusR"]                      = {Spellname ="VarusR",Name ="Varus",Spellslot =_R},
    ["VayneCondemm"]                      = {Spellname ="VayneCondemm",Name ="Vayne",Spellslot =_E},
    ["VeigarPrimordialBurst"]                      = {Spellname ="VeigarPrimordialBurst",Name ="Veigar",Spellslot =_R},
    ["WildCards"]                      = {Spellname ="WildCards",Name ="Twistedfate",Spellslot =_Q},
    ["VelkozQ"]                      = {Spellname ="VelkozQ",Name ="Velkoz",Spellslot =_Q},
    ["VelkozW"]                      = {Spellname ="VelkozW",Name ="Velkoz",Spellslot =_W},
    ["ViktorDeathRay"]                      = {Spellname ="ViktorDeathRay",Name ="Viktor",Spellslot =_E},
    ["XerathArcanoPulseChargeUp"]                      = {Spellname ="XerathArcanoPulseChargeUp",Name ="Xerath",Spellslot =_Q},
    ["ZedShuriken"]                      = {Spellname ="ZedShuriken",Name ="Zed",Spellslot =_Q},
    ["ZiggsR"]                      = {Spellname ="ZiggsR",Name ="Ziggs",Spellslot =_R},
    ["ZiggsQ"]                      = {Spellname ="ZiggsQ",Name ="Ziggs",Spellslot =_Q},
    ["ZyraGraspingRoots"]                      = {Spellname ="ZyraGraspingRoots",Name ="Zyra",Spellslot =_E}

}
    self.JungleMinions = minionManager(MINION_JUNGLE, 2000, myHero, MINION_SORT_HEALTH_ASC)
    --Target
    self.menu_ts = TargetSelector(1750, 0, myHero, true, true, true)
    self:MenuOlaf()

    self.Machados = false
    vpred = VPrediction(true)

		--Spells
		self.Q = Spell(_Q, 1000)
		self.W = Spell(_W, GetTrueAttackRange())
        self.E = Spell(_E, 325)
        self.R = Spell(_R, 1200)

        self.Q:SetSkillShot(0.25, 1200, 90, false)
        self.W:SetActive()
        self.E:SetTargetted()
        self.R:SetActive()

		Callback.Add("Tick", function() self:OnTick() end) --Call Back Olaf <3 by: DevkAT
		--Callback.Add("Draw", function() self:OnDraw() end)
        --Callback.Add("ProcessSpell", function(...) self:OnProcessSpell(...) end)
        Callback.Add("DrawMenu", function(...) self:OnDrawMenu(...) end)
end

function Olaf:MenuOlaf()
	self.menu = "Olaf"
    self.Use_Combo_Q = self:MenuBool("Use Combo Q", true)
    self.AutoQStack = self:MenuBool("Auto Q", true)

    self.Use_Combo_W = self:MenuBool("Auto W", true)

	self.Enable_E = self:MenuBool("Enable E", true)

	--self.Enable_R = self:MenuBool("Evade R", true)
    self.Use_R_Kill_Steal = self:MenuBool("Use R Kill Steal", true)
    self.Life = self:MenuSliderInt("Hero Life Utimate", 50)
    --self.LifeEvade = self:MenuSliderInt("Evade Life", 30)
    self.Lifetarget = self:MenuSliderInt("Hero Enemy Life Utimate", 50)
    self.MinInimigo = self:MenuSliderInt("Range Heros {R}", 2)

    self.UseQClear = self:MenuBool("Use Q LaneClear", true)
    self.UseWClear = self:MenuBool("Use W LaneClear", true)
    self.UseEClear = self:MenuBool("Use E LaneClear", true)
    self.ManaJungle = self:MenuSliderInt("Mana Jungle", 45)

	self.menu_key_combo = self:MenuKeyBinding("Combo", 32)
    self.Lane_Clear = self:MenuKeyBinding("Lane Clear", 86)
    self.Harass = self:MenuKeyBinding("Harass", 67)
end

function Olaf:OnDrawMenu()
	if Menu_Begin(self.menu) then
		if Menu_Begin("Combo") then
			self.Use_Combo_Q = Menu_Bool("Use Combo Q", self.Use_Combo_Q, self.menu)
            self.Use_Combo_W = Menu_Bool("Use Combo W", self.Use_Combo_W, self.menu)
			self.Enable_E = Menu_Bool("Use Combo E", self.Enable_E, self.menu)
			--self.Enable_R = Menu_Bool("Enable R", self.Enable_R, self.menu)
            --self.Use_R_Kill_Steal = Menu_Bool("Use R Kill Steal", self.Use_R_Kill_Steal, self.menu)
            --self.Life = Menu_SliderInt("Hero Life Utimate", self.Life, 0, 100, self.menu)
            --self.MinInimigo = Menu_SliderInt("Range Heros {R}", self.MinInimigo, 0, 5, self.menu)
			Menu_End()
        end
        if Menu_Begin("Logic {R}") then
            self.Life = Menu_SliderInt("Hero Life Utimate", self.Life, 0, 100, self.menu)
            self.Lifetarget = Menu_SliderInt("Hero Enemy Life Utimate", self.Lifetarget, 0, 100, self.menu)
            self.MinInimigo = Menu_SliderInt("Range Heros {R}", self.MinInimigo, 0, 5, self.menu)
            Menu_End()
        end
        if Menu_Begin("Evade") then
            --self.Enable_R = Menu_Bool("Evade R", self.Enable_R, self.menu)
            --self.LifeEvade = Menu_SliderInt("Hero Enemy Life Utimate", self.LifeEvade, 0, 100, self.menu)
            Menu_End()
        end
        if Menu_Begin("JungleClear") then
            self.UseQClear = Menu_Bool("Use Q Clear", self.UseQClear, self.menu)
            self.UseWClear = Menu_Bool("Use W Clear", self.UseQClear, self.menu)
            self.UseEClear = Menu_Bool("Use E Clear", self.UseEClear, self.menu)
            self.ManaJungle = Menu_SliderInt("Mana Jungle", self.ManaJungle, 0, 100, self.menu)
            Menu_End()
        end

		if Menu_Begin("Keys Olaf") then
			self.menu_key_combo = Menu_KeyBinding("Combo", self.menu_key_combo, self.menu)
            self.Lane_Clear = Menu_KeyBinding("Lane Clear", self.Lane_Clear, self.menu)
            self.Last_Hit = Menu_KeyBinding("Last Hit", self.Last_Hit, self.menu)
            self.Harass = Menu_KeyBinding("Harass", self.Harass, self.menu)
			Menu_End()
		end
		Menu_End()
	end
end

function Olaf:MenuBool(stringKey, bool)
	return ReadIniBoolean(self.menu, stringKey, bool)
end

function Olaf:MenuKeyBinding(stringKey, valueDefault)
	return ReadIniInteger(self.menu, stringKey, valueDefault)
end

function Olaf:MenuSliderInt(stringKey, valueDefault)
	return ReadIniInteger(self.menu, stringKey, valueDefault)
end

function Olaf:IsAfterAttack()
    if CanMove() and not CanAttack() then
        return true
    else
        return false
	end
end

--[[function Olaf:OnProcessSpell(unit, spell)
    if GetChampName(GetMyChamp()) ~= "Olaf" then return end
	if self.W:IsReady()  and IsValidTarget(unit.Addr, 1500) then
		if spell and unit.IsEnemy and myHero.HP*100/myHero.MaxHP < self.LifeEvade and self.Enable_R then
			if myHero == spell.target and spell.Name:lower():find("attack") and (unit.AARange >= 450 or unit.IsRanged) then
				local wPos = Vector(myHero) + (Vector(unit) - Vector(myHero)):Normalized() * self.W.range
				CastSpellTarget(myHero.Addr, _R)
			end
			spell.endPos = {x=spell.DestPos_x, y=spell.DestPos_y, z=spell.DestPos_z}
			if W_SPELLS[spell.Name] and not unit.IsMe and GetDistance(unit) <= GetDistance(unit, spell.endPos) and myHero.HP*100/myHero.MaxHP < self.LifeEvade and self.Enable_R then
				CastSpellTarget(myHero.Addr, _R)
			end
		end
	end
end]]

function Olaf:JungleClear()
    GetAllUnitAroundAnObject(myHero.Addr, 2000)
    local result = {}
    for i, minions in pairs(pUnit) do
        if minions ~= 0 and not IsDead(minions) and not IsInFog(minions) and GetType(minions) == 3 then
            table.insert(result, minions)
        end
    end

    return result
end

function Olaf:FarmJungle(target)
	for i, minions in ipairs(self:JungleClear()) do
        if minions ~= 0 then
		local jungle = GetUnit(minions)
		if jungle.Type == 3 and GetPercentMP(myHero.Addr) >= self.ManaJungle then 

	  if CanCast(_Q) then
		if jungle ~= nil and GetDistance(jungle) < self.Q.range then
			self.Q:Cast(jungle.Addr)
        end
       end
       if CanCast(_W) then
		if jungle ~= nil and GetDistance(jungle) < self.W.range then
			self.W:Cast(myHero.Addr)
        end
	   end
	  if CanCast(_E) then
		if jungle ~= nil and GetDistance(jungle) < self.E.range then
		  self.E:Cast(jungle.Addr)
		end
    end
 end
end
end
end

function Olaf:OnTick()
	if IsDead(myHero.Addr) or IsTyping() or IsDodging() then return end

    if GetKeyPress(self.Lane_Clear) > 0 then
        self:FarmJungle()
    end

    if GetKeyPress(self.menu_key_combo) > 0 then
        self:LogicQ()
        self:LogicE()
        self:LogicW()
        self:LogicR()
    end
end

function Olaf:LogicQ()
	local TargetQ = GetTargetSelector(self.Q.range)
	if CanCast(_Q) and CanMove() and TargetQ ~= 0 then
		target = GetAIHero(TargetQ)
		local CastPosition, HitChance, Position = vpred:GetLineCastPosition(target, self.Q.delay, self.Q.width, self.Q.range, self.Q.speed, myHero, false)
		--local Collision = CountObjectCollision(0, target.Addr, myHero.x, myHero.z, CastPosition.x, CastPosition.z, self.Q.width, self.Q.range, 65)
		if HitChance >= 2 then
			CastSpellToPos(CastPosition.x, CastPosition.z, _Q)
		end
	end
end

function Olaf:LogicW()
    local target = self.menu_ts:GetTarget()
    if target ~= 0 then
    if self.W:IsReady() and IsValidTarget(target, GetTrueAttackRange()) then
        self.W:Cast()
        end 
    end 
end 

function Olaf:LogicE()
	local TargetE = GetTargetSelector(self.E.range)
	if CanCast(_E) and CanMove() and TargetE ~= 0 then
        target = GetAIHero(TargetE)
        CastSpellTarget(target.Addr, _E)
    end 
end

function Olaf:LogicR()
    local target = self.menu_ts:GetTarget()
	if target ~= 0 and IsEnemy(target) then
		local hero = GetAIHero(target)
		if self.R:IsReady() and IsValidTarget(target, self.R.range) and CountEnemyChampAroundObject(target, self.R.range) <= self.MinInimigo and hero.HP*100/hero.MaxHP < self.Lifetarget and GetPercentHP(myHero.Addr) < self.Life then --solo
			self.R:Cast(target)
		end
	end
end




