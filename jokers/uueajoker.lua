
SMODS.Joker{ --UUEA Joker
    key = "uueajoker",
    config = {
        extra = {
            chips0 = 50,
            odds = 5,
            odds2 = 10,
            odds3 = 200,
            mult0 = 5,
            dollars0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'UUEA Joker',
        ['text'] = {
            [1] = 'When card is scoring gives {C:blue}+50{} Chips',
            [2] = '{C:green}#1# in 5 chance{} to give {C:red}+5{} Mult',
            [3] = '{C:green}#1# in 10 chance{} to give{C:attention} 10${}',
            [4] = '{C:green}#1# in 200 chance{} to change card into a {C:inactive}Steel{} {C:purple}polychrome{} {C:gold}king{} of {C:hearts}Hearts{} with the {C:red}Red seal{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["kulikosr_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_kulikosr_uueajoker')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_kulikosr_uueajoker')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_kulikosr_uueajoker')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                return {
                    chips = 50
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_4337a228', 1, card.ability.extra.odds, 'j_kulikosr_uueajoker', false) then
                            SMODS.calculate_effect({mult = 5}, card)
                        end
                        if SMODS.pseudorandom_probability(card, 'group_1_666d5c93', 1, card.ability.extra.odds2, 'j_kulikosr_uueajoker', false) then
                            SMODS.calculate_effect({
                                func = function()
                                    
                                    local current_dollars = G.GAME.dollars
                                    local target_dollars = G.GAME.dollars + 10
                                    local dollar_value = target_dollars - current_dollars
                                    ease_dollars(dollar_value)
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(10), colour = G.C.MONEY})
                                    return true
                                end}, card)
                            end
                            if SMODS.pseudorandom_probability(card, 'group_2_7d5c3c9b', 1, card.ability.extra.odds3, 'j_kulikosr_uueajoker', false) then
                                local scored_card = context.other_card
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        
                                        assert(SMODS.change_base(scored_card, "Hearts", "King"))
                                        scored_card:set_ability(G.P_CENTERS.m_steel)
                                        scored_card:set_seal("Red", true)
                                        scored_card:set_edition("e_polychrome", true)
                                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                                        return true
                                    end
                                }))
                                
                            end
                            return true
                        end
                    }
                end
            end
        end
    }