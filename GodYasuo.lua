IncludeFile("Lib\\TOIR_SDK.lua")
IncludeFile("Lib\\OrbNew.lua")

Yasuo = class()

-- CREDITS: Shulepin, Noob, Thanks for Evade and Baseuti


local function PrintChat(msg)
	return __PrintTextGame("<b><font color=\"#ffffff\">[Yasuo Good] </font></b> </font><font color=\"#c5eff7\"> " .. msg .. " </font><b><font color=\"#ffffff\"></font></b> </font>")
end

function OnLoad()
	if GetChampName(GetMyChamp()) == "Yasuo" then
		Yasuo:__init()
	end
end

function Yasuo:__init()
    SetLuaCombo(true)

    orbwalk = Orbwalking()
	self.menuOrbwalk = menuInst.addItem(SubMenu.new("Orbwalking", Lua_ARGB(255, 100, 250, 50)))
    orbwalk:LoadToMenu(self.menuOrbwalk)
    
    --Main Menu
    self.menu = menuInst.addItem(SubMenu.new("Yasuo", Lua_ARGB(255, 100, 250, 50)))

    --TS
    self.menu_ts = TargetSelector(1500, 1, myHero, true, self.menu, true)

    vpred = VPrediction(self.menu)

    --Combo
    self.menu_combo = self.menu.addItem(SubMenu.new("Combo"))
    self.menu_combo_q = self.menu_combo.addItem(MenuBool.new("Use Q", true))
    self.menu_combo_q2 = self.menu_combo.addItem(MenuBool.new("Use Q Circle", true))
    self.menu_combo_w = self.menu_combo.addItem(MenuBool.new("Use W", true))
    self.menu_combo_e = self.menu_combo.addItem(MenuBool.new("Use E", true))
    self.menu_combo_e_gap = self.menu_combo.addItem(MenuBool.new("Use E For Gap", true))
    self.menu_combo_r = self.menu_combo.addItem(MenuBool.new("Use R", true))
    self.menu_combo_lifenemy = self.menu_combo.addItem(MenuSlider.new("Use R Enemy > Life", 30, 1, 5, 100))
    self.menu_combo_items = self.menu_combo.addItem(MenuBool.new("Use Items", true))

    --Evade
    --[[self.menu_evade = self.menu.addItem(SubMenu.new("W Block"))
    self.menu_evade.addItem(MenuSeparator.new("Spell Settings", true))
    self.menu_evade_spells = {}
    self.menu_evade_spells_dec = {}
    for i, enemy in pairs(GetEnemyHeroes()) do
        local enemy = GetAIHero(enemy)
        if self.SpellData[enemy.CharName] then
            for i, v in pairs(self.SpellData[enemy.CharName]) do
                if enemy and v then
                    local SlotToStr = ({[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"})[v.slot]

                    table.insert(self.menu_evade_spells, {
                        charName = enemy.CharName,
                        slot = v.slot,
                        menu = self.menu_evade.addItem(SubMenu.new(enemy.CharName.." | "..SlotToStr.." | "..v.name))
                        })

                    
                    for i = 1, #self.menu_evade_spells do
                                local index = 0

                                if self.menu_evade_spells[i].charName == enemy.CharName and self.menu_evade_spells[i].slot == v.slot then
                                        index = i
                                end

                                if index ~= 0 then
                                        table.insert(self.menu_evade_spells_dec, {
                                            name = v.name,
                                            enabled = self.menu_evade_spells[index].menu.addItem(MenuBool.new("Enabled", true)),
                                            danger = self.menu_evade_spells[index].menu.addItem(MenuSlider.new("Danger Value", v.danger or 1, 1, 5, 1))
                                            })
                                end
                        end
                end
            end
        end
    end
    --self.menu_evade.addItem(MenuSeparator.new("Block Settings", true))
    --self.menu_evade_enabled = self.menu_evade.addItem(MenuBool.new("Enabled", true))
   -- self.menu_evade_combo = self.menu_evade.addItem(MenuBool.new("Only On Combo", true))
    --self.menu_evade_danger = self.menu_evade.addItem(MenuSlider.new("Min. Danger Value", 3, 1, 5, 1))]]

    --Keys
    self.menu_key = self.menu.addItem(SubMenu.new("Keys"))
    self.menu_key_combo = self.menu_key.addItem(MenuKeyBind.new("Combo Key", 32))

    menuInstSep.setValue("Yasuo Assasin")

    --Spells
    self.Q = Spell(_Q, 425)
    self.W = Spell(_W, 600)
    self.E = Spell(_E, 475)
    self.R = Spell(_R, 1200)
    self.E:SetTargetted()
    self.R:SetTargetted()

    Callback.Add("Tick", function() self:OnTick() end)

    PrintChat("Yasuo Loading...")
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
    local closest = math.huge

    GetAllUnitAroundAnObject(myHero.Addr, 1500)

    local units = pUnit
    for i, unit in pairs(units) do
        if unit and unit ~= 0 and IsMinion(unit) and IsEnemy(unit) and not IsDead(unit) and not IsInFog(unit) and GetTargetableToTeam(unit) == 4 and not self:IsMarked(GetUnit(unit)) then
            if GetDistance(target, self:DashEndPos(GetUnit(unit))) < GetDistance(target) and GetDistance(self:DashEndPos(GetUnit(unit))) < closest then
                bestMinion = unit
                closest = GetDistance(self:DashEndPos(GetUnit(unit)), target)
            end
        end
    end

    return bestMinion
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
        print(GetDamage("Q", GetAIHero(target)))
        if self.E:IsReady() then
            if self.menu_combo_e.getValue() and IsValidTarget(target, self.E.range) and not self:IsMarked(GetAIHero(target)) and GetDistance(GetAIHero(target), self:DashEndPos(GetAIHero(target))) <= GetDistance(GetAIHero(target)) then
                self.E:Cast(target)
            end 

            if self.menu_combo_e_gap.getValue() then
                local gapMinion = self:GetGapMinion(GetAIHero(target))

                if gapMinion and gapMinion ~= 0 then
                    self.E:Cast(gapMinion)
                end
            end
        end

        if self.Q:IsReady() and IsValidTarget(target, self.Q.range) then
            if self.menu_combo_q.getValue() and not myHero.IsDash then
                self.Q:Cast(target)
            end

            if self.menu_combo_q2.getValue() and myHero.IsDash and GetDistance(GetAIHero(target)) <= 250 then
                self.Q:Cast(target)
            end
        end
    end
end

function Yasuo:LogicR(target)
    
    if self.R:IsReady() and IsValidTarget(target, self.R.range) then
        if self.menu_combo_r.getValue() and not myHero.IsDash then
            self.R:Cast(target)
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

    if self.menu_key_combo.getValue() then
        local target = self.menu_ts:GetTarget()

        self:Combo(target)
        self:LogicR(target)
    end
end

    