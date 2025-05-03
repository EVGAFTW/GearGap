-- GearGap.lua
-- Version 2.9.2

local addonName, addon = ...
GearGap = addon
GearGap.debug = false -- Toggle debug prints

-- Specialization ID to name mapping
local SPEC_MAP = {
    -- Druid
    ["102"] = "Balance",
    ["103"] = "Feral",
    ["104"] = "Guardian",
    ["105"] = "Restoration",
    -- Paladin
    ["65"] = "Holy",
    ["66"] = "Protection",
    ["70"] = "Retribution",
    -- Hunter
    ["253"] = "BeastMastery",
    ["254"] = "Marksmanship",
    ["255"] = "Survival",
    -- Mage
    ["62"] = "Arcane",
    ["63"] = "Fire",
    ["64"] = "Frost",
    -- Monk
    ["268"] = "Brewmaster",
    ["270"] = "Mistweaver",
    ["269"] = "Windwalker",
    -- Priest
    ["256"] = "Discipline",
    ["257"] = "Holy",
    ["258"] = "Shadow",
    -- Rogue
    ["259"] = "Assassination",
    ["260"] = "Outlaw",
    ["261"] = "Subtlety",
    -- Shaman
    ["262"] = "Elemental",
    ["263"] = "Enhancement",
    ["264"] = "Restoration",
    -- Warlock
    ["265"] = "Affliction",
    ["266"] = "Demonology",
    ["267"] = "Destruction",
    -- Warrior
    ["71"] = "Arms",
    ["72"] = "Fury",
    ["73"] = "Protection",
    -- Death Knight
    ["250"] = "Blood",
    ["251"] = "Frost",
    ["252"] = "Unholy",
    -- Demon Hunter
    ["577"] = "Havoc",
    ["581"] = "Vengeance",
    -- Evoker
    ["1467"] = "Devastation",
    ["1468"] = "Preservation",
    ["1473"] = "Augmentation"
}

-- Slot coordinates (x, y) relative to TOPLEFT of panel content
local SLOT_COORDINATES = {
    ["Head"] = {20, -65},
    ["Neck"] = {20, -120},
    ["Shoulder"] = {20, -175},
    ["Back"] = {20, -230},
    ["Chest"] = {20, -285},
    ["Wrist"] = {20, -340},
    ["Hands"] = {280, -65},
    ["Waist"] = {280, -120},
    ["Legs"] = {280, -175},
    ["Feet"] = {280, -230},
    ["Finger"] = {280, -285},
    ["Finger2"] = {280, -340},
    ["Trinket"] = {280, -395},
    ["Trinket2"] = {280, -450},
    ["Weapon"] = {120, -460},
    ["Offhand"] = {175, -460},
}

-- Initialize BiS data
GearGapBiS = GearGapBiS or {}
if GearGap.debug then
    print("[GearGap Debug]: Initializing GearGapBiS")
end

-- BiS Data Start
-- DeathKnight Blood
GearGapBiS['DeathKnight'] = GearGapBiS['DeathKnight'] or {}
GearGapBiS['DeathKnight']['Blood'] = GearGapBiS['DeathKnight']['Blood'] or {
    { slot = "Head", itemID = 229253, name = "Cauldron Champion\'s Crown", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Neck", itemID = 221103, name = "Flickering Glowtorc", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Shoulder", itemID = 229251, name = "Cauldron Champion\'s Screamplate", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Crafting", ilvl = 639 },
    { slot = "Chest", itemID = 234506, name = "Muckdiver\'s Wading Plate", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Wrist", itemID = 222435, name = "Everforged Vambraces", source = "Crafting", ilvl = 639 },
    { slot = "Hands", itemID = 229254, name = "Cauldron Champion\'s Fistguards", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 228873, name = "Heaviestweight Title Belt", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Legs", itemID = 229252, name = "Cauldron Champion\'s Tattered Cuisses", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 168972, name = "Pyroclastic Greatboots", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 219309, name = "Tome of Light\'s Devotion", source = "Priory of the Sacred Flame", ilvl = 639 },
    { slot = "Weapon", itemID = 232526, name = "Best-in-Slots", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- DeathKnight Frost
GearGapBiS['DeathKnight']['Frost'] = GearGapBiS['DeathKnight']['Frost'] or {
    { slot = "Head", itemID = 228858, name = "Fullthrottle Facerig", source = "Vexie", ilvl = 639 },
    { slot = "Neck", itemID = 232663, name = "Undermine Merc\'s Dog Tags", source = "Liberation of Undermine BoE", ilvl = 639 },
    { slot = "Shoulder", itemID = 229251, name = "Cauldron Champion\'s Screamplate", source = "Rik Reverb/ Catalyst / Vault", ilvl = 639 },
    { slot = "Back", itemID = 221054, name = "Chef Chewie\'s Towel", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Chest", itemID = 229256, name = "Cauldron Champion\'s Ribcage", source = "Sprocketmonger / Catalyst / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 222435, name = "Everforged Vambraces", source = "Blacksmithing", ilvl = 639 },
    { slot = "Hands", itemID = 229254, name = "Cauldron Champion\'s Fistguards", source = "Cauldron of Carnage / Catalyst / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 168976, name = "Automatic Waist Tightener", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Legs", itemID = 229252, name = "Cauldron Champion\'s Tattered Cuisses", source = "Stix Bunkjunker / Catalyst / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 221061, name = "Hops-Laden Greatboots", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Trinket", itemID = 232541, name = "Improvised Seaforium Pacemaker", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Weapon", itemID = 228895, name = "Remixed Ignition Saber", source = "Rik Reverb", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- DeathKnight Unholy
GearGapBiS['DeathKnight']['Unholy'] = GearGapBiS['DeathKnight']['Unholy'] or {
    { slot = "Head", itemID = 229253, name = "Cauldron Champion\'s Crown", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Neck", itemID = 221060, name = "Strapped Rescue-Keg", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Shoulder", itemID = 229251, name = "Cauldron Champion\'s Screamplate", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Crafting", ilvl = 639 },
    { slot = "Chest", itemID = 229256, name = "Cauldron Champion\'s Ribcage", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 222435, name = "Everforged Vambraces", source = "Crafting", ilvl = 639 },
    { slot = "Hands", itemID = 229254, name = "Cauldron Champion\'s Fistguards", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 228886, name = "Coin-Operated Girdle", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Legs", itemID = 178800, name = "Galvanized Oxxein Legguards", source = "Theater of Pain", ilvl = 639 },
    { slot = "Feet", itemID = 229255, name = "Cauldron Champion\'s Greatboots", source = "Catalyst", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 232485, name = "Mechano-Core Amplifier", source = "Delves / Vault", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Weapon", itemID = 232526, name = "Best-in-Slots", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- DemonHunter Havoc
GearGapBiS['DemonHunter'] = GearGapBiS['DemonHunter'] or {}
GearGapBiS['DemonHunter']['Havoc'] = GearGapBiS['DemonHunter']['Havoc'] or {
    { slot = "Head", itemID = 229316, name = "Fel-Dealer\'s Visor", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Neck", itemID = 232663, name = "Undermine Merc\'s Dog Tags", source = "Liberation of Undermine Bind on Equip Drop", ilvl = 639 },
    { slot = "Shoulder", itemID = 229314, name = "Fel-Dealer\'s Recycled Reavers", source = "Rik Reverb", ilvl = 639 },
    { slot = "Back", itemID = 221054, name = "Chef Chewie\'s Towel", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Chest", itemID = 229319, name = "Fel-Dealer\'s Soul Engine", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Wrist", itemID = 219334, name = "Rune-Branded Armbands", source = "Crafting", ilvl = 639 },
    { slot = "Hands", itemID = 221036, name = "Tempestwind Handlers", source = "The Rookery", ilvl = 639 },
    { slot = "Waist", itemID = 229313, name = "Fel-Dealer\'s Waistwrap", source = "Catalyst", ilvl = 639 },
    { slot = "Legs", itemID = 229315, name = "Fel-Dealer\'s Fur Kilt", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Feet", itemID = 228888, name = "Rushed Beta Launchers", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 178872, name = "Ring of Perpetual Conflict", source = "Theater of Pain", ilvl = 639 },
    { slot = "Trinket", itemID = 232541, name = "Improvised Seaforium Pacemaker", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Weapon", itemID = 232804, name = "Capo\'s Molten Knuckles", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Offhand", itemID = 222441, name = "Everforged Warglaive", source = "Crafting", ilvl = 639 },
}

-- DemonHunter Vengeance
GearGapBiS['DemonHunter']['Vengeance'] = GearGapBiS['DemonHunter']['Vengeance'] or {
    { slot = "Head", itemID = 229316, name = "Fel-Dealer\'s Visor", source = "Catalyst/One-Armed Bandit (Liberation of Undermine)/Vault", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb (Liberation of Undermine)", ilvl = 639 },
    { slot = "Shoulder", itemID = 229314, name = "Fel-Dealer\'s Recycled Reavers", source = "Catalyst/Rik Reverb (Liberation of Undermine/Vault", ilvl = 639 },
    { slot = "Back", itemID = 228844, name = "Test Pilot\'s Go-Pack", source = "Sprocketmonger Lockenstock (Liberation of Undermine)", ilvl = 639 },
    { slot = "Chest", itemID = 229319, name = "Fel-Dealer\'s Soul Engine", source = "Catalyst/Sprocketmonger Lockenstock (Liberation of Undermine)/Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 158353, name = "Servo-Arm Bindings", source = "The MOTHERLODE!!", ilvl = 639 },
    { slot = "Hands", itemID = 229317, name = "Fel-Dealer\'s Underhandlers", source = "Catalyst/Cauldron of Carnage (Liberation of Undermine)/Vault", ilvl = 639 },
    { slot = "Waist", itemID = 219502, name = "Adrenal Surge Clasp", source = "Leatherworking", ilvl = 639 },
    { slot = "Legs", itemID = 221114, name = "Shadowspawn Leggings", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Feet", itemID = 228876, name = "Dragster\'s Last Stride", source = "Vexie and the Geargrinders (Liberation of Undermine)", ilvl = 639 },
    { slot = "Finger", itemID = 178871, name = "Bloodoath Signet", source = "Theater of Pain", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix (Liberation of Undermine)", ilvl = 639 },
    { slot = "Trinket", itemID = 219309, name = "Tome of Light\'s Devotion", source = "Priory of the Sacred Flame", ilvl = 639 },
    { slot = "Trinket", itemID = 232541, name = "Improvised Seaforium Pacemaker", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Weapon", itemID = 234491, name = "Sonic Ka-BOOM!-erang", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Druid Balance
GearGapBiS['Druid'] = GearGapBiS['Druid'] or {}
GearGapBiS['Druid']['Balance'] = GearGapBiS['Druid']['Balance'] or {
    { slot = "Head", itemID = 229307, name = "Branches of Reclaiming Blight", source = "Catalyst / One-Armed Bandit", ilvl = 639 },
    { slot = "Neck", itemID = 221060, name = "Strapped Rescue-Keg", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Shoulder", itemID = 229305, name = "Jaws of Reclaiming Blight", source = "Catalyst / Rik Reverb", ilvl = 639 },
    { slot = "Back", itemID = 228844, name = "Test Pilot\'s Go-Pack", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Chest", itemID = 229310, name = "Robes of Reclaiming Blight", source = "Catalyst / Sprocketmonger", ilvl = 639 },
    { slot = "Wrist", itemID = 219334, name = "Rune-Branded Armbands", source = "Crafting", ilvl = 639 },
    { slot = "Hands", itemID = 221102, name = "Shimmering Glimclaws", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Waist", itemID = 219331, name = "Rune-Branded Waistband", source = "Crafting", ilvl = 639 },
    { slot = "Legs", itemID = 229306, name = "Breeches of Reclaiming Blight", source = "Catalyst / Stix Bunkjunker", ilvl = 639 },
    { slot = "Feet", itemID = 221120, name = "Stalwart Guardian\'s Boots", source = "Priory of the Sacred Flame", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Weapon", itemID = 232805, name = "Best-in-Slots", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Druid Feral
GearGapBiS['Druid']['Feral'] = GearGapBiS['Druid']['Feral'] or {
    { slot = "Head", itemID = 229307, name = "Branches of Reclaiming Blight", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 229305, name = "Jaws of Reclaiming Blight", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Crafting", ilvl = 639 },
    { slot = "Chest", itemID = 229310, name = "Robes of Reclaiming Blight", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 234499, name = "Disturbed Kelp Wraps", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Hands", itemID = 219333, name = "Rune-Branded Grasps", source = "Crafting", ilvl = 639 },
    { slot = "Waist", itemID = 228880, name = "Hitman\'s Holster", source = "Mug\'Zee", ilvl = 639 },
    { slot = "Legs", itemID = 229306, name = "Breeches of Reclaiming Blight", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 221120, name = "Stalwart Guardian\'s Boots", source = "Priory of the Sacred Flame", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Weapon", itemID = 232526, name = "Best-in-Slots", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Druid Guardian
GearGapBiS['Druid']['Guardian'] = GearGapBiS['Druid']['Guardian'] or {
    { slot = "Head", itemID = 235224, name = "Mekgineer\'s Mindbending Headgear", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 229305, name = "Jaws of Reclaiming Blight", source = "Rik Reverb / Catalyst", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Crafting", ilvl = 639 },
    { slot = "Chest", itemID = 229310, name = "Robes of Reclaiming Blight", source = "Sprocketmonger / Catalyst", ilvl = 639 },
    { slot = "Wrist", itemID = 219334, name = "Rune-Branded Armbands", source = "Crafting", ilvl = 639 },
    { slot = "Hands", itemID = 229308, name = "Grips of Reclaiming Blight", source = "Cauldron of Carnage / Catalyst", ilvl = 639 },
    { slot = "Waist", itemID = 228880, name = "Hitman\'s Holster", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Legs", itemID = 229306, name = "Breeches of Reclaiming Blight", source = "Stix Bunkjunker / Catalyst", ilvl = 639 },
    { slot = "Feet", itemID = 228876, name = "Dragster\'s Last Stride", source = "Vexie", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230194, name = "Reverb Radio", source = "Rik Reverb", ilvl = 639 },
    { slot = "Trinket", itemID = 230193, name = "Mister Lock-N-Stalk", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Weapon", itemID = 232526, name = "Best-in-Slots", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Druid Restoration
GearGapBiS['Druid']['Restoration'] = GearGapBiS['Druid']['Restoration'] or {
    { slot = "Head", itemID = 229307, name = "Branches of Reclaiming Blight", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Neck", itemID = 221060, name = "Strapped Rescue-Keg", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Shoulder", itemID = 229305, name = "Jaws of Reclaiming Blight", source = "Rik Reverb", ilvl = 639 },
    { slot = "Back", itemID = 234507, name = "Electrician\'s Siphoning Filter", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Chest", itemID = 228864, name = "\"Streamlined\" Cartel Uniform", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Wrist", itemID = 221053, name = "Battle-Scarred Fisticuffs", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Hands", itemID = 229308, name = "Grips of Reclaiming Blight", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Waist", itemID = 228856, name = "Competitor\'s Battle Cord", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Legs", itemID = 229306, name = "Breeches of Reclaiming Blight", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Feet", itemID = 221120, name = "Stalwart Guardian\'s Boots", source = "Priory of the Sacred Flame", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230186, name = "Mister Pick-Me-Up", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Weapon", itemID = 228896, name = "Stix\'s Metal Detector", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Offhand", itemID = 228906, name = "Operator\'s Fraud Detector", source = "One-Armed Bandit", ilvl = 639 },
}

-- Evoker Augmentation
GearGapBiS['Evoker'] = GearGapBiS['Evoker'] or {}
GearGapBiS['Evoker']['Augmentation'] = GearGapBiS['Evoker']['Augmentation'] or {
    { slot = "Head", itemID = 229280, name = "Opulent Treasurescale\'s Crowned Jewel", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Neck", itemID = 228842, name = "Gobfather\'s Gifted Bling", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Shoulder", itemID = 229278, name = "Opulent Treasurescale\'s Gleaming Mantle", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 228844, name = "Test Pilot\'s Go-Pack", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Chest", itemID = 229283, name = "Opulent Treasurescale\'s Tunic", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 219342, name = "Glyph-Etched Vambraces", source = "Crafting", ilvl = 639 },
    { slot = "Hands", itemID = 228867, name = "Gravi-Gunk Handlers", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Waist", itemID = 228877, name = "Dealer\'s Covetous Chain", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Legs", itemID = 229279, name = "Opulent Treasurescale\'s Petticoat", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 228883, name = "Dubious Table-Runners", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230192, name = "Mug\'s Moxie Jug", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Weapon", itemID = 232805, name = "Best-in-Slots", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Evoker Devastation
GearGapBiS['Evoker']['Devastation'] = GearGapBiS['Evoker']['Devastation'] or {
    { slot = "Head", itemID = 228859, name = "Sanitized Scraphood", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 229278, name = "Opulent Treasurescale\'s Gleaming Mantle", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Crafting", ilvl = 639 },
    { slot = "Chest", itemID = 229283, name = "Opulent Treasurescale\'s Tunic", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 219342, name = "Glyph-Etched Vambraces", source = "Crafting", ilvl = 639 },
    { slot = "Hands", itemID = 229281, name = "Opulent Treasurescale\'s Gold-Counters", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 228845, name = "Sash of the Fierce Diva", source = "Rik Reverb", ilvl = 639 },
    { slot = "Legs", itemID = 229279, name = "Opulent Treasurescale\'s Petticoat", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 228862, name = "Shrapnel-Ridden Sabatons", source = "Vexie", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 178871, name = "Bloodoath Signet", source = "Theater of Pain", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 230192, name = "Mug\'s Moxie Jug", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Weapon", itemID = 232805, name = "Best-in-Slots", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Evoker Preservation
GearGapBiS['Evoker']['Preservation'] = GearGapBiS['Evoker']['Preservation'] or {
    { slot = "Head", itemID = 229280, name = "Opulent Treasurescale\'s Crowned Jewel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Neck", itemID = 221060, name = "Strapped Rescue-Keg", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Shoulder", itemID = 229278, name = "Opulent Treasurescale\'s Gleaming Mantle", source = "Rik Reverb", ilvl = 639 },
    { slot = "Back", itemID = 228844, name = "Test Pilot\'s Go-Pack", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Chest", itemID = 229283, name = "Opulent Treasurescale\'s Tunic", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Wrist", itemID = 228878, name = "Made Manacles", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Hands", itemID = 229281, name = "Opulent Treasurescale\'s Gold-Counters", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Waist", itemID = 168983, name = "Maniacal Monarch\'s Girdle", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Legs", itemID = 158341, name = "Chemical Blaster\'s Legguards", source = "The MOTHERLODE!!", ilvl = 639 },
    { slot = "Feet", itemID = 221035, name = "Treads of the Galvanic Skysoarer", source = "The Rookery", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230186, name = "Mister Pick-Me-Up", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Weapon", itemID = 228898, name = "Alphacoil Ba-Boom Stick", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Hunter BeastMastery
GearGapBiS['Hunter'] = GearGapBiS['Hunter'] or {}
GearGapBiS['Hunter']['BeastMastery'] = GearGapBiS['Hunter']['BeastMastery'] or {
    { slot = "Head", itemID = 229271, name = "Tireless Collector\'s Chained Cowl", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 228860, name = "Epaulettes of Failed Enforcers", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Back", itemID = 228844, name = "Test Pilot\'s Go-Pack", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Chest", itemID = 229274, name = "Tireless Collector\'s Battlegear", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 219342, name = "Glyph-Etched Vambraces", source = "Crafted", ilvl = 639 },
    { slot = "Hands", itemID = 229272, name = "Tireless Collector\'s Gauntlets", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 234501, name = "Portable Power Generator", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Legs", itemID = 229270, name = "Tireless Collector\'s Armored Breeches", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 219335, name = "Glyph-Etched Stompers", source = "Crafted", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 219308, name = "Signet of the Priory", source = "Priory of the Sacred Flame", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Weapon", itemID = 228893, name = "\"Tiny Pal\"", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Hunter Marksmanship
GearGapBiS['Hunter']['Marksmanship'] = GearGapBiS['Hunter']['Marksmanship'] or {
    { slot = "Head", itemID = 229271, name = "Tireless Collector\'s Chained Cowl", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Neck", itemID = 232663, name = "Undermine Merc\'s Dog Tags", source = "BoE", ilvl = 639 },
    { slot = "Shoulder", itemID = 235416, name = "Crashguard Spaulders", source = "The MOTHERLODE!!", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Crafting", ilvl = 639 },
    { slot = "Chest", itemID = 229274, name = "Tireless Collector\'s Battlegear", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 219342, name = "Glyph-Etched Vambraces", source = "Crafting", ilvl = 639 },
    { slot = "Hands", itemID = 229272, name = "Tireless Collector\'s Gauntlets", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 228877, name = "Dealer\'s Covetous Chain", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Legs", itemID = 229270, name = "Tireless Collector\'s Armored Breeches", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 228862, name = "Shrapnel-Ridden Sabatons", source = "Vexie", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 232541, name = "Improvised Seaforium Pacemaker", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Weapon", itemID = 228893, name = "\"Tiny Pal\"", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Hunter Survival
GearGapBiS['Hunter']['Survival'] = GearGapBiS['Hunter']['Survival'] or {
    { slot = "Head", itemID = 229271, name = "Tireless Collector\'s Chained Cowl", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Neck", itemID = 228842, name = "Gobfather\'s Gifted Bling", source = "Mug\'Zee", ilvl = 639 },
    { slot = "Shoulder", itemID = 235416, name = "Crashguard Spaulders", source = "The MOTHERLODE!!", ilvl = 639 },
    { slot = "Back", itemID = 228844, name = "Test Pilot\'s Go-Pack", source = "Sprocketmonger Lockenstock", ilvl = 639 },
    { slot = "Chest", itemID = 229274, name = "Tireless Collector\'s Battlegear", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 219342, name = "Glyph-Etched Vambraces", source = "Crafted - Leatherworking", ilvl = 639 },
    { slot = "Hands", itemID = 229272, name = "Tireless Collector\'s Gauntlets", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 219339, name = "Glyph-Etched Binding", source = "Crafted - Leatherworking", ilvl = 639 },
    { slot = "Legs", itemID = 229270, name = "Tireless Collector\'s Armored Breeches", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 229273, name = "Tireless Collector\'s Spiked Cleats", source = "Catalyst", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 232541, name = "Improvised Seaforium Pacemaker", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Trinket", itemID = 219308, name = "Signet of the Priory", source = "Priory of the Sacred Flame", ilvl = 639 },
    { slot = "Weapon", itemID = 228905, name = "Giga Bank-Breaker", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Mage Arcane
GearGapBiS['Mage'] = GearGapBiS['Mage'] or {}
GearGapBiS['Mage']['Arcane'] = GearGapBiS['Mage']['Arcane'] or {
    { slot = "Head", itemID = 229343, name = "Aspectral Emissary\'s Crystalline Cowl", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 229341, name = "Aspectral Emissary\'s Arcane Vents", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 168970, name = "Trashmaster\'s Mantle", source = "Operation: Mechagon", ilvl = 639 },
    { slot = "Chest", itemID = 235420, name = "Petticoat of the Self-Stylized Azerite Baron", source = "The MOTHERLODE!!", ilvl = 639 },
    { slot = "Wrist", itemID = 222815, name = "Consecrated Cuffs", source = "Crafting", ilvl = 639 },
    { slot = "Hands", itemID = 229344, name = "Aspectral Emissary\'s Hardened Grasp", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 168958, name = "Ringmaster\'s Cummerbund", source = "Operation: Mechagon", ilvl = 639 },
    { slot = "Legs", itemID = 229342, name = "Aspectral Emissary\'s Trousers", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 222814, name = "Consecrated Slippers", source = "Crafting", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230192, name = "Mug\'s Moxie Jug", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Weapon", itemID = 168973, name = "Neural Synapse Enhancer", source = "Operation: Mechagon", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Mage Fire
GearGapBiS['Mage']['Fire'] = GearGapBiS['Mage']['Fire'] or {
    { slot = "Head", itemID = 229343, name = "Aspectral Emissary\'s Crystalline Cowl", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 229341, name = "Aspectral Emissary\'s Arcane Vents", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Crafting", ilvl = 639 },
    { slot = "Chest", itemID = 229346, name = "Aspectral Emissary\'s Primal Robes", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 168989, name = "Hyperthread Wristwraps", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Hands", itemID = 221067, name = "Punctured Apiary Gloves", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Waist", itemID = 232655, name = "Vatwork Janitor\'s Wasteband", source = "Bind on Equip", ilvl = 639 },
    { slot = "Legs", itemID = 229342, name = "Aspectral Emissary\'s Trousers", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 228879, name = "Cemented Murloc-Swimmers", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230192, name = "Mug\'s Moxie Jug", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Weapon", itemID = 228896, name = "Stix\'s Metal Detector", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Offhand", itemID = 222566, name = "Vagabond\'s Torch", source = "Crafting", ilvl = 639 },
}

-- Mage Frost
GearGapBiS['Mage']['Frost'] = GearGapBiS['Mage']['Frost'] or {
    { slot = "Head", itemID = 235226, name = "Inventor\'s Ingenious Trifocals", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Neck", itemID = 221103, name = "Flickering Glowtorc", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Shoulder", itemID = 229341, name = "Aspectral Emissary\'s Arcane Vents", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 228844, name = "Test Pilot\'s Go-Pack", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Chest", itemID = 229346, name = "Aspectral Emissary\'s Primal Robes", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 222815, name = "Consecrated Cuffs", source = "Crafting", ilvl = 639 },
    { slot = "Hands", itemID = 229344, name = "Aspectral Emissary\'s Hardened Grasp", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 229340, name = "Aspectral Emissary\'s Cummerbund", source = "Catalyst", ilvl = 639 },
    { slot = "Legs", itemID = 229342, name = "Aspectral Emissary\'s Trousers", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 221043, name = "Cloudstrider Soles", source = "The Rookery", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Finger", itemID = 221099, name = "Wick\'s Golden Loop", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 219299, name = "Synergistic Brewterializer", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Weapon", itemID = 231268, name = "Blastfurious Machete", source = "Vexie", ilvl = 639 },
    { slot = "Offhand", itemID = 222566, name = "Vagabond\'s Torch", source = "Crafting", ilvl = 639 },
}

-- Monk Brewmaster
GearGapBiS['Monk'] = GearGapBiS['Monk'] or {}
GearGapBiS['Monk']['Brewmaster'] = GearGapBiS['Monk']['Brewmaster'] or {
    { slot = "Head", itemID = 229298, name = "Ageless Serpent\'s Mane", source = "One-Armed Bandit (Liberation of Undermine),The Catalyst,The Great Vault", ilvl = 639 },
    { slot = "Neck", itemID = 221103, name = "Flickering Glowtorc", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Shoulder", itemID = 229296, name = "Ageless Serpent\'s Shoulderpads", source = "Rik Reverb (Liberation of Undermine),The Catalyst,The Great Vault", ilvl = 639 },
    { slot = "Back", itemID = 199921, name = "Trashmaster\'s Mantle", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Chest", itemID = 235417, name = "Venture Co. Plenipotentiary Vest", source = "The MOTHERLODE!!", ilvl = 639 },
    { slot = "Wrist", itemID = 219334, name = "Rune-Branded Armbands", source = "Leatherworking (See note)", ilvl = 639 },
    { slot = "Hands", itemID = 229299, name = "Ageless Serpent\'s Handguards", source = "Cauldron of Carnage (Liberation of Undermine),The Catalyst,The Great Vault", ilvl = 639 },
    { slot = "Waist", itemID = 219502, name = "Adrenal Surge Clasp", source = "Leatherworking", ilvl = 639 },
    { slot = "Legs", itemID = 229297, name = "Ageless Serpent\'s Leggings", source = "Stix Bunkjunker (Liberation of Undermine),The Catalyst,The Great Vault", ilvl = 639 },
    { slot = "Feet", itemID = 229300, name = "Ageless Serpent\'s Ankleweights", source = "The Catalyst", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit (Liberation of Undermine)", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix (Liberation of Undermine)", ilvl = 639 },
    { slot = "Trinket", itemID = 230197, name = "Geargrinder\'s Spare Keys", source = "Vexie (Liberation of Undermine)", ilvl = 639 },
    { slot = "Trinket", itemID = 178811, name = "Grim Codex", source = "Theater of Pain", ilvl = 639 },
    { slot = "Weapon", itemID = 228905, name = "Giga Bank-Breaker", source = "One-Armed Bandit (Liberation of Undermine)", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Monk Mistweaver
GearGapBiS['Monk']['Mistweaver'] = GearGapBiS['Monk']['Mistweaver'] or {
    { slot = "Head", itemID = 234498, name = "Waterworks Filtration Mask", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 229296, name = "Ageless Serpent\'s Shoulderpads", source = "Rik Reverb The Catalyst |  The Great Vault", ilvl = 639 },
    { slot = "Back", itemID = 221109, name = "Candlebearer\'s Shroud", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Chest", itemID = 229301, name = "Ageless Serpent\'s Inked Coils", source = "Sprocketmonger The Catalyst |  The Great Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 219334, name = "Rune-Branded Armbands", source = "Leatherworking", ilvl = 639 },
    { slot = "Hands", itemID = 229299, name = "Ageless Serpent\'s Handguards", source = "Cauldron of Carnage The Catalyst |  The Great Vault", ilvl = 639 },
    { slot = "Waist", itemID = 228880, name = "Hitman\'s Holster", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Legs", itemID = 229297, name = "Ageless Serpent\'s Leggings", source = "Stix Bunkjunker The Catalyst |  The Great Vault", ilvl = 639 },
    { slot = "Feet", itemID = 159336, name = "Mercenary Miner\'s Boots", source = "The MOTHERLODE!!", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Trinket", itemID = 230186, name = "Mister Pick-Me-Up", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Weapon", itemID = 231268, name = "Blastfurious Machete", source = "Vexie", ilvl = 639 },
    { slot = "Offhand", itemID = 222566, name = "Vagabond\'s Torch", source = "Inscription", ilvl = 639 },
}

-- Monk Windwalker
GearGapBiS['Monk']['Windwalker'] = GearGapBiS['Monk']['Windwalker'] or {
    { slot = "Head", itemID = 229298, name = "Ageless Serpent\'s Mane", source = "Catalyst", ilvl = 639 },
    { slot = "Neck", itemID = 228842, name = "Gobfather\'s Gifted Bling", source = "Mug\'zee, Heads of Security - Liberation of Undermine", ilvl = 639 },
    { slot = "Shoulder", itemID = 229296, name = "Ageless Serpent\'s Shoulderpads", source = "Catalyst", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Tailoring", ilvl = 639 },
    { slot = "Chest", itemID = 229301, name = "Ageless Serpent\'s Inked Coils", source = "Catalyst", ilvl = 639 },
    { slot = "Wrist", itemID = 219334, name = "Rune-Branded Armbands", source = "Leatherworking", ilvl = 639 },
    { slot = "Hands", itemID = 229299, name = "Ageless Serpent\'s Handguards", source = "Catalyst", ilvl = 639 },
    { slot = "Waist", itemID = 168957, name = "Mekgineer\'s Championship Belt", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Legs", itemID = 168968, name = "Flame-Seared Leggings", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Feet", itemID = 221071, name = "Backbreaking Bootstrappers", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix - Liberation of Undermine", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit - Liberation of Undermine", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix - Liberation of Undermine", ilvl = 639 },
    { slot = "Weapon", itemID = 221116, name = "Glorious Defender\'s Poleaxe", source = "Priory of the Sacred Flame", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Paladin Holy
GearGapBiS['Paladin'] = GearGapBiS['Paladin'] or {}
GearGapBiS['Paladin']['Holy'] = GearGapBiS['Paladin']['Holy'] or {
    { slot = "Head", itemID = 229244, name = "Aureate Sentry\'s Pledge", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Neck", itemID = 221060, name = "Strapped Rescue-Keg", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Shoulder", itemID = 229242, name = "Aureate Sentry\'s Roaring Will", source = "Rik Reverb", ilvl = 639 },
    { slot = "Back", itemID = 228844, name = "Test Pilot\'s Go-Pack", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Chest", itemID = 229247, name = "Aureate Sentry\'s Encasement", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Wrist", itemID = 228868, name = "Revved-Up Vambraces", source = "Vexie", ilvl = 639 },
    { slot = "Hands", itemID = 234504, name = "Jumpstarter\'s Scaffold-Scrapers", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Waist", itemID = 234505, name = "Venture Contractor\'s Floodlight", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Legs", itemID = 229243, name = "Aureate Sentry\'s Legguards", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Feet", itemID = 228874, name = "Rik\'s Walkin\' Boots", source = "Rik Reverb", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230186, name = "Mister Pick-Me-Up", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Weapon", itemID = 228901, name = "Big Earner\'s Bludgeon", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Offhand", itemID = 228889, name = "Titan of Industry", source = "Chrome King Gallywix", ilvl = 639 },
}

-- Paladin Protection
GearGapBiS['Paladin']['Protection'] = GearGapBiS['Paladin']['Protection'] or {
    { slot = "Head", itemID = 221100, name = "Waxsteel Greathelm", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Neck", itemID = 221060, name = "Strapped Rescue-Keg", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Shoulder", itemID = 229242, name = "Aureate Sentry\'s Roaring Will", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 228844, name = "Test Pilot\'s Go-Pack", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Chest", itemID = 229247, name = "Aureate Sentry\'s Encasement", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 222435, name = "Everforged Vambraces", source = "Blacksmithing", ilvl = 639 },
    { slot = "Hands", itemID = 229245, name = "Aureate Sentry\'s Gauntlets", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 222431, name = "Everforged Greatbelt", source = "Blacksmithing", ilvl = 639 },
    { slot = "Legs", itemID = 229243, name = "Aureate Sentry\'s Legguards", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 228874, name = "Rik\'s Walkin\' Boots", source = "Rik Reverb", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 159462, name = "Footbomb Championship Ring", source = "The MOTHERLODE!!", ilvl = 639 },
    { slot = "Trinket", itemID = 0, name = "None", source = "None", ilvl = 0 },
    { slot = "Trinket", itemID = 0, name = "None", source = "None", ilvl = 0 },
    { slot = "Weapon", itemID = 221096, name = "Rail Rider\'s Bisector", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Offhand", itemID = 228889, name = "Titan of Industry", source = "Chrome King Gallywix", ilvl = 639 },
}

-- Paladin Retribution
GearGapBiS['Paladin']['Retribution'] = GearGapBiS['Paladin']['Retribution'] or {
    { slot = "Head", itemID = 229244, name = "Aureate Sentry\'s Pledge", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Neck", itemID = 221060, name = "Strapped Rescue-Keg", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Shoulder", itemID = 229242, name = "Aureate Sentry\'s Roaring Will", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Crafting", ilvl = 639 },
    { slot = "Chest", itemID = 229247, name = "Aureate Sentry\'s Encasement", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 222435, name = "Everforged Vambraces", source = "Crafting", ilvl = 639 },
    { slot = "Hands", itemID = 168980, name = "Gauntlets of Absolute Authority", source = "Operation: Mechagon", ilvl = 639 },
    { slot = "Waist", itemID = 234505, name = "Venture Contractor\'s Floodlight", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Legs", itemID = 229243, name = "Aureate Sentry\'s Legguards", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 228887, name = "Cutthroat Competition Stompers", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 232541, name = "Improvised Seaforium Pacemaker", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Weapon", itemID = 232526, name = "Best-in-Slots", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Priest Discipline
GearGapBiS['Priest'] = GearGapBiS['Priest'] or {}
GearGapBiS['Priest']['Discipline'] = GearGapBiS['Priest']['Discipline'] or {
    { slot = "Head", itemID = 228871, name = "Cleanup Crew\'s Wastemask", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 229332, name = "Confessor\'s Unshakable Radiance", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Crafting", ilvl = 639 },
    { slot = "Chest", itemID = 229337, name = "Confessor\'s Unshakable Vestment", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 228881, name = "Illicit Bankroll Bracers", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Hands", itemID = 229335, name = "Confessor\'s Unshakable Mitts", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 168958, name = "Ringmaster\'s Cummerbund", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Legs", itemID = 229333, name = "Confessor\'s Unshakable Leggings", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 228879, name = "Cemented Murloc-Swimmers", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 230192, name = "Mug\'s Moxie Jug", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Weapon", itemID = 228896, name = "Stix\'s Metal Detector", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Offhand", itemID = 222566, name = "Vagabond\'s Torch", source = "Crafting", ilvl = 639 },
}

-- Priest Holy
GearGapBiS['Priest']['Holy'] = GearGapBiS['Priest']['Holy'] or {
    { slot = "Head", itemID = 228871, name = "Cleanup Crew\'s Wastemask", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Neck", itemID = 221103, name = "Flickering Glowtorc", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Shoulder", itemID = 229332, name = "Confessor\'s Unshakable Radiance", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Crafting", ilvl = 639 },
    { slot = "Chest", itemID = 229337, name = "Confessor\'s Unshakable Vestment", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 221104, name = "Gleamwax Shackles", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Hands", itemID = 229335, name = "Confessor\'s Unshakable Mitts", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 221121, name = "Honorbound Retainer\'s Sash", source = "Priory of the Sacred Flame", ilvl = 639 },
    { slot = "Legs", itemID = 229333, name = "Confessor\'s Unshakable Leggings", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 228847, name = "Hotstep Heel-Turners", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230186, name = "Mister Pick-Me-Up", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Weapon", itemID = 228901, name = "Big Earner\'s Bludgeon", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Offhand", itemID = 222566, name = "Vagabond\'s Torch", source = "Crafting", ilvl = 639 },
}

-- Priest Shadow
GearGapBiS['Priest']['Shadow'] = GearGapBiS['Priest']['Shadow'] or {
    { slot = "Head", itemID = 229334, name = "Confessor\'s Unshakable Halo", source = "Catalyst |  Raid |  Vault", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 229332, name = "Confessor\'s Unshakable Radiance", source = "Catalyst |  Raid |  Vault", ilvl = 639 },
    { slot = "Back", itemID = 228844, name = "Test Pilot\'s Go-Pack", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Chest", itemID = 229337, name = "Confessor\'s Unshakable Vestment", source = "Catalyst |  Raid |  Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 222815, name = "Consecrated Cuffs", source = "Crafting", ilvl = 639 },
    { slot = "Hands", itemID = 229335, name = "Confessor\'s Unshakable Mitts", source = "Catalyst |  Raid |  Vault", ilvl = 639 },
    { slot = "Waist", itemID = 228882, name = "Refiner\'s Conveyor Belt", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Legs", itemID = 228865, name = "Pit Doctor\'s Petticoat", source = "Vexie", ilvl = 639 },
    { slot = "Feet", itemID = 228879, name = "Cemented Murloc-Swimmers", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Trinket", itemID = 230192, name = "Mug\'s Moxie Jug", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Weapon", itemID = 228901, name = "Big Earner\'s Bludgeon", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Offhand", itemID = 222566, name = "Vagabond\'s Torch", source = "Crafting", ilvl = 639 },
}

-- Rogue Assassination
GearGapBiS['Rogue'] = GearGapBiS['Rogue'] or {}
GearGapBiS['Rogue']['Assassination'] = GearGapBiS['Rogue']['Assassination'] or {
    { slot = "Head", itemID = 229289, name = "Spectral Gambler\'s Damned Visage", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Neck", itemID = 221103, name = "Flickering Glowtorc", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Shoulder", itemID = 229287, name = "Spectral Gambler\'s Bladed Mantle", source = "Rik Reverb", ilvl = 639 },
    { slot = "Back", itemID = 234507, name = "Electrician\'s Siphoning Filter", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Chest", itemID = 235417, name = "Venture Co. Plenipotentiary Vest", source = "The MOTHERLODE!!", ilvl = 639 },
    { slot = "Wrist", itemID = 234499, name = "Disturbed Kelp Wraps", source = "Operation: Floodgate", ilvl = 639 },
    { slot = "Hands", itemID = 229290, name = "Spectral Gambler\'s Gloves", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Waist", itemID = 221107, name = "Gleamkeeper\'s Buckle", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Legs", itemID = 229288, name = "Spectral Gambler\'s Pantaloons", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Feet", itemID = 219327, name = "Rune-Branded Kickers", source = "Crafting", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Trinket", itemID = 232485, name = "Mechano-Core Amplifier", source = "Delves", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Weapon", itemID = 231266, name = "Random Number Perforator", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Offhand", itemID = 222438, name = "Everforged Stabber", source = "Crafting", ilvl = 639 },
}

-- Rogue Outlaw
GearGapBiS['Rogue']['Outlaw'] = GearGapBiS['Rogue']['Outlaw'] or {
    { slot = "Head", itemID = 229289, name = "Spectral Gambler\'s Damned Visage", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Neck", itemID = 221103, name = "Flickering Glowtorc", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Shoulder", itemID = 229287, name = "Spectral Gambler\'s Bladed Mantle", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 168970, name = "Trashmaster\'s Mantle", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Chest", itemID = 221130, name = "Seraphic Wraps of the Ordained", source = "Priory of the Sacred Flame", ilvl = 639 },
    { slot = "Wrist", itemID = 219334, name = "Rune-Branded Armbands", source = "Crafting", ilvl = 639 },
    { slot = "Hands", itemID = 229290, name = "Spectral Gambler\'s Gloves", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 221058, name = "Brewery Toiler\'s Waistband", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Legs", itemID = 229288, name = "Spectral Gambler\'s Pantaloons", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 159336, name = "Mercenary Miner\'s Boots", source = "The MOTHERLODE!!", ilvl = 639 },
    { slot = "Finger", itemID = 215135, name = "Ring of Earthen Craftsmanship", source = "Crafting", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230199, name = "Zee\'s Thug Hotline", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Weapon", itemID = 228899, name = "Gallywix\'s Iron Thumb", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Offhand", itemID = 232804, name = "Capo\'s Molten Knuckles", source = "Mug\'zee, Heads of Security", ilvl = 639 },
}

-- Rogue Subtlety
GearGapBiS['Rogue']['Subtlety'] = GearGapBiS['Rogue']['Subtlety'] or {
    { slot = "Head", itemID = 229289, name = "Spectral Gambler\'s Damned Visage", source = "One-Armed Bandit / Catalyst / Vault", ilvl = 639 },
    { slot = "Neck", itemID = 221103, name = "Flickering Glowtorc", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Shoulder", itemID = 229287, name = "Spectral Gambler\'s Bladed Mantle", source = "Rik Reverb / Catalyst / Vault", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Tailoring", ilvl = 639 },
    { slot = "Chest", itemID = 229292, name = "Spectral Gambler\'s Vest", source = "Sprocketmonger / Catalyst / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 228885, name = "Hustler\'s Ante-Uppers", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Hands", itemID = 228863, name = "Enforcer\'s Sticky Fingers", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Waist", itemID = 228856, name = "Competitor\'s Battle Cord", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Legs", itemID = 229288, name = "Spectral Gambler\'s Pantaloons", source = "Stix Bunkjunker / Catalyst / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 219327, name = "Rune-Branded Kickers", source = "Leatherworking", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 178870, name = "Ritual Bone Band", source = "Theater of Pain", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Weapon", itemID = 228897, name = "Pyrotechnic Needle-Dropper", source = "Rik Reverb", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Shaman Elemental
GearGapBiS['Shaman'] = GearGapBiS['Shaman'] or {}
GearGapBiS['Shaman']['Elemental'] = GearGapBiS['Shaman']['Elemental'] or {
    { slot = "Head", itemID = 229262, name = "Gale Sovereign\'s Charged Hood", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 229260, name = "Gale Sovereign\'s Zephyrs", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Crafting", ilvl = 639 },
    { slot = "Chest", itemID = 229265, name = "Gale Sovereign\'s Clouded Hauberk", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 219342, name = "Glyph-Etched Vambraces", source = "Crafting", ilvl = 639 },
    { slot = "Hands", itemID = 229263, name = "Gale Sovereign\'s Grasps", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 228845, name = "Sash of the Fierce Diva", source = "Rik Reverb", ilvl = 639 },
    { slot = "Legs", itemID = 158341, name = "Chemical Blaster\'s Legguards", source = "The MOTHERLODE!!", ilvl = 639 },
    { slot = "Feet", itemID = 168982, name = "Regal Mekanospurs", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 159462, name = "Footbomb Championship Ring", source = "The MOTHERLODE!!", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Weapon", itemID = 232805, name = "Best-in-Slots", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Shaman Enhancement
GearGapBiS['Shaman']['Enhancement'] = GearGapBiS['Shaman']['Enhancement'] or {
    { slot = "Head", itemID = 229262, name = "Gale Sovereign\'s Charged Hood", source = "Catalyst |  Raid |  Vault", ilvl = 639 },
    { slot = "Neck", itemID = 221060, name = "Strapped Rescue-Keg", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Shoulder", itemID = 229260, name = "Gale Sovereign\'s Zephyrs", source = "Catalyst |  Raid |  Vault", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Tailoring", ilvl = 639 },
    { slot = "Chest", itemID = 229265, name = "Gale Sovereign\'s Clouded Hauberk", source = "Catalyst |  Raid |  Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 228878, name = "Made Manacles", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Hands", itemID = 229263, name = "Gale Sovereign\'s Grasps", source = "Catalyst |  Raid |  Vault", ilvl = 639 },
    { slot = "Waist", itemID = 168983, name = "Maniacal Monarch\'s Girdle", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Legs", itemID = 158341, name = "Chemical Blaster\'s Legguards", source = "The MOTHERLODE!!", ilvl = 639 },
    { slot = "Feet", itemID = 221035, name = "Treads of the Galvanic Skysoarer", source = "The Rookery", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Weapon", itemID = 228899, name = "Gallywix\'s Iron Thumb", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Offhand", itemID = 222446, name = "Charged Facesmasher", source = "Blacksmithing", ilvl = 639 },
}

-- Shaman Restoration
GearGapBiS['Shaman']['Restoration'] = GearGapBiS['Shaman']['Restoration'] or {
    { slot = "Head", itemID = 228859, name = "Sanitized Scraphood", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Neck", itemID = 221103, name = "Flickering Glowtorc", source = "Darkflame Cleft", ilvl = 639 },
    { slot = "Shoulder", itemID = 229260, name = "Gale Sovereign\'s Zephyrs", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Crafted", ilvl = 639 },
    { slot = "Chest", itemID = 229265, name = "Gale Sovereign\'s Clouded Hauberk", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 221059, name = "I\'pa\'s Pale Aleguards", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Hands", itemID = 229263, name = "Gale Sovereign\'s Grasps", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 228877, name = "Dealer\'s Covetous Chain", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Legs", itemID = 229261, name = "Gale Sovereign\'s Pantaloons", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 228862, name = "Shrapnel-Ridden Sabatons", source = "Vexie", ilvl = 639 },
    { slot = "Finger", itemID = 228840, name = "Faded Championship Ring", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Finger", itemID = 228843, name = "Miniature Roulette Wheel", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 230186, name = "Mister Pick-Me-Up", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Weapon", itemID = 222568, name = "Vagabond\'s Bounding Baton", source = "Crafting", ilvl = 639 },
    { slot = "Offhand", itemID = 228889, name = "Titan of Industry", source = "Chrome King Gallywix", ilvl = 639 },
}

-- Warlock Affliction
GearGapBiS['Warlock'] = GearGapBiS['Warlock'] or {}
GearGapBiS['Warlock']['Affliction'] = GearGapBiS['Warlock']['Affliction'] or {
    { slot = "Head", itemID = 229325, name = "Spliced Fiendtrader\'s Transcendence", source = "Catalyst, Raid, or Great Vault", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 229323, name = "Spliced Fiendtrader\'s Loyal Servants", source = "Catalyst, Raid, or Great Vault", ilvl = 639 },
    { slot = "Back", itemID = 228839, name = "Undercircuit Racing Flag", source = "Vexie", ilvl = 639 },
    { slot = "Chest", itemID = 229328, name = "Spliced Fiendtrader\'s Surgical Gown", source = "Catalyst, Raid, or Great Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 228857, name = "Underparty Admission Bracelet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Hands", itemID = 228872, name = "Golden Handshakers", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Waist", itemID = 228882, name = "Refiner\'s Conveyor Belt", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Legs", itemID = 229324, name = "Spliced Fiendtrader\'s Skin Tights", source = "Catalyst, Raid, or Great Vault", ilvl = 639 },
    { slot = "Feet", itemID = 222814, name = "Consecrated Slippers", source = "Tailoring", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228840, name = "Faded Championship Ring", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Weapon", itemID = 228896, name = "Stix\'s Metal Detector", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Offhand", itemID = 222566, name = "Vagabond\'s Torch", source = "Inscription", ilvl = 639 },
}

-- Warlock Demonology
GearGapBiS['Warlock']['Demonology'] = GearGapBiS['Warlock']['Demonology'] or {
    { slot = "Head", itemID = 229325, name = "Spliced Fiendtrader\'s Transcendence", source = "Catalyst, Raid, or Great Vault", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 229323, name = "Spliced Fiendtrader\'s Loyal Servants", source = "Catalyst, Raid, or Great Vault", ilvl = 639 },
    { slot = "Back", itemID = 228839, name = "Undercircuit Racing Flag", source = "Vexie", ilvl = 639 },
    { slot = "Chest", itemID = 229328, name = "Spliced Fiendtrader\'s Surgical Gown", source = "Catalyst, Raid, or Great Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 228857, name = "Underparty Admission Bracelet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Hands", itemID = 228872, name = "Golden Handshakers", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Waist", itemID = 228882, name = "Refiner\'s Conveyor Belt", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Legs", itemID = 229324, name = "Spliced Fiendtrader\'s Skin Tights", source = "Catalyst, Raid, or Great Vault", ilvl = 639 },
    { slot = "Feet", itemID = 222814, name = "Consecrated Slippers", source = "Tailoring", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228840, name = "Faded Championship Ring", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Weapon", itemID = 228896, name = "Stix\'s Metal Detector", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Offhand", itemID = 222566, name = "Vagabond\'s Torch", source = "Inscription", ilvl = 639 },
}

-- Warlock Destruction
GearGapBiS['Warlock']['Destruction'] = GearGapBiS['Warlock']['Destruction'] or {
    { slot = "Head", itemID = 229325, name = "Spliced Fiendtrader\'s Transcendence", source = "Catalyst, Raid, or Great Vault", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 229323, name = "Spliced Fiendtrader\'s Loyal Servants", source = "Catalyst, Raid, or Great Vault", ilvl = 639 },
    { slot = "Back", itemID = 228839, name = "Undercircuit Racing Flag", source = "Vexie", ilvl = 639 },
    { slot = "Chest", itemID = 229328, name = "Spliced Fiendtrader\'s Surgical Gown", source = "Catalyst, Raid, or Great Vault", ilvl = 639 },
    { slot = "Wrist", itemID = 228857, name = "Underparty Admission Bracelet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Hands", itemID = 228872, name = "Golden Handshakers", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Waist", itemID = 228882, name = "Refiner\'s Conveyor Belt", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Legs", itemID = 229324, name = "Spliced Fiendtrader\'s Skin Tights", source = "Catalyst, Raid, or Great Vault", ilvl = 639 },
    { slot = "Feet", itemID = 222814, name = "Consecrated Slippers", source = "Tailoring", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228840, name = "Faded Championship Ring", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230192, name = "Mug\'s Moxie Jug", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Weapon", itemID = 228896, name = "Stix\'s Metal Detector", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Offhand", itemID = 222566, name = "Vagabond\'s Torch", source = "Inscription", ilvl = 639 },
}

-- Warrior Arms
GearGapBiS['Warrior'] = GearGapBiS['Warrior'] or {}
GearGapBiS['Warrior']['Arms'] = GearGapBiS['Warrior']['Arms'] or {
    { slot = "Head", itemID = 229235, name = "Enforcer\'s Backalley Faceshield", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 229233, name = "Enforcer\'s Backalley Shoulderplates", source = "Rik Reverb", ilvl = 639 },
    { slot = "Back", itemID = 222817, name = "Consecrated Cloak", source = "Crafted", ilvl = 639 },
    { slot = "Chest", itemID = 228851, name = "\"Bullet-Proof\" Vestplate", source = "Mug\'zee, Heads of Security", ilvl = 639 },
    { slot = "Wrist", itemID = 222435, name = "Everforged Vambraces", source = "Crafted", ilvl = 639 },
    { slot = "Hands", itemID = 229236, name = "Enforcer\'s Backalley Crushers", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Waist", itemID = 229232, name = "Enforcer\'s Backalley Girdle", source = "Catalyst", ilvl = 639 },
    { slot = "Legs", itemID = 229234, name = "Enforcer\'s Backalley Chausses", source = "Stix Bunkjunker", ilvl = 639 },
    { slot = "Feet", itemID = 228887, name = "Cutthroat Competition Stompers", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 230027, name = "House of Cards", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Weapon", itemID = 232526, name = "Best-in-Slots", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Offhand", itemID = 0, name = "None", source = "None", ilvl = 0 },
}

-- Warrior Fury
GearGapBiS['Warrior']['Fury'] = GearGapBiS['Warrior']['Fury'] or {
    { slot = "Head", itemID = 229235, name = "Enforcer\'s Backalley Faceshield", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Neck", itemID = 221060, name = "Strapped Rescue-Keg", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Shoulder", itemID = 229233, name = "Enforcer\'s Backalley Shoulderplates", source = "Rik Reverb", ilvl = 639 },
    { slot = "Back", itemID = 228844, name = "Test Pilot\'s Go-Pack", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Chest", itemID = 229238, name = "Enforcer\'s Backalley Vestplate", source = "Sprocketmonger", ilvl = 639 },
    { slot = "Wrist", itemID = 222435, name = "Everforged Vambraces", source = "Crafted", ilvl = 639 },
    { slot = "Hands", itemID = 229236, name = "Enforcer\'s Backalley Crushers", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Waist", itemID = 221040, name = "Lightning-Conductor\'s Bands", source = "The Rookery", ilvl = 639 },
    { slot = "Legs", itemID = 221034, name = "Thunder-Clad Legguards", source = "The Rookery", ilvl = 639 },
    { slot = "Feet", itemID = 221123, name = "Devoted Plate Walkers", source = "Priory of the Sacred Flame", ilvl = 639 },
    { slot = "Finger", itemID = 228411, name = "Cyrce\'s Circlet", source = "Siren Isle", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Trinket", itemID = 232485, name = "Mechano-Core Amplifier", source = "Delves/Great Vault", ilvl = 639 },
    { slot = "Trinket", itemID = 230198, name = "Eye of Kezan", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Weapon", itemID = 232526, name = "Best-in-Slots", source = "One-Armed Bandit", ilvl = 639 },
    { slot = "Offhand", itemID = 222447, name = "Charged Claymore", source = "Crafted", ilvl = 639 },
}

-- Warrior Protection
GearGapBiS['Warrior']['Protection'] = GearGapBiS['Warrior']['Protection'] or {
    { slot = "Head", itemID = 229235, name = "Enforcer\'s Backalley Faceshield", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Neck", itemID = 228841, name = "Semi-Charmed Amulet", source = "Rik Reverb", ilvl = 639 },
    { slot = "Shoulder", itemID = 229233, name = "Enforcer\'s Backalley Shoulderplates", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Back", itemID = 199921, name = "Trashmaster\'s Mantle", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Chest", itemID = 221069, name = "Slashproof Business Plate", source = "Cinderbrew Meadery", ilvl = 639 },
    { slot = "Wrist", itemID = 222435, name = "Everforged Vambraces", source = "Blacksmithing", ilvl = 639 },
    { slot = "Hands", itemID = 229236, name = "Enforcer\'s Backalley Crushers", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Waist", itemID = 228873, name = "Heaviestweight Title Belt", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Legs", itemID = 229234, name = "Enforcer\'s Backalley Chausses", source = "Catalyst / Raid / Vault", ilvl = 639 },
    { slot = "Feet", itemID = 168972, name = "Pyroclastic Greatboots", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Finger", itemID = 231265, name = "The Jastor Diamond", source = "Chrome King Gallywix", ilvl = 639 },
    { slot = "Finger", itemID = 228840, name = "Faded Championship Ring", source = "Cauldron of Carnage", ilvl = 639 },
    { slot = "Trinket", itemID = 0, name = "None", source = "None", ilvl = 0 },
    { slot = "Trinket", itemID = 0, name = "None", source = "None", ilvl = 0 },
    { slot = "Weapon", itemID = 169608, name = "Tearing Sawtooth Blade", source = "Operation: Mechagon Workshop", ilvl = 639 },
    { slot = "Offhand", itemID = 228889, name = "Titan of Industry", source = "Chrome King Gallywix", ilvl = 639 },
}
-- BiS Data End

-- Create main frame
local frame = CreateFrame("Frame", "GearGapFrame", UIParent, "BasicFrameTemplateWithInset")
frame:SetSize(350, 550)
frame:SetPoint("CENTER")
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
frame:Hide()
frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
frame.title:SetPoint("TOP", 0, -5)
frame.title:SetText("GearGap BiS")

-- Add close button
local closeButton = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
closeButton:SetPoint("TOPRIGHT", -5, -5)

-- Create buttons
local buttons = {}
local BUTTON_SIZE = 50
local SPACING = 5
local function CreateSlotButton(slot)
    local button = CreateFrame("Button", nil, frame)
    button:SetSize(BUTTON_SIZE, BUTTON_SIZE)
    local coords = SLOT_COORDINATES[slot]
    button:SetPoint("TOPLEFT", coords[1], coords[2])
    button:SetNormalTexture("Interface\\Buttons\\UI-Quickslot2")
    button:GetNormalTexture():SetSize(BUTTON_SIZE, BUTTON_SIZE)
    button:GetNormalTexture():SetTexCoord(0.15, 0.85, 0.15, 0.85)
    button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
    button.icon = button:CreateTexture(nil, "ARTWORK")
    button.icon:SetSize(BUTTON_SIZE, BUTTON_SIZE)
    button.icon:SetPoint("CENTER")
    button:SetScript("OnEnter", function(self)
        if self.item then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:AddLine(self.item.name or "Unknown Item", 1, 1, 1)
            GameTooltip:AddLine("Source: " .. (self.item.source or "Unknown"), 0.7, 0.7, 0.7)
            GameTooltip:AddLine("Item Level: " .. (self.item.ilvl or "Unknown"), 0.7, 0.7, 0.7)
            GameTooltip:Show()
        end
    end)
    button:SetScript("OnLeave", function() GameTooltip:Hide() end)
    return button
end

for slot, _ in pairs(SLOT_COORDINATES) do
    buttons[slot] = CreateSlotButton(slot)
end

-- Update display
function addon:UpdateDisplay()
    local class = select(2, UnitClass("player"))
    class = string.gsub(class, "(%a)(%a+)", function(first, rest) return first:upper() .. rest:lower() end)
    local specIndex = GetSpecialization()
    local specId, rawSpecName = select(1, GetSpecializationInfo(specIndex)), select(2, GetSpecializationInfo(specIndex))
    specId = tostring(specId)
    local spec = SPEC_MAP[specId] or rawSpecName -- Fallback to raw spec name

    if GearGap.debug then
        print("GearGap Debug: Class = " .. (class or "nil"))
        print("GearGap Debug: Spec ID = " .. (specId or "nil"))
        print("GearGap Debug: Spec = " .. (spec or "nil"))
        print("GearGap Debug: Loaded specs in GearGapBiS:")
        if GearGapBiS then
            for className, specs in pairs(GearGapBiS) do
                print(" - " .. className .. ":")
                for specName, _ in pairs(specs) do
                    print("   - " .. specName)
                end
            end
        else
            print(" - None (GearGapBiS is nil)")
        end
    end

    if not GearGapBiS then
        print("GearGap: BiS data not loaded")
        frame.title:SetText("GearGap BiS - Data Not Loaded")
        return
    end

    if not spec then
        print("GearGap: Unknown specialization")
        frame.title:SetText("GearGap BiS - No Spec")
        return
    end

    if not GearGapBiS[class] or not GearGapBiS[class][spec] then
        print("GearGap: No BiS data for " .. class .. " " .. spec)
        frame.title:SetText("GearGap BiS - No Data")
        return
    end

    frame.title:SetText("GearGap BiS - " .. class .. " " .. spec)
    for slot, button in pairs(buttons) do
        button.icon:SetTexture(nil)
        button.item = nil
    end
    local fingerCount, trinketCount = 0, 0
    for _, bisItem in ipairs(GearGapBiS[class][spec]) do
        if bisItem.itemID ~= 0 then -- Skip empty items
            local slot = bisItem.slot
            if slot == "Finger" then
                fingerCount = fingerCount + 1
                slot = fingerCount == 1 and "Finger" or "Finger2"
            elseif slot == "Trinket" then
                trinketCount = trinketCount + 1
                slot = trinketCount == 1 and "Trinket" or "Trinket2"
            end
            local button = buttons[slot]
            if button then
                local icon = GetItemIcon(bisItem.itemID)
                button.icon:SetTexture(icon)
                button.item = bisItem
            end
        end
    end
end

-- Event handling for addon loading
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
        if GearGap.debug then
            print("GearGap Debug: Addon loaded")
        end
        frame:Hide()
    end
end)

-- Slash command
SLASH_GEARGAP1 = "/bis"
SlashCmdList["GEARGAP"] = function(msg)
    if msg == "debug" then
        GearGap.debug = not GearGap.debug
        print("GearGap: Debug mode " .. (GearGap.debug and "enabled" or "disabled"))
        print("Class:", playerClass)
        print("Spec:", playerSpec)
        print("BiS Entry:", GearGapBiS[playerClass] and GearGapBiS[playerClass][playerSpec])
        return
    end
    if not GearGapBiS then
        print("GearGap: BiS data not loaded yet")
        return
    end
    frame:Show()
    addon:UpdateDisplay()
end