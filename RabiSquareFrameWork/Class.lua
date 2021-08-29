-- ******************************************************************
--       /\ /|       @file       Class.lua
--       \ V/        @brief      lua面向对象模拟
--       | "")       @author     Shadowrabbit, yingtu0401@gmail.com
--       /  |                    
--      /  \\        @Modified   2021-04-27 16:59
--    *(__\_\        @Copyright  Copyright (c) 2021, Shadowrabbit
-- ******************************************************************
local assert = assert
local type = type
local setmetatable = setmetatable

--- @brief 定义一个类
--- @public
--- @param className string 类名字
--- @param superClass table 父类
function Class(className, superClass)
    assert(type(className) == 'string', "className类型为string, 当前为" .. type(className))
    assert(type(superClass) == 'table' or type(superClass) == 'nil', "superClass类型为table, 当前为" .. type(superClass))
    local class = {}
    class.className = className
    class.superClass = superClass
    --设置实例创建方法
    local metaTable = {
        __call = function(...)
            return Create(class, ...)
        end,
        __index = superClass
    }
    setmetatable(class, metaTable)
    return class
end

--- @brief 销毁实例
--- @public
function DestroyInstance(instance)
    assert(type(instance) == 'table', "instance类型为table, 当前为" .. type(instance))
    local currentClass = instance.class
    while currentClass do
        --存在析构函数
        if currentClass.Finalize then
            currentClass.Finalize(instance)
        end
        currentClass = currentClass.superClass
    end
end

--- @brief 创建实例
--- @private
function Create(class, ...)
    assert(type(class) == 'table', "superClass类型为table, 当前为" .. type(class))
    local instance = {} --创建类实例
    instance.class = class
    --存在构造函数
    if class.Initialize then
        class.Initialize(instance, ...)
    end
    --设置类的方法为实例的元表
    setmetatable(instance, {
        __index = class,
    })
    return instance
end