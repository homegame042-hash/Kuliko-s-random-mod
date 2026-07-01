
SMODS.Joker{ --Circle
    key = "circle",
    config = {
        extra = {
            chips0 = 50,
            dollars0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Circle',
        ['text'] = {
            [1] = 'if you sell this joker it will give you {C:red}-10${}',
            [2] = '{C:red}BUT{}',
            [3] = 'Give {C:blue}+50{} Chips for every played card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "kulikosr_but",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["kulikosr_kulikosr_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                chips = 50
            }
        end
        if context.selling_self  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars - 10
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(10), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}