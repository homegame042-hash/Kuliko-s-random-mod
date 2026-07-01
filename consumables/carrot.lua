
SMODS.Consumable {
    key = 'carrot',
    set = 'seed_cards',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            hands0 = 1,
            discards0 = 1   
        } 
    },
    loc_txt = {
        name = 'Carrot',
        text = {
            [1] = 'gives 1{C:hearts} discard{} and 1 {C:blue}hand{} for this round'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hands", colour = G.C.GREEN})
                
                G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Discards", colour = G.C.GREEN})
                
                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 1
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}