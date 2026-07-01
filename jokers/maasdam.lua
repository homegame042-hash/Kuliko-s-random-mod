
SMODS.Joker{ --maasdam
    key = "maasdam",
    config = {
        extra = {
            freejokerslots = 0
        }
    },
    loc_txt = {
        ['name'] = 'maasdam',
        ['text'] = {
            [1] = 'Gives {C:gold}5${}{} at the end of the round for each empty {C:diamonds}joker{} slot.',
            [2] = '{C:inactive}(Currently {C:gold}#1#${}{}){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
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
    pools = { ["kulikosr_maasdam"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {(((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and (G.jokers and G.jokers.cards or {}) or {}))) * 5}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + (((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {}))) * 5
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "maasdam gives you #1#$", colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}