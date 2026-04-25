
local IdiotBox = { }

IdiotBox.Copy( Table, Index, Lookup )
	if not Table then return end 

	Index = Index or _G

	Lookup = Lookup or { }

	local Copy = { }

	Index.setmetatable( Copy, Index.debug.getmetatable( Table ) )

	for i, v in Index.pairs( Table ) do
		if not Index.istable( v ) then 
			Copy[ i ] = v
		else
			Lookup[ Table ] = Copy
			if ( Lookup[ v ] ) then
				Copy[ i ] = Lookup[ v ]
			else
				Copy[ i ] = Qrex.Copy( v, Index, Lookup )
			end
		end
	end

	return Copy
end

local __G = IdiotBox.Copy( _G )
IdiotBox.__G = __G

IdiotBox.Environment = setmetatable( {
	Qrex = Qrex,
	_G = _G,
	__G = __G
}, {
	__index = __G
} )