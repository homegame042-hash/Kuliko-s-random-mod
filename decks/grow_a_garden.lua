
SMODS.Back {
    key = 'grow_a_garden',
    pos = { x = 0, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'grow a garden',
        text = {
            [1] = 'Every time you enter the shop you get {C:attention}2{} {C:uncommon}seed cards{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.starting_shop then
            for i = 1, math.min(2, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        play_sound('timpani')
                        SMODS.add_card({ set = 'seed_cards', 
                        })
                        return true
                    end
                }))
            end
        end
    end,
    
}