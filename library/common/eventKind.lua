--- 事件种类
--- 下面的todo用于板块定位，不是常规todo之意
---@class eventKind
eventKind = eventKind or {}

-- 对象 Class[框架默认只注册了Vast类] --------------------------------------------------------------------------------------------------

--- [Class]创建
--- triggerObject 触发对象
--- 事件触发会自动匹配className产生trigger[ClassName]数据，下面的triggerUnit、triggerItem等为常用匹配注释
--- triggerUnit 触发单位对象（当是Unit时存在）
--- triggerItem 触发物品对象（当是Item时存在）
--- triggerAbility 触发技能对象（当是Ability时存在）
--- triggerTimer 触发计时器对象（当是Timer时存在）
---@alias eventOnClassObject {triggerObject:Object,triggerUnit:Unit,triggerAbility:Ability,triggerItem:Item,triggerTimer:Timer}
---@alias eventOnClassConstruct eventOnClassObject
eventKind.classConstruct = "classConstruct"

--- [Class]毁灭
---@alias eventOnClassDestruct eventOnClassObject
eventKind.classDestruct = "classDestruct"

--- [Class]参数改变前
--- old 旧的参数值
--- new 新的参数值
--- name 参数名（不带前置下划线）
--- 实际事件注册/触发时使用的key为[eventKind.classBeforeChange..paramsName]参数名参与到事件种类中
--- 比如监听攻击，如 event.syncRegister(symbol, eventKind.classBeforeChange .. 'attack', key, callback)
---@alias eventOnClassBeforeChange eventOnClassObject|{old:any, new:any,name:string}
eventKind.classBeforeChange = "classBeforeChange"

--- [Class]参数改变后
--- old 旧的参数值
--- new 新的参数值
--- name 参数名（不带前置下划线）
--- 实际事件注册/触发时使用的key为[eventKind.classBeforeChange..paramsName]参数名参与到事件种类中
--- 比如监听攻击，如 event.syncRegister(symbol, eventKind.classAfterChange .. 'attack', key, callback)
---@alias eventOnClassAfterChange eventOnClassObject|{old:any, new:any,name:string}
eventKind.classAfterChange = "classAfterChange"

-- 时间 time --------------------------------------------------------------------------------------------------

--- [时间]进入凌晨
---@alias eventOnTimeDawn table
eventKind.timeDawn = "timeDawn"

--- [时间]进入白天
---@alias eventOnTimeDay table
eventKind.timeDay = "timeDay"

--- [时间]进入正午
---@alias eventOnTimeNoon table
eventKind.timeNoon = "timeNoon"

--- [时间]进入黑夜
---@alias eventOnTimeNight table
eventKind.timeNight = "timeNight"

-- 玩家 player ---------------------------------------------------------------------------------------
--- triggerPlayer 触发玩家
---@alias eventOnPlayerBase {triggerPlayer:Player}

--- [玩家]聊天
--- chatString 聊天的内容
--- matchedString 匹配命中的内容
---@alias eventOnPlayerChat eventOnPlayerBase|{chatString:string,matchedString:string}
eventKind.playerChat = "playerChat"

--- [玩家]按下Esc
---@alias eventOnPlayerEsc eventOnPlayerBase
eventKind.playerEsc = "playerEsc"

--- [玩家]选择单位（只要有选中操作就会触发）
--- old 旧的选中单位
--- new 新的选中单位
---@alias eventOnPlayerSelect eventOnPlayerBase|{old:Unit|nil,new:Unit}
eventKind.playerSelect = "playerSelect"

--- [玩家]多次选择单位（大于1小于4次的连续选择，有0.3秒的判定空隙）
--- times 选中次数
---@alias eventOnPlayerMultipleSelect eventOnPlayerSelect|{times:number}
eventKind.playerMultipleSelect = "playerMultipleSelect"

--- [玩家]取消选择单位
--- triggerUnit 触发单位（被取消选择单位）
---@alias eventOnPlayerDeSelect eventOnPlayerBase|{triggerUnit:Unit}
eventKind.playerDeSelect = "playerDeSelect"

--- [玩家]离开游戏
---@alias eventOnPlayerQuit eventOnPlayerBase
eventKind.playerQuit = "playerQuit"

--- [玩家]仓库变动钩子（玩家仓库栏的变化联动，一般用于UI反馈）
--- triggerSlot 触发仓库
---@alias eventOnPlayerWarehouseChange eventOnPlayerBase|{triggerSlot:WarehouseSlot}
eventKind.playerWarehouseChange = "playerWarehouseChange"

--- [玩家]财产有所变化
--- old 旧的财产值
--- new 新的财产值
---@alias eventOnPlayerWorthChange eventOnPlayerBase|{old:table, new:table}
eventKind.playerWorthChange = "playerWorthChange"

-- 可破坏物 destructable ---------------------------------------------------------------------------------------
--- triggerDestructable 触发可破坏物（原生handle）
---@alias eventOnDestructableBase {triggerDestructable:number}

--- [可破坏物]死亡
---@alias eventOnDestructableDead eventOnDestructableBase
eventKind.destructableDead = "destructableDead"

-- 区域 region --------------------------------------------------------------------------------------------------
--- triggerRegion 触发区域
---@alias eventOnRegionBase {triggerRegion:Region}

--- [区域]进入
--- triggerUnit 触发单位（进入单位）
---@alias eventOnRegionEnter eventOnRegionBase|{triggerUnit:Unit}
eventKind.regionEnter = "regionEnter"

--- [区域]离开
--- triggerUnit 触发单位（离开单位）
---@alias eventOnRegionLeave eventOnRegionBase|{triggerUnit:Unit}
eventKind.regionLeave = "regionLeave"

-- 单位 unit --------------------------------------------------------------------------------------------------
--- triggerUnit 触发单位
--- triggerAbility 触发技能（当在Ability中使用onUnitEvent时存在）
--- triggerItem 触发物品（当在Item中使用onUnitEvent时存在）
---@alias eventOnUnitBase {triggerUnit:Unit,triggerAbility:Ability,triggerItem:Item}

--- [单位]候住命令
---@alias eventOnUnitOrderHold eventOnUnitBase
eventKind.unitOrderHold = "unitOrderHold"

--- [单位]停止命令
---@alias eventOnUnitOrderStop eventOnUnitBase
eventKind.unitOrderStop = "unitOrderStop"

--- [单位]移动命令
--- x 移动目标x坐标
--- y 移动目标y坐标
---@alias eventOnUnitOrderMove eventOnUnitBase|{x:number,y:number}
eventKind.unitOrderMove = "unitOrderMove"

--- [单位]攻击命令
--- x 攻击目标x坐标
--- y 攻击目标y坐标
---@alias eventOnUnitOrderAttack eventOnUnitBase|{x:number,y:number}
eventKind.unitOrderAttack = "unitOrderAttack"

--- [单位]造成伤害
--- targetUnit 目标单位（被攻击单位）
--- damage 伤害数值
--- damageSrc 伤害来源
--- damageType 伤害类型
---@see injury#damageSrc
---@see injury#damageType
---@alias eventOnUnitDamage eventOnUnitBase|{targetUnit:Unit,damage:number,damageSrc:MappingValue,damageType:MappingValue}
eventKind.unitDamage = "unitDamage"

--- [单位]出生
---@alias eventOnUnitBorn eventOnUnitBase
eventKind.unitBorn = "unitBorn"

--- [单位]死亡
--- killerUnit 凶手单位
---@alias eventOnUnitDead eventOnUnitBase|{killerUnit:Unit}
eventKind.unitDead = "unitDead"

--- [单位]假死（可以复活的单位被击杀时触发）
---@alias eventOnUnitFeignDead eventOnUnitDead
eventKind.unitFeignDead = "unitFeignDead"

--- [单位]复活
---@alias eventOnUnitReborn eventOnUnitBase
eventKind.unitReborn = "unitReborn"

--- [单位]等级改变
--- old 旧等级
--- new 新等级
---@alias eventOnUnitLevelChange eventOnUnitBase|{old:number, new:number}
eventKind.unitLevelChange = "unitLevelChange"

--- [单位]受伤
--- sourceUnit 来源单位（予伤单位）
--- targetUnit 目标单位（受伤单位）同 triggerUnit
--- damage 伤害数值
--- damageSrc 伤害来源
--- damageType 伤害类型
---@see injury#damageSrc
---@see injury#damageType
---@alias eventOnUnitHurt eventOnUnitBase|{sourceUnit:Unit,targetUnit:Unit,damage:number,damageSrc:MappingValue,damageType:MappingValue}
eventKind.unitHurt = "unitHurt"

--- [单位]受伤前
---@alias eventOnUnitBeforeHurt eventOnUnitHurt
eventKind.unitBeforeHurt = "unitBeforeHurt"

--- [单位]准备攻击
--- targetUnit 目标单位（被攻击单位）
---@alias eventOnUnitBeforeAttack eventOnUnitBase|{targetUnit:Unit}
eventKind.unitBeforeAttack = "unitBeforeAttack"

--- [单位]被准备攻击
--- sourceUnit 来源单位（攻击单位）
---@alias eventOnUnitBeBeforeAttack eventOnUnitBase|{sourceUnit:Unit}
eventKind.unitBeBeforeAttack = "unitBeBeforeAttack"

--- [单位]攻击
---@alias eventOnUnitAttack eventOnUnitDamage
eventKind.unitAttack = "unitAttack"

--- [单位]被攻击
---@alias eventOnUnitBeAttack eventOnUnitHurt
eventKind.unitBeAttack = "unitBeAttack"

--- [单位]杀敌
--- targetUnit 目标单位（被击杀单位）
---@alias eventOnUnitKill eventOnUnitBase|{targetUnit:Unit}
eventKind.unitKill = "unitKill"

--- [单位]被杀
--- sourceUnit 来源单位（凶手单位）
---@alias eventOnUnitBeKill eventOnUnitBase|{sourceUnit:Unit}
eventKind.unitBeKill = "unitBeKill"

--- [单位]破防
--- targetUnit 目标单位（被破防单位）
--- breakArmorType 无视防御种类
---@see injury#breakArmorType
---@alias eventOnUnitBreakArmor eventOnUnitBase|{targetUnit:Unit,breakArmorType:MappingValue}
eventKind.unitBreakArmor = "unitBreakArmor"

--- [单位]被破防
--- sourceUnit 来源单位（破防单位）
--- breakArmorType 无视防御种类
---@see injury#breakArmorType
---@alias eventOnUnitBeBreakArmor eventOnUnitBase|{sourceUnit:Unit,breakArmorType:MappingValue}
eventKind.unitBeBreakArmor = "unitBeBreakArmor"

--- [单位]陷入中止
---@alias eventOnUnitInterruptIn eventOnUnitBase
eventKind.unitInterruptIn = "unitInterruptIn"

--- [单位]脱离中止
---@alias eventOnUnitInterruptOut eventOnUnitBase
eventKind.unitInterruptOut = "unitInterruptOut"

--- [单位]附魔反应
--- sourceUnit 来源单位（被谁击飞）
--- enchantType 附魔类型 同damageType
--- percent 加成百分比
---@see injury#damageType
---@alias eventOnUnitEnchant eventOnUnitBase|{sourceUnit:Unit,enchantType:MappingValue,percent:number}
eventKind.unitEnchant = "unitEnchant"

--- [单位]全抵抗[防御]
--- sourceUnit 来源单位（伤害来源）
---@alias eventOnUnitImmuneDefend eventOnUnitBase|{sourceUnit:Unit}
eventKind.unitImmuneDefend = "unitImmuneDefend"

--- [单位]全抵抗[无敌]
--- sourceUnit 来源单位（伤害来源）
---@alias eventOnUnitImmuneInvincible eventOnUnitBase|{sourceUnit:Unit}
eventKind.unitImmuneInvincible = "unitImmuneInvincible"

--- [单位]免疫[附魔]
--- sourceUnit 来源单位（伤害来源）
--- enchantType 附魔类型 同damageType
---@see injury#damageType
---@alias eventOnUnitImmuneEnchant eventOnUnitBase|{sourceUnit:Unit,enchantType:MappingValue}
eventKind.unitImmuneEnchant = "unitImmuneEnchant"

-- [单位]获得技能
---@alias eventOnUnitAbilityGet eventOnAbilityGet
eventKind.unitAbilityGet = "unitAbilityGet"

--- [单位]失去技能
---@alias eventOnUnitAbilityLose eventOnAbilityLose
eventKind.unitAbilityLose = "unitAbilityLose"

--- [单位]开始施放技能（施法瞬间）
--- triggerItem 触发物品（当技能是物品技能时存在）
--- targetUnit 目标单位（技能目标）
--- targetX 目标x坐标
--- targetY 目标y坐标
--- targetZ 目标z坐标
---@alias eventOnUnitAbilitySpell eventOnAbilitySpell
eventKind.unitAbilitySpell = "unitAbilitySpell"

--- [单位]技能生效
---@alias eventOnUnitAbilityEffective eventOnAbilityEffective
eventKind.unitAbilityEffective = "unitAbilityEffective"

--- [单位]技能持续施法每周期时（动作时）
---@alias eventOnUnitAbilityCasting eventOnAbilityCasting
eventKind.unitAbilityCasting = "unitAbilityCasting"

--- [单位]停止施放技能（吟唱、持续施法有停止状态）
---@alias eventOnUnitAbilityStop eventOnAbilityStop
eventKind.unitAbilityStop = "unitAbilityStop"

--- [单位]施放技能结束（只有持续施法有结束状态）
---@alias eventOnUnitAbilityOver eventOnAbilityOver
eventKind.unitAbilityOver = "unitAbilityOver"

--- [单位]技能等级改变
--- old 旧等级
--- new 新等级
---@alias eventOnUnitAbilityLevelChange eventOnAbilityLevelChange
eventKind.unitAbilityLevelChange = "unitAbilityLevelChange"

--- [单位]技能变动钩子（技能或技能栏的变化联动，常用于UI修改的触发）
--- triggerAbility 触发技能
--- triggerSlot 触发技能栏
---@alias eventOnUnitAbilityChange eventOnUnitBase|{triggerAbility:Ability|nil,triggerSlot:AbilitySlot|nil}
eventKind.unitAbilityChange = "unitAbilityChange"

--- [单位]捡取物品
---@alias eventOnUnitItemPick eventOnItemPick
eventKind.unitItemPick = "unitItemPick"

--- [单位]获得物品
---@alias eventOnUnitItemGet eventOnItemGet
eventKind.unitItemGet = "unitItemGet"

--- [单位]失去物品
---@alias eventOnUnitItemLose eventOnItemLose
eventKind.unitItemLose = "unitItemLose"

--- [单位]使用物品
---@alias eventOnUnitItemUsed eventOnItemUsed
eventKind.unitItemUsed = "unitItemUsed"

--- [单位]丢弃物品
--- targetX 丢弃目标点x坐标
--- targetY 丢弃目标点y坐标
---@alias eventOnUnitItemDrop eventOnItemDrop
eventKind.unitItemDrop = "unitItemDrop"

--- [单位]传递物品
--- targetUnit 目标单位（接受传递单位）
---@alias eventOnUnitItemDeliver eventOnItemDeliver
eventKind.unitItemDeliver = "unitItemDeliver"

--- [单位]抵押物品（持有人售出）
---@alias eventOnUnitItemPawn eventOnItemPawn
eventKind.unitItemPawn = "unitItemPawn"

--- [单位]物品等级改变
--- old 旧等级
--- new 新等级
---@alias eventOnUnitItemLevelChange eventOnItemLevelChange
eventKind.unitItemLevelChange = "unitItemLevelChange"

--- [单位]物品变动钩子（技能或技能栏的变化联动，常用于UI修改的触发）
--- triggerItem 触发物品
--- triggerSlot 触发物品栏
---@alias eventOnUnitItemChange eventOnUnitBase|{triggerItem:Item|nil,triggerSlot:ItemSlot|nil}
eventKind.unitItemChange = "unitItemChange"

-- 技能 ability -------------------------------------------------------------------------------------------

--- triggerAbility 触发技能
--- triggerUnit 触发单位
--- increaseRatio 效果增幅比率（技能效果乘以此值就是蓄力效果）
---@alias eventOnAbilityBase {triggerAbility:Ability,triggerUnit:Unit,increaseRatio:number|nil}

-- [技能]被单位获得
--- 过程中若技能被注销，由于此事件在unitAbilityGet之前，unit事件将不会触发
---@see eventKind#unitAbilityGet
---@alias eventOnAbilityGet eventOnAbilityBase
eventKind.abilityGet = "abilityGet"

--- [技能]被获得单位失去
--- 过程中若技能被注销，由于此事件在unitAbilityLose之前，unit事件将不会触发
---@see eventKind#unitAbilityLose
---@alias eventOnAbilityLose eventOnAbilityBase
eventKind.abilityLose = "abilityLose"

--- [技能]开始施放技能（施法瞬间）
--- 过程中若技能被注销，由于此事件在unitAbilitySpell之前，unit事件将不会触发
---@see eventKind#unitAbilitySpell
---@alias eventOnAbilitySpell eventOnAbilityBase|{triggerItem:Item,targetUnit:Unit,targetX:number,targetY:number,targetZ:number}
eventKind.abilitySpell = "abilitySpell"

--- [技能]生效
--- 过程中若技能被注销，由于此事件在unitAbilityEffective之前，unit事件将不会触发
---@see eventKind#unitAbilityEffective
---@alias eventOnAbilityEffective eventOnAbilitySpell
eventKind.abilityEffective = "abilityEffective"

--- [技能]持续施法每周期时（动作时）
--- 过程中若技能被注销，由于此事件在unitAbilityCasting之前，unit事件将不会触发
---@see eventKind#unitAbilityCasting
---@alias eventOnAbilityCasting eventOnAbilitySpell
eventKind.abilityCasting = "abilityCasting"

--- [技能]停止施放（吟唱、持续施法有停止状态）
--- 过程中若技能被注销，由于此事件在unitAbilityStop之前，unit事件将不会触发
---@see eventKind#unitAbilityStop
---@alias eventOnAbilityStop eventOnAbilityBase
eventKind.abilityStop = "abilityStop"

--- [技能]施放结束（只有持续施法有结束状态）
--- 过程中若技能被注销，由于此事件在unitAbilityOver之前，unit事件将不会触发
---@see eventKind#unitAbilityOver
---@alias eventOnAbilityOver eventOnAbilityBase
eventKind.abilityOver = "abilityOver"

--- [技能]等级改变
--- 过程中若技能被注销，由于此事件在unitAbilityLevelChange之前，unit事件将不会触发
--- old 旧等级
--- new 新等级
---@see eventKind#unitAbilityLevelChange
---@alias eventOnAbilityLevelChange eventOnAbilityBase|{old:number, new:number}
eventKind.abilityLevelChange = "abilityLevelChange"

-- 物品 item -------------------------------------------------------------------------------------------
--- triggerItem 触发物品
--- triggerUnit 触发单位
---@alias eventOnItemBase {triggerItem:Item,triggerUnit:Unit}

--- [物品]被单位捡取
--- 过程中若物品被注销，由于此事件在unitItemPick之前，unit事件将不会触发
---@see eventKind#unitItemPick
---@alias eventOnItemPick eventOnItemBase
eventKind.itemPick = "itemPick"

--- [物品]被获得
--- 过程中若物品被注销，由于此事件在unitItemGet之前，unit事件将不会触发
---@see eventKind#unitItemGet
---@alias eventOnItemGet eventOnItemBase
eventKind.itemGet = "itemGet"

--- [物品]被失去
--- 过程中若物品被注销，由于此事件在unitItemLose之前，unit事件将不会触发
---@see eventKind#unitItemLose
---@alias eventOnItemLose eventOnItemBase
eventKind.itemLose = "itemLose"

--- [物品]被使用
--- 过程中若物品被注销，由于此事件在unitItemUsed之前，unit事件将不会触发
---@see eventKind#unitItemUsed
---@alias eventOnItemUsed eventOnItemBase|eventOnAbilityEffective
eventKind.itemUsed = "itemUsed"

--- [物品]被丢弃
--- 过程中若物品被注销，由于此事件在unitItemDrop之前，unit事件将不会触发
--- targetX 丢弃目标点x坐标
--- targetY 丢弃目标点y坐标
---@see eventKind#unitItemDrop
---@alias eventOnItemDrop eventOnItemBase|{targetX:number,targetY:number}
eventKind.itemDrop = "itemDrop"

--- [物品]被传递
--- 过程中若物品被注销，由于此事件在unitItemDeliver之前，unit事件将不会触发
--- targetUnit 目标单位（接受传递单位）
---@see eventKind#unitItemDeliver
---@alias eventOnItemDeliver eventOnItemBase|{targetUnit:Unit}
eventKind.itemDeliver = "itemDeliver"

--- [物品]被抵押物品（持有人售出）
--- 过程中若物品被注销，由于此事件在unitItemPawn之前，unit事件将不会触发
---@see eventKind#unitItemPawn
---@alias eventOnItemPawn eventOnItemBase
eventKind.itemPawn = "itemPawn"

--- [物品]等级改变
--- 过程中若物品被注销，由于此事件在unitItemLevelChange之前，unit事件将不会触发
--- old 旧等级
--- new 新等级
---@see eventKind#unitItemLevelChange
---@alias eventOnItemLevelChange eventOnItemBase|{old:number, new:number}
eventKind.itemLevelChange = "itemLevelChange"

-- 窗口 window --------------------------------------------------------------------------------------------------

--- [窗口]大小改变
--- triggerPlayer 触发玩家
---@alias eventOnWindowResize eventOnPlayerBase
eventKind.windowResize = "windowResize"

-- 镜头 camera --------------------------------------------------------------------------------------------------

--- [镜头]移动
eventKind.cameraMove = "cameraMove"

--- [镜头]缩放
eventKind.cameraZoom = "cameraZoom"

--- [镜头]旋转
eventKind.cameraRotate = "cameraRotate"

--- [镜头]变动
eventKind.cameraChange = "cameraChange"

-- 鼠标 mouse --------------------------------------------------------------------------------------------------

--- [鼠标]左键点击
--- triggerPlayer 触发玩家
--- rx 点击rx坐标
--- ry 点击ry坐标
---@alias eventOnMouseLeftClick eventOnPlayerBase|{rx:number,ry:number}
eventKind.mouseLeftClick = "mouseLeftClick"

--- [鼠标]左键释放
--- triggerPlayer 触发玩家
--- rx 释放rx坐标
--- ry 释放ry坐标
---@alias eventOnMouseLeftRelease eventOnPlayerBase|{rx:number,ry:number}
eventKind.mouseLeftRelease = "mouseLeftRelease"

--- [鼠标]左键长按被打断（指打算长按，但未能顺利开始的情况，如按压时长过短却已松开）
--- triggerPlayer 触发玩家
---@alias eventOnMouseLeftLongPressBroken {triggerPlayer:Player}
eventKind.mouseLeftLongPressBroken = "mouseLeftLongPressBroken"

--- [鼠标]左键长按开始
--- triggerPlayer 触发玩家
--- rx 长按开始rx坐标
--- ry 长按开始ry坐标
--- frame 长按开始时对应的后台帧
---@alias eventOnMouseLeftLongPressStart eventOnPlayerBase|{rx:number,ry:number,frame:number}
eventKind.mouseLeftLongPressStart = "mouseLeftLongPressStart"

--- [鼠标]左键长按结束
--- triggerPlayer 触发玩家
--- rx 长按结束rx坐标
--- ry 长按结束ry坐标
--- frame 长按结束时对应的后台帧
--- duration 长按经历的帧数
---@alias eventOnMouseLeftLongPressOver eventOnPlayerBase|{rx:number,ry:number,frame:number,duration:number}
eventKind.mouseLeftLongPressOver = "mouseLeftLongPressOver"

--- [鼠标]右键点击
--- triggerPlayer 触发玩家
--- rx 点击rx坐标
--- ry 点击ry坐标
---@alias eventOnMouseRightClick eventOnPlayerBase|{rx:number,ry:number}
eventKind.mouseRightClick = "mouseRightClick"

--- [鼠标]右键释放
--- triggerPlayer 触发玩家
--- rx 释放rx坐标
--- ry 释放ry坐标
---@alias eventOnMouseRightRelease eventOnPlayerBase|{rx:number,ry:number}
eventKind.mouseRightRelease = "mouseRightRelease"

--- [鼠标]右键长按被打断（指打算长按，但未能顺利开始的情况，如按压时长过短却已松开）
--- triggerPlayer 触发玩家
---@alias eventOnMouseRightLongPressBroken {triggerPlayer:Player}
eventKind.mouseRightLongPressBroken = "mouseRightLongPressBroken"

--- [鼠标]右键长按开始
--- triggerPlayer 触发玩家
--- rx 结束rx坐标
--- ry 结束ry坐标
--- frame 长按开始时对应的后台帧
---@alias eventOnMouseRightLongPressStart eventOnPlayerBase|{rx:number,ry:number,frame:number}
eventKind.mouseRightLongPressStart = "mouseRightLongPressStart"

--- [鼠标]右键长按结束
--- triggerPlayer 触发玩家
--- rx 结束rx坐标
--- ry 结束ry坐标
--- frame 长按结束时对应的后台帧
--- duration 长按经历的帧数
---@alias eventOnMouseRightLongPressOver eventOnPlayerBase|{rx:number,ry:number,frame:number,duration:number}
eventKind.mouseRightLongPressOver = "mouseRightLongPressOver"

--- [鼠标]移动
--- triggerPlayer 触发玩家
--- rx 实时rx坐标
--- ry 实时ry坐标
---@alias eventOnMouseMove eventOnPlayerBase|{rx:number,ry:number}
eventKind.mouseMove = "mouseMove"

--- [鼠标]滚轮
--- triggerPlayer 触发玩家
--- delta 滚轮值
---@alias eventOnMouseWheel eventOnPlayerBase|{delta:number}
eventKind.mouseWheel = "mouseWheel"

-- 键盘 keyboard --------------------------------------------------------------------------------------------------

--- [键盘]按下
--- triggerPlayer 触发玩家
--- triggerKey 触发按键值
---@alias eventOnKeyboardPress {triggerPlayer:Player,triggerKey:number}
eventKind.keyboardPress = "keyboardPress"

--- [键盘]释放
--- triggerPlayer 触发玩家
--- triggerKey 触发按键值
---@alias eventOnKeyboardRelease {triggerPlayer:Player,triggerKey:number}
eventKind.keyboardRelease = "keyboardRelease"

--- [键盘]长按被打断（指打算长按，但未能顺利开始的情况，如按压时长过短却已松开）
--- triggerPlayer 触发玩家
--- triggerKey 触发按键值
---@alias eventOnKeyboardLongPressBroken {triggerPlayer:Player,triggerKey:number}
eventKind.keyboardLongPressBroken = "keyboardLongPressBroken"

--- [键盘]长按开始
--- triggerPlayer 触发玩家
--- triggerKey 触发按键值
--- frame 长按开始时对应的后台帧
---@alias eventOnKeyboardLongPressStart {triggerPlayer:Player,triggerKey:number,frame:number}
eventKind.keyboardLongPressStart = "keyboardLongPressStart"

--- [键盘]长按结束
--- triggerPlayer 触发玩家
--- triggerKey 触发按键值
--- frame 长按结束时对应的后台帧
--- duration 长按经历的帧数
---@alias eventOnKeyboardLongPressOver {triggerPlayer:Player,triggerKey:number,frame:number,duration:number}
eventKind.keyboardLongPressOver = "keyboardLongPressOver"

-- UI ui -------------------------------------------------------------------------------------------
--- triggerUI 触发UI
---@alias eventOnUIBase {triggerUI:UI}

--- [UI]显示
---@alias eventOnUIShow eventOnUIBase
eventKind.uiShow = "uiShow"

--- [UI]隐藏
---@alias eventOnUIHide eventOnUIBase
eventKind.uiHide = "uiHide"

--- [UI]左键点击
--- triggerPlayer 触发玩家
---@alias eventOnUILeftClick eventOnUIBase|{triggerPlayer:Player}
eventKind.uiLeftClick = "uiLeftClick"

--- [UI]左键释放
--- triggerPlayer 触发玩家
--- status 鼠标是否还在UI内
---@alias eventOnUILeftRelease eventOnUIBase|{triggerPlayer:Player,status:boolean}
eventKind.uiLeftRelease = "uiLeftRelease"

--- [UI]右键点击
--- triggerPlayer 触发玩家
---@alias eventOnUIRightClick eventOnUIBase|{triggerPlayer:Player}
eventKind.uiRightClick = "uiRightClick"

--- [UI]右键释放
--- triggerPlayer 触发玩家
--- status 鼠标是否还在UI内
---@alias eventOnUIRightRelease eventOnUIBase|{triggerPlayer:Player,status:boolean}
eventKind.uiRightRelease = "uiRightRelease"

--- [UI]移动
--- triggerPlayer 触发玩家
---@alias eventOnUIMove eventOnUIBase|{triggerPlayer:Player}
eventKind.uiMove = "uiMove"

--- [UI]移入
--- triggerPlayer 触发玩家
---@alias eventOnUIEnter eventOnUIBase|{triggerPlayer:Player}
eventKind.uiEnter = "uiEnter"

--- [UI]移出
--- triggerPlayer 触发玩家
---@alias eventOnUILeave eventOnUIBase|{triggerPlayer:Player}
eventKind.uiLeave = "uiLeave"

--- [UI]滚动
--- triggerPlayer 触发玩家
--- delta 滚轮值
---@alias eventOnUIWheel eventOnUIBase|{triggerPlayer:Player,delta:number}
eventKind.uiWheel = "uiWheel"

--- [UI]拖拽开始
--- triggerPlayer 触发玩家
---@alias eventOnUIDragStart eventOnUIBase|{triggerPlayer:Player}
eventKind.uiDragStart = "uiDragStart"

--- [UI]拖拽结束
--- triggerPlayer 触发玩家
---@alias eventOnUIDragStop eventOnUIBase|{triggerPlayer:Player}
eventKind.uiDragStop = "uiDragStop"