modifier_stolen_intelligence = class({})

--------------------------------------------------------------------------------

function modifier_stolen_intelligence:OnCreated( kv )
	self.flesh_heap_magic_resist = self:GetAbility():GetSpecialValueFor( "flesh_heap_magic_resist" )
	self.flesh_heap_strength_buff_amount = self:GetAbility():GetSpecialValueFor( "flesh_heap_strength_buff_amount" )
	if IsServer() then
		self:SetStackCount( self:GetAbility():GetFleshHeapKills() )
		self:GetParent():CalculateStatBonus()
	end
end

--------------------------------------------------------------------------------

function modifier_stolen_intelligence:OnRefresh( kv )
	self.flesh_heap_magic_resist = self:GetAbility():GetSpecialValueFor( "flesh_heap_magic_resist" )
	self.flesh_heap_strength_buff_amount = self:GetAbility():GetSpecialValueFor( "flesh_heap_strength_buff_amount" )
	if IsServer() then
		self:GetParent():CalculateStatBonus()
	end
end

--------------------------------------------------------------------------------

function modifier_stolen_intelligence:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS
	}

	return funcs
end

--------------------------------------------------------------------------------

function modifier_stolen_intelligence:GetModifierMagicalResistanceBonus( params )
	return self.flesh_heap_magic_resist
end

--------------------------------------------------------------------------------

function modifier_stolen_intelligence:GetModifierBonusStats_Intellect( params )
	return self:GetStackCount() * self.flesh_heap_strength_buff_amount
end

--------------------------------------------------------------------------------