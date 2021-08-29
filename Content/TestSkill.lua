-- ******************************************************************
--       /\ /|       @file       TestSkill.lua
--       \ V/        @brief      铃仙 卡牌逻辑
--       | "")       @author     Shadowrabbit, yingtu0401@gmail.com
--       /  |                    
--      /  \\        @Modified   2021-08-29 19:10
--    *(__\_\        @Copyright  Copyright (c) 2021, Shadowrabbit
-- ******************************************************************
require "Base/Class"
local BaseSkillLogic = require "Base/BaseSkillLogic"

--- @brief
--- @class TestSkill : BaseSkillLogic
local TestSkill = Class("TestSkill", BaseSkillLogic)

function TestSkill:OnShowTips()
    --设置该技能的名字
    self.myCardLogic.displayName = "测试技能名称"
    --设置该技能的描述
    self.myCardLogic.Desc = "测试技能描述"
    --设置该技能的颜色 只有卡片站在在对应颜色的格子上才会触发此技能
    self.myCardLogic.Color = CS.CardLogicColor.red
end

function TestSkill:OnBeforeAttack(player, target)
    --方法体正式内容-----------------------------------------
    if (player == self.myCardLogic.CardData) then
        local targets = self.myCardLogic:GetAllCurrentMonsters()--找到当前存在的所有怪物
        if (targets.Count <= 0)--若怪物数量不大于0则技能无效 因为战斗应结束了
        then
            coroutine.yield(nil)
        end
        self.myCardLogic:ShowMe()--触发技能时，在卡片上显示出技能名
        local count = 0--定义一个暴击概率增加的计数器
        for i = 0, targets.Count - 1 --遍历所有怪物
        do
            --判断怪物是否与自己同列且生命值大于自己
            if (targets[i].CurrentCardSlotData:GetAttr("Col") == self.myCardLogic.CardData.CurrentCardSlotData:GetAttr("Col") and targets[i].HP > self.myCardLogic.CardData.HP)
            then
                --若满足条件则叠加暴击概率计数器
                count = count + 10 * self.myCardLogic.Layers
            end
        end
        if (count > 0)
        then
            --将计数器上的值赋给卡片本身的临时暴击率属性
            self.myCardLogic.CardData.wCRIT = self.myCardLogic.CardData.wCRIT + count
        end
    end
    --协程未返回 在此处返回。若已返回则不需要这一句
    coroutine.yield(nil)
end

return TestSkill