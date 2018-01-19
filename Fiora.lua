IncludeFile("Lib\\TOIR_SDK.lua")

Fiora = class()


function OnLoad()
	if GetChampName(GetMyChamp()) == "Fiora" then
		Fiora:__init()
    end
end

function Fiora:__init()

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
    self.EnemyMinions = minionManager(MINION_ENEMY, 2000, myHero, MINION_SORT_HEALTH_ASC)
    --Target
    self.menu_ts = TargetSelector(1750, 0, myHero, true, true, true)

    self.MissileSpellsData = {}
    self:MenuFiora()

    self.PassiveFiora = false

		--Spells
		self.Q = Spell(_Q, 425)
		self.W = Spell(_W, 600)
        self.E = Spell(_E, 475)
        self.R = Spell(_R, 1200)

        self.W:SetSkillShot()
        self.E:SetTargetted()
        self.R:SetTargetted()

		Callback.Add("Tick", function() self:OnTick() end) --Call Back Fiora <3 by: DevkAT
        Callback.Add("Draw", function() self:OnDraw() end)
        Callback.Add("DoCast", function(...) self:OnDoCast(...) end)
		Callback.Add("CreateObject", function(...) self:OnCreateObject(...) end)
		Callback.Add("DeleteObject", function(...) self:OnDeleteObject(...) end)
        Callback.Add("ProcessSpell", function(...) self:OnProcessSpell(...) end)
        Callback.Add("DrawMenu", function(...) self:OnDrawMenu(...) end)


        self.objList = {}
		self.trackList = {}
		self.passtiveList = { --thank you shulepin for the Names of the Passive of the fiora
			["Fiora_Base_Passive_NE.troy"] = { x = 0, z = 200},
			["Fiora_Base_Passive_NW.troy"] = { x = 200, z = 0},
			["Fiora_Base_Passive_SE.troy"] = { x = -1 * 200, z = 0},
			["Fiora_Base_Passive_SW.troy"] = { x = 0, z = -1 * 200},
			["Fiora_Base_R_Mark_NE_FioraOnly.troy"] = { x = 0, z = 200},
			["Fiora_Base_R_Mark_NW_FioraOnly.troy"] = { x = 200, z = 0},
			["Fiora_Base_R_Mark_SE_FioraOnly.troy"] = { x = -1 * 200, z = 0},
			["Fiora_Base_R_Mark_SW_FioraOnly.troy"] = { x = 0, z = -1 * 200}
		}
end

function Fiora:MenuFiora()
	self.menu = "Fiora"
    self.Basic = self:MenuBool("Use Combo Basic", false)
    self.Medium = self:MenuBool("Use Combo Medium ", true)
    self.Hard = self:MenuBool("Use Combo Hard ", true)

	self.Enable_R = self:MenuBool("Enable R", true)
    self.Use_R_Kill_Steal = self:MenuBool("Use R Kill Steal", true)
    self.Life = self:MenuSliderInt("Hero Life Utimate", 50)
    self.MinInimigo = self:MenuSliderInt("Range Heros {R}", 2)

    self.DRAWS = self.MenuBool("Draw Passive", true)

	self.menu_key_combo = self:MenuKeyBinding("Combo", 32)
    self.Lane_Clear = self:MenuKeyBinding("Lane Clear", 86)
    self.Last_Hit = self:MenuKeyBinding("Last Hit", 88)
    self.Harass = self:MenuKeyBinding("Harass", 67)
end

function Fiora:OnDrawMenu()
	if Menu_Begin(self.menu) then
		if Menu_Begin("Combos") then
			self.Basic = Menu_Bool("Use Combo Basic", self.Basic, self.menu)
            self.Hard = Menu_Bool("Use Combo Medium", self.Hard, self.menu)
            self.Medium = Menu_Bool("Use Combo Hard", self.Medium, self.menu)
            Menu_End()
        end
        if Menu_Begin("Config {R}") then
            self.Use_R_Kill_Steal = Menu_Bool("Use R Kill Steal", self.Use_R_Kill_Steal, self.menu)
            self.Life = Menu_SliderInt("Hero Life Utimate", self.Life, 0, 100, self.menu)
            self.MinInimigo = Menu_SliderInt("Range Heros {R}", self.MinInimigo, 0, 5, self.menu)
			Menu_End()
        end
        if Menu_Begin("Draws") then
            self.DRAWS = Menu_Bool("Draw Passive", self.DRAWS, self.menu)
			Menu_End()
        end
		if Menu_Begin("Keys Fiora") then
			self.menu_key_combo = Menu_KeyBinding("Combo", self.menu_key_combo, self.menu)
            self.Lane_Clear = Menu_KeyBinding("Lane Clear", self.Lane_Clear, self.menu)
            self.Last_Hit = Menu_KeyBinding("Last Hit", self.Last_Hit, self.menu)
            self.Harass = Menu_KeyBinding("Harass", self.Harass, self.menu)
			Menu_End()
		end
		Menu_End()
	end
end

function Fiora:PossitionQ()
    local result = nil
		local distanceTemp = math.huge

		for i, obj in pairs(self.trackList) do
			local origin_x, origin_y, origin_z = GetPos(obj.Addr)
			local origin = Vector(origin_x, origin_y, origin_z)

			if origin then
				local distance = self.passtiveList[obj.Name]

				local PassiveBuff = {
					x = origin.x + distance.x,
					y = origin.y,
					z = origin.z + distance.z
				}

				local PassiveBuff_distance = GetDistance(PassiveBuff)
				if not result or PassiveBuff_distance < distanceTemp then
					result = PassiveBuff
					distanceTemp = PassiveBuff_distance
				end
			end
		end

		return result, distanceTemp
    end
    
function Fiora:ObjList()
    local result = {}

    for i, object in pairs(self.objList) do
        local nID = object.NetworkId

        if nID then
            self.trackList[nID] = object
        else
            table.insert(result, object)
        end
    end

    self.objList = result
end

function Fiora:OnDraw()
    if self.DRAWS then 

    for i, obj in pairs(self.trackList) do
    	local origin_x, origin_y, origin_z = GetPos(obj.Addr)
    	local origin = Vector(origin_x, origin_y, origin_z)
    
    	if origin then
    		local distance = self.passtiveList[obj.Name]
    		DrawCircleGame(origin.x + distance.x, origin.y, origin.z + distance.z,100, Lua_ARGB(255,255,255,255))
      end
    end
    end
end 

    
function Fiora:MenuBool(stringKey, bool)
	return ReadIniBoolean(self.menu, stringKey, bool)
end

function Fiora:MenuKeyBinding(stringKey, valueDefault)
	return ReadIniInteger(self.menu, stringKey, valueDefault)
end

function Fiora:MenuSliderInt(stringKey, valueDefault)
	return ReadIniInteger(self.menu, stringKey, valueDefault)
end

function Fiora:OnProcessSpell(unit, spell)
    if GetChampName(GetMyChamp()) ~= "Fiora" then return end
	if self.W:IsReady()  and IsValidTarget(unit.Addr, 800) then
		if spell and unit.IsEnemy then
			if myHero == spell.target and spell.Name:lower():find("attack") and (unit.AARange >= 450 or unit.IsRanged) then
				local wPos = Vector(myHero) + (Vector(unit) - Vector(myHero)):Normalized() * self.W.range
				CastSpellToPos(wPos.x, wPos.z, _W)
			end
			spell.endPos = {x=spell.DestPos_x, y=spell.DestPos_y, z=spell.DestPos_z}
			if W_SPELLS[spell.Name] and not unit.IsMe and GetDistance(unit) <= GetDistance(unit, spell.endPos) then
				CastSpellToPos(unit.x, unit.z, _W)
			end
		end
	end
end

function Fiora:OnDoCast(unit, spell)
    if unit.IsMe then
        if spell.Name:lower():find("attack") and CanCast(_E) then
            CastSpellTarget(myHero.Addr, _E)
        end

        if (spell.Name == "FioraEAttack") and not CanCast(_E) then --3077 3748 ItemTiamatCleave  ItemTitanicHydraCleave spell.Name == "FioraEAttack"
            local tiamat = GetSpellIndexByName("ItemTiamatCleave")
            local titan = GetSpellIndexByName("ItemTitanicHydraCleave")

            if myHero.HasItem(3074) and CanCast(tiamat) then
                CastSpellTarget(myHero.Addr, tiamat)
            end

            if myHero.HasItem(3077) and CanCast(tiamat) then
                CastSpellTarget(myHero.Addr, tiamat)
            end

            if myHero.HasItem(3748) and CanCast(titan) then
                CastSpellTarget(myHero.Addr, titan)
            end
        end
    end
end

function Fiora:OnCreateObject(obj)
    if self.passtiveList[obj.Name] then
        table.insert(self.objList, obj)
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

function Fiora:OnDeleteObject(obj)
    if self.passtiveList[obj.Name] then
        self.trackList[obj.NetworkId] = nil
    end

    for i, missile in pairs(self.MissileSpellsData) do
        if missile.addr == obj.Addr then
            table.remove(self.MissileSpellsData, i)
        end
    end
end

function Fiora:Combo(target)
    local PassiveBuff, distance = self:PossitionQ()
    if PassiveBuff and distance > 100 then
        if CanCast(_Q) and distance < 450 then
            CastSpellToPos(PassiveBuff.x, PassiveBuff.z, _Q)
        end
    end
end


function Fiora:AntiDashsing()
    SearchAllChamp()
    local Enemies = pObjChamp
    for idx, enemy in ipairs(Enemies) do
      if enemy ~= 0 then
        if self.Q:IsReady() and IsValidTarget(enemy, self.Q.range) and IsDashing(enemy) and self.passiveTracker then
              self.Q:Cast(enemy)
          end
      end
    end
  end
  
  function Fiora:AutoUtimatey()
      local target = self.menu_ts:GetTarget()
      if target ~= 0 then
          local hero = GetAIHero(target)
          if self.R:IsReady() and IsValidTarget(target, self.R.range) and CountEnemyChampAroundObject(target, self.R.range) <= 1 and hero.HP*100/hero.MaxHP < self.Life then --solo
              self.R:Cast(target)
          end
      end
  end

function Fiora:OnTick()

    self:ObjList()

	if IsDead(myHero.Addr) or IsTyping() or IsDodging() then return end

	self.PassiveFiora = false

    self:AutoUtimatey()

    if GetKeyPress(self.menu_key_combo) > 0 then
        local target = self.menu_ts:GetTarget()
        self:Combo(target)
    end
end