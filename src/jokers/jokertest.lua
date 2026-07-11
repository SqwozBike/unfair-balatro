-- Ride the Bus
SMODS.Joker {
    key = "jokertest",
    atlas = "jokertest",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 6,
    pos = { x = 0, y = 0 },
    config = { extra = { mult_gain = 1, mult = 0, max_mult = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context, joker)
        if context.before and not context.blueprint then
            local faces = false
            for _, playing_card in ipairs(context.scoring_hand) do
                if playing_card:is_face() then
                    faces = true
                    break
                end
            end
            if faces then
                local last_mult = card.ability.extra.mult
                card.ability.extra.mult = 0
                if last_mult > 0 then
                    return {
                        message = localize('k_reset')
                    }
                end
            else
                -- See note about SMODS Scaling Manipulation on the wiki
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                for _, area in ipairs(G.Joker) do
                    if area == joker.joker then
                        if max_mult < card.ability.extra.mult then
                            max_mult = card.ability.extra.mult
                        end
                    else
                        max_mult = card.ability.extra.mult
                    end
                end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        
        end
    end
end
}