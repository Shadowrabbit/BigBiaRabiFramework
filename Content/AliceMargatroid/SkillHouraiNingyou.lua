-- ******************************************************************
--       /\ /|       @file       SkillHouraiNingyou.lua
--       \ V/        @brief      诅咒「上吊的蓬莱人偶」
--       | "")       @author     Shadowrabbit, yingtu0401@gmail.com
--       /  |                    
--      /  \\        @Modified   2021-08-30 21:43
--    *(__\_\        @Copyright  Copyright (c) 2021, Shadowrabbit
-- ******************************************************************
require "Base/Class"
local string = string
local pairs = pairs
local math = math
local BaseSkillLogic = require "Base/BaseSkillLogic"

--- @brief
--- @class SkillHouraiNingyou : BaseSkillLogic
local SkillHouraiNingyou = Class("SkillHouraiNingyou", BaseSkillLogic)

local power = 0

--- @brief 显示事件 鼠标悬浮在卡片上时，会调用该卡片身上所有技能的此事件
--- @public
function SkillHouraiNingyou:OnShowTips()
    self.myCardLogic.NeedEnergyCount = CS.UnityEngine.Vector3Int(1, 0, 0);
    self.myCardLogic.displayName = "诅咒:上吊的蓬莱人偶"
    power = (self.myCardLogic.Layers + 1) / 3
    local powerPercent = string.format("%.2f", power * 100)
    self.myCardLogic.Desc = "在我方全部剩余格子召唤蓬莱人偶, 人偶的能力值为爱丽丝的" .. powerPercent .. "%"
    self.myCardLogic.Color = CS.CardLogicColor.blue
end

--- @brief 使用主动技能事件 自己使用此技能时触发
--- @public
function SkillHouraiNingyou:OnUseSkill()
    local emptySlots = self.myCardLogic:GetAllEmptySlotsInMyBattleArea()
    for _, emptySlot in pairs(emptySlots) do
        local houraiNingyou = CS.Card.InitCardDataByID("HouraiNingyou")
        houraiNingyou:PutInSlotData(emptySlot)
        houraiNingyou.MaxHP = math.floor(self.myCardLogic.CardData.MaxHP * power)
        houraiNingyou.HP = math.floor(self.myCardLogic.CardData.HP * power)
        houraiNingyou._ATK = math.floor(self.myCardLogic.CardData.ATK * power)
        houraiNingyou._AttackTimes = math.floor(self.myCardLogic.CardData.AttackTimes * power)
        houraiNingyou._CRIT = math.floor(self.myCardLogic.CardData.CRIT * power)
    end

    self.myCardLogic:ShowMe()
    self.myCardLogic.CardData.IsAttacked = true
end

return SkillHouraiNingyou