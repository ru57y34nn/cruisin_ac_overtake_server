
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

local countDown = 99
local timePassed = 0
local totalTimer = 0
local sec10 = 0
local min10 = 0
local min1 = 0
local secondsTime = 0
local minutesTime = 0
local subSeconds = 0

-- local speedMessageTimer = 0
local collisionMessageTimer = 0
local collisionTimer = 0

local totalScore = 0
local comboMeter = 1
-- local comboColor = 0

local carsState = {}
local wheelsWarningTimeout = 0
local personalBest = 0

local CollisionMessages = { 'BRUTAL!!!!', 'OUCH!!!', 'Watch it!!!', 'WANKER!!!', 'OOF!!!', 'Caution! Student Driver!',
    'NOPE!' }
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

local startTimer = 0

local raceBegin = false
local raceEnd = false
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
local gameOverMessage = false

local gameStartPos = 0.02
local checkpt1pos = 0.1
local checkpt2pos = 0.2
local checkpt3pos = 0.3
local checkpt4pos = 0.4
local checkpt5pos = 0.5
local checkpt6pos = 0.6
local checkpt7pos = 0.7
local checkpt8pos = 0.8
local checkpt9pos = 0.9
local finishpos = 0.99

local messages = {}
local glitter = {}
local glitterCount = 0
local numMssgs = 8

local timeBonus = 0
local overtakePts = 1000
local closeOvertakePts = 3000
local collisionOvertakePts = 500


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
    -- comboColor = comboColor + dt * 10 * comboMeter
    -- if comboColor > 360 then comboColor = comboColor - 360 end
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
-- personalBest = stored.playerscore:set(0.0)
personalBest = stored.playerscore:get()


local function sendhighscore(connectedCarIndex, connectedSessionID)
    ac.sendChatMessage("has a highscore of " .. personalBest .. " pts.")
end

ac.onClientConnected(sendhighscore)

function script.update(dt)

    local player = ac.getCarState(1)
    -- this line sets the rate at which the player's score rises, based on player speed
    local scoreRisingRate = 100 * math.lerp(0, 1, math.lerpInvSat(player.speedKmh, 0, 260))
    ac.debug("player pos", player.position)
    ac.debug("spline pos", player.splinePosition)

    -- this will flip your car 180 degrees in case you are stuck if you press delete
    local playerPos = player.position
    local playerDir = ac.getCameraForward()
    if ac.isKeyDown(ac.KeyIndex.Delete) and player.speedKmh < 15 then
        physics.setCarPosition(0, playerPos, playerDir)
    end

    if timePassed == 0 then
        addMessage('Let’s go!', 0)
    end

    if player.splinePosition > gameStartPos then
        raceBegin = true
        if player.splinePosition < 0.999 then
            if countDown > -0.001 then
                countDown = countDown - dt
                totalTimer = totalTimer + dt
                startTimer = 1
                if player.wheelsOutside < 1 then
                    totalScore = totalScore + dt * scoreRisingRate
                end
            else
                countDown = 0
                totalScore = 0
                totalTimer = 0
                -- raceStarted = false
                -- endReached = false
                gameOverMessage = true
                -- gameOverMessage = false
            end
        else
            raceEnd = true
            timeBonus = 1000 * math.floor(countDown)
            if not checkpoint10 then
                -- countDown = 99
                countDown = countDown
                totalScore = totalScore + timeBonus
                addMessage("FINISH!", 1)
                addMessage("1000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
                checkpoint10 = true
            end 
        end
    else
        countDown = 99
        totalScore = 0
        totalTimer = 0
        startTimer = 0
        -- raceStarted = false
        -- endReached = false
        raceBegin = false
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
        gameOverMessage = false
    end

    if math.ceil(countDown) == 0 then
        totalScore = totalScore
        -- comboMeter = 1
        countDown = 0
        totalTimer = totalTimer
        if not gameOverMessage then
            -- addMessage('Outta Time! Game Over Man!', -1)
            gameOverMessage = true
        end
    end

    if countDown > 99 then
        countDown = 99
    end


    secondsTime = totalTimer/60 
    if secondsTime > 1 then
        secondsTime = secondsTime - math.floor(secondsTime)
    end
    secondsTime = secondsTime * 60

    if secondsTime > 10 then
        sec10 = 1
    else
        sec10 = 0
    end

    minutesTime = totalTimer/60
    if minutesTime > 10 then
        min10 = 1
    else
        min10 = 0
    end

    if minutesTime > 1 then
        min1 = 1
    else
        min1 = 0
    end

    subSeconds = totalTimer



    -- functionalize this part and add checks for all previous checkpoints to prevent teleporting to checkpoints before previous ones have been crossed
    if player.splinePosition > checkpt1pos then
        timeBonus = 100 * math.floor(countDown)
        if not checkpoint1 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 1! 9 to go!", 1)
            addMessage(" 100 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            checkpoint1 = true
        end
    end

    if player.splinePosition > checkpt2pos then
        timeBonus = 200 * math.floor(countDown)
        if not checkpoint2 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 2! 8 to Go!", 1)
            addMessage("200 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            checkpoint2 = true
        end
    end

    if player.splinePosition > checkpt3pos then
        timeBonus = 300 * math.floor(countDown)
        if not checkpoint3 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 3! 7 to Go!", 1)
            addMessage("300 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            checkpoint3 = true
        end
    end

    if player.splinePosition > checkpt4pos then
        timeBonus = 400 * math.floor(countDown)
        if not checkpoint4 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 4! 6 to Go!", 1)
            addMessage("400 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            checkpoint4 = true
        end
    end

    if player.splinePosition > checkpt5pos then
        timeBonus = 500 * math.floor(countDown)
        if not checkpoint5 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 5! 5 to Go!", 1)
            addMessage("500 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            checkpoint5 = true
        end
    end

    if player.splinePosition > checkpt6pos then
        timeBonus = 600 * math.floor(countDown)
        if not checkpoint6 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 6! 4 to Go!", 1)
            addMessage("600 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            checkpoint6 = true
        end
    end

    if player.splinePosition > checkpt7pos then
        timeBonus = 700 * math.floor(countDown)
        if not checkpoint7 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 7! 3 to Go!", 1)
            addMessage("700 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            checkpoint7 = true
        end
    end

    if player.splinePosition > checkpt8pos then
        timeBonus = 800 * math.floor(countDown)
        if not checkpoint8 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 8! 2 to Go!", 1)
            addMessage("800 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            checkpoint8 = true
        end
    end

    if player.splinePosition > checkpt9pos then
        timeBonus = 900 * math.floor(countDown)
        if not checkpoint9 then
            countDown = 99
            totalScore = totalScore + timeBonus
            addMessage("CHECKPOINT 9! 1 to Go!", 1)
            addMessage("900 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            checkpoint9 = true
        end
    end

    if player.splinePosition > finishpos then
        timeBonus = 1000 * math.floor(countDown)
        if not checkpoint10 then
            -- countDown = 99
            countDown = countDown
            totalScore = totalScore + timeBonus
            addMessage("FINISH!", 1)
            addMessage("1000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
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
        -- addMessage('Based on Overtake by Ilja, Modded by Boon and Rusty', 2)
    end


    timePassed = timePassed + dt
    -- speedMessageTimer = speedMessageTimer + dt
    collisionMessageTimer = collisionMessageTimer + dt
    collisionTimer = collisionTimer + dt

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
        addMessage('Keep it between the lines buddy!', -1)
        wheelsWarningTimeout = 15
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
                        collisionTimer = 0
                        if collisionTimer < 2.0 then
                            totalScore = totalScore + collisionOvertakePts
                           addMessage('Overtake 0.5x: + ' .. collisionOvertakePts .. ' pts', 2)
                        end
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




local beginraceflag = 0
local checkpt1flag = 0
local checkpt2flag = 0
local checkpt3flag = 0
local checkpt4flag = 0
local checkpt5flag = 0
local checkpt6flag = 0
local checkpt7flag = 0
local checkpt8flag = 0
local checkpt9flag = 0
local finishflag = 0

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

        local requiredSpeed = 100 
        local speedRelative = math.saturate(math.floor(ac.getCarState(1).speedKmh) / requiredSpeed)
        local colorDark = rgbm(0.4, 0.4, 0.4, 1)
        local colorGrey = rgbm(0.7, 0.7, 0.7, 1)
        -- local colorAccent = rgbm(1.0, 0.0, 1.0, 1)   -- rgbm.new(hsv(speedRelative * 120, 1, 1):rgb(), 1)
        local colorAccent = rgbm.new(hsv(speedRelative * 120, 1, 1):rgb(), 1)
        -- local colorCombo = rgbm.new(hsv(comboColor, math.saturate(comboMeter / 10), 1):rgb(),
        --     math.saturate(comboMeter / 4))

        
        local function progressMeter(ref, prevCheckptPos, checkptPos)
            
            local player = ac.getCarState(1)
            local currPos = math.lerp(0, 180, math.lerpInvSat(player.splinePosition, prevCheckptPos, checkptPos))

            ui.drawRectFilled(ref + vec2(0, -4), ref + vec2(180, 5), colorDark, 1)
            ui.drawLine(ref + vec2(0, -4), ref + vec2(0, 4), colorGrey, 1)
            ui.drawLine(ref + vec2(180, -4), ref + vec2(180, 4), colorGrey, 1)

            ui.drawLine(ref + vec2(0, 0), ref + vec2(currPos, 0), colorAccent, 4)
  
        end


        ui.beginTransparentWindow('overtakeScore', uiCustomPos, vec2(1400, 1400), true)
        ui.beginOutline()
        ui.pushFont(ui.Font.Huge)
        ui.text('SCORE')
        -- ui.pushACFont('ddm_digital_odo')
        -- ui.acText("SCORE", vec2(50,50), 0, rgbm(0.5, 0.0, 1.0, 1))
        -- ui.popACFont()

        ui.pushFont(ui.Font.Huge)
        ui.text(math.ceil(totalScore) .. ' pts')
        ui.popFont()
        -- ui.pushACFont('ddm_digital_odo')
        -- ui.acText(math.ceil(totalScore) .. ' pts', vec2(50,50), 2, rgbm(0.75, 0.5, 0.0, 1))
        -- ui.popACFont()

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
        ui.endTransparentWindow()


        ui.beginTransparentWindow('progressWindow', vec2(uiState.windowSize.x * 0.5 + 1000, uiState.windowSize.y * 0.8), vec2(1400, 1400), false)
        ui.beginOutline()

        ui.setCursor(0 + vec2(0, 4 * 30))

        ui.setCursorY(0)

        -- ui.textColored('Keep speed above ' .. requiredSpeed .. ' km/h:', colorAccent)
        if raceBegin and not checkpoint1 then
            progressMeter(ui.getCursor() + vec2(-9, 4), gameStartPos, checkpt1pos) -- starting line and checkpt 1 positions
            ui.pushFont(ui.Font.Huge)
            ui.text('STAGE 1')
            ui.popFont()
        end

        if checkpoint1 and not checkpoint2 then
            progressMeter(ui.getCursor() + vec2(-9, 4), checkpt1pos, checkpt2pos)
            ui.pushFont(ui.Font.Huge)
            ui.text('STAGE 2')
            ui.popFont()
        end

        if checkpoint2 and not checkpoint3 then
            progressMeter(ui.getCursor() + vec2(-9, 4), checkpt2pos, checkpt3pos)
            ui.pushFont(ui.Font.Huge)
            ui.text('STAGE 3')
            ui.popFont()
        end

        if checkpoint3 and not checkpoint4 then
            progressMeter(ui.getCursor() + vec2(-9, 4), checkpt3pos, checkpt4pos)
            ui.pushFont(ui.Font.Huge)
            ui.text('STAGE 4')
            ui.popFont()
        end

        if checkpoint4 and not checkpoint5 then
            progressMeter(ui.getCursor() + vec2(-9, 4), checkpt4pos, checkpt5pos)
            ui.pushFont(ui.Font.Huge)
            ui.text('STAGE 5')
            ui.popFont()
        end

        if checkpoint5 and not checkpoint6 then
            progressMeter(ui.getCursor() + vec2(-9, 4), checkpt5pos, checkpt6pos)
            ui.pushFont(ui.Font.Huge)
            ui.text('STAGE 6')
            ui.popFont()
        end

        if checkpoint6 and not checkpoint7 then
            progressMeter(ui.getCursor() + vec2(-9, 4), checkpt6pos, checkpt7pos)
            ui.pushFont(ui.Font.Huge)
            ui.text('STAGE 7')
            ui.popFont()
        end

        if checkpoint7 and not checkpoint8 then
            progressMeter(ui.getCursor() + vec2(-9, 4), checkpt7pos, checkpt8pos)
            ui.pushFont(ui.Font.Huge)
            ui.text('STAGE 8')
            ui.popFont()
        end

        if checkpoint8 and not checkpoint9 then
            progressMeter(ui.getCursor() + vec2(-9, 4), checkpt8pos, checkpt9pos)
            ui.pushFont(ui.Font.Huge)
            ui.text('STAGE 9')
            ui.popFont()
        end

        if checkpoint9 and not checkpoint10 then
            progressMeter(ui.getCursor() + vec2(-9, 4), checkpt9pos, finishpos)
            ui.pushFont(ui.Font.Huge)
            ui.text('FINAL STAGE')
            ui.popFont()
        end

        ui.popFont()

        ui.endTransparentWindow()


        ui.beginTransparentWindow("countDownTimer", vec2(uiState.windowSize.x * 0.46, uiState.windowSize.y * 0.1), vec2(400, 400), false)
        ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.acText("TIME", vec2(50,50), 0, rgbm(0.75, 0.5, 0.0, 1))
        ui.popACFont()
        ui.endTransparentWindow()

        ui.beginTransparentWindow('countDownTime', vec2(uiState.windowSize.x * 0.46, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        -- ui.pushACFont('fd2_speedo')
        ui.acText(" " .. math.ceil(countDown).. "", vec2(50,50), 2, rgbm(1.0, 1.0, 0.0, 1))
        ui.popACFont()
        ui.endTransparentWindow()



        local checkptflagtime = 0.005
        local player = ac.getCarState(1)
        local beginraceflag = math.applyLag(beginraceflag, player.splinePosition > gameStartPos and player.splinePosition < gameStartPos + checkptflagtime and 1 or 0, 0.1, uiState.dt)
        local checkpt1flag = math.applyLag(checkpt1flag, player.splinePosition > checkpt1pos and player.splinePosition < checkpt1pos + checkptflagtime and 1 or 0, 0.1, uiState.dt)
        local checkpt2flag = math.applyLag(checkpt2flag, player.splinePosition > checkpt2pos and player.splinePosition < checkpt2pos + checkptflagtime and 1 or 0, 0.1, uiState.dt)
        local checkpt3flag = math.applyLag(checkpt3flag, player.splinePosition > checkpt3pos and player.splinePosition < checkpt3pos + checkptflagtime and 1 or 0, 0.1, uiState.dt)
        local checkpt4flag = math.applyLag(checkpt4flag, player.splinePosition > checkpt4pos and player.splinePosition < checkpt4pos + checkptflagtime and 1 or 0, 0.1, uiState.dt)
        local checkpt5flag = math.applyLag(checkpt5flag, player.splinePosition > checkpt5pos and player.splinePosition < checkpt5pos + checkptflagtime and 1 or 0, 0.1, uiState.dt)
        local checkpt6flag = math.applyLag(checkpt6flag, player.splinePosition > checkpt6pos and player.splinePosition < checkpt6pos + checkptflagtime and 1 or 0, 0.1, uiState.dt)
        local checkpt7flag = math.applyLag(checkpt7flag, player.splinePosition > checkpt7pos and player.splinePosition < checkpt7pos + checkptflagtime and 1 or 0, 0.1, uiState.dt)
        local checkpt8flag = math.applyLag(checkpt8flag, player.splinePosition > checkpt8pos and player.splinePosition < checkpt8pos + checkptflagtime and 1 or 0, 0.1, uiState.dt)
        local checkpt9flag = math.applyLag(checkpt9flag, player.splinePosition > checkpt9pos and player.splinePosition < checkpt9pos + checkptflagtime and 1 or 0, 0.1, uiState.dt)
        local finishflag = math.applyLag(finishflag, player.splinePosition > finishpos and player.splinePosition < finishpos + checkptflagtime and 1 or 0, 0.1, uiState.dt)

        local checkpointcolor = rgbm(1.0, 0.0, 1.0, 1)

        -- if player.splinePosition > 0.02 then
        ui.beginTransparentWindow("beginRaceWindow", vec2(uiState.windowSize.x * 0.47, 200), vec2(1000, 1000), false)
        ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, beginraceflag)
        ui.pushFont(ui.Font.Huge)
        ui.textColored('Let\'s Go!', rgbm(1.0, 1.0, 0.1, 1))
        ui.popFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint1Window", vec2(uiState.windowSize.x * 0.45, 150), vec2(1000, 1000), false)
        ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt1flag)
        ui.pushFont(ui.Font.Huge)
        ui.textColored('CHECKPOINT!', checkpointcolor)
        ui.pushFont(ui.Font.Huge)
        ui.text('Extend Play!')
        ui.popFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint2Window", vec2(uiState.windowSize.x * 0.45, 150), vec2(1000, 1000), false)
        ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt2flag)
        ui.pushFont(ui.Font.Huge)
        ui.textColored('CHECKPOINT!', checkpointcolor)
        ui.pushFont(ui.Font.Huge)
        ui.text('Extend Play!')
        ui.popFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint3Window", vec2(uiState.windowSize.x * 0.45, 150), vec2(1000, 1000), false)
        ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt3flag)
        ui.pushFont(ui.Font.Huge)
        ui.textColored('CHECKPOINT!', checkpointcolor)
        ui.pushFont(ui.Font.Huge)
        ui.text('Extend Play!')
        ui.popFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint4Window", vec2(uiState.windowSize.x * 0.45, 150), vec2(1000, 1000), false)
        ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt4flag)
        ui.pushFont(ui.Font.Huge)
        ui.textColored('CHECKPOINT!', checkpointcolor)
        ui.pushFont(ui.Font.Huge)
        ui.text('Extend Play!')
        ui.popFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint5Window", vec2(uiState.windowSize.x * 0.45, 150), vec2(1000, 1000), false)
        ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt5flag)
        ui.pushFont(ui.Font.Huge)
        ui.textColored('CHECKPOINT!', checkpointcolor)
        ui.pushFont(ui.Font.Huge)
        ui.text('Extend Play!')
        ui.popFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint6Window", vec2(uiState.windowSize.x * 0.45, 150), vec2(1000, 1000), false)
        ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt6flag)
        ui.pushFont(ui.Font.Huge)
        ui.textColored('CHECKPOINT!', checkpointcolor)
        ui.pushFont(ui.Font.Huge)
        ui.text('Extend Play!')
        ui.popFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint7Window", vec2(uiState.windowSize.x * 0.45, 150), vec2(1000, 1000), false)
        ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt7flag)
        ui.pushFont(ui.Font.Huge)
        ui.textColored('CHECKPOINT!', checkpointcolor)
        ui.pushFont(ui.Font.Huge)
        ui.text('Extend Play!')
        ui.popFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint8Window", vec2(uiState.windowSize.x * 0.45, 150), vec2(1000, 1000), false)
        ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt8flag)
        ui.pushFont(ui.Font.Huge)
        ui.textColored('CHECKPOINT!', checkpointcolor)
        ui.pushFont(ui.Font.Huge)
        ui.text('Extend Play!')
        ui.popFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint9Window", vec2(uiState.windowSize.x * 0.45, 150), vec2(1000, 1000), false)
        ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt9flag)
        ui.pushFont(ui.Font.Huge)
        ui.textColored('CHECKPOINT!', checkpointcolor)
        ui.pushFont(ui.Font.Huge)
        ui.text('Extend Play!')
        ui.popFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("beginRaceWindow", vec2(uiState.windowSize.x * 0.45, 150), vec2(1000, 1000), false)
        ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, finishflag)
        ui.pushFont(ui.Font.Huge)
        ui.textColored('Finish! You made it!', checkpointcolor)
        ui.popFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("gameOverWindow", vec2(uiState.windowSize.x * 0.45, 250), vec2(1000, 1000), false)
        ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, gameOverMessage)
        ui.pushFont(ui.Font.Huge)
        ui.textColored('Outta Time! Game Over Man!', rgbm(1.0, 0, 0, 1))
        ui.popFont()
        ui.popStyleVar()
        ui.endTransparentWindow() 


        ui.beginTransparentWindow("totalTimeWindow", vec2(uiState.windowSize.x * 0.68, uiState.windowSize.y * 0.1), vec2(800, 400), false)
        ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.acText("TOTAL TIME", vec2(50,50), 0, rgbm(0.1, 0.3, 1.0, 1))
        ui.popACFont()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("totalSecondsWindow", vec2(uiState.windowSize.x * 0.72, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-sec10)
        ui.acText("0", vec2(50,50), 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("totalSecondsWindow", vec2(uiState.windowSize.x * 0.72 , uiState.windowSize.y * 0.15), vec2(400, 400), false)
        ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-startTimer)
        ui.acText("0:", vec2(50,50), 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        if secondsTime > 10 then
            ui.beginTransparentWindow("totalSeconsWindow", vec2(uiState.windowSize.x * 0.72, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        else
            ui.beginTransparentWindow("totalSeconsWindow", vec2(uiState.windowSize.x * 0.73, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        end
        ui.pushStyleVar(ui.StyleVar.Alpha, startTimer)
        ui.pushACFont('ddm_digital_odo')
        -- ui.pushACFont('fd2_speedo')
        -- ui.acText("".. math.floor(countUp10sSecs).. "", vec2(50,50), 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText("".. math.floor(secondsTime).. ":", vec2(50,50), 0, rgbm(0.2, 1.0, 0.2, 1))
        -- ui.acText
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("totalMinutesWindow", vec2(uiState.windowSize.x * 0.69, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-min10)
        ui.acText("0", vec2(50,50), 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("totalMinutesWindow", vec2(uiState.windowSize.x * 0.69, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-min1)
        ui.acText("0:", vec2(50,50), 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        if minutesTime > 10 then
            ui.beginTransparentWindow("totalMinutesWindow", vec2(uiState.windowSize.x * 0.66, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        else
            ui.beginTransparentWindow("totalMinutesWindow", vec2(uiState.windowSize.x * 0.67, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        end
        ui.pushStyleVar(ui.StyleVar.Alpha, min1)
        ui.pushACFont('ddm_digital_odo')
        -- ui.pushACFont('fd2_speedo')
        -- ui.acText("".. math.floor(countUp10sSecs).. "", vec2(50,50), 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText("".. math.floor(minutesTime).. ":", vec2(50,50), 0, rgbm(0.2, 1.0, 0.2, 1))
        -- ui.acText
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("totalSubsecondsWindow", vec2(uiState.windowSize.x * 0.75, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-startTimer)
        ui.acText("00", vec2(50,50), 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()



        ui.beginTransparentWindow("totalSubsecondsWindow", vec2(uiState.windowSize.x * 0.73, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, startTimer)
        -- ui.acText("".. math.floor(subSeconds).. "", vec2(50,50), 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText(string.sub("".. math.round(subSeconds, 2).. "", -2, -1), vec2(50,50), 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()




    end
end



