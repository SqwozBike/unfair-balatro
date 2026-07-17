SMODS.Joker {
    key = "jokertest",
    atlas = "jokertest",
    -- atlas = "key", -- here you can use the atlas created above, if you have one
    pos = { x = 0, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 6,
    discovered = true,
    config = {extra = {mult = 67}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
    local nine_tally = 0
    if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == 7 then nine_tally = nine_tally + 1 end
            end
        end
    if context.joker_main and nine_tally == 6 then
        return {
            mult = card.ability.extra.mult
        }
    end
end
}