--Credtis: PINGGIN AND DavKat

--Incluindo Files do Yasuo 
    IncludeFile("Lib\\TOIR_SDK.lua")

--Classes
Yasuo = class()

function Yasuo:__init()
    SetLuaCombo(true)

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


    --Target
    self.menu_ts = TargetSelector(1500, 1, myHero, true, self.menu, true)

    self.MissileSpellsData = {}
    self:MenuYasuo()

		--Spells
		self.Q = Spell(_Q, 425)
		self.W = Spell(_W, 600)
		self.E = Spell(_E, 475)
        self.R = Spell(_R, 1200)
        
        self.W:SetSkillShot()
        self.E:SetTargetted()
        self.R:SetTargetted()

		Callback.Add("Tick", function() self:OnTick() end) --Call Back Yasuo <3 by: DevkAT
		--Callback.Add("Draw", function() self:OnDraw() end)
        Callback.Add("CreateObject", function(...) self:OnCreateObject(...) end)
        Callback.Add("ProcessSpell", function(...) self:OnProcessSpell(...) end)
        Callback.Add("DeleteObject", function(...) self:OnDeleteObject(...) end)
        Callback.Add("DrawMenu", function(...) self:OnDrawMenu(...) end)
end

function Yasuo:MenuYasuo()
	self.menu = "Yasuo"
	self.Use_Combo_Q = self:MenuBool("Use Combo Q", true)

    self.Use_Combo_W = self:MenuBool("Use Combo W", false)
    
	self.Enable_E = self:MenuBool("Enable E", true)

	self.Enable_R = self:MenuBool("Enable R", true)
	self.Use_R_Kill_Steal = self:MenuBool("Use R Kill Steal", true)

	self.menu_key_combo = self:MenuKeyBinding("Combo", 32)
	self.Lane_Clear = self:MenuKeyBinding("Lane Clear", 86)
end

function Yasuo:OnDrawMenu()
	if Menu_Begin(self.menu) then
		if Menu_Begin("Setting Q") then
			self.Use_Combo_Q = Menu_Bool("Use Combo Q", self.Use_Combo_Q, self.menu)
			self.Use_Combo_W = Menu_Bool("Use Combo W", self.Use_Combo_W, self.menu)
			self.Enable_E = Menu_Bool("Enable E", self.Enable_E, self.menu)		
			self.Enable_R = Menu_Bool("Enable R", self.Enable_R, self.menu)
			self.Use_R_Kill_Steal = Menu_Bool("Use R Kill Steal", self.Use_R_Kill_Steal, self.menu)
			Menu_End()
		end
		if Menu_Begin("Key Mode") then
			self.menu_key_combo = Menu_KeyBinding("Combo", self.menu_key_combo, self.menu)
			self.Lane_Clear = Menu_KeyBinding("Lane Clear", self.Lane_Clear, self.menu)
			Menu_End()
		end
		Menu_End()
	end
end

function Yasuo:MenuBool(stringKey, bool)
	return ReadIniBoolean(self.menu, stringKey, bool)
end

function Yasuo:MenuKeyBinding(stringKey, valueDefault)
	return ReadIniInteger(self.menu, stringKey, valueDefault)
end

function Yasuo:OnProcessSpell(unit, spell)
    if GetChampName(GetMyChamp()) ~= "Yasuo" then return end
	if self.W:IsReady() and IsValidTarget(unit.Addr, 1500) then
		if spell then
			if W_SPELLS[spell.Name] and not unit.IsMe then
				CastSpellToPos(unit.x, unit.z, _W)
			end
		end
	end
end


function Yasuo:DashEndPos(target)
    local point = 0

    if GetDistance(target) < 410 then
        point = Vector(myHero):Extended(Vector(target), 485)
    else
        point = Vector(myHero):Extended(Vector(target), GetDistance(target) + 65)
    end

    return point
end

function Yasuo:IsMarked(target)
    return target.HasBuff("YasuoDashWrapper")
end

function Yasuo:GetGapMinion(target)
    local bestMinion = nil
    local closest = 0

    GetAllUnitAroundAnObject(myHero.Addr, 1500)

    local units = pUnit
    for i, unit in pairs(units) do
        if unit and unit ~= 0 and IsMinion(unit) and IsEnemy(unit) and not IsDead(unit) and not IsInFog(unit) and GetTargetableToTeam(unit) == 4 and not self:IsMarked(GetUnit(unit)) and GetDistance(GetUnit(unit)) < 375 then
            if GetDistance(self:DashEndPos(GetUnit(unit)), target) < GetDistance(target) and closest < GetDistance(GetUnit(unit)) then
                closest = GetDistance(GetUnit(unit))
                bestMinion = unit
            end
        end
    end
    return bestMinion
end

function Yasuo:Combo(target)
    if target and target ~= 0 then
        if self.E:IsReady() then
            if self.Enable_E and IsValidTarget(target, self.E.range) and not self:IsMarked(GetAIHero(target)) and GetDistance(GetAIHero(target), self:DashEndPos(GetAIHero(target))) <= GetDistance(GetAIHero(target)) then
                self.E:Cast(target)
            end

            if self.Enable_E then
                local gapMinion = self:GetGapMinion(GetAIHero(target))

                if gapMinion and gapMinion ~= 0 then
                    self.E:Cast(gapMinion)
                end
            end
        end

        if self.R:IsReady() and IsValidTarget(target, self.R.range) and getDmg(R, target) > GetHealthPoint(target) then 
            self.R:Cast(target)
        end

        if self.Q:IsReady() and IsValidTarget(target, self.Q.range) then
            if self.Use_Combo_Q and not myHero.IsDash then
                self.Q:Cast(target)
            end

            if self.Use_Combo_Q and myHero.IsDash and GetDistance(GetAIHero(target)) <= 250 then
                self.Q:Cast(target)
            end
        end
    end
end

function Yasuo:OnTick()
    if GetSpellNameByIndex(myHero.Addr, _Q) == "YasuoQW" then
        self.Q.range = 425
        self.Q:SetSkillShot(0.25, math.huge, 30, false)
    elseif GetSpellNameByIndex(myHero.Addr, _Q) == "YasuoQ3W" then
        self.Q.range = 1000
        self.Q:SetSkillShot(0.25, 1200, 90, false)
    end

    if GetKeyPress(self.menu_key_combo) > 0 then	
        local target = self.menu_ts:GetTarget()
        self:Combo(target)
    end
end

function Yasuo:OnCreateObject(obj)
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

function Yasuo:OnDeleteObject(obj)
    for i, missile in pairs(self.MissileSpellsData) do
        if missile.addr == obj.Addr then
            table.remove(self.MissileSpellsData, i)
        end
    end
end

function OnLoad()
	if GetChampName(GetMyChamp()) == "Yasuo" then
		Yasuo:__init()
    end
end

function getDmg(Spell, target)
	local Damage = 0

	if Spell == R then
		if GetSpellLevel(GetMyChamp(),R) == 0 then return 0 end

		local DamageSpellRTable = {175, 275, 375}

		local Percent_Bonus_AD = 1

		local Damage_Bonus_AD = GetFlatPhysicalDamage(GetMyChamp())

		local DamageSpellR = DamageSpellRTable[GetSpellLevel(GetMyChamp(),R)]

		local Enemy_Armor = GetArmor(Enemy)

		local ArmorPenetration = 60 * GetArmorPenetration(GetMyChamp()) / 100 + (1 - 60/100) * GetArmorPenetration(GetMyChamp()) * GetLevel(target) / 18

		Enemy_Armor = Enemy_Armor - ArmorPenetration

		if Enemy_Armor >= 0 then
			Damage = (DamageSpellR + Percent_Bonus_AD * Damage_Bonus_AD) * (100/(100 + Enemy_Armor))
		else
			Damage = (DamageSpellR + Percent_Bonus_AD * Damage_Bonus_AD) * (2 - 100/(100 - Enemy_Armor))
		end

		return Damage
	end

end