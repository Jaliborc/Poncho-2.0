local Tests = WoWUnit and WoWUnit('Poncho-2.0')
if not Tests then return end

local NewClass = LibStub('Poncho-2.0')
local AreEqual, IsFalse, IsTrue = WoWUnit.AreEqual, WoWUnit.IsFalse, WoWUnit.IsTrue

function Tests:ClassInheritance()
  local a = NewClass('Frame')
  local b = a:NewClass()

  a.A = 1

  AreEqual(b.GetName, a.GetName)
  AreEqual(b.A, a.A)
end

function Tests:DirectInheritance()
  local a = NewClass('Frame')
  local f = a()

  a.A = 1

  AreEqual(f.GetName, a.GetName)
  AreEqual(f.A, a.A)
end

function Tests:IndirectInheritance()
  local a = NewClass('Frame')
  local b = a:NewClass()
  local f = b()

  a.A = 1
  b.B = 2

  AreEqual(f.GetName, a.GetName)
  AreEqual(f.A, a.A)
  AreEqual(f.B, b.B)
end

function Tests:AbstractInheritance()
  local a = NewClass()
  local b = a:NewClass('Frame')
  local f = b()

  a.Abstract = 1
  b.Conctrete = 2

  AreEqual(f.Abstract, 1)
  AreEqual(b.Conctrete, 2)
end

function Tests:AsbtractInstances()
  local a = NewClass()
  local b = NewClass('Frame')

  IsFalse(pcall(a))
  IsTrue(pcall(b))
end

function Tests:Super()
  local a = NewClass()
  local b = a:NewClass('Frame')
  local f = b()
  f:SetID(5)
  f.v = 1

  function a:GetVal()
    return self.v
  end

  function b:GetVal()
    return self:Super(b):GetVal() + 3
  end

  function b:GetID()
    return self:Super(b):GetID() + 2
  end

  AreEqual(f:GetVal(), 4)
  AreEqual(f:GetID(), 7)
end

function Tests:Release()
  local class = NewClass('Frame')
  AreEqual(class:NumFrames(), 0)

  local a, b = class(), class()
  AreEqual(class:NumFrames(), 2)
  AreEqual(class:NumInactive(), 0)

  a:Release()
  AreEqual(class:NumFrames(), 2)
  AreEqual(class:NumInactive(), 1)

  a:Release()
  AreEqual(class:NumFrames(), 2)
  AreEqual(class:NumInactive(), 1)

  local c = class()
  AreEqual(class:NumFrames(), 2)
  AreEqual(class:NumInactive(), 0)
end

function Tests:HidingInactive()
  local class = NewClass('Frame', nil, BackdropTemplateMixin and 'BackdropTemplate')
  local f = class()
  f:SetParent(UIParent)
  f:SetPoint('CENTER')
  f:SetSize(200, 200)
  f:SetBackdrop {bgFile = 'fail'}
  f:Release()
end
