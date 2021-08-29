-- ******************************************************************
--       /\ /|       @file       BaseSkillLogic.lua
--       \ V/        @brief      技能逻辑基类
--       | "")       @author     Shadowrabbit, yingtu0401@gmail.com
--       /  |                    
--      /  \\        @Modified   2021-08-29 15:44
--    *(__\_\        @Copyright  Copyright (c) 2021, Shadowrabbit
-- ******************************************************************
require "RabiSquareFrameWork/Class"

--- @brief
--- @class BaseSkillLogic
local BaseSkillLogic = Class("BaseSkillLogic")

--- @brief 初始化事件，这个技能初始化时触发的逻辑
--- @public
function BaseSkillLogic:Init()

end

--- @brief 显示事件 鼠标悬浮在卡片上时，会调用该卡片身上所有技能的此事件
--- @public
function BaseSkillLogic:OnShowTips()

end

--- @brief 攻击前触发事件 战斗时，自己或其他单位普通攻击产生效果前触发此事件
--- @public
--- @param player table 攻击发起者
--- @param target table 攻击直接目标的卡槽
function BaseSkillLogic:OnBeforeAttack(player, target)

end

--- @brief 战斗开始事件 会在每场战斗开始时触发
--- @public
function BaseSkillLogic:OnBattleStart()

end

--- @brief 回合开始事件 玩家和怪物都行动过后，开启新的回合时触发
--- @public
function BaseSkillLogic:OnTurnStart()

end

--- @brief 回合结束事件 每个回合（无论玩家或怪物）结束后都会触发
--- @public
--- @param isPlayerTurn boolean 是否为玩家回合结束
function BaseSkillLogic:OnEndTurn(isPlayerTurn)

end

--- @brief 战斗结束事件
--- @public
function BaseSkillLogic:OnBattleEnd()

end

--是否开启自定义攻击 默认为否 若要编写下面的CustomAttack 将此属性改为true
IsCustomAttack = false

--- @brief 自定义攻击事件 普通攻击触发 会覆盖掉默认的普通攻击 若开启了却不实现 普通攻击将无效果
--- @public
--- @param target table 默认攻击目标的卡槽
function BaseSkillLogic:CustomAttack(target)

end

--- @brief 攻击后触发事件 战斗时，自己或其他单位普通攻击产生效果后触发此事件 此事件在OnFinishAttack事件之前
--- @public
--- @param player table 攻击发起者
--- @param target table 攻击直接目标的卡槽
function BaseSkillLogic:OnAfterAttack(player, target)

end

--- @brief 攻击结束触发事件 战斗时，自己或其他单位普通攻击结束后触发的事件
--- @public
--- @param player table 攻击发起者
--- @param target table 攻击直接目标的卡槽
function BaseSkillLogic:OnFinishAttack(player, target)

end

--- @brief 生命值改变前事件 任何单位生命值将发生改变前，触发此事件
--- @public
--- @param player table 攻击发起者
--- @param value number 生命值改变的数值
--- @param from table|nil 造成改变的来源
function BaseSkillLogic:OnBeforeHpChange(player, value, from)

end

--- @brief 生命值改变前事件 任何单位生命值发生改变时，触发此事件 触发此事件时，生命值改变已经完成
--- @public
--- @param player table 生命改变发起者
--- @param changedValue number 生命值改变的数值
--- @param from table|nil 造成改变的来源
function BaseSkillLogic:OnHpChange(player, changedValue, from)

end

--- @brief 击杀事件 任何单位被击杀都会触发
--- @public
--- @param target table 死亡的单位
--- @param value number 死亡时受到的伤害
--- @param from table 造成死亡的单位
function BaseSkillLogic:OnKill(target, value, from)

end

--- @brief 击杀后事件 任何单位被击杀且结算后都会触发
--- @public
--- @param cardSlot table 死亡的单位临死前所处的卡槽
--- @param originCardData table 造成死亡的单位
function BaseSkillLogic:OnAfterKill(cardSlot, originCardData)

end

--- @brief 销毁事件 此技能被移除或销毁时触发的事件
--- @public
function BaseSkillLogic:Terminate()

end

--- @brief 使用主动技能前事件 自己或其他单位使用主动技能前触发
--- @public
--- @param user table 使用技能者
--- @param origin table 使用的技能
function BaseSkillLogic:OnCardBeforeUseSkill(user, origin)

end

--- @brief 使用主动技能事件 自己使用此技能时触发
--- @public
function BaseSkillLogic:OnUseSkill()

end

--- @brief 使用主动技能后事件 自己或其他单位使用主动技能后触发
--- @public
--- @param user table 使用技能者
--- @param origin table 使用的技能
function BaseSkillLogic:OnCardAfterUseSkill(user, origin)

end

--- @brief 融合事件 卡片吃下食物或被吃下 与其他卡片融合时触发的事件
--- @public
--- @param mergeBy table 被合成的卡片
function BaseSkillLogic:OnMerge(mergeBy)

end

--- @brief ACT结束时触发 打开商店 关闭宝箱 结束战斗 都算作结束ACT 都会触发此事件
--- @public
function BaseSkillLogic:OnActEnd()

end

--- @brief 左键单击卡片触发
--- @public
--- @param res table
function BaseSkillLogic:OnLeftClick(res)

end

--- @brief 右键单击卡片触发
--- @public
--- @param res table
function BaseSkillLogic:OnRightClick(res)

end

--- @brief 退出场景时触发
--- @public
function BaseSkillLogic:OnPlayerExitArea()

end

--- @brief 金币改变时触发
--- @public
--- @param value number 金币改变的值
function BaseSkillLogic:OnMoneyChanged(value)

end

--- @brief 在地图上移动时触发
--- @public
function BaseSkillLogic:OnMoveOnMap()

end

--- @brief 事件开始前触发
--- @public
function BaseSkillLogic:BeforeFact()

end

--- @brief 攻击特效开始时触发 暂不需使用
--- @public
--- @param origin
--- @param target
function BaseSkillLogic:OnAttackEffect(origin, target)

end

--- @brief 进入新场景时触发
--- @public
--- @param areaID number 进入的场景ID
function BaseSkillLogic:OnEnterArea(areaID)

end

return BaseSkillLogic