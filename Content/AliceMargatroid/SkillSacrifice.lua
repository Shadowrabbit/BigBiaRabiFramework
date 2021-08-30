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

--- @brief 显示事件 鼠标悬浮在卡片上时，会调用该卡片身上所有技能的此事件
--- @public
function SkillSacrifice:OnShowTips()
    self.myCardLogic.displayName = "狡猾的献祭"
    self.myCardLogic.Desc = "回合结束时死亡并对前方敌人造成自身攻击力的伤害"
    self.myCardLogic.Color = CS.CardLogicColor.white
end

--- @brief 回合结束事件 每个回合（无论玩家或怪物）结束后都会触发
--- @public
--- @param isPlayerTurn boolean 是否为玩家回合结束
function SkillSacrifice:OnEndTurn(isPlayerTurn)
    if isPlayerTurn then
        return
    end

    coroutine.yield(CS.DungeonOperationMgr.Instance.DungeonHandler:ChangeHp(self.myCardLogic.CardData, -self.myCardLogic.CardData.HP, nil))
    local targets = self.myCardLogic:GetAllCurrentMonsters()
    if targets.Count <= 0 then
        return
    end

    for i = 0, targets.Count - 1 do
        if (targets[i].CurrentCardSlotData:GetAttr("Col") == self.myCardLogic.CardData.CurrentCardSlotData:GetAttr("Col")) then
            self.myCardLogic:GetChainLighting(self.myCardLogic.CardData.CardGameObject.transform.position, targets[i].CardGameObject.transform.position)
            coroutine.yield(CS.DungeonOperationMgr.Instance.DungeonHandler:ChangeHp(targets[i], -self.myCardLogic.CardData.ATK, nil))
            return
        end
    end
end

return SkillSacrifice