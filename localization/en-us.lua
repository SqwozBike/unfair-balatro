return {
    descriptions = {
        -- this key should match the set ("object type") of your object,
        -- e.g. Voucher, Tarot, or the key of a modded consumable type
        Joker = {
            -- this should be the full key of your object, including any prefixes
            j_unfb_jokertest = {
                name = 'Six Seven',
                text = {
                    'if you have exactly six sevens',
                    'in your deck gain {C:mult}+#1#{} mult',
                    'every played hand',
                },
                -- only needed when this object is locked by default,
            },
        },
    },
}