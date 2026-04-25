
local Element = { }

function Element:Init( )

end

function Element:Paint( x, y, w, h )
    surface.SetDrawColor( 16, 16, 16 )
    surface.DrawRect( x, y, w, h )
end

IdiotBox.Vgui.Register( "Frame", Element, "Base" )