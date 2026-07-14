SMODS.Joker {
    key = "jokertest",
    atlas = "jokertest",
    -- atlas = "key", -- here you can use the atlas created above, if you have one
    pos = { x = 0, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 5,
    discovered = true,
    --[[
        Note: Unlike some vanilla Jokers that put values in card.ability, these examples will use card.ability.extra as it's best practice for modded Jokers, since card.ability is used for a lot of other values that might be accindentally written over.
    ]]
    config = {extra = {mult = 10, change = 5}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.change } }
    end,
    calculate = function(self, card, context)
    -- Check if we have played a Flush before we do any scoring and increment the mult
    if context.before and next(context.poker_hands['Flush']) then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.change
        return {
            message = 'retarded!',
            colour = G.C.RED
        }    
    end
    -- Add the mult in main scoring context
    if context.joker_main then
        return {
            mult = card.ability.extra.mult
        }
    end
end
}