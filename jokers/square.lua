
SMODS.Joker{ --Square
    key = "square",
    config = {
        extra = {
            dollars0 = 5,
            dollars = 3
        }
    },
    loc_txt = {
        ['name'] = 'Square',
        ['text'] = {
            [1] = 'Every {C:red}discard{} used subtract {C:money}5${}',
            [2] = '{C:hearts}BUT{}',
            [3] = 'Every {C:blue}hand{} played gives {C:money}3${}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
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
        if context.pre_discard  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars - 5
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(5), colour = G.C.MONEY})
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 3
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}