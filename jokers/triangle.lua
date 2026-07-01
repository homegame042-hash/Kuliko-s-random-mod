
SMODS.Joker{ --Triangle
    key = "triangle",
    config = {
        extra = {
            odds = 35
        }
    },
    loc_txt = {
        ['name'] = 'Triangle',
        ['text'] = {
        [1] = 'Each rerrol have a {C:green}#1# in 35 chance{} to force {C:hearts}game over{} :)',
        [2] = '{C:rare}BUT{}',
        [3] = '{C:hearts}Hearst{} = {C:spades}Spades{}',
        [4] = '{C:diamonds}Diamonds{} = {C:clubs}Clubs{}'
    },
    ['unlock'] = {
        [1] = 'Unlocked by default.'
    }
},
pos = {
    x = 3,
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

loc_vars = function(self, info_queue, card)
    
    local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_kulikosr_triangle') 
    return {vars = {new_numerator, new_denominator}}
end,

calculate = function(self, card, context)
    if context.reroll_shop  then
        if true then
            if SMODS.pseudorandom_probability(card, 'group_0_b63b3474', 1, card.ability.extra.odds, 'j_kulikosr_triangle', false) then
                SMODS.calculate_effect({func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "LOL", colour = G.C.RED})
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.5,
                        func = function()
                            if G.STAGE == G.STAGES.RUN then 
                                G.STATE = G.STATES.GAME_OVER
                                G.STATE_COMPLETE = false
                            end
                        end
                    }))
                    
                    return true
                end}, card)
            end
        end
    end
end,

add_to_deck = function(self, card, from_debuff)
    -- Combine suits effect enabled
    -- Combine suits effect enabled
end,

remove_from_deck = function(self, card, from_debuff)
    -- Combine suits effect disabled
    -- Combine suits effect disabled
end
}


local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    local ret = card_is_suit_ref(self, suit, bypass_debuff, flush_calc)
    if not ret and not SMODS.has_no_suit(self) then
        if next(SMODS.find_card("j_kulikosr_triangle")) then
            -- If checking for Spades and card is Hearts, return true
            if suit == "Spades" and self.base.suit == "Hearts" then
                ret = true
            end
            -- If checking for Hearts and card is Spades, return true
            if suit == "Hearts" and self.base.suit == "Spades" then
                ret = true
            end
            -- If checking for Diamonds and card is Clubs, return true
            if suit == "Diamonds" and self.base.suit == "Clubs" then
                ret = true
            end
            -- If checking for Clubs and card is Diamonds, return true
            if suit == "Clubs" and self.base.suit == "Diamonds" then
                ret = true
            end
        end
    end
    return ret
end