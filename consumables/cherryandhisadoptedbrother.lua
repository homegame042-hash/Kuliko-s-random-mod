
SMODS.Consumable {
    key = 'cherryandhisadoptedbrother',
    set = 'seed_cards',
    pos = { x = 5, y = 0 },
    config = { 
        extra = {
            dollars0 = 5,
            odds = 4,
            dollars = 10   
        } 
    },
    loc_txt = {
        name = 'Cherry and his adopted brother',
        text = {
            [1] = 'Gives {C:money}5${}{C:red} BUT{} have {C:green}#1# in 4 chance{} to subtract {C:money}5${}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_kulikosr_cherryandhisadoptedbrother')
        return {vars = {numerator, denominator}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars + 5
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(5).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
        if SMODS.pseudorandom_probability(card, 'group_0_31d6b939', 1, card.ability.extra.odds, 'j_kulikosr_cherryandhisadoptedbrother', false) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars - 10
                    local dollar_value = target_dollars - current_dollars
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(10).." $", colour = G.C.RED})
                    ease_dollars(dollar_value, true)
                    return true
                end
            }))
            delay(0.6)
            
        end
    end,
    can_use = function(self, card)
        return true
    end
}