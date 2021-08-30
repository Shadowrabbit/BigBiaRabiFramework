-- ******************************************************************
--       /\ /|       @file       TestSkillLogic.lua
--       \ V/        @brief      测试技能逻辑 供vanilla调用
--       | "")       @author     Shadowrabbit, yingtu0401@gmail.com
--       /  |                    
--      /  \\        @Modified   2021-08-29 19:46
--    *(__\_\        @Copyright  Copyright (c) 2021, Shadowrabbit
-- ******************************************************************
require "Base/SkillGenerator"
local TestSkill = require "Content/TestSkill"

local testSkill = TestSkill()

ICardLogic = GenerateSkill(testSkill)
