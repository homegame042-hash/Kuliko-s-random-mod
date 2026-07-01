
SMODS.Joker{ --Trojan
    key = "trojan",
    config = {
        extra = {
            xmult0 = 1.5,
            odds = 10
        }
    },
    loc_txt = {
        ['name'] = 'Trojan',
        ['text'] = {
            [1] = 'Delete {C:attention} Joker{} to the right and with {C:green}#1# in 10 chance{}',
            [2] = 'creates copy of this {C:attention}Joker{} when blind ends.',
            [3] = 'Every odd scored cards gives {C:red}X1.5 Mult{}',
            [4] = '{C:inactive}(Ace, 3, 5, 7, 9){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["kulikosr_kulikosr_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_kulikosr_trojan') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9) then
                return {
                    Xmult = 1.5
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                return {
                    func = function()
                        local my_pos = nil
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i] == card then
                                my_pos = i
                                break
                            end
                        end
                        local target_joker = nil
                        if my_pos and my_pos > 1 then
                            local joker = G.jokers.cards[my_pos - 1]
                            if not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                target_joker = joker
                            end
                        end
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            local my_pos = nil
                            for i = 1, #G.jokers.cards do
                                if G.jokers.cards[i] == card then
                                    my_pos = i
                                    break
                                end
                            end
                            local target_joker = nil
                            if my_pos and my_pos < #G.jokers.cards then
                                local joker = G.jokers.cards[my_pos + 1]
                                if not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                    target_joker = joker
                                end
                            end
                            
                            if target_joker then
                                target_joker.getting_sliced = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                        return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                            end
                            return true
                        end,
                        colour = G.C.RED
                    }
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_c8bb9300', 1, card.ability.extra.odds, 'j_kulikosr_trojan', false) then
                            SMODS.calculate_effect({func = function()
                                
                                local created_joker = false
                                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                    created_joker = true
                                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_kulikosr_trojan' })
                                            if joker_card then
                                                
                                                
                                            end
                                            G.GAME.joker_buffer = 0
                                            return true
                                        end
                                    }))
                                end
                                if created_joker then
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                                end
                                return true
                            end}, card)
                        end
                        return true
                    end
                }
            end
        end
    end
}