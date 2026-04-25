
local Vgui = { 
    Elements = { },
    Metas = { },
    List = { }
}

Vgui.__index = Vgui

IdiotBox.Vgui = Vgui

function Vgui.GetAll( )
    return Vgui.List
end

function Vgui.Register( Title, Meta, Base )
    if Vgui.Metas[ Title ] then
        return
    end

    if not Meta.__index then
        Meta.__index = Meta
    end

    if Base then
        setmetatable( Meta, Vgui.Metas[ Base ] )
    end

    Vgui.Metas[ Title ] = Meta
end

function Vgui.Create( Title, Child )
    local Meta = self.Metas[ Title ]
    if not Meta then return end

    local Element = setmetatable( { }, Meta )

    Element.TypeName = Title

    Element:BaseInit( )
    Element:Init( )

    if not Child then
        Vgui.Store( Element )
    end

    return Element
end

function Vgui.Store( Element )
    local Type = Element.TypeName
    if not Type then return end

    table.insert( Vgui.List, Element )
end

function Vgui.UnStore( Element )
    local Index = 0

    for i = #Vgui.List, 1, -1 do
        if Vgui.List[ i ] == Element then
            Index = i
            table.remove( Vgui.List, i )
            break
        end
    end
end