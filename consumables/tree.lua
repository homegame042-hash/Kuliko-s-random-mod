
SMODS.Consumable {
    key = 'tree',
    set = 'seed_cards',
    pos = { x = 6, y = 0 },
    config = { 
        extra = {
            odds = 4   
        } 
    },
    loc_txt = {
        name = 'Tree',
        text = {
            [1] = 'Enhances up to {C:attention}2{} cards selected cards to a random {C:attention}enhancement{}',
            [2] = 'Have {C:green}#1# in 4{} chance to create an {C:attention}apple{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_kulikosr_tree')
        return {vars = {numerator, denominator}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if (to_big(#G.hand.highlighted) <= to_big(2) and to_big(#G.hand.highlighted) > to_big(0)) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        local cen_pool = {}
                        for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                            if enhancement_center.key ~= 'm_stone' then
                                cen_pool[#cen_pool + 1] = enhancement_center
                            end
                        end
                        local enhancement = pseudorandom_element(cen_pool, 'random_enhance')
                        G.hand.highlighted[i]:set_ability(enhancement)            
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
            if SMODS.pseudorandom_probability(card, 'group_0_736059b2', 1, card.ability.extra.odds, 'j_kulikosr_tree', false) then
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            
                            play_sound('timpani')
                            SMODS.add_card({ set = 'seed_cards', key = 'c_kulikosr_apple'})                            
                            used_card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.6)
                
                if created_consumable then
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                end
                return true
                
            end
        end
    end,
    can_use = function(self, card)
        return ((to_big(#G.hand.highlighted) <= to_big(2) and to_big(#G.hand.highlighted) > to_big(0)))
    end
}