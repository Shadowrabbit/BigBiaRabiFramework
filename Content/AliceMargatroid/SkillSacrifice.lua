-- ******************************************************************
--       /\ /|       @file       SkillSacrifice.lua
--       \ V/        @brief      狡猾的献祭
--       | "")       @author     Shadowrabbit, yingtu0401@gmail.com
--       /  |                    
--      /  \\        @Modified   2021-08-30 21:40
--    *(__\_\        @Copyright  Copyright (c) 2021, Shadowrabbit
-- ******************************************************************
require "Base/Class"
local coroutine = coroutine
local BaseSkillLogic = require "Base/BaseSkillLogic"

--- @brief
--- @class SkillSacrifice : BaseSkillLogic
local SkillSacrifice = Class("SkillSacrifice", BaseSkillLogic)

function SkillSacrifice:OnShowTips()
    self.myCardLogic.displayName = "狡猾的献祭"
    self.myCardLogic.Desc = "回合结束时自爆"
    self.myCardLogic.Color = CS.CardLogicColor.white
end

return SkillSacrifice