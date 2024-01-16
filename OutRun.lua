
-- local requiredSpeed = 40

local splashWave = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1193677215276216584/Wolf_and_Raven_-_Tribute_to_OutRun_-_03_Splashwave.mp3'
local magicalSoundShower = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1193696762121162812/Wolf_and_Raven_-_Tribute_to_OutRun_-_01_Magical_Sound_Shower.mp3'
local passingBreeze = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1195154796248838234/Wolf_and_Raven_-_Tribute_to_OutRun_-_02_Passing_Breeze.mp3'
local lastWave = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1195154824417771690/Wolf_and_Raven_-_Tribute_to_OutRun_-_04_Last_Wave.mp3'
local noti = 'http' .. 's://cdn.discordapp.com/attachments/140183723348852736/1000988999877394512/pog_noti_sound.mp3'


local mediaPlayer3 = ui.MediaPlayer()
local mediaPlayer4 = ui.MediaPlayer()
local mediaPlayer5 = ui.MediaPlayer()
local mediaPlayer6 = ui.MediaPlayer()
local mediaPlayer7 = ui.MediaPlayer()

-- function script.prepare(dt)
--     ac.debug('speed', ac.getCarState(1).speedKmh)
--     return ac.getCarState(1).speedKmh > requiredSpeed
-- end

local countDown = 99
local timePassed = 0
-- local speedMessageTimer = 0
local collisionMessageTimer = 0

local totalScore = 0
local comboMeter = 1
local add_amt = 0
local comboColor = 0

-- local dangerouslySlowTimer = 0
local carsState = {}
local wheelsWarningTimeout = 0
local personalBest = 0

local CollisionMessages = { 'BRUTAL!!!!', 'OUCH!!!', 'Watch it!!!', 'WANKER!!!', 'Caution! Student Driver!',
    'Ain\'t no way you were makin that.' }
local CloseMessages = { 'Way to Go! 3x Combo!', 'Close One! 3x Combo!', 'Near Miss! 3x Combo!', 'Wow! 3x Combo!' }

local uiState = ac.getUI()
local uiCustomPos = vec2(uiState.windowSize.x * 0.5 - 1000, 100)
local uiMoveMode = false
local lastUiMoveKeyState = false


local muteToggle = false
local lastMuteKeyState = false
local messageState = false

local musicVol = 0.25
local stored = {}

local checkpoint1 = false
local checkpoint2 = false
local checkpoint3 = false
local checkpoint4 = false
local checkpoint5 = false
local checkpoint6 = false
local checkpoint7 = false
local checkpoint8 = false
local checkpoint9 = false
local checkpoint10 = false

local messages = {}
local glitter = {}
local glitterCount = 0
local numMssgs = 8

local timeBonus = 0
local overtakePts = 1000
local closeOvertakePts = 3000
local collisionOvertakePts = 500

local gameStartPos = 0.02
-- local endReached = false
-- local raceStarted = false

function addMessage(text, mood)
    for i = math.min(#messages + 1, numMssgs), 2, -1 do
        messages[i] = messages[i - 1]
        messages[i].targetPos = i
    end
    messages[1] = { text = text, age = 0, targetPos = 1, currentPos = 1, mood = mood }
    if mood == 1 then
        for i = 1, 60 do
            local dir = vec2(math.random() - 0.5, math.random() - 0.5)
            glitterCount = glitterCount + 1
            glitter[glitterCount] = {
                color = rgbm.new(hsv(math.random() * 360, 1, 1):rgb(), 1),
                pos = vec2(80, 140) + dir * vec2(40, 20),
                velocity = dir:normalize():scale(0.2 + math.random()),
                life = 0.5 + 0.5 * math.random()
            }
        end
    end
end

local function updateMessages(dt)
    comboColor = comboColor + dt * 10 * comboMeter
    if comboColor > 360 then comboColor = comboColor - 360 end
    for i = 1, #messages do
        local m = messages[i]
        m.age = m.age + dt
        m.currentPos = math.applyLag(m.currentPos, m.targetPos, 0.8, dt)
    end
    for i = glitterCount, 1, -1 do
        local g = glitter[i]
        g.pos:add(g.velocity)
        g.velocity.y = g.velocity.y + 0.02
        g.life = g.life - dt
        g.color.mult = math.saturate(g.life * 4)
        if g.life < 0 then
            if i < glitterCount then
                glitter[i] = glitter[glitterCount]
            end
            glitterCount = glitterCount - 1
        end
    end
    if comboMeter > 10 and math.random() > 0.98 then
        for i = 1, math.floor(comboMeter) do
            local dir = vec2(math.random() - 0.5, math.random() - 0.5)
            glitterCount = glitterCount + 1
            glitter[glitterCount] = {
                color = rgbm.new(hsv(math.random() * 360, 1, 1):rgb(), 1),
                pos = vec2(195, 75) + dir * vec2(40, 20),
                velocity = dir:normalize():scale(0.2 + math.random()),
                life = 0.5 + 0.5 * math.random()
            }
        end
    end
end


stored.playerscore = ac.storage('playerscore', personalBest) --default value
personalBest = stored.playerscore:set(0.0)
personalBest = stored.playerscore:get()


local function sendhighscore(connectedCarIndex, connectedSessionID)
    ac.sendChatMessage("has a highscore of " .. personalBest .. " pts.")
end

ac.onClientConnected(sendhighscore)

function script.update(dt)

    local player = ac.getCar(0)
    ac.debug("player pos", player.position)
    ac.debug("spline pos", player.splinePosition)

    local playerPos = player.position
    local playerDir = ac.getCameraForward()
    if ac.isKeyDown(ac.KeyIndex.Delete) and player.speedKmh < 15 then
        physics.setCarPosition(0, playerPos, playerDir)
    end

    if timePassed == 0 then
        addMessage('Let’s go!', 0)
    end

    if player.splinePosition > gameStartPos and countDown > -0.001 and player.splinePosition < 0.999 then
        countDown = countDown - dt
    elseif player.splinePosition > 0.999 then
        countDown = countDown
        -- endReached = true
    else
        countDown = 99
        totalScore = 0
        -- raceStarted = false
        -- endReached = false
        checkpoint1 = false
        checkpoint2 = false
        checkpoint3 = false
        checkpoint4 = false
        checkpoint5 = false
        checkpoint6 = false
        checkpoint7 = false
        checkpoint8 = false
        checkpoint9 = false
        checkpoint10 = false
    end

    if math.ceil(countDown) == 0 then
        totalScore = 0
        -- comboMeter = 1
        countDown = 0
        addMessage('Outta Time! Game Over Man!', -1)
    end

    if countDown > 99 then
        countDown = 99
    end

    -- functionalize this part and add checks for all previous checkpoints to prevent teleporting to checkpoints before previous ones have been crossed
    if player.splinePosition > 0.10 then
        timeBonus = 100 * math.floor(countDown)
        if not checkpoint1 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 1! 9 to go!", 1)
            addMessage(" 100 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            checkpoint1 = true
        end
    end

    if player.splinePosition > 0.20 then
        timeBonus = 200 * math.floor(countDown)
        if not checkpoint2 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 2! 8 to Go!", 1)
            addMessage("200 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            checkpoint2 = true
        end
    end

    if player.splinePosition > 0.30 then
        timeBonus = 300 * math.floor(countDown)
        if not checkpoint3 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 3! 7 to Go!", 1)
            addMessage("300 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            checkpoint3 = true
        end
    end

    if player.splinePosition > 0.40 then
        timeBonus = 400 * math.floor(countDown)
        if not checkpoint4 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 4! 6 to Go!", 1)
            addMessage("400 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            checkpoint4 = true
        end
    end

    if player.splinePosition > 0.50 then
        timeBonus = 500 * math.floor(countDown)
        if not checkpoint5 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 5! 5 to Go!", 1)
            addMessage("500 x TIME BONUS! + " .. timeBonus .. " pts")
            checkpoint5 = true
        end
    end

    if player.splinePosition > 0.60 then
        timeBonus = 600 * math.floor(countDown)
        if not checkpoint6 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 6! 4 to Go!", 1)
            addMessage("600 x TIME BONUS! + " .. timeBonus .. " pts")
            checkpoint6 = true
        end
    end

    if player.splinePosition > 0.70 then
        timeBonus = 700 * math.floor(countDown)
        if not checkpoint7 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 7! 3 to Go!", 1)
            addMessage("700 x TIME BONUS! + " .. timeBonus .. " pts")
            checkpoint7 = true
        end
    end

    if player.splinePosition > 0.80 then
        timeBonus = 800 * math.floor(countDown)
        if not checkpoint8 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 8! 2 to Go!", 1)
            addMessage("800 x TIME BONUS! + " .. timeBonus .. " pts")
            checkpoint8 = true
        end
    end

    if player.splinePosition > 0.90 then
        timeBonus = 900 * math.floor(countDown)
        if not checkpoint9 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 9! 1 to Go!", 1)
            addMessage("900 x TIME BONUS! + " .. timeBonus .. " pts")
            checkpoint9 = true
        end
    end

    if player.splinePosition > 0.99 then
        timeBonus = 1000 * math.floor(countDown)
        if not checkpoint10 then
            -- countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("FINISH!", 1)
            addMessage("1000 x TIME BONUS! + " .. timeBonus .. " pts")
            checkpoint10 = true
        end
    end


    if ac.isKeyDown(ac.KeyIndex.U) and musicVol < 1 then
        musicVol = musicVol + 0.01
    end

    if ac.isKeyDown(ac.KeyIndex.D) and musicVol > 0 then
        musicVol = musicVol - 0.01
    end

    mediaPlayer4:setSource(magicalSoundShower):setAutoPlay(false)
    mediaPlayer4:setVolume(musicVol)

    mediaPlayer5:setSource(passingBreeze):setAutoPlay(false)
    mediaPlayer5:setVolume(musicVol)

    mediaPlayer6:setSource(splashWave):setAutoPlay(false)
    mediaPlayer6:setVolume(musicVol)

    mediaPlayer7:setSource(lastWave):setAutoPlay(false)
    mediaPlayer7:setVolume(musicVol)

    if timePassed > 5 and timePassed < 6 then
        mediaPlayer4:play()
    end

    if mediaPlayer4:currentTime() > math.round(mediaPlayer4:duration(), 2) then
        mediaPlayer4:pause():setCurrentTime(0.00)
        mediaPlayer5:play()
    end

    if mediaPlayer5:currentTime() > math.round(mediaPlayer5:duration(), 2) then
        mediaPlayer5:pause():setCurrentTime(0.00)
        mediaPlayer6:play()
    end

    if mediaPlayer6:currentTime() > math.round(mediaPlayer6:duration(), 2) then
        mediaPlayer6:pause():setCurrentTime(0.00)
        mediaPlayer7:play()
    end

    if mediaPlayer7:currentTime() > math.round(mediaPlayer7:duration(),2) then
        mediaPlayer7:pause():setCurrentTime(0.00)
        mediaPlayer4:play()
    end


    local uiMoveKeyState = ac.isKeyDown(ac.KeyIndex.B)
    if uiMoveKeyState and lastUiMoveKeyState ~= uiMoveKeyState then
        uiMoveMode = not uiMoveMode
        lastUiMoveKeyState = uiMoveKeyState
        if messageState then
            addMessage('UI Move mode Disabled', -1)
            messageState = false
        else
            addMessage('UI Move mode Enabled', -1)
            messageState = true
        end


    elseif not uiMoveKeyState then
        lastUiMoveKeyState = false
    end

    if ui.mouseClicked(ui.MouseButton.Left) then
        if uiMoveMode then
            uiCustomPos = ui.mousePos()
        end
    end

    local muteKeyState = ac.isKeyDown(ac.KeyIndex.M)
    if muteKeyState and lastMuteKeyState ~= muteKeyState then
        muteToggle = not muteToggle
        if messageState then
            addMessage('Sounds off', -1)
            messageState = false
        else
            addMessage('Sounds on', -1)
            messageState = true
        end

        lastMuteKeyState = muteKeyState
    elseif not muteKeyState then
        lastMuteKeyState = false

    end
    

    if timePassed == 0 then
        addMessage(ac.getCarName(0), 0)
        addMessage('CTRL + D to toggle UI', -1)
        addMessage('M to toggle sound fx', -1)
        addMessage('Delete to re-orient car', -1)
        addMessage('B to toggle UI move mode', -1)
        addMessage('U and D to increase/decrease music volume', -1)
        addMessage('Based on Overtake by Ilja, Modded by Boon and Rusty', 2)
    end


    timePassed = timePassed + dt
    -- speedMessageTimer = speedMessageTimer + dt
    collisionMessageTimer = collisionMessageTimer + dt

    -- local comboFadingRate = 0.1 * math.lerp(1, 0.1, math.lerpInvSat(player.speedKmh, 45, 160)) + player.wheelsOutside / 4
    -- comboMeter = math.max(1, comboMeter - dt * comboFadingRate)

    local sim = ac.getSim()
    while sim.carsCount > #carsState do
        carsState[#carsState + 1] = {}
    end

    if wheelsWarningTimeout > 0 then
        wheelsWarningTimeout = wheelsWarningTimeout - dt
    elseif player.wheelsOutside > 0 then
        if wheelsWarningTimeout == 0 then
        end
        addMessage('Get back on the road!', -1)
        wheelsWarningTimeout = 15
    end

    local scoreRisingRate = 100 * math.lerp(0, 1, math.lerpInvSat(player.speedKmh, 0, 260))
    if player.wheelsOutside < 1 and player.splinePosition > gameStartPos then
        totalScore = totalScore + dt * scoreRisingRate
    end

    -- ac.debug(" player", player.collidedWith)
    for i = 1, ac.getSim().carsCount do
        local car = ac.getCarState(i) --or error()
        local state = carsState[i]
        -- ac.debug(" car " .. i-1, car.collidedWith)

        if car.position:closerToThan(player.position, 7) then
            local drivingAlong = math.dot(car.look, player.look) > 0.2
            if not drivingAlong then
                state.drivingAlong = false

                if not state.nearMiss and car.position:closerToThan(player.position, 3) then
                    state.nearMiss = true


                end
            end

            if player.collidedWith == 0 then
                if collisionMessageTimer > 5 then
                    -- comboMeter = comboMeter / 2.0
                    addMessage(CollisionMessages[math.random(1, #CollisionMessages)], -1)
                    collisionMessageTimer = 0
                end    
            end

            if not state.overtaken and not state.collided and state.drivingAlong then
                local posDir = (car.position - player.position):normalize()
                local posDot = math.dot(posDir, car.look)
                state.maxPosDot = math.max(state.maxPosDot, posDot)
                if posDot < -0.5 and state.maxPosDot > 0.5 then
                    -- add_amt = math.ceil(10 * comboMeter)
                    if player.collidedWith == 0 then
                        totalScore = totalScore + collisionOvertakePts
                        addMessage('Overtake 0.5x: + ' .. collisionOvertakePts .. ' pts', 2)
                    elseif car.position:closerToThan(player.position, 3) then
                        totalScore = totalScore + closeOvertakePts
                        addMessage(CloseMessages[math.random(#CloseMessages)], 1)
                    else
                        totalScore = totalScore + overtakePts
                        addMessage('Overtake 1x: + ' .. overtakePts .. ' pts', 0)
                    end
                    -- totalScore = totalScore + overtakePts
                    -- comboMeter = comboMeter + 1
                    -- comboColor = comboColor + 90
                    if muteToggle then
                        mediaPlayer3:setSource(noti)
                        mediaPlayer3:setVolume(1)
                        mediaPlayer3:play()
                    else
                        mediaPlayer3:setSource(noti)
                        mediaPlayer3:setVolume(0)
                        mediaPlayer3:pause()
                    end

                   
                    state.overtaken = true

                    -- if car.position:closerToThan(player.position, 3) and not player.collidedWith == 0 then
                    --     totalScore = totalScore + closeOvertakePts
                    --     -- comboMeter = comboMeter + 3
                    --     -- comboColor = comboColor + math.random(1, 90)
                    --     -- comboColor = comboColor + 90
                    --     if muteToggle then
                    --         mediaPlayer3:setSource(noti)
                    --         mediaPlayer3:setVolume(1)
                    --         mediaPlayer3:play()
                    --     else
                    --         mediaPlayer3:setSource(noti)
                    --         mediaPlayer3:setVolume(0)
                    --         mediaPlayer3:pause()
                    --     end

                    --     addMessage(CloseMessages[math.random(#CloseMessages)], 1)
                    -- end
                end
            end
        else
            state.maxPosDot = -1
            state.overtaken = false
            state.collided = false
            state.drivingAlong = true
            state.nearMiss = false
        end
    end    
end


local UIToggle = true
local LastKeyState = false

function script.drawUI()
    local keyState = ac.isKeyDown(ac.KeyIndex.Control) and ac.isKeyDown(ac.KeyIndex.D)
    if keyState and LastKeyState ~= keyState then
        UIToggle = not UIToggle
        LastKeyState = keyState
    elseif not keyState then
        LastKeyState = false
    end


    if UIToggle then
        local uiState = ac.getUI()
        updateMessages(uiState.dt)

        -- local colorCombo = rgbm.new(hsv(comboColor, math.saturate(comboMeter / 10), 1):rgb(),
        --     math.saturate(comboMeter / 4))

        ui.beginTransparentWindow('overtakeScore', uiCustomPos, vec2(1400, 1400), true)
        ui.beginOutline()

        ui.pushFont(ui.Font.Title)
        ui.text('Cruisin\' AC: Outrun Edition')

        -- ui.pushFont(ui.Font.Huge)
        -- ui.text('High Score: ' .. personalBest .. ' pts')
        -- ui.popFont()

        ui.pushFont(ui.Font.Huge)
        ui.text(math.ceil(totalScore) .. ' pts')

        -- ui.beginRotation()
        -- ui.textColored(math.ceil(comboMeter * 10) / 10 .. 'x', colorCombo)

        -- if comboMeter > 20 then
        --     ui.endRotation(math.sin(comboMeter / 180 * 3141.5) * 3 * math.lerpInvSat(comboMeter, 20, 30) + 90)
        -- end
        -- if comboMeter > 50 then
        -- -- if comboMeter > 20 then
        --     ui.endRotation(math.sin(comboMeter / 220 * 3141.5) * 3 * math.lerpInvSat(comboMeter, 20, 30) + 90)
        -- end
        -- if comboMeter > 100 then
        -- -- if comboMeter > 30 then
        --     ui.endRotation(math.sin(comboMeter / 260 * 3141.5) * 3 * math.lerpInvSat(comboMeter, 20, 30) + 90)
        -- end
        -- if comboMeter > 250 then
        -- -- if comboMeter > 40 then
        --     ui.endRotation(math.sin(comboMeter / 360 * 3141.5) * 3 * math.lerpInvSat(comboMeter, 20, 30) + 90)
        -- end

        ui.popFont()
        ui.endOutline(rgbm(0, 0, 0, 0.3))

        ui.offsetCursorY(20)
        ui.pushFont(ui.Font.Title)
        local startPos = ui.getCursor()
        for i = 1, #messages do
            local m = messages[i]
            local f = math.saturate(numMssgs - m.currentPos) * math.saturate(8 - m.age)
            ui.setCursor(startPos + vec2(20 + math.saturate(1 - m.age * 10) ^ 2 * 100, (m.currentPos - 1) * 30))
            ui.textColored(m.text, m.mood == 1 and rgbm(0, 1, 0, f)
                or m.mood == -1 and rgbm(1, 0, 0, f) or m.mood == 2 and rgbm(100, 84, 0, f) or rgbm(1, 1, 1, f))
        end
        for i = 1, glitterCount do
            local g = glitter[i]
            if g ~= nil then
                ui.drawLine(g.pos, g.pos + g.velocity * 4, g.color, 2)
            end
        end
        ui.popFont()
        ui.setCursor(startPos + vec2(0, 4 * 30))

        ui.endTransparentWindow()

        ui.beginTransparentWindow("countDownTimer", vec2(uiState.windowSize.x * 0.5, 100), vec2(1400, 1400), false)
        ui.beginOutline()
        ui.pushFont(ui.Font.Huge)
        ui.text("Time")
        ui.pushFont(ui.Font.Huge)
        ui.text(math.ceil(countDown).. "")
        ui.popFont()

        ui.endTransparentWindow()

        if checkpoint1 then
            ui.beginTransparentWindow("checkpoint window", vec2(uiState.windowSize.x * 0.))
        end
        

    end
end



