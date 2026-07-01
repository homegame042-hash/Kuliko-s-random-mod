
SMODS.Joker{ --Oops! All 7s
    key = "oopsall7s",
    config = {
        extra = {
            mod_probability0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Oops! All 7s',
        ['text'] = {
            [1] = 'Triples all {C:attention}listed{} {C:green}probabilities{}',
            [2] = '(ex: {C:green}1 in 4{} -> {C:green}3 in 4{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["kulikosr_kulikosr_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.mod_probability  then
            local numerator, denominator = context.numerator, context.denominator
            numerator = numerator * (3)
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}