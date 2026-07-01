
SMODS.Joker{ --A pan of cringles
    key = "apanofcringles",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'A pan of cringles',
        ['text'] = {
            [1] = 'Swaps {C:blue}Chips{} and {C:red}Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["kulikosr_kulikosr_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                swap = true
            }
        end
    end
}