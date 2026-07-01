
SMODS.Joker{ --Zoom in
    key = "zoomin",
    config = {
        extra = {
            xchips0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Zoom in',
        ['text'] = {
            [1] = 'first scored {C:purple}???{} card also gives{C:blue} 3x Chips{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["kulikosr_kulikosr_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (SMODS.get_enhancements(context.other_card)["m_kulikosr_booster_6j7elv"] == true and context.other_card == context.scoring_hand[1]) then
                return {
                    x_chips = 3
                }
            end
        end
    end
}