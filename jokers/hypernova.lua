
SMODS.Joker{ --hypernova
    key = "hypernova",
    config = {
        extra = {
            mostrecenthandlevel = 0
        }
    },
    loc_txt = {
        ['name'] = 'hypernova',
        ['text'] = {
            [1] = '{C:hearts}Multiplies{} your {C:hearts}Mult{} based on the level',
            [2] = 'of poker hand that you played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
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
    pools = { ["kulikosr_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {((G.GAME.last_hand_played and G.GAME.hands[G.GAME.last_hand_played] and G.GAME.hands[G.GAME.last_hand_played].level or 0) or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = (G.GAME.last_hand_played and G.GAME.hands[G.GAME.last_hand_played] and G.GAME.hands[G.GAME.last_hand_played].level or 0)
            }
        end
    end
}