local util = require 'xlua.util'
--这是刘备的技能示例，刘备的技能会让全场的右方单位平分生面值
--具体的规则入下：
--低于平均生命值的单位会增加血量，如果他的最大生命值低于平均值，会回复全部生命值
--统计所有增加的生命值的和，作为需要减少的生命值
--高于平均生命值的单位会均摊需要减少的生命值。
ICardLogic = {
    myCardLogic,

    Init = function(self)
        --todo
    end,

    OnShowTips = function(self)
        --这里指定了这个技能需要三个蓝色能量
        self.myCardLogic.NeedEnergyCount = CS.UnityEngine.Vector3Int(3, 0, 0);
        --这里指定了这个技能的名称
        self.myCardLogic.displayName = "仁主"
        --这里指定了这个技能的描述
        self.myCardLogic.Desc = "下令让血多的随从给血少的随从分配生命值"
        self.myCardLogic.Color = CS.CardLogicColor.blue
    end,

    OnBattleStart = function(self)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnTurnStart = function(self)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnEndTurn = function(self, isPlayerTurn)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnBattleEnd = function(self)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnBeforeAttack = function(self, player, target)
        return util.cs_generator(function()
            --todo
        end)
    end,

    CustomAttack = function(self, target)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnAfterAttack = function(self, player, target)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnFinishAttack = function(self, player, target)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnBeforeHpChange = function(self, player, value, from)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnHpChange = function(self, player, changedValue, from)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnKill = function(self, target, value, from)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnAfterKill = function(self, cardSlot, originCardData)
        return util.cs_generator(function()
            --todo
        end)
    end,

    Terminate = function(self)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnCardBeforeUseSkill = function(self, user, origin)
        return util.cs_generator(function()
            --todo
        end)
    end,
    --这是使用该技能时调用的协程方法接口
    --为了让逻辑简单易读，这里使用了最容易理解的计算方式(很粗暴)
    OnUseSkill = function(self)
        return util.cs_generator(function()
            --获取了全场所有的友方单位
            local targets = self.myCardLogic:GetAllCurrentMinions()
            --如果数量只有一个那这个技能就没必要触发了
            if (targets.Count <= 1) then
                return
            end
            --使用技能时弹出技能名称
            self.myCardLogic:ShowMe()
            --这个变量记录友方单位数量
            local count = 0
            --这个变量记录友方单位生命值总量
            local sum = 0
            --这个变量记录超过平均生命值的友方单位数量
            local highBloodSum = 0
            --这个变量是平均生命值
            local avg = 0
            --遍历当前的所有友方单位，计算总数和总血量
            for i = 0, targets.Count - 1
            do
                count = count + 1
                sum = sum + targets[i].HP
                --平均值向下取整
                avg = math.floor(sum / count)
            end
            --遍历当前的所有友方单位，记录总共有多少单位的生命值超过了平均生命值
            for i = 0, targets.Count - 1
            do
                if (targets[i].HP > avg)
                then
                    highBloodSum = highBloodSum + 1;
                end
            end
            --定义一个变量记录一共加了多少血
            local SumOfIncreases = 0
            --遍历当前的所有友方单位，找出生命值少于平均生命值的单位，并让他加血
            for i = 0, targets.Count - 1
            do
                if (targets[i].HP < avg) then
                    --最大生命值小于平均值则回满血
                    if (targets[i].MaxHP < avg) then
                        --添加到总加血量
                        SumOfIncreases = SumOfIncreases + targets[i].MaxHP - targets[i].HP;
                        --调用血量变化的协程
                        coroutine.yield(CS.DungeonOperationMgr.Instance.DungeonHandler:ChangeHp(targets[i], targets[i].MaxHP - targets[i].HP, nil))
                        --否则回复到平均值的血量
                    else
                        --添加到总加血量
                        SumOfIncreases = SumOfIncreases + targets[i], avg - targets[i].HP;
                        coroutine.yield(CS.DungeonOperationMgr.Instance.DungeonHandler:ChangeHp(targets[i], avg - targets[i].HP, nil))
                    end
                end
            end
            --定义一个变量记录需要减多少血，数值等于总增加血量除以多于平均生命值的单位数量
            local needReduce = math.floor(SumOfIncreases / highBloodSum)
            --最后遍历一遍扣除相应的血量
            for i = 0, targets.Count - 1
            do
                if (targets[i].HP > avg)
                then
                    coroutine.yield(CS.DungeonOperationMgr.Instance.DungeonHandler:ChangeHp(targets[i], -needReduce, nil))
                end
            end
        end)
    end,
    --至此结束，这个技能的实现方式存在一些问题，但是可以清晰的表现出实现的过程供Mod制作者借鉴，如果你发现了更好的实现方式，可以覆盖这个方法

    OnCardAfterUseSkill = function(self, user, origin)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnMerge = function(self, mergeBy)
        --todo
    end,

    OnActEnd = function(self)
        --todo
    end,

    OnLeftClick = function(self, res)
        --todo
    end,

    OnRightClick = function(self, res)
        --todo
    end,

    OnPlayerExitArea = function(self)
        --todo
    end,

    OnMoneyChanged = function(value)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnMoveOnMap = function(self)
        return util.cs_generator(function()
            --todo
        end)
    end,

    BeforeFact = function(self)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnAttackEffect = function(self, origin, target)
        return util.cs_generator(function()
            --todo
        end)
    end,

    OnEnterArea = function(self, areaID)
        return util.cs_generator(function()
            --todo
        end)
    end,
}
