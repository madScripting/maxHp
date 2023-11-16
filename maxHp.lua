maxHp = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceEvent-2.0")
maxHp.addonVersion = GetAddOnMetadata("maxHp", "Version")

maxHp.loadedMsg = "|cFFFF8080Relar|r maxHp version "..maxHp.addonVersion.." |cff00FF00loaded successfully!|r"

function maxHp:OnEnable()
	DEFAULT_CHAT_FRAME:AddMessage(maxHp.loadedMsg)
	self:CreateSlashCmd()
end

function maxHp:OnDisable()

end

function maxHp:CreateSlashCmd()
	SLASH_MAXHP1 = "/maxhp"
	SlashCmdList["MAXHP"] =
		function(msg)
			self:slashHandle(msg)
		end
end
	
function maxHp:slashHandle(msg)
	self:MaxHp()
end

function maxHp:MaxHp()

	mhpMaxHp1 = nil
	mhpMaxHp2 = nil
	mhpMaxHp3 = nil
	mhpMaxHp4 = nil
	mhpMaxHp5 = nil
		
	if GetNumRaidMembers() > 0 then		
		mhpHpArray = {}
		for i = 1,GetNumRaidMembers() do
			if UnitClass("raid"..i) ~= "Mage" and UnitClass("raid"..i) ~= "Warlock" and UnitClass("raid"..i) ~= "Priest" and UnitClass("raid"..i) ~= "Hunter" then
				table.insert(mhpHpArray,UnitHealthMax("raid"..i))
			end
		end

		table.sort(mhpHpArray, function(x, y) return x > y end)
		mhpMaxHp1 = mhpHpArray[1]
		mhpMaxHp2 = mhpHpArray[2]
		mhpMaxHp3 = mhpHpArray[3]
		mhpMaxHp4 = mhpHpArray[4]
		mhpMaxHp5 = mhpHpArray[5]
		
		for i = 1,GetNumRaidMembers() do
			if UnitClass("raid"..i) ~= "Mage" and UnitClass("raid"..i) ~= "Warlock" and UnitClass("raid"..i) ~= "Priest" and UnitClass("raid"..i) ~= "Hunter" then
				if UnitHealthMax("raid"..i) == mhpMaxHp1 then mhpMaxHp1Name = UnitName("raid"..i) end
				if UnitHealthMax("raid"..i) == mhpMaxHp2 then mhpMaxHp2Name = UnitName("raid"..i) end
				if UnitHealthMax("raid"..i) == mhpMaxHp3 then mhpMaxHp3Name = UnitName("raid"..i) end
				if UnitHealthMax("raid"..i) == mhpMaxHp4 then mhpMaxHp4Name = UnitName("raid"..i) end
				if UnitHealthMax("raid"..i) == mhpMaxHp5 then mhpMaxHp5Name = UnitName("raid"..i) end
			end
		end
		
		SendChatMessage("Relar maxHp: Displaying the 5 highest HP","RAID")
		if mhpMaxHp1 ~= nil and mhpMaxHp1Name ~= nil then SendChatMessage("#1: "..mhpMaxHp1Name.." -- "..mhpMaxHp1.." HP","RAID") end
		if mhpMaxHp2 ~= nil and mhpMaxHp2Name ~= nil then SendChatMessage("#2: "..mhpMaxHp2Name.." -- "..mhpMaxHp2.." HP","RAID") end
		if mhpMaxHp3 ~= nil and mhpMaxHp3Name ~= nil then SendChatMessage("#3: "..mhpMaxHp3Name.." -- "..mhpMaxHp3.." HP","RAID") end
		if mhpMaxHp4 ~= nil and mhpMaxHp4Name ~= nil then SendChatMessage("#4: "..mhpMaxHp4Name.." -- "..mhpMaxHp4.." HP","RAID") end
		if mhpMaxHp5 ~= nil and mhpMaxHp5Name ~= nil then SendChatMessage("#5: "..mhpMaxHp5Name.." -- "..mhpMaxHp5.." HP","RAID") end

		DEFAULT_CHAT_FRAME:AddMessage("|cffFF8080   Relar maxHp:|r |cff00FF00MaxHP command!|r")
	else
		DEFAULT_CHAT_FRAME:AddMessage("|cffFF8080   Relar maxHp:|r |cff00FF00You are not in a raid group!|r")
	end
end
