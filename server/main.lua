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