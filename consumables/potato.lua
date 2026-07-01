
SMODS.Consumable {
    key = 'potato',
    set = 'seed_cards',
    pos = { x = 4, y = 0 },
    config = { 
        extra = {
            odds = 4   
        } 
    },
    loc_txt = {
        name = 'Potato',
        text = {
            [1] = 'Have {C:green}#1# in 4 chance{} to {C:red}destroy{} up to 4 selected cards'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_kulikosr_potato')
        return {vars = {numerator, denominator}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if to_big(#G.hand.highlighted) <= to_big(4) then
            if SMODS.pseudorandom_probability(card, 'group_0_56ac0eaf', 1, card.ability.extra.odds, 'j_kulikosr_potato', false) then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('tarot1')
                        used_card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        SMODS.destroy_cards(G.hand.highlighted)
                        return true
                    end
                }))
                delay(0.3)
                
            end
        end
    end,
    can_use = function(self, card)
        return (to_big(#G.hand.highlighted) <= to_big(4))
    end
}