
SMODS.Joker{ --photolarp
    key = "photolarp",
    config = {
        extra = {
            xchips0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'photolarp',
        ['text'] = {
            [1] = 'Gives {C:blue}2X Chips{} for the last scored {C:attention}NON-face{} card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["kulikosr_kulikosr_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card == context.scoring_hand[#context.scoring_hand] and not (context.other_card:is_face())) then
                return {
                    x_chips = 2
                }
            end
        end
    end
}