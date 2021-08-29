-- ******************************************************************
--       /\ /|       @file       TestSkillLogic.lua
--       \ V/        @brief      
--       | "")       @author     Shadowrabbit, yingtu0401@gmail.com
--       /  |                    
--      /  \\        @Modified   2021-08-29 19:46
--    *(__\_\        @Copyright  Copyright (c) 2021, Shadowrabbit
-- ******************************************************************
require "RabiSquareFrameWork/SkillGenerator"
local TestSkill = require "RabiSquareFrameWork/TestSkill"

local testSkill = TestSkill()

ICardLogic = GenerateSkill(testSkill)
