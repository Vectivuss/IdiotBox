
local Element = { }

function Element:BaseInit( )
    self.x = 0
    self.y = 0 
    self.w = 0 
    self.h = 0 

    self.Children = { }

    self.Dock = NODOCK
end

function Element:Init( ) end

function Element:Paint( x, y, w, h ) end
function Element:PaintOver( x, y, w, h ) end

function Element:OnLeftClick( ) end
function Element:OnRightClick( ) end

function Element:OnPositionChanged( oldx, oldy, x, y ) end
function Element:OnSizeChanged( oldw, oldh, w, h ) end

function ElemenT:GetParent( )
    return self.Parent
end

function Element:GetChildren( )
    return self.Children
end