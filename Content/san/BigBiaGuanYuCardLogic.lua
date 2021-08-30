local util = require 'xlua.util'--需要引用xlua的工具包，不可删除

ICardLogic={ --创建你的技能 这个不是技能名称 不能改动
	myCardLogic,--你的技能逻辑本体 不能改动
	
	--初始化事件，这个技能初始化时触发的逻辑
	--参数：self 可用于获得技能逻辑本身 下同
	Init=function(self)
		--todo
	end,
	
	--显示事件 鼠标悬浮在卡片上时，会调用该卡片身上所有技能的此事件
	OnShowTips=function(self)	
		--设置该技能的名字
		self.myCardLogic.displayName="武圣"
		--设置该技能的描述
		self.myCardLogic.Desc="自己攻击前，同列每有一个生命值大于自己的敌人，便于此回合+"..math.ceil(self.myCardLogic.Layers*10).."%暴击率"
		--设置该技能的颜色 只有卡片站在在对应颜色的格子上才会触发此技能
		self.myCardLogic.Color=CS.CardLogicColor.yellow
	end,
	
	--攻击前触发事件 战斗时，自己或其他单位普通攻击产生效果前触发此事件
	--参数：self player:攻击发起者 target:攻击直接目标的卡槽
	OnBeforeAttack=function(self,player,target)
		return util.cs_generator(function()--XLUA调用协程的方式 不能改动
		--方法体正式内容-----------------------------------------
			if(player==self.myCardLogic.CardData)--判断攻击者是否是自己
			then
				local targets=self.myCardLogic:GetAllCurrentMonsters()--找到当前存在的所有怪物
				if(targets.Count<=0)--若怪物数量不大于0则技能无效 因为战斗应结束了
				then
					coroutine.yield(nil)
				end
				self.myCardLogic:ShowMe()--触发技能时，在卡片上显示出技能名
				local count=0--定义一个暴击概率增加的计数器
				for i=0,targets.Count-1 --遍历所有怪物
				do
					--判断怪物是否与自己同列且生命值大于自己
					if(targets[i].CurrentCardSlotData:GetAttr("Col") == self.myCardLogic.CardData.CurrentCardSlotData:GetAttr("Col") and targets[i].HP>self.myCardLogic.CardData.HP)
					then
						--若满足条件则叠加暴击概率计数器
						count=count+10*self.myCardLogic.Layers
					end
				end
				if(count>0)
				then
					--将计数器上的值赋给卡片本身的临时暴击率属性
					self.myCardLogic.CardData.wCRIT=self.myCardLogic.CardData.wCRIT+count
				end
			end
			--协程未返回 在此处返回。若已返回则不需要这一句
			coroutine.yield(nil)
		--方法体正式内容-----------------------------------------
		end)
	end,
	
	--战斗开始事件 会在每场战斗开始时触发
	OnBattleStart=function(self)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--回合开始事件 玩家和怪物都行动过后，开启新的回合时触发
	OnTurnStart=function(self)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--回合结束事件 每个回合（无论玩家或怪物）结束后都会触发
	--参数:isPlayerTurn:是否为玩家回合结束
	OnEndTurn=function(self,isPlayerTurn)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--战斗结束事件
	OnBattleEnd=function(self)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--是否开启自定义攻击 默认为否 若要编写下面的CustomAttack 将此属性改为true
	IsCustomAttack=false,
	--自定义攻击事件 普通攻击触发 会覆盖掉默认的普通攻击 若开启了却不实现 普通攻击将无效果
	--参数：target:默认攻击目标的卡槽
	CustomAttack=function(self,target)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--攻击后触发事件 战斗时，自己或其他单位普通攻击产生效果后触发此事件 此事件在OnFinishAttack事件之前
	--参数：self player:攻击发起者 target:攻击的直接目标
	OnAfterAttack=function(self,player,target)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--攻击结束触发事件 战斗时，自己或其他单位普通攻击结束后触发的事件
	--参数：self player:攻击发起者 target:攻击的直接目标
	OnFinishAttack=function(self,player,target)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--生命值改变前事件 任何单位生命值将发生改变前，触发此事件
	--参数：self player:生命值改变的发起者 value:生命值改变的数值 from:造成改变的来源 可能为空
	OnBeforeHpChange=function(self,player,value,from)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--生命值改变前事件 任何单位生命值发生改变时，触发此事件 触发此事件时，生命值改变已经完成。
	--参数：self player:生命值改变的发起者 changedValue:生命值改变的数值 from:造成改变的来源 可能为空
	OnHpChange=function(self,player,changedValue,from)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--击杀事件 任何单位被击杀都会触发
	--参数：self target:死亡的单位 value：死亡时受到的伤害 from:造成死亡的单位
	OnKill=function(self,target,value,from)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--击杀后事件 任何单位被击杀且结算后都会触发
	--参数：self cardSlot:死亡的单位临死前所处的卡槽 originCardData:造成死亡的单位
	OnAfterKill=function(self,cardSlot,originCardData)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--销毁事件 此技能被移除或销毁时触发的事件
	Terminate=function(self)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--使用主动技能前事件 自己或其他单位使用主动技能前触发
	--参数：self user:使用技能者 origin:使用的技能
	OnCardBeforeUseSkill=function(self,user,origin)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--使用主动技能事件 自己使用此技能时触发
	OnUseSkill=function(self)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--使用主动技能后事件 自己或其他单位使用主动技能后触发
	--参数：self user:使用技能者 origin:使用的技能
	OnCardAfterUseSkill=function(self,user,origin)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--融合事件 卡片吃下食物或被吃下 与其他卡片融合时触发的事件
	--参数：self mergeBy:被合成的卡片
	OnMerge=function(self,mergeBy)
		--todo
	end,
	
	--ACT结束时触发 打开商店 关闭宝箱 结束战斗 都算作结束ACT 都会触发此事件
	OnActEnd=function(self)
		--todo
	end,
	
	--左键单击卡片触发
	OnLeftClick=function(self,res)
		--todo
	end,
	
	--右键单击卡片触发
	OnRightClick=function(self,res)
		--todo
	end,
	
	--退出场景时触发
	OnPlayerExitArea=function(self)
		--todo
	end,
	
	--金币改变时触发
	--参数:self value:金币改变的值
	OnMoneyChanged=function(self,value)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--在地图上移动时触发
	OnMoveOnMap=function(self)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--事件开始前触发
	BeforeFact=function(self)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--攻击特效开始时触发 暂不需使用
	OnAttackEffect=function(self,origin,target)
		return util.cs_generator(function()
			--todo
		end)
	end,
	
	--进入新场景时触发
	--参数：self areaID:进入的场景ID
	OnEnterArea=function(self,areaID)
		return util.cs_generator(function()
			--todo
		end)
	end,
}
