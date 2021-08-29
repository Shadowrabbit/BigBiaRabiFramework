-- ******************************************************************
--       /\ /|       @file       SkillGenerator.lua
--       \ V/        @brief      
--       | "")       @author     Shadowrabbit, yingtu0401@gmail.com
--       /  |                    
--      /  \\        @Modified   2021-08-29 19:26
--    *(__\_\        @Copyright  Copyright (c) 2021, Shadowrabbit
-- ******************************************************************
local util = require "xlua.util"

--- @brief 生成技能
--- @public
--- @param baseSkillLogic BaseSkillLogic
--- @return table
function GenerateSkill(baseSkillLogic)
    --也就是官方教程中的ICardLogic
    local skill = {
        myCardLogic,
        Init = baseSkillLogic.Init,
        OnShowTips = baseSkillLogic.OnShowTips,
        OnBeforeAttack = util.cs_generator(baseSkillLogic.OnBeforeAttack),
        OnBattleStart = util.cs_generator(baseSkillLogic.OnBattleStart),
        OnTurnStart = util.cs_generator(baseSkillLogic.OnTurnStart),
        OnEndTurn = util.cs_generator(baseSkillLogic.OnEndTurn),
        OnBattleEnd = util.cs_generator(baseSkillLogic.OnBattleEnd),
        IsCustomAttack = baseSkillLogic.IsCustomAttack,
        CustomAttack = util.cs_generator(baseSkillLogic.CustomAttack),
        OnAfterAttack = util.cs_generator(baseSkillLogic.OnAfterAttack),
        OnFinishAttack = util.cs_generator(baseSkillLogic.OnFinishAttack),
        OnBeforeHpChange = util.cs_generator(baseSkillLogic.OnBeforeHpChange),
        OnHpChange = util.cs_generator(baseSkillLogic.OnHpChange),
        OnKill = util.cs_generator(baseSkillLogic.OnKill),
        OnAfterKill = util.cs_generator(baseSkillLogic.OnAfterKill),
        Terminate = util.cs_generator(baseSkillLogic.Terminate),
        OnCardBeforeUseSkill = util.cs_generator(baseSkillLogic.OnCardBeforeUseSkill),
        OnUseSkill = util.cs_generator(baseSkillLogic.OnUseSkill),
        OnCardAfterUseSkill = util.cs_generator(baseSkillLogic.OnCardAfterUseSkill),
        OnMerge = util.cs_generator(baseSkillLogic.OnMerge),
        OnActEnd = util.cs_generator(baseSkillLogic.OnActEnd),
        OnLeftClick = util.cs_generator(baseSkillLogic.OnLeftClick),
        OnRightClick = util.cs_generator(baseSkillLogic.OnRightClick),
        OnPlayerExitArea = util.cs_generator(baseSkillLogic.OnPlayerExitArea),
        OnMoneyChanged = util.cs_generator(baseSkillLogic.OnMoneyChanged),
        OnMoveOnMap = util.cs_generator(baseSkillLogic.OnMoveOnMap),
        BeforeFact = util.cs_generator(baseSkillLogic.BeforeFact),
        OnAttackEffect = util.cs_generator(baseSkillLogic.OnAttackEffect),
        OnEnterArea = util.cs_generator(baseSkillLogic.OnEnterArea)
    }
    return skill
end