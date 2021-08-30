-- ******************************************************************
--       /\ /|       @file       SkillHouraiNingyou.lua
--       \ V/        @brief      诅咒「上吊的蓬莱人偶」
--       | "")       @author     Shadowrabbit, yingtu0401@gmail.com
--       /  |                    
--      /  \\        @Modified   2021-08-30 21:43
--    *(__\_\        @Copyright  Copyright (c) 2021, Shadowrabbit
-- ******************************************************************
require "Base/Class"
local coroutine = coroutine
local BaseSkillLogic = require "Base/BaseSkillLogic"

--- @brief
--- @class SkillHouraiNingyou : BaseSkillLogic
local SkillHouraiNingyou = Class("SkillHouraiNingyou", BaseSkillLogic)

function SkillHouraiNingyou:OnShowTips()
    self.myCardLogic.displayName = "诅咒「上吊的蓬莱人偶」"
    self.myCardLogic.Desc = "在我方全部剩余格子召唤蓬莱人偶"
    self.myCardLogic.Color = CS.CardLogicColor.blue
end

return SkillHouraiNingyou