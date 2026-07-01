
SMODS.Joker{ --jokr
    key = "jokr",
    config = {
        extra = {
            xchips0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'jokr',
        ['text'] = {
            [1] = 'if Played hand is a high card',
            [2] = 'each scoring card gives you {C:blue}1.5x {}{C:blue}Chips{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["kulikosr_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.scoring_name == "High Card" then
                return {
                    x_chips = 1.5
                }
            end
        end
    end
}