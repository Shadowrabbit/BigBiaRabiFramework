-- ******************************************************************
--       /\ /|       @file       SkillFairySpin.lua
--       \ V/        @brief      
--       | "")       @author     Shadowrabbit, yingtu0401@gmail.com
--       /  |                    
--      /  \\        @Modified   2021-08-30 21:50
--    *(__\_\        @Copyright  Copyright (c) 2021, Shadowrabbit
-- ******************************************************************
require "Base/Class"
local coroutine = coroutine
local BaseSkillLogic = require "Base/BaseSkillLogic"

--- @brief
--- @class SkillFairySpin : BaseSkillLogic
local SkillFairySpin = Class("SkillFairySpin", BaseSkillLogic)

function SkillFairySpin:OnShowTips()
    self.myCardLogic.displayName = "冰符「妖精旋转」"
    self.myCardLogic.Desc = "对敌方每列第一个敌人造成伤害并眩晕"
    self.myCardLogic.Color = CS.CardLogicColor.blue
end



return SkillFairySpin