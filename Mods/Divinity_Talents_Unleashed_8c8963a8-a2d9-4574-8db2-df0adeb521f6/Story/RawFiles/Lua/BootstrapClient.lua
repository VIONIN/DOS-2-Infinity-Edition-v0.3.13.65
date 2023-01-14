local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true, index
        end
    end

    return false
end

local SpamCalls = {
    ['updateStatuses'] = true,
    ['update'] = true,
    -- ['removeTooltip'] = true,
    -- ['addTooltip'] = true,
    ['removeLabel'] = true,
    -- ['showFormattedTooltipAfterPos'] = true,
    -- ['addFormattedTooltip'] = true,
    ['updateOHs'] = true,
    ['clearObsoleteOHTs'] = true,
    ['setAllSlotsEnabled'] = true,
    -- ['removingOHT'] = true,
    -- ['updateSlotData'] = true,
    ['setBar1Progress'] = true,
    ['setInputDevice'] = true
}

local function UpdateTalents()
    local ui_charSheet = Ext.UI.GetByType(119)
    local ui_charSheet_root = ui_charSheet:GetRoot()
    local ui_tooltips = Ext.UI.GetByType(44)
    local player = Ext.Entity.GetCharacter(ui_charSheet:GetPlayerHandle())

    local talent_array = {"hbe8305f4g2b31g431ega1ffgc3f0518503ed", 1, player.Stats.TALENT_ItemMovement, "hb97606efg07d3g4d71gae3ag735767403366", 2, player.Stats.TALENT_ItemCreation,"hbb7a1718g390dg400agb5a4g9e07b758a2e8", 3, player.Stats.TALENT_Flanking, "ha6916b7cg086eg4d2dgb30ag80c997699e8a", 4, player.Stats.TALENT_AttackOfOpportunity, "h9836a401g63f6g49c3g8fa0g9564cbad7628",5,player.Stats.TALENT_Backstab,"hecd2ef6cgdd5bg4844ga65fg01193fb2326d",6,player.Stats.TALENT_Trade,"h76d7cc01g0ab7g41f4gb41eg158ae544a5d1",7,player.Stats.TALENT_Lockpick,"h368525f5gf1e4g4e2ag8bf8gc5dc929deb7a",8,player.Stats.TALENT_ChanceToHitRanged,"h6e2e18fcg265bg4a62g855dg51cc05443219",9,player.Stats.TALENT_ChanceToHitMelee,"hbc17d848g850dg482eg904dga57d86f1abc2",10,player.Stats.TALENT_Damage,"h6f921734gc02bg415dg98dag0437a0bbd913",11,player.Stats.TALENT_ActionPoints,"h9be2e2b0gfa3ag480dgbbabgd8f49fd46e5f",12,player.Stats.TALENT_ActionPoints2,"h6f51690dge17eg4b21g93c6g149d73c8ff74",13,player.Stats.TALENT_Criticals,"h3fa29fc4gcd05g415cgab67g4dc26f815f5a",14,player.Stats.TALENT_IncreasedArmor,"h15361d26g3894g4dd1gb726ga9d81cf84138",15,player.Stats.TALENT_Sight,"h17d5a17egc177g4ea4gb0c5g235babd3ba86",16,player.Stats.TALENT_ResistFear,"h2337ec28gb7e0g471bg8f8agcedb4bf66b8a",17,player.Stats.TALENT_ResistKnockdown,"h37e6c2b5ge8bag4e75gaa7ag42fb8aa205a2",18,player.Stats.TALENT_ResistStun,"hf066c9e3g68a7g42d9gb038g12b35bc83c7a",19,player.Stats.TALENT_ResistPoison,"h57fbe968gc007g46d4gbee9g53360bb4c3fb",20,player.Stats.TALENT_ResistSilence,"hb15a53dbge70eg4ca7gba85g94f17e75c0e0",21,player.Stats.TALENT_ResistDead, "h5cf639a9g48b2g44cfgb47bg2350abc0fe0b", 22, player.Stats.TALENT_Carry, "h43453702gb543g454dg9755g22b76c8209ae", 23, player.Stats.TALENT_Throwing, "h9b132ea3g89edg4d79gb9bag640fd23effb4", 24, player.Stats.TALENT_Repair, "h1e39c5b6gec83g4eb5g9f29g7811024fccf7", 25, player.Stats.TALENT_ExpGain, "hd980a2a1gc33eg4810gafc8g07f55ba70245", 26, player.Stats.TALENT_ExtraStatPoints, "h70fe2b7cg2c09g403ag9dd2g82b757e0d39c", 27, player.Stats.TALENT_ExtraSkillPoints, "hbb931846g8f68g45cdg9f97g45afae886797", 28,player.Stats.TALENT_Durability, "h04a28dbeg50c9g42f9g9f04g50f5c4951cdf", 29,player.Stats.TALENT_Awareness, "h8d63a08agaee1g4184g8a26g588784aa55de", 30,player.Stats.TALENT_Vitality, "h3ec565c4gbf86g4ecbg8269gcf2999fab937", 31,player.Stats.TALENT_FireSpells, "h5893d609g682bg49c0g9872g395016a50e50", 32, player.Stats.TALENT_WaterSpells, "h0b4471b4gf3cfg4eecgaf24g8526735e8d11", 33, player.Stats.TALENT_AirSpells, "h814e6bb5g3f51g4549gb3e4ge99e1d0017e1", 34, player.Stats.TALENT_EarthSpells, "hba2372ffge6deg418ag9ae7gc7b860cbcded", 35, player.Stats.TALENT_Charm, "hcf35b10ag331ag438cga2b5gc6d873aab0a0", 36, player.Stats.TALENT_Intimidate, "h84750678g16d5g45ddg9039g46459b7100e9", 37, player.Stats.TALENT_Reason, "hdab9966fgf122g475cg87feg88e08bf52e7b", 38, player.Stats.TALENT_Luck, "hc4d2ebdagd523g4606gbac9g686e44aaee5a", 39, player.Stats.TALENT_Initiative, "h1b8aeef2gf10fg4ae0g8fe7g7a053b568517", 40, player.Stats.TALENT_InventoryAccess, "h0c76874ag1d3cg48b1g9ca8g1c0765708f85", 41, player.Stats.TALENT_AvoidDetection, "h8637e196g238ag46b6gbb85gc2bbbb5e0424", 42, player.Stats.TALENT_AnimalEmpathy, "hd8c70f78g43eeg44c9g81f2gcf16132b1e21", 43, player.Stats.TALENT_Escapist, "h2337ec28gb7e0g471bg8f8agcedb4bf66b8a", 44, player.Stats.TALENT_StandYourGround, "hd82e253fg4915g4275g883bgd61ec85f22b7", 45, player.Stats.TALENT_SurpriseAttack, "hea860e3ag9226g41a8ga17bg0a997bf896fa", 46, player.Stats.TALENT_LightStep, "he8b593b1g2187g47f6g9424g063cb6b60789", 47, player.Stats.TALENT_ResurrectToFullHealth, "h5ca84506g2110g4cdeg923cgb409350183d9", 48, player.Stats.TALENT_Scientist, "h9ce62b0fg4219g4b8bg8844g7bec16feaa3d", 49, player.Stats.TALENT_Raistlin, "hd8a824bdg56bcg4574gb32bg184b06d10564", 50, player.Stats.TALENT_MrKnowItAll, "hf562d566g65d6g46c8g8e27g429bb4d3cf8b", 51, player.Stats.TALENT_WhatARush, "ha04e7d1ag8bf6g4914g82a3gdb7efab194a3", 52, player.Stats.TALENT_FaroutDude, "h4a42fa34g8674g47b2g8313g00a0d9b767a8", 53, player.Stats.TALENT_Leech, "h11964196g2451g4dc2gbb99gba40f1f3dc2d", 54, player.Stats.TALENT_ElementalAffinity, "h4e3165b4gc58bg44caga271ga210f01ba582", 55, player.Stats.TALENT_FiveStarRestaurant, "h6ce94509gdf8fg4831gaf49g099d62e457f8", 56, player.Stats.TALENT_Bully, "h211a5354g7752g4d67gacffg7e07c8fd06e9", 57, player.Stats.TALENT_ElementalRanger, "h37e6c2b5ge8bag4e75gaa7ag42fb8aa205a2", 58, player.Stats.TALENT_LightningRod, "h01dd61c8gd2fdg426fgbd15g4b3f66ab663f", 59, player.Stats.TALENT_Politician, "h476e2244gf088g49e5ga32agc39039659145", 60, player.Stats.TALENT_WeatherProof, "hd650c4cfg77b8g42d5ga6b3g55c28fd8e4e3", 61, player.Stats.TALENT_LoneWolf, "hffa022a2g03b0g46f7g8ee6gcb8e5811a4d3", 62, player.Stats.TALENT_Zombie, "h332be1ccg2610g4942g8d92g58708580c68a", 63, player.Stats.TALENT_Demon, "hb2647f59g3906g4b9bg8b96g0f3ce9518e07", 64, player.Stats.TALENT_IceKing, "h881d0db8g9f57g44dfg9839g0f169399ed51", 65, player.Stats.TALENT_Courageous, "h13b41369g85b4g4897ga277g55b06c779b4b", 66, player.Stats.TALENT_GoldenMage, "h3f059078g65efg4ea9g8514g7175404a276e", 67, player.Stats.TALENT_WalkItOff, "h8fa27d2fgeb94g4475ga70ag1510273e6003", 68, player.Stats.TALENT_FolkDancer, "h54fdcb17g804bg499eg8a8egc562dbfe0a24", 69, player.Stats.TALENT_SpillNoBlood, "hdebdc54fg082dg4973ga6e8g54695c64fb9a", 70, player.Stats.TALENT_Stench, "h14703cb2g02e2g4befg8adcg7bf93245939b", 71, player.Stats.TALENT_Kickstarter, "hfef25ef5g6e0dg4a54g8fa3g1f464130a469", 72, player.Stats.TALENT_WarriorLoreNaturalArmor, "h618f5bcbg76dbg4941g8611gf3a1d50f297e", 73, player.Stats.TALENT_WarriorLoreNaturalHealth, "ha1b1543eg1df1g4c92ga08ag0fd9ef3ef355", 74, player.Stats.TALENT_WarriorLoreNaturalResistance, "hfb6e0d6aga98fg4398g979agcc71ba1ec1e0", 75, player.Stats.TALENT_RangerLoreArrowRecover, "h6a4f7786g3c96g419bgb023g8cd0d25ee9b3", 76, player.Stats.TALENT_RangerLoreEvasionBonus, "h67fc2341g6949g4283g8eb3g2566cbfcda83", 77, player.Stats.TALENT_RangerLoreRangedAPBonus, "hd2bafc20g2692g4ac2g8c9cg957d3c671850", 78, player.Stats.TALENT_RogueLoreDaggerAPBonus, "hce5fda5egaeb0g4e2bg8c94g595c0cd029b3", 79, player.Stats.TALENT_RogueLoreDaggerBackStab, "h9c905ad9g5c9ag4566g957bgefb4d45eefd5", 80, player.Stats.TALENT_RogueLoreMovementBonus, "h4e0cb65dg11e1g4195gbf29gc2e12d310d25", 81, player.Stats.TALENT_RogueLoreHoldResistance, "ha08a2ddag5df0g4e9ag92f5ga34af7b1fc17", 82, player.Stats.TALENT_NoAttackOfOpportunity, "h86bee297g3f52g425egbef7g5057f1ee930d", 83, player.Stats.TALENT_WarriorLoreGrenadeRange, "hc0ab97b9g95dbg461fg9b8eg4601142ae50a", 84, player.Stats.TALENT_RogueLoreGrenadePrecision, "h8725f47dg3256g4d6agb02fg0a9c611146e8", 85, player.Stats.TALENT_WandCharge, "h3b5870dfg90e2g4b87g9328g12872063f35f", 86, player.Stats.TALENT_DualWieldingDodging, "h2646745cgf1b5g44a2gaf6ageef8ee73a923", 87, player.Stats.TALENT_Human_Inventive, "h6c44d6c0g4603g429ag9f5bgc4ba0460fdec", 88, player.Stats.TALENT_Human_Civil, "hcfd646bdg491dg4d9cgaf1ag2ca5f4421f7b", 89, player.Stats.TALENT_Elf_Lore, "h8fcf368eg0abeg4314gacdcgb495473a9ade", 90, player.Stats.TALENT_Elf_CorpseEating, "h477b8976gfac3g4cdag954bg5617876c6ef7", 91, player.Stats.TALENT_Dwarf_Sturdy, "h429e53b9ge574g4c77gbc1ag2cfd9844252f", 92, player.Stats.TALENT_Dwarf_Sneaking, "h7b9a0d2egff87g42afgbec4g6c01c4303401", 93, player.Stats.TALENT_Lizard_Resistance, "ha4af67a7g7112g4e66gbaedg6bf024feb097", 94, player.Stats.TALENT_Lizard_Persuasion, "h1fe3d762g3ad4g403bgbe14gfcbcf99d692a", 95, player.Stats.TALENT_Perfectionist, "h51aee942g9713g493ag9467g6dff07a0f02d", 96, player.Stats.TALENT_Executioner, "hfb87cc03g1dc0g4095g93efg0becba59f352", 97, player.Stats.TALENT_ViolentMagic, "h01248cafga159g43aaga826g214fd84dde62", 98, player.Stats.TALENT_QuickStep, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 99, player.Stats.TALENT_Quest_SpidersKiss_Str, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 100, player.Stats.TALENT_Quest_SpidersKiss_Int, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 101, player.Stats.TALENT_Quest_SpidersKiss_Per, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 102, player.Stats.TALENT_Quest_SpidersKiss_Null, "heb588256ge75fg492fg8c29g3c3b5643f3db", 103, player.Stats.TALENT_Memory,"h068a4c1dg465ag4653gb5eeg639f1ebdf539", 104, player.Stats.TALENT_Quest_TradeSecrets, "hb3f045a6gd7b6g49fcga080g5b7d13aee6de", 105, player.Stats.TALENT_Quest_GhostTree, "hf7681f8fg310cg4596g91efg571d32a2bd70", 106, player.Stats.TALENT_BeastMaster, "h34f3a0e4g7722g4d5fg97f8gd9b67a582c32", 107, player.Stats.TALENT_LivingArmor, "hec141b07gb2e6g4283g8006gd94adc63d734", 108, player.Stats.TALENT_Torturer, "h52b6a3cfga4dag4a3bga6fdgf5158d6d030b", 109, player.Stats.TALENT_Ambidextrous, "hb95f314agabcfg45e9g942ege43b8c9adaa5", 110, player.Stats.TALENT_Unstable, "h958144bbg2c4ag4267g9d71g3b9080167711", 111, player.Stats.TALENT_ResurrectExtraHealth, "h0a3386f4gd52cg47b0ga63eg02582fe6720d", 112, player.Stats.TALENT_NaturalConductor, "h61e75d99g2d31g43d3g9de5gb523a74506e1", 113, player.Stats.TALENT_Quest_Rooted, "hc07b1f2ag23b4g42d4g8d11g1b9e54a2ea8a", 114, player.Stats.TALENT_PainDrinker, "hcf141983g4e08g405dg83bcg3f66636aa9ec", 115, player.Stats.TALENT_DeathfogResistant, "h5279a104g5c7ag4d0fgb191gc963d39c286c", 116, player.Stats.TALENT_Sourcerer, "he1b6d26dgfa57g4878g8948g68f08c6c531f", 117, player.Stats.TALENT_Rager, "h8d9e4cc0g448dg40b0g9936gbd7cb0098f46", 118, player.Stats.TALENT_Elementalist, "h1ba5c933g7a30g4d1fg99c0gc266fb5a0d12", 119, player.Stats.TALENT_Sadist, "h53a20ccfgf169g4e61ga093g1e0586b73318", 120, player.Stats.TALENT_Haymaker, "hba13af60g3ff2g4927gac9dgb98029a1873f", 121, player.Stats.TALENT_Gladiator, "h37ab421bgc879g4e3cgabdegf6ec70854bea", 122, player.Stats.TALENT_Indomitable, "h42bc6d05g85f4g4315gaa8bg5ec6073f74ea", 123, player.Stats.TALENT_WildMag, "h34c2dbe0g49e4g40cdgb6bcgbc19f73b7a06", 124, player.Stats.TALENT_Jitterbug, "hc6caa349gcb41g4976g8257gae9fc52b6031",
     125, player.Stats.TALENT_Soulcatcher, "h2a458c89g1c51g47c9ga6dbg6d507dc10022", 126, player.Stats.TALENT_MasterThief, "h1d99c24eg60a0g424dg8fa5gd184f6b7cb4f", 127, player.Stats.TALENT_GreedyVessel, "h4564bbfbgd845g4318g97e7ge85f5923b323", 128, player.Stats.TALENT_MagicCycles}
    local notAcceptebleTalents = {"hffa022a2g03b0g46f7g8ee6gcb8e5811a4d3", 62, player.Stats.TALENT_Zombie, "h2646745cgf1b5g44a2gaf6ageef8ee73a923", 87, player.Stats.TALENT_Human_Inventive, "h6c44d6c0g4603g429ag9f5bgc4ba0460fdec", 88, player.Stats.TALENT_Human_Civil, "hcfd646bdg491dg4d9cgaf1ag2ca5f4421f7b", 89, player.Stats.TALENT_Elf_Lore, "h8fcf368eg0abeg4314gacdcgb495473a9ade", 90, player.Stats.TALENT_Elf_CorpseEating, "h477b8976gfac3g4cdag954bg5617876c6ef7", 91, player.Stats.TALENT_Dwarf_Sturdy, "h429e53b9ge574g4c77gbc1ag2cfd9844252f", 92, player.Stats.TALENT_Dwarf_Sneaking, "h7b9a0d2egff87g42afgbec4g6c01c4303401", 93, player.Stats.TALENT_Lizard_Resistance, "ha4af67a7g7112g4e66gbaedg6bf024feb097", 94, player.Stats.TALENT_Lizard_Persuasion, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 99, player.Stats.TALENT_Quest_SpidersKiss_Str, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 100, player.Stats.TALENT_Quest_SpidersKiss_Int, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 101, player.Stats.TALENT_Quest_SpidersKiss_Per, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 102, player.Stats.TALENT_Quest_SpidersKiss_Null, "h068a4c1dg465ag4653gb5eeg639f1ebdf539", 104, player.Stats.TALENT_Quest_TradeSecrets, "hb3f045a6gd7b6g49fcga080g5b7d13aee6de", 105, player.Stats.TALENT_Quest_GhostTree, "h61e75d99g2d31g43d3g9de5gb523a74506e1", 113, player.Stats.TALENT_Quest_Rooted}
    local notWorkingTalents = {"hb97606efg07d3g4d71gae3ag735767403366", 2, player.Stats.TALENT_ItemCreation, "h9b132ea3g89edg4d79gb9bag640fd23effb4", 24, player.Stats.TALENT_Repair, "h476e2244gf088g49e5ga32agc39039659145", 60, player.Stats.TALENT_WeatherProof, "hfef25ef5g6e0dg4a54g8fa3g1f464130a469", 72, player.Stats.TALENT_WarriorLoreNaturalArmor, "h958144bbg2c4ag4267g9d71g3b9080167711", 111, player.Stats.TALENT_ResurrectExtraHealth,  "h8d9e4cc0g448dg40b0g9936gbd7cb0098f46", 118, player.Stats.TALENT_Elementalist, "h368525f5gf1e4g4e2ag8bf8gc5dc929deb7a",8,player.Stats.TALENT_ChanceToHitRanged,"h6e2e18fcg265bg4a62g855dg51cc05443219",9,player.Stats.TALENT_ChanceToHitMelee, "h9836a401g63f6g49c3g8fa0g9564cbad7628",5,player.Stats.TALENT_Backstab, "h17d5a17egc177g4ea4gb0c5g235babd3ba86",16,player.Stats.TALENT_ResistFear,"h2337ec28gb7e0g471bg8f8agcedb4bf66b8a",17,player.Stats.TALENT_ResistKnockdown,"h37e6c2b5ge8bag4e75gaa7ag42fb8aa205a2",18,player.Stats.TALENT_ResistStun,"hf066c9e3g68a7g42d9gb038g12b35bc83c7a",19,player.Stats.TALENT_ResistPoison,"h57fbe968gc007g46d4gbee9g53360bb4c3fb",20,player.Stats.TALENT_ResistSilence, "h43453702gb543g454dg9755g22b76c8209ae", 23, player.Stats.TALENT_Throwing, "h04a28dbeg50c9g42f9g9f04g50f5c4951cdf", 29,player.Stats.TALENT_Awareness, "hba2372ffge6deg418ag9ae7gc7b860cbcded", 35, player.Stats.TALENT_Charm, "hcf35b10ag331ag438cga2b5gc6d873aab0a0", 36, player.Stats.TALENT_Intimidate, "h84750678g16d5g45ddg9039g46459b7100e9", 37, player.Stats.TALENT_Reason, "h5ca84506g2110g4cdeg923cgb409350183d9", 48, player.Stats.TALENT_Scientist, "h14703cb2g02e2g4befg8adcg7bf93245939b", 71, player.Stats.TALENT_Kickstarter, "hce5fda5egaeb0g4e2bg8c94g595c0cd029b3", 79, player.Stats.TALENT_RogueLoreDaggerBackStab, "h15361d26g3894g4dd1gb726ga9d81cf84138",15,player.Stats.TALENT_Sight, "h4e0cb65dg11e1g4195gbf29gc2e12d310d25", 81, player.Stats.TALENT_RogueLoreHoldResistance, "h8725f47dg3256g4d6agb02fg0a9c611146e8", 85, player.Stats.TALENT_WandCharge, "h67fc2341g6949g4283g8eb3g2566cbfcda83", 77, player.Stats.TALENT_RangerLoreRangedAPBonus, "h54fdcb17g804bg499eg8a8egc562dbfe0a24", 69, player.Stats.TALENT_SpillNoBlood, "hbb7a1718g390dg400agb5a4g9e07b758a2e8", 3, player.Stats.TALENT_Flanking}
    local emptyTalents = {"hc07b1f2ag23b4g42d4g8d11g1b9e54a2ea8a", 114, player.Stats.TALENT_PainDrinker, "hcf141983g4e08g405dg83bcg3f66636aa9ec", 115, player.Stats.TALENT_DeathfogResistant, "h5279a104g5c7ag4d0fgb191gc963d39c286c", 116, player.Stats.TALENT_Sourcerer, "he1b6d26dgfa57g4878g8948g68f08c6c531f", 117, player.Stats.TALENT_Rager}
    local defaultTalents = {"hd650c4cfg77b8g42d5ga6b3g55c28fd8e4e3", 61, player.Stats.TALENT_LoneWolf, "h9ce62b0fg4219g4b8bg8844g7bec16feaa3d", 49, player.Stats.TALENT_Raistlin, "hd8a824bdg56bcg4574gb32bg184b06d10564", 50, player.Stats.TALENT_MrKnowItAll, "hb15a53dbge70eg4ca7gba85g94f17e75c0e0",21,player.Stats.TALENT_ResistDead, "hd980a2a1gc33eg4810gafc8g07f55ba70245", 26, player.Stats.TALENT_ExtraStatPoints, "h70fe2b7cg2c09g403ag9dd2g82b757e0d39c", 27, player.Stats.TALENT_ExtraSkillPoints, "h52b6a3cfga4dag4a3bga6fdgf5158d6d030b", 109, player.Stats.TALENT_Ambidextrous, "hfb6e0d6aga98fg4398g979agcc71ba1ec1e0", 75, player.Stats.TALENT_RangerLoreArrowRecover, "h332be1ccg2610g4942g8d92g58708580c68a", 63, player.Stats.TALENT_Demon, "h11964196g2451g4dc2gbb99gba40f1f3dc2d", 54, player.Stats.TALENT_ElementalAffinity, "h4e3165b4gc58bg44caga271ga210f01ba582", 55, player.Stats.TALENT_FiveStarRestaurant, "h211a5354g7752g4d67gacffg7e07c8fd06e9", 57, player.Stats.TALENT_ElementalRanger, "h8637e196g238ag46b6gbb85gc2bbbb5e0424", 42, player.Stats.TALENT_AnimalEmpathy, "hd8c70f78g43eeg44c9g81f2gcf16132b1e21", 43, player.Stats.TALENT_Escapist, "h51aee942g9713g493ag9467g6dff07a0f02d", 96, player.Stats.TALENT_Executioner, "ha04e7d1ag8bf6g4914g82a3gdb7efab194a3", 52, player.Stats.TALENT_FaroutDude, "hd82e253fg4915g4275g883bgd61ec85f22b7", 45, player.Stats.TALENT_SurpriseAttack, "h1fe3d762g3ad4g403bgbe14gfcbcf99d692a", 95, player.Stats.TALENT_Perfectionist, "hb2647f59g3906g4b9bg8b96g0f3ce9518e07", 64, player.Stats.TALENT_IceKing, "h4a42fa34g8674g47b2g8313g00a0d9b767a8", 53, player.Stats.TALENT_Leech, "h34f3a0e4g7722g4d5fg97f8gd9b67a582c32", 107, player.Stats.TALENT_LivingArmor, "heb588256ge75fg492fg8c29g3c3b5643f3db", 103, player.Stats.TALENT_Memory, "he8b593b1g2187g47f6g9424g063cb6b60789", 47, player.Stats.TALENT_ResurrectToFullHealth, "ha6916b7cg086eg4d2dgb30ag80c997699e8a", 4, player.Stats.TALENT_AttackOfOpportunity, "h3b5870dfg90e2g4b87g9328g12872063f35f", 86, player.Stats.TALENT_DualWieldingDodging, "h618f5bcbg76dbg4941g8611gf3a1d50f297e", 73, player.Stats.TALENT_WarriorLoreNaturalHealth, "hfb87cc03g1dc0g4095g93efg0becba59f352", 97, player.Stats.TALENT_ViolentMagic, "h86bee297g3f52g425egbef7g5057f1ee930d", 83, player.Stats.TALENT_WarriorLoreGrenadeRange}

    local subTalent_con = 0
    local talent_state_orig = 2
    local talent_state = talent_state_orig
    local workTalents_length = #talent_array

    while subTalent_con < workTalents_length do
        talent_state = talent_state_orig
        talent_name = talent_array[subTalent_con + 1]
        talent_id = talent_array[subTalent_con + 2]
        talent_has = talent_array[subTalent_con + 3]

        talentIsEmpty = has_value(emptyTalents, talent_id)
        if talentIsEmpty then goto idinahuy end
        
        talent_name = Ext.L10N.GetTranslatedString(talent_name)
        origTalName = talent_name

        ui_charSheet:ExternalInterfaceCall("showTalentTooltip", talent_id, 0, 0, 0, 0, 0)
        talentAvailabe = ui_tooltips:GetValue("tooltip_array", nil, 7)
        ui_charSheet:ExternalInterfaceCall("hideTooltip")

        --Если есть таланта, то присваиваю ему статус таланта которые есть)
        if talent_has == true then
            talent_state = 0
        --Если параметр возможности к прокачке false у тултипа таланта, то назначаю ему статус невозможного к прокачке
        elseif talentAvailabe == false then
            talent_state = 3
        end

        talentNotWorking = has_value(notWorkingTalents, talent_id)
        if talentNotWorking then
            talent_state = 4
        end

        if talent_state == 4 then
            talent_name = "<font color=\"#644C00\">" .. origTalName .. "</font>"
        end

        if talent_state == 3 then
            talent_name = "<font color=\"#C80030\">" .. origTalName .. "</font>"
        end
        
        if talent_state == 2 then
            talent_name = "<font color=\"#403625\">" .. origTalName .. "</font>"
        end
        
        --Выставляю уже прокачанные неработающие таланты к списку прокачанных и окрашиваю его в неработающий цвет
        if talent_has and talentNotWorking then
            talent_state = 0
            talent_name = "<font color=\"#644C00\">" .. origTalName .. "</font>"
        end
        
        --не добавляю недоступные таланты (поцелуй паука или рассовые и также квестовые), если их нет у персонажа
        talentNotChoosable = has_value(notAcceptebleTalents, talent_id)
        talentIsDefault = has_value(defaultTalents, talent_id)
        if talent_has == true then
            ui_charSheet:Invoke("addTalent", talent_name, talent_id, talent_state)
        elseif talent_has == false and talentNotChoosable == true then
            goto idinahuy
        elseif talentIsDefault == false and talent_state ~= 4 then
            ui_charSheet:Invoke("addTalent", talent_name, talent_id, talent_state)
        end

        ::idinahuy::
        subTalent_con = subTalent_con + 3
    end
    ui_charSheet_root.stats_mc.talentHolder_mc.list.positionElements()
end

local function UpdateCreationEditTalents()
    local ui_charSheet = Ext.UI.GetByType(119)
    local ui_charCreation = Ext.UI.GetByType(3)
    local ui_charCreation_root = ui_charCreation:GetRoot()
    local ui_tooltips = Ext.UI.GetByType(44)
    local player = nil

    local player = Ext.Entity.GetCharacter(Ext.DoubleToHandle(ui_charCreation_root.CCPanel_mc.root_mc.characterHandle))
    
    local talent_array = {"hbe8305f4g2b31g431ega1ffgc3f0518503ed", 1, player.Stats.TALENT_ItemMovement, "hb97606efg07d3g4d71gae3ag735767403366", 2, player.Stats.TALENT_ItemCreation,"hbb7a1718g390dg400agb5a4g9e07b758a2e8", 3, player.Stats.TALENT_Flanking, "ha6916b7cg086eg4d2dgb30ag80c997699e8a", 4, player.Stats.TALENT_AttackOfOpportunity, "h9836a401g63f6g49c3g8fa0g9564cbad7628",5,player.Stats.TALENT_Backstab,"hecd2ef6cgdd5bg4844ga65fg01193fb2326d",6,player.Stats.TALENT_Trade,"h76d7cc01g0ab7g41f4gb41eg158ae544a5d1",7,player.Stats.TALENT_Lockpick,"h368525f5gf1e4g4e2ag8bf8gc5dc929deb7a",8,player.Stats.TALENT_ChanceToHitRanged,"h6e2e18fcg265bg4a62g855dg51cc05443219",9,player.Stats.TALENT_ChanceToHitMelee,"hbc17d848g850dg482eg904dga57d86f1abc2",10,player.Stats.TALENT_Damage,"h6f921734gc02bg415dg98dag0437a0bbd913",11,player.Stats.TALENT_ActionPoints,"h9be2e2b0gfa3ag480dgbbabgd8f49fd46e5f",12,player.Stats.TALENT_ActionPoints2,"h6f51690dge17eg4b21g93c6g149d73c8ff74",13,player.Stats.TALENT_Criticals,"h3fa29fc4gcd05g415cgab67g4dc26f815f5a",14,player.Stats.TALENT_IncreasedArmor,"h15361d26g3894g4dd1gb726ga9d81cf84138",15,player.Stats.TALENT_Sight,"h17d5a17egc177g4ea4gb0c5g235babd3ba86",16,player.Stats.TALENT_ResistFear,"h2337ec28gb7e0g471bg8f8agcedb4bf66b8a",17,player.Stats.TALENT_ResistKnockdown,"h37e6c2b5ge8bag4e75gaa7ag42fb8aa205a2",18,player.Stats.TALENT_ResistStun,"hf066c9e3g68a7g42d9gb038g12b35bc83c7a",19,player.Stats.TALENT_ResistPoison,"h57fbe968gc007g46d4gbee9g53360bb4c3fb",20,player.Stats.TALENT_ResistSilence,"hb15a53dbge70eg4ca7gba85g94f17e75c0e0",21,player.Stats.TALENT_ResistDead, "h5cf639a9g48b2g44cfgb47bg2350abc0fe0b", 22, player.Stats.TALENT_Carry, "h43453702gb543g454dg9755g22b76c8209ae", 23, player.Stats.TALENT_Throwing, "h9b132ea3g89edg4d79gb9bag640fd23effb4", 24, player.Stats.TALENT_Repair, "h1e39c5b6gec83g4eb5g9f29g7811024fccf7", 25, player.Stats.TALENT_ExpGain, "hd980a2a1gc33eg4810gafc8g07f55ba70245", 26, player.Stats.TALENT_ExtraStatPoints, "h70fe2b7cg2c09g403ag9dd2g82b757e0d39c", 27, player.Stats.TALENT_ExtraSkillPoints, "hbb931846g8f68g45cdg9f97g45afae886797", 28,player.Stats.TALENT_Durability, "h04a28dbeg50c9g42f9g9f04g50f5c4951cdf", 29,player.Stats.TALENT_Awareness, "h8d63a08agaee1g4184g8a26g588784aa55de", 30,player.Stats.TALENT_Vitality, "h3ec565c4gbf86g4ecbg8269gcf2999fab937", 31,player.Stats.TALENT_FireSpells, "h5893d609g682bg49c0g9872g395016a50e50", 32, player.Stats.TALENT_WaterSpells, "h0b4471b4gf3cfg4eecgaf24g8526735e8d11", 33, player.Stats.TALENT_AirSpells, "h814e6bb5g3f51g4549gb3e4ge99e1d0017e1", 34, player.Stats.TALENT_EarthSpells, "hba2372ffge6deg418ag9ae7gc7b860cbcded", 35, player.Stats.TALENT_Charm, "hcf35b10ag331ag438cga2b5gc6d873aab0a0", 36, player.Stats.TALENT_Intimidate, "h84750678g16d5g45ddg9039g46459b7100e9", 37, player.Stats.TALENT_Reason, "hdab9966fgf122g475cg87feg88e08bf52e7b", 38, player.Stats.TALENT_Luck, "hc4d2ebdagd523g4606gbac9g686e44aaee5a", 39, player.Stats.TALENT_Initiative, "h1b8aeef2gf10fg4ae0g8fe7g7a053b568517", 40, player.Stats.TALENT_InventoryAccess, "h0c76874ag1d3cg48b1g9ca8g1c0765708f85", 41, player.Stats.TALENT_AvoidDetection, "h8637e196g238ag46b6gbb85gc2bbbb5e0424", 42, player.Stats.TALENT_AnimalEmpathy, "hd8c70f78g43eeg44c9g81f2gcf16132b1e21", 43, player.Stats.TALENT_Escapist, "h2337ec28gb7e0g471bg8f8agcedb4bf66b8a", 44, player.Stats.TALENT_StandYourGround, "hd82e253fg4915g4275g883bgd61ec85f22b7", 45, player.Stats.TALENT_SurpriseAttack, "hea860e3ag9226g41a8ga17bg0a997bf896fa", 46, player.Stats.TALENT_LightStep, "he8b593b1g2187g47f6g9424g063cb6b60789", 47, player.Stats.TALENT_ResurrectToFullHealth, "h5ca84506g2110g4cdeg923cgb409350183d9", 48, player.Stats.TALENT_Scientist, "h9ce62b0fg4219g4b8bg8844g7bec16feaa3d", 49, player.Stats.TALENT_Raistlin, "hd8a824bdg56bcg4574gb32bg184b06d10564", 50, player.Stats.TALENT_MrKnowItAll, "hf562d566g65d6g46c8g8e27g429bb4d3cf8b", 51, player.Stats.TALENT_WhatARush, "ha04e7d1ag8bf6g4914g82a3gdb7efab194a3", 52, player.Stats.TALENT_FaroutDude, "h4a42fa34g8674g47b2g8313g00a0d9b767a8", 53, player.Stats.TALENT_Leech, "h11964196g2451g4dc2gbb99gba40f1f3dc2d", 54, player.Stats.TALENT_ElementalAffinity, "h4e3165b4gc58bg44caga271ga210f01ba582", 55, player.Stats.TALENT_FiveStarRestaurant, "h6ce94509gdf8fg4831gaf49g099d62e457f8", 56, player.Stats.TALENT_Bully, "h211a5354g7752g4d67gacffg7e07c8fd06e9", 57, player.Stats.TALENT_ElementalRanger, "h37e6c2b5ge8bag4e75gaa7ag42fb8aa205a2", 58, player.Stats.TALENT_LightningRod, "h01dd61c8gd2fdg426fgbd15g4b3f66ab663f", 59, player.Stats.TALENT_Politician, "h476e2244gf088g49e5ga32agc39039659145", 60, player.Stats.TALENT_WeatherProof, "hd650c4cfg77b8g42d5ga6b3g55c28fd8e4e3", 61, player.Stats.TALENT_LoneWolf, "hffa022a2g03b0g46f7g8ee6gcb8e5811a4d3", 62, player.Stats.TALENT_Zombie, "h332be1ccg2610g4942g8d92g58708580c68a", 63, player.Stats.TALENT_Demon, "hb2647f59g3906g4b9bg8b96g0f3ce9518e07", 64, player.Stats.TALENT_IceKing, "h881d0db8g9f57g44dfg9839g0f169399ed51", 65, player.Stats.TALENT_Courageous, "h13b41369g85b4g4897ga277g55b06c779b4b", 66, player.Stats.TALENT_GoldenMage, "h3f059078g65efg4ea9g8514g7175404a276e", 67, player.Stats.TALENT_WalkItOff, "h8fa27d2fgeb94g4475ga70ag1510273e6003", 68, player.Stats.TALENT_FolkDancer, "h54fdcb17g804bg499eg8a8egc562dbfe0a24", 69, player.Stats.TALENT_SpillNoBlood, "hdebdc54fg082dg4973ga6e8g54695c64fb9a", 70, player.Stats.TALENT_Stench, "h14703cb2g02e2g4befg8adcg7bf93245939b", 71, player.Stats.TALENT_Kickstarter, "hfef25ef5g6e0dg4a54g8fa3g1f464130a469", 72, player.Stats.TALENT_WarriorLoreNaturalArmor, "h618f5bcbg76dbg4941g8611gf3a1d50f297e", 73, player.Stats.TALENT_WarriorLoreNaturalHealth, "ha1b1543eg1df1g4c92ga08ag0fd9ef3ef355", 74, player.Stats.TALENT_WarriorLoreNaturalResistance, "hfb6e0d6aga98fg4398g979agcc71ba1ec1e0", 75, player.Stats.TALENT_RangerLoreArrowRecover, "h6a4f7786g3c96g419bgb023g8cd0d25ee9b3", 76, player.Stats.TALENT_RangerLoreEvasionBonus, "h67fc2341g6949g4283g8eb3g2566cbfcda83", 77, player.Stats.TALENT_RangerLoreRangedAPBonus, "hd2bafc20g2692g4ac2g8c9cg957d3c671850", 78, player.Stats.TALENT_RogueLoreDaggerAPBonus, "hce5fda5egaeb0g4e2bg8c94g595c0cd029b3", 79, player.Stats.TALENT_RogueLoreDaggerBackStab, "h9c905ad9g5c9ag4566g957bgefb4d45eefd5", 80, player.Stats.TALENT_RogueLoreMovementBonus, "h4e0cb65dg11e1g4195gbf29gc2e12d310d25", 81, player.Stats.TALENT_RogueLoreHoldResistance, "ha08a2ddag5df0g4e9ag92f5ga34af7b1fc17", 82, player.Stats.TALENT_NoAttackOfOpportunity, "h86bee297g3f52g425egbef7g5057f1ee930d", 83, player.Stats.TALENT_WarriorLoreGrenadeRange, "hc0ab97b9g95dbg461fg9b8eg4601142ae50a", 84, player.Stats.TALENT_RogueLoreGrenadePrecision, "h8725f47dg3256g4d6agb02fg0a9c611146e8", 85, player.Stats.TALENT_WandCharge, "h3b5870dfg90e2g4b87g9328g12872063f35f", 86, player.Stats.TALENT_DualWieldingDodging, "h2646745cgf1b5g44a2gaf6ageef8ee73a923", 87, player.Stats.TALENT_Human_Inventive, "h6c44d6c0g4603g429ag9f5bgc4ba0460fdec", 88, player.Stats.TALENT_Human_Civil, "hcfd646bdg491dg4d9cgaf1ag2ca5f4421f7b", 89, player.Stats.TALENT_Elf_Lore, "h8fcf368eg0abeg4314gacdcgb495473a9ade", 90, player.Stats.TALENT_Elf_CorpseEating, "h477b8976gfac3g4cdag954bg5617876c6ef7", 91, player.Stats.TALENT_Dwarf_Sturdy, "h429e53b9ge574g4c77gbc1ag2cfd9844252f", 92, player.Stats.TALENT_Dwarf_Sneaking, "h7b9a0d2egff87g42afgbec4g6c01c4303401", 93, player.Stats.TALENT_Lizard_Resistance, "ha4af67a7g7112g4e66gbaedg6bf024feb097", 94, player.Stats.TALENT_Lizard_Persuasion, "h1fe3d762g3ad4g403bgbe14gfcbcf99d692a", 95, player.Stats.TALENT_Perfectionist, "h51aee942g9713g493ag9467g6dff07a0f02d", 96, player.Stats.TALENT_Executioner, "hfb87cc03g1dc0g4095g93efg0becba59f352", 97, player.Stats.TALENT_ViolentMagic, "h01248cafga159g43aaga826g214fd84dde62", 98, player.Stats.TALENT_QuickStep, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 99, player.Stats.TALENT_Quest_SpidersKiss_Str, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 100, player.Stats.TALENT_Quest_SpidersKiss_Int, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 101, player.Stats.TALENT_Quest_SpidersKiss_Per, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 102, player.Stats.TALENT_Quest_SpidersKiss_Null, "heb588256ge75fg492fg8c29g3c3b5643f3db", 103, player.Stats.TALENT_Memory,"h068a4c1dg465ag4653gb5eeg639f1ebdf539", 104, player.Stats.TALENT_Quest_TradeSecrets, "hb3f045a6gd7b6g49fcga080g5b7d13aee6de", 105, player.Stats.TALENT_Quest_GhostTree, "hf7681f8fg310cg4596g91efg571d32a2bd70", 106, player.Stats.TALENT_BeastMaster, "h34f3a0e4g7722g4d5fg97f8gd9b67a582c32", 107, player.Stats.TALENT_LivingArmor, "hec141b07gb2e6g4283g8006gd94adc63d734", 108, player.Stats.TALENT_Torturer, "h52b6a3cfga4dag4a3bga6fdgf5158d6d030b", 109, player.Stats.TALENT_Ambidextrous, "hb95f314agabcfg45e9g942ege43b8c9adaa5", 110, player.Stats.TALENT_Unstable, "h958144bbg2c4ag4267g9d71g3b9080167711", 111, player.Stats.TALENT_ResurrectExtraHealth, "h0a3386f4gd52cg47b0ga63eg02582fe6720d", 112, player.Stats.TALENT_NaturalConductor, "h61e75d99g2d31g43d3g9de5gb523a74506e1", 113, player.Stats.TALENT_Quest_Rooted, "hc07b1f2ag23b4g42d4g8d11g1b9e54a2ea8a", 114, player.Stats.TALENT_PainDrinker, "hcf141983g4e08g405dg83bcg3f66636aa9ec", 115, player.Stats.TALENT_DeathfogResistant, "h5279a104g5c7ag4d0fgb191gc963d39c286c", 116, player.Stats.TALENT_Sourcerer, "he1b6d26dgfa57g4878g8948g68f08c6c531f", 117, player.Stats.TALENT_Rager, "h8d9e4cc0g448dg40b0g9936gbd7cb0098f46", 118, player.Stats.TALENT_Elementalist, "h1ba5c933g7a30g4d1fg99c0gc266fb5a0d12", 119, player.Stats.TALENT_Sadist, "h53a20ccfgf169g4e61ga093g1e0586b73318", 120, player.Stats.TALENT_Haymaker, "hba13af60g3ff2g4927gac9dgb98029a1873f", 121, player.Stats.TALENT_Gladiator, "h37ab421bgc879g4e3cgabdegf6ec70854bea", 122, player.Stats.TALENT_Indomitable, "h42bc6d05g85f4g4315gaa8bg5ec6073f74ea", 123, player.Stats.TALENT_WildMag, "h34c2dbe0g49e4g40cdgb6bcgbc19f73b7a06", 124, player.Stats.TALENT_Jitterbug, "hc6caa349gcb41g4976g8257gae9fc52b6031",
     125, player.Stats.TALENT_Soulcatcher, "h2a458c89g1c51g47c9ga6dbg6d507dc10022", 126, player.Stats.TALENT_MasterThief, "h1d99c24eg60a0g424dg8fa5gd184f6b7cb4f", 127, player.Stats.TALENT_GreedyVessel, "h4564bbfbgd845g4318g97e7ge85f5923b323", 128, player.Stats.TALENT_MagicCycles}
    local notAcceptebleTalents = {"hffa022a2g03b0g46f7g8ee6gcb8e5811a4d3", 62, player.Stats.TALENT_Zombie, "h2646745cgf1b5g44a2gaf6ageef8ee73a923", 87, player.Stats.TALENT_Human_Inventive, "h6c44d6c0g4603g429ag9f5bgc4ba0460fdec", 88, player.Stats.TALENT_Human_Civil, "hcfd646bdg491dg4d9cgaf1ag2ca5f4421f7b", 89, player.Stats.TALENT_Elf_Lore, "h8fcf368eg0abeg4314gacdcgb495473a9ade", 90, player.Stats.TALENT_Elf_CorpseEating, "h477b8976gfac3g4cdag954bg5617876c6ef7", 91, player.Stats.TALENT_Dwarf_Sturdy, "h429e53b9ge574g4c77gbc1ag2cfd9844252f", 92, player.Stats.TALENT_Dwarf_Sneaking, "h7b9a0d2egff87g42afgbec4g6c01c4303401", 93, player.Stats.TALENT_Lizard_Resistance, "ha4af67a7g7112g4e66gbaedg6bf024feb097", 94, player.Stats.TALENT_Lizard_Persuasion, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 99, player.Stats.TALENT_Quest_SpidersKiss_Str, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 100, player.Stats.TALENT_Quest_SpidersKiss_Int, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 101, player.Stats.TALENT_Quest_SpidersKiss_Per, "h69cf8934ge43eg4564g8c7eg35ce410cf457", 102, player.Stats.TALENT_Quest_SpidersKiss_Null, "h068a4c1dg465ag4653gb5eeg639f1ebdf539", 104, player.Stats.TALENT_Quest_TradeSecrets, "hb3f045a6gd7b6g49fcga080g5b7d13aee6de", 105, player.Stats.TALENT_Quest_GhostTree, "h61e75d99g2d31g43d3g9de5gb523a74506e1", 113, player.Stats.TALENT_Quest_Rooted}
    local notWorkingTalents = {"hb97606efg07d3g4d71gae3ag735767403366", 2, player.Stats.TALENT_ItemCreation, "h9b132ea3g89edg4d79gb9bag640fd23effb4", 24, player.Stats.TALENT_Repair, "h476e2244gf088g49e5ga32agc39039659145", 60, player.Stats.TALENT_WeatherProof, "hfef25ef5g6e0dg4a54g8fa3g1f464130a469", 72, player.Stats.TALENT_WarriorLoreNaturalArmor, "h958144bbg2c4ag4267g9d71g3b9080167711", 111, player.Stats.TALENT_ResurrectExtraHealth,  "h8d9e4cc0g448dg40b0g9936gbd7cb0098f46", 118, player.Stats.TALENT_Elementalist, "h368525f5gf1e4g4e2ag8bf8gc5dc929deb7a",8,player.Stats.TALENT_ChanceToHitRanged,"h6e2e18fcg265bg4a62g855dg51cc05443219",9,player.Stats.TALENT_ChanceToHitMelee, "h9836a401g63f6g49c3g8fa0g9564cbad7628",5,player.Stats.TALENT_Backstab, "h17d5a17egc177g4ea4gb0c5g235babd3ba86",16,player.Stats.TALENT_ResistFear,"h2337ec28gb7e0g471bg8f8agcedb4bf66b8a",17,player.Stats.TALENT_ResistKnockdown,"h37e6c2b5ge8bag4e75gaa7ag42fb8aa205a2",18,player.Stats.TALENT_ResistStun,"hf066c9e3g68a7g42d9gb038g12b35bc83c7a",19,player.Stats.TALENT_ResistPoison,"h57fbe968gc007g46d4gbee9g53360bb4c3fb",20,player.Stats.TALENT_ResistSilence, "h43453702gb543g454dg9755g22b76c8209ae", 23, player.Stats.TALENT_Throwing, "h04a28dbeg50c9g42f9g9f04g50f5c4951cdf", 29,player.Stats.TALENT_Awareness, "hba2372ffge6deg418ag9ae7gc7b860cbcded", 35, player.Stats.TALENT_Charm, "hcf35b10ag331ag438cga2b5gc6d873aab0a0", 36, player.Stats.TALENT_Intimidate, "h84750678g16d5g45ddg9039g46459b7100e9", 37, player.Stats.TALENT_Reason, "h5ca84506g2110g4cdeg923cgb409350183d9", 48, player.Stats.TALENT_Scientist, "h14703cb2g02e2g4befg8adcg7bf93245939b", 71, player.Stats.TALENT_Kickstarter, "hce5fda5egaeb0g4e2bg8c94g595c0cd029b3", 79, player.Stats.TALENT_RogueLoreDaggerBackStab, "h15361d26g3894g4dd1gb726ga9d81cf84138",15,player.Stats.TALENT_Sight, "h4e0cb65dg11e1g4195gbf29gc2e12d310d25", 81, player.Stats.TALENT_RogueLoreHoldResistance, "h8725f47dg3256g4d6agb02fg0a9c611146e8", 85, player.Stats.TALENT_WandCharge, "h67fc2341g6949g4283g8eb3g2566cbfcda83", 77, player.Stats.TALENT_RangerLoreRangedAPBonus, "h54fdcb17g804bg499eg8a8egc562dbfe0a24", 69, player.Stats.TALENT_SpillNoBlood, "hbb7a1718g390dg400agb5a4g9e07b758a2e8", 3, player.Stats.TALENT_Flanking}
    local emptyTalents = {"hc07b1f2ag23b4g42d4g8d11g1b9e54a2ea8a", 114, player.Stats.TALENT_PainDrinker, "hcf141983g4e08g405dg83bcg3f66636aa9ec", 115, player.Stats.TALENT_DeathfogResistant, "h5279a104g5c7ag4d0fgb191gc963d39c286c", 116, player.Stats.TALENT_Sourcerer, "he1b6d26dgfa57g4878g8948g68f08c6c531f", 117, player.Stats.TALENT_Rager}

    local talent_state = "work"
    local subTalent_con = 0
    local workTalents_length = #talent_array

    ui_charCreation_root.CCPanel_mc.talents_mc.talentList.cleanUpElements()

    while subTalent_con < workTalents_length do
        talent_name = talent_array[subTalent_con + 1]
        talent_name = Ext.L10N.GetTranslatedString(talent_name)
        talent_id = talent_array[subTalent_con + 2]
        talent_has = talent_array[subTalent_con + 3]
        talent_state = "work"

        --Убираю 4 нерабочих пустых таланта
        talentIsEmpty = has_value(emptyTalents, talent_id)
        if talentIsEmpty then goto nahuy end
        
        talentAvailabe = true
        ui_charCreation:ExternalInterfaceCall("showTalentTooltip", ui_charCreation_root.CCPanel_mc.root_mc.characterHandle, talent_id, 0, 0, 0, 0, 0)
        talentAvailabe = ui_tooltips:GetValue("tooltip_array", nil, 7)
        ui_charCreation:ExternalInterfaceCall("hideTooltip")

        talentNotWorking = has_value(notWorkingTalents, talent_id)
        if talentNotWorking then
            talent_state = "notWorking"
        end

        if talent_state == "nowWorking" then
            talent_name = "<font color=\"#644C00\">" .. talent_name .. "</font>"
        end

        --не добавляю недоступные таланты (поцелуй паука или рассовые и также квестовые), если их нет у персонажа
        talentNotChoosable = has_value(notAcceptebleTalents, talent_id)
        if talent_has == true then
            ui_charCreation_root.CCPanel_mc.talents_mc.addTalentElement(talent_id, talent_name, talent_has, talentAvailabe, talentNotChoosable)
        elseif talent_has == false and talentNotChoosable == true then
            goto nahuy
        --Не добавляет талант которые уже и так есть в оригинальном списке
        elseif talent_state ~= "notWorking" then
            ui_charCreation_root.CCPanel_mc.talents_mc.addTalentElement(talent_id, talent_name, talent_has, talentAvailabe, talentNotChoosable)
        end

        ::nahuy::
        subTalent_con = subTalent_con + 3
    end
end

local function OnSessionLoaded()
    local ui_charSheet = Ext.UI.GetByType(119)
    local ui_tooltip = Ext.UI.GetByType(44)
    Ext.RegisterUIInvokeListener(ui_charSheet, "updateArraySystem", UpdateTalents)
    Ext.RegisterUINameInvokeListener("updateTalents", UpdateCreationEditTalents) --для изменения персонажа в зеркале

    ui_tooltip:SetCustomIcon("tt_talent_123", "TALENT_WildMag", 128, 128)
    ui_tooltip:SetCustomIcon("tt_talent_39", "TALENT_Initiative", 128, 128)
end
Ext.Events.SessionLoaded:Subscribe(OnSessionLoaded)


