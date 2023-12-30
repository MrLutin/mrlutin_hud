local function healPlayer(source, target)
    local player = Ox.GetPlayer(target)

    if not player then
        if source == 0 then
            print('Player not found!')
        else
            lib.notify(source, {
                type = 'error',
                description = "Player not found!",
            })
        end
        return
    end

    player.setStatus('hunger', 0)
    player.setStatus('thirst', 0)
    player.setStatus('stress', 0)
    player.setStatus('drunk', 0)
end

lib.addCommand('heal', {
    help = 'Restore player health and statuses',
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'Target player\'s server id', },
        {
            name = 'armour',
            type = 'number',
            help = 'How much armour to give the player',
            optional = true,
        }
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    healPlayer(source, args.target)
end)