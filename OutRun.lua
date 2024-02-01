
local splashWave = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1193677215276216584/Wolf_and_Raven_-_Tribute_to_OutRun_-_03_Splashwave.mp3'
local magicalSoundShower = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1193696762121162812/Wolf_and_Raven_-_Tribute_to_OutRun_-_01_Magical_Sound_Shower.mp3'
local passingBreeze = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1195154796248838234/Wolf_and_Raven_-_Tribute_to_OutRun_-_02_Passing_Breeze.mp3'
local lastWave = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1195154824417771690/Wolf_and_Raven_-_Tribute_to_OutRun_-_04_Last_Wave.mp3'
local checkpoint = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1200650001995542548/checkpoint_-voice_sample.mp3'

local noti = 'http' .. 's://cdn.discordapp.com/attachments/140183723348852736/1000988999877394512/pog_noti_sound.mp3'
local wilhelmScream = 'http' .. 's://ia902801.us.archive.org/5/items/wilhelmscreamremastered/Wilhelm%20Scream%20Remastered.mp3'

local musicTimer = 0

local song1name = "Splash Wave"
local song2name = "Magical Sound Shower"
local song3name = "Passing Breeze"
local song4name = "Last Wave"

local mediaPlayer2 = ui.MediaPlayer()
local mediaPlayer3 = ui.MediaPlayer()
local mediaPlayer4 = ui.MediaPlayer()
local mediaPlayer5 = ui.MediaPlayer()
local mediaPlayer6 = ui.MediaPlayer()
local mediaPlayer7 = ui.MediaPlayer()
local mediaPlayer8 = ui.MediaPlayer()

local countDown = 90
local countDownTime = 90
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
local finalScore = 0
local comboMeter = 1
-- local comboColor = 0

local carsState = {}
local wheelsWarningTimeout = 0
local personalBest = 0

local offRoadMessages = { 'KEEP IT BETWEEN THE LINES, BUDDY!', 'GET BACK ON THE ROAD!', 'HEY, YOU ARE BREAKING THE CAR!' }
local CollisionMessages = { 'D\'Oh!', 'BRUTAL!!!!', 'OUCH!!!', 'WATCH IT!!!', 'WANKER!!!', 'OOF!!!', 'CAUTION! STUDENT DRIVER!','NOPE!' }
local CloseMessages = { 'CLOSE ONE! 5x: + 50000 pts!', 'NEAR MISS! 5x: + 50000 pts!', 'SOOO CLOSE! 5x + 50000 pts!', 'WHOA! 5x + 50000 pts!' }

local uiState = ac.getUI()
-- local uiCustomPos = vec2(uiState.windowSize.x * 0.5 - 1000, 100)
local uiMoveMode = false
local lastUiMoveKeyState = false


local muteToggle = true
local lastMuteKeyState = true
local messageState = false

local musicVol = 0.25
local stored = {}

local startTimer = 0
local gameOverMessage = 0

local raceBegin = false
-- local raceEnd = false
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

local gameStartPos = 0.0196
local checkpt1pos = 0.12
local checkpt2pos = 0.235
local checkpt3pos = 0.33
local checkpt4pos = 0.415
local checkpt5pos = 0.51
local checkpt6pos = 0.61
local checkpt7pos = 0.695
local checkpt8pos = 0.775
local checkpt9pos = 0.88
local finishpos = 0.9901

local messages = {}
local glitter = {}
local glitterCount = 0
local numMssgs = 6

local timeBonus = 0
local overtakePts = 10000
local closeOvertakePts = 50000
local collisionOvertakePts = 2500

local highScoreChatMsgSent = false
local connectedHighScoreMsgSent = false

local screen_ratio = uiState.windowSize.x / uiState.windowSize.y

local lastPlayedSong = 1
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
personalBest = stored.playerscore:set(0.0)
personalBest = stored.playerscore:get()


local function sendhighscore(connectedCarIndex, connectedSessionID)
    ac.sendChatMessage("has a current highscore of " .. personalBest .. " pts.")
end

if not connectedHighScoreMsgSent then
    ac.onClientConnected(sendhighscore)
    connectedHighScoreMsgSent = true
end

ac.debug("connected car index", connectedCarIndex)
ac.debug("connected session id", connectedSessionID)
ac.debug("hi score msg sent", highScoreChatMsgSent)
ac.debug("connected msg sent", connectedHighScoreMsgSent)

function script.update(dt)

    local player = ac.getCarState(1)
    -- this line sets the rate at which the player's score rises, based on player speed
    local scoreRisingRate = 10 * (math.lerp(0, 10, math.lerpInvSat(player.speedKmh, 0, 260))) * math.lerp(0, 10, math.lerpInvSat(player.speedKmh, 0, 260))
    ac.debug("player pos", player.position)
    ac.debug("spline pos", player.splinePosition)

    -- this will flip your car 180 degrees in case you are stuck if you press delete
    local playerPos = player.position
    local playerDir = ac.getCameraForward()
    if ac.isKeyDown(ac.KeyIndex.Delete) and player.speedKmh < 15 then
        physics.setCarPosition(0, playerPos, playerDir)
    end

    -- if timePassed == 0 then
    --     addMessage('Let’s go!', 0)
    -- end

    mediaPlayer2:setSource(checkpoint):setAutoPlay(false)
    mediaPlayer2:setVolume(1.0)
    -- functionalize this part and add checks for all previous checkpoints to prevent teleporting to checkpoints before previous ones have been crossed
    if player.splinePosition > checkpt1pos then
        timeBonus = 1000 * math.floor(countDown)
        if not checkpoint1 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            addMessage(" 1000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            addMessage("STAGE 1 CLEAR! 9 to go!", 1)
            if muteToggle then
                mediaPlayer2:play()
            end
            checkpoint1 = true
        end
    end

    if player.splinePosition > checkpt2pos then
        timeBonus = 2000 * math.floor(countDown)
        if not checkpoint2 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            addMessage("2000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            addMessage("STAGE 2 CLEAR! 8 to Go!", 1)
            if muteToggle then
                mediaPlayer2:play() 
            end
            checkpoint2 = true
        end
    end

    if player.splinePosition > checkpt3pos then
        timeBonus = 3000 * math.floor(countDown)
        if not checkpoint3 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            addMessage("3000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            addMessage("STAGE 3 CLEAR! 7 to Go!", 1)
            if muteToggle then
                mediaPlayer2:play()
            end
            checkpoint3 = true
        end
    end

    if player.splinePosition > checkpt4pos then
        timeBonus = 4000 * math.floor(countDown)
        if not checkpoint4 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            addMessage("4000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            addMessage("STAGE 4 CLEAR! 6 to Go!", 1)
            if muteToggle then
                mediaPlayer2:play()
            end
            checkpoint4 = true
        end
    end

    if player.splinePosition > checkpt5pos then
        timeBonus = 5000 * math.floor(countDown)
        if not checkpoint5 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            addMessage("5000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            addMessage("STAGE 5 CLEAR! 5 to Go!", 1)
            if muteToggle then
                mediaPlayer2:play()
            end
            checkpoint5 = true
        end
    end

    if player.splinePosition > checkpt6pos then
        timeBonus = 6000 * math.floor(countDown)
        if not checkpoint6 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            addMessage("6000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            addMessage("STAGE 6 CLEAR! 4 to Go!", 1)
            if muteToggle then
                mediaPlayer2:play()
            end
            checkpoint6 = true
        end
    end

    if player.splinePosition > checkpt7pos then
        timeBonus = 7000 * math.floor(countDown)
        if not checkpoint7 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            addMessage("7000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            addMessage("STAGE 7 CLEAR! 3 to Go!", 1)
            if muteToggle then
                mediaPlayer2:play()
            end
            checkpoint7 = true
        end
    end

    if player.splinePosition > checkpt8pos then
        timeBonus = 8000 * math.floor(countDown)
        if not checkpoint8 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            addMessage("8000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            addMessage("STAGE 8 CLEAR! 2 to Go!", 1)
            if muteToggle then
                mediaPlayer2:play()
            end
            checkpoint8 = true
        end
    end

    if player.splinePosition > checkpt9pos then
        timeBonus = 9000 * math.floor(countDown)
        if not checkpoint9 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            addMessage("9000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            addMessage("STAGE 9 CLEAR! 1 to Go!", 1)
            if muteToggle then
                mediaPlayer2:play()
            end
            checkpoint9 = true
        end
    end



    if player.splinePosition > gameStartPos then
        raceBegin = true
        -- if player.splinePosition < finishpos then
            -- if countDown > -0.001 then
        if countDown > 0 then
            if player.splinePosition < finishpos then
                countDown = countDown - dt
                totalTimer = totalTimer + dt
                startTimer = 1
                if player.wheelsOutside < 1 then
                    totalScore = totalScore + dt * scoreRisingRate
                end
            else
                if not checkpoint10 then
                    -- raceEnd = true
                    timeBonus = 10000 * math.floor(countDown)
                    countDown = countDown
                    totalTimer = totalTimer
                    totalScore = totalScore
                    totalScore = totalScore + timeBonus
                    finalScore = totalScore
                    if finalScore > personalBest then
                        personalBest = math.ceil(finalScore)
                        stored.playerscore:set(personalBest)
                        if not highScoreChatMsgSent then
                            ac.sendChatMessage('has a NEW Highscore of ' .. math.ceil(personalBest) .. ' pts')
                            highScoreChatMsgSent = true
                        end
                    end
                    checkpoint10 = true
                end
            end
            
        else
            -- raceStarted = false
            -- endReached = false
            mediaPlayer8:setSource(wilhelmScream):setAutoPlay(false)
            mediaPlayer8:setVolume(1.0)
            gameOverMessage = 1
            checkpoint1 = true
            checkpoint2 = true
            checkpoint3 = true
            checkpoint4 = true
            checkpoint5 = true
            checkpoint6 = true
            checkpoint7 = true
            checkpoint8 = true
            checkpoint9 = true
            checkpoint10 = true
            countDown = countDown
            totalTimer = totalTimer
            totalScore = totalScore
            finalScore = totalScore
            if finalScore > personalBest then
                personalBest = math.ceil(finalScore)
                stored.playerscore:set(personalBest)
                if not highScoreChatMsgSent then
                    ac.sendChatMessage('has a NEW Highscore of ' .. math.ceil(personalBest) .. ' pts')
                    highScoreChatMsgSent = true
                end
            end
        end
    else
        countDown = countDownTime
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
        -- raceEnd = false
        highScoreChatMsgSent = false
        gameOverMessage = 0
    end


    -- ac.debug("total timer", totalTimer)
    -- ac.debug("rounded timer", math.round(totalTimer, 3))
    ac.debug("subseconds", string.sub(string.format("%.2f", subSeconds), -2, -1))

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



    if ac.isKeyDown(ac.KeyIndex.OemPlus) and musicVol < 1 then
        musicVol = musicVol + 0.01
    end

    if ac.isKeyDown(ac.KeyIndex.OemMinus) and musicVol > 0 then
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

    musicTimer = musicTimer + dt

    if mediaPlayer4:currentTime() > math.round(mediaPlayer4:duration(), 2) or (mediaPlayer4:playing() == true and ac.isKeyDown(ac.KeyIndex.Back)) then
        if musicTimer > 1 then
            mediaPlayer4:pause():setCurrentTime(0.00)
            mediaPlayer5:play()
            lastPlayedSong = 2
            musicTimer = 0
        end
    end

    if mediaPlayer5:currentTime() > math.round(mediaPlayer5:duration(), 2) or (mediaPlayer5:playing() == true and ac.isKeyDown(ac.KeyIndex.Back)) then
        if musicTimer > 1 then
            mediaPlayer5:pause():setCurrentTime(0.00)
            mediaPlayer6:play()
            lastPlayedSong = 3
            musicTimer = 0
        end
    end

    if mediaPlayer6:currentTime() > math.round(mediaPlayer6:duration(), 2) or (mediaPlayer6:playing() == true and ac.isKeyDown(ac.KeyIndex.Back)) then
        if musicTimer > 1 then
            mediaPlayer6:pause():setCurrentTime(0.00)
            mediaPlayer7:play()
            lastPlayedSong = 4
            musicTimer = 0
        end
    end

    if mediaPlayer7:currentTime() > math.round(mediaPlayer7:duration(),2) or (mediaPlayer7:playing() == true and ac.isKeyDown(ac.KeyIndex.Back)) then
        if musicTimer > 1 then
            mediaPlayer7:pause():setCurrentTime(0.00)
            mediaPlayer4:play()
            lastPlayedSong = 1
            musicTimer = 0
        end
    end

    if mediaPlayer4:playing() == true and ac.isKeyDown(ac.KeyIndex.Space) then
        mediaPlayer4:pause()
    elseif mediaPlayer4:playing() == false and lastPlayedSong == 1 and ac.isKeyDown(ac.KeyIndex.Space) then
        mediaPlayer4:play()
    end

    if mediaPlayer5:playing() == true and ac.isKeyDown(ac.KeyIndex.Space) then
        mediaPlayer5:pause()
    elseif mediaPlayer5:playing() == false and lastPlayedSong == 2 and ac.isKeyDown(ac.KeyIndex.Space) then
        mediaPlayer5:play()
    end

    if mediaPlayer6:playing() == true and ac.isKeyDown(ac.KeyIndex.Space) then
        mediaPlayer6:pause()
    elseif mediaPlayer6:playing() == false and lastPlayedSong == 3 and ac.isKeyDown(ac.KeyIndex.Space) then
        mediaPlayer6:play()
    end

    if mediaPlayer7:playing() == true and ac.isKeyDown(ac.KeyIndex.Space) then
        mediaPlayer7:pause()
    elseif mediaPlayer7:playing() == false and lastPlayedSong == 4 and ac.isKeyDown(ac.KeyIndex.Space) then
        mediaPlayer7:play()
    end


    -- local uiMoveKeyState = ac.isKeyDown(ac.KeyIndex.B)
    -- if uiMoveKeyState and lastUiMoveKeyState ~= uiMoveKeyState then
    --     uiMoveMode = not uiMoveMode
    --     lastUiMoveKeyState = uiMoveKeyState
    --     if messageState then
    --         addMessage('UI Move mode Disabled', -1)
    --         messageState = false
    --     else
    --         addMessage('UI Move mode Enabled', -1)
    --         messageState = true
    --     end


    -- elseif not uiMoveKeyState then
    --     lastUiMoveKeyState = false
    -- end

    -- if ui.mouseClicked(ui.MouseButton.Left) then
    --     if uiMoveMode then
    --         uiCustomPos = ui.mousePos()
    --     end
    -- end

    local muteKeyState = ac.isKeyDown(ac.KeyIndex.M)
    if muteKeyState and lastMuteKeyState ~= muteKeyState then
        muteToggle = not muteToggle
        if messageState then
            addMessage('Sounds on', -1)
            messageState = false
        else
            addMessage('Sounds off', -1)
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
        -- addMessage('B to toggle UI move mode', -1)
        addMessage('Plus/Minus to increase/decrease music volume', -1)
        addMessage('Space bar to play/pause music, Backspace to skip track', -1)
        addMessage('Delete to re-orient car', -1)
        -- addMessage('Based on Overtake by Ilja, Modded by Boon and Rusty', 2)
    end


    timePassed = timePassed + dt
    -- speedMessageTimer = speedMessageTimer + dt
    collisionMessageTimer = collisionMessageTimer + dt
    collisionTimer = collisionTimer - dt

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
        addMessage(offRoadMessages[math.random(1, #offRoadMessages)], -1)
        wheelsWarningTimeout = 15
    end



    -- ac.debug(" player", player.collidedWith)
    for i = 1, ac.getSim().carsCount do
        local car = ac.getCarState(i) --or error()
        local state = carsState[i]
        ac.debug(" player ", player.collidedWith)
        ac.debug(" collision timer ", collisionTimer)

        if car.position:closerToThan(player.position, 10) then
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
                    collisionTimer = 2
                end
            end

            if not state.overtaken and not state.collided and state.drivingAlong then
                local posDir = (car.position - player.position):normalize()
                local posDot = math.dot(posDir, car.look)
                state.maxPosDot = math.max(state.maxPosDot, posDot)
                if posDot < -0.5 and state.maxPosDot > 0.5 then
                    -- add_amt = math.ceil(10 * comboMeter)
                    -- if player.collidedWith == 0 then
                    if collisionTimer > 0 then
                        totalScore = totalScore + collisionOvertakePts
                        addMessage('OVERTAKE 0.25x: + ' .. collisionOvertakePts .. ' pts', 2)
                        -- collisionTimer = 0
                    -- end  
                    elseif car.position:closerToThan(player.position, 3) then
                        totalScore = totalScore + closeOvertakePts
                        addMessage(CloseMessages[math.random(#CloseMessages)], 1)
                    else
                        totalScore = totalScore + overtakePts
                        addMessage('OVERTAKE 1x: + ' .. overtakePts .. ' pts', 0)
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

local fontscale = 0.03
local font_sizex = fontscale*uiState.windowSize.x/screen_ratio
local font_sizey = fontscale*uiState.windowSize.y
local basic_fontsize = vec2(font_sizex, font_sizey)

local bigfontscale = 0.05
local bigfont_sizex = bigfontscale*uiState.windowSize.x/screen_ratio
local bigfont_sizey = bigfontscale*uiState.windowSize.y
local big_fontsize = vec2(bigfont_sizex, bigfont_sizey)


local totaltime_xpos = 0.77*uiState.windowSize.x

local minutes10s_xpos = totaltime_xpos + 1*font_sizex
local minutes_xpos = minutes10s_xpos + font_sizex

local seconds10s_xpos = minutes_xpos + 2*font_sizex
local seconds_xpos = seconds10s_xpos + font_sizex

local subseconds_xpos = seconds_xpos + 2*font_sizex


ac.debug("font size", basic_fontsize)
ac.debug("x_dim", uiState.windowSize.x)
ac.debug("font size x_dim", font_sizex)

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
            local currPos = math.lerp(0, 200, math.lerpInvSat(player.splinePosition, prevCheckptPos, checkptPos))

            ui.drawRectFilled(ref + vec2(0, -8), ref + vec2(200, 10), colorDark, 1)
            ui.drawLine(ref + vec2(0, -8), ref + vec2(0, 8), colorGrey, 1)
            ui.drawLine(ref + vec2(200, -8), ref + vec2(200, 8), colorGrey, 1)

            ui.drawLine(ref + vec2(0, 0), ref + vec2(currPos, 0), colorAccent, 13)

        end


        
        ac.debug('screen ratio', screen_ratio)
        -- ui.beginTransparentWindow('cruisinAcWindow', vec2(uiState.windowSize.x * 0.25, uiState.windowSize.y * 0.1), vec2(400, 400), false)
        ui.drawImage('https://cdn.discordapp.com/attachments/1193340713123983500/1199189350429241497/cruisin-ac-logo.png', vec2(uiState.windowSize.x * 0.05, uiState.windowSize.y * 0.1), vec2(uiState.windowSize.x * 0.2, uiState.windowSize.y * 0.2), rgbm.colors.white, vec2(0,0), vec2(1,1), ui.ImageFit.Fit)


        ui.beginTransparentWindow('overtakeScore1', vec2(uiState.windowSize.x * 0.15, uiState.windowSize.y * 0.1), vec2(400, 400), false)
        ui.pushACFont('ddm_digital_odo')
        ui.acText('SCORE', basic_fontsize, 0, rgbm(1.0, 0.0, 1.0, 1.0))
        ui.popACFont()
        ui.endTransparentWindow()
        -- ui.pushACFont('ddm_digital_odo')
        -- ui.acText("SCORE", vec2(50,50), 0, rgbm(0.5, 0.0, 1.0, 1))
        -- ui.popACFont()
        ui.beginTransparentWindow('overtakeScore2', vec2(uiState.windowSize.x * 0.15, uiState.windowSize.y * 0.15), vec2(2000, 2000), false)
        ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.acText(math.ceil(totalScore) .. ' pts', basic_fontsize, 0, rgbm(0.8, 0.8, 1.0, 1.0))
        ui.popACFont()
        -- ui.pushACFont('ddm_digital_odo')
        -- ui.acText(math.ceil(totalScore) .. ' pts', vec2(50,50), 2, rgbm(0.75, 0.5, 0.0, 1))
        -- ui.popACFont()

        -- ui.endOutline(rgbm(0, 0, 0, 0.3))

        ui.offsetCursorY(150)
        ui.offsetCursorX(-200)
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

        local progress_loc = vec2(-270, 60)
        ui.beginTransparentWindow('progressWindow', vec2(uiState.windowSize.x * 0.78, uiState.windowSize.y * 0.8), vec2(1400, 1400), false)
        -- ui.beginOutline()

        ui.setCursor(0 + vec2(0, 4 * 30))

        ui.setCursorY(0)

        -- ui.textColored('Keep speed above ' .. requiredSpeed .. ' km/h:', colorAccent)
        if raceBegin and not checkpoint1 then
            ui.pushACFont('ddm_digital_odo')
            ui.acText('STAGE 1: ', basic_fontsize, 0, rgbm(1.0, 1.0, 0.0, 1.0))
            ui.popACFont()
            progressMeter(ui.getCursor() + progress_loc, gameStartPos, checkpt1pos) -- starting line and checkpt 1 positions
            
        end

        if checkpoint1 and not checkpoint2 then
            ui.pushACFont('ddm_digital_odo')
            ui.acText('STAGE 2: ', basic_fontsize, 0, rgbm(1.0, 1.0, 0.0, 1.0))
            ui.popACFont()
            progressMeter(ui.getCursor() + progress_loc, checkpt1pos, checkpt2pos)
        end

        if checkpoint2 and not checkpoint3 then
            ui.pushACFont('ddm_digital_odo')
            ui.acText('STAGE 3: ', basic_fontsize, 0, rgbm(1.0, 1.0, 0.0, 1.0))
            ui.popACFont()
            progressMeter(ui.getCursor() + progress_loc, checkpt2pos, checkpt3pos)
        end

        if checkpoint3 and not checkpoint4 then
            ui.pushACFont('ddm_digital_odo')
            ui.acText('STAGE 4: ', basic_fontsize, 0, rgbm(1.0, 1.0, 0.0, 1.0))
            ui.popACFont()
            progressMeter(ui.getCursor() + progress_loc, checkpt3pos, checkpt4pos)
        end

        if checkpoint4 and not checkpoint5 then
            ui.pushACFont('ddm_digital_odo')
            ui.acText('STAGE 5: ', basic_fontsize, 0, rgbm(1.0, 1.0, 0.0, 1.0))
            ui.popACFont()
            progressMeter(ui.getCursor() + progress_loc, checkpt4pos, checkpt5pos)
        end

        if checkpoint5 and not checkpoint6 then
            ui.pushACFont('ddm_digital_odo')
            ui.acText('STAGE 6: ', basic_fontsize, 0, rgbm(1.0, 1.0, 0.0, 1.0))
            ui.popACFont()
            progressMeter(ui.getCursor() + progress_loc, checkpt5pos, checkpt6pos)
        end

        if checkpoint6 and not checkpoint7 then
            ui.pushACFont('ddm_digital_odo')
            ui.acText('STAGE 7: ', basic_fontsize, 0, rgbm(1.0, 1.0, 0.0, 1.0))
            ui.popACFont()
            progressMeter(ui.getCursor() + progress_loc, checkpt6pos, checkpt7pos)
        end

        if checkpoint7 and not checkpoint8 then
            ui.pushACFont('ddm_digital_odo')
            ui.acText('STAGE 8: ', basic_fontsize, 0, rgbm(1.0, 1.0, 0.0, 1.0))
            ui.popACFont()
            progressMeter(ui.getCursor() + progress_loc, checkpt7pos, checkpt8pos)
        end

        if checkpoint8 and not checkpoint9 then
            ui.pushACFont('ddm_digital_odo')
            ui.acText('STAGE 9: ', basic_fontsize, 0, rgbm(1.0, 1.0, 0.0, 1.0))
            ui.popACFont()
            progressMeter(ui.getCursor() + progress_loc, checkpt8pos, checkpt9pos)
        end

        if checkpoint9 and not checkpoint10 then
            ui.pushACFont('ddm_digital_odo')
            ui.acText('FINAL STAGE: ', basic_fontsize, 0, rgbm(1.0, 1.0, 0.0, 1.0))
            ui.popACFont()
            progressMeter(ui.getCursor() + progress_loc, checkpt9pos, finishpos)
        end

        -- ui.popFont()

        ui.endTransparentWindow()


        ui.beginTransparentWindow("countDownTimer", vec2(uiState.windowSize.x * 0.47, uiState.windowSize.y * 0.1), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.acText("TIME", basic_fontsize, 0, rgbm(0.75, 0.5, 0.0, 1))
        ui.popACFont()
        ui.endTransparentWindow()

        ui.beginTransparentWindow('countDownTime', vec2(uiState.windowSize.x * 0.47, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        -- local textsize = vec2(0,0)
        -- textsize = ui.calculateACTextSize(" " .. math.abs(math.ceil(countDown)).. "", vec2(10,10*screen_ratio), 0, 0, monospace)
        -- ac.debug("text size", textsize)
        -- ui.pushACFont('fd2_speedo')
        ui.acText(" " .. math.abs(math.ceil(countDown)).. "", vec2(1.5*font_sizex, 1.5*font_sizey), 2, rgbm(1.0, 1.0, 0.0, 1))
        ui.popACFont()
        ui.endTransparentWindow()



        local checkptflagdist = 0.005
        local player = ac.getCarState(1)
        local beginraceflag = math.applyLag(beginraceflag, player.splinePosition > gameStartPos and player.splinePosition < gameStartPos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        local checkpt1flag = math.applyLag(checkpt1flag, player.splinePosition > checkpt1pos and player.splinePosition < checkpt1pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        local checkpt2flag = math.applyLag(checkpt2flag, player.splinePosition > checkpt2pos and player.splinePosition < checkpt2pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        local checkpt3flag = math.applyLag(checkpt3flag, player.splinePosition > checkpt3pos and player.splinePosition < checkpt3pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        local checkpt4flag = math.applyLag(checkpt4flag, player.splinePosition > checkpt4pos and player.splinePosition < checkpt4pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        local checkpt5flag = math.applyLag(checkpt5flag, player.splinePosition > checkpt5pos and player.splinePosition < checkpt5pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        local checkpt6flag = math.applyLag(checkpt6flag, player.splinePosition > checkpt6pos and player.splinePosition < checkpt6pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        local checkpt7flag = math.applyLag(checkpt7flag, player.splinePosition > checkpt7pos and player.splinePosition < checkpt7pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        local checkpt8flag = math.applyLag(checkpt8flag, player.splinePosition > checkpt8pos and player.splinePosition < checkpt8pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        local checkpt9flag = math.applyLag(checkpt9flag, player.splinePosition > checkpt9pos and player.splinePosition < checkpt9pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        local finishflag = math.applyLag(finishflag, player.splinePosition > finishpos and player.splinePosition < finishpos + checkptflagdist and 1 or 0, 0.1, uiState.dt)

        local checkpointcolor = rgbm(0.8, 0.2, 0.8, 1)

       local checkpt_windowx_scale = 6*bigfont_sizex
       local checkpt_windowy_scale = 6*bigfont_sizey
       local extendplay_windowx_scale = 6.5*bigfont_sizex
       local extendplay_windowy_scale = 5*bigfont_sizey


        ui.beginTransparentWindow("beginRaceWindow", vec2(uiState.windowSize.x * 0.5 - 5*bigfont_sizex, uiState.windowSize.y * 0.5 - 5*bigfont_sizey), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, beginraceflag)
        ui.pushACFont("650S_big")
        ui.acText('Let\'s Go!', big_fontsize, 0, rgbm(1.0, 1.0, 0.0, 1.0))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint1Window", vec2(uiState.windowSize.x * 0.5 - checkpt_windowx_scale, uiState.windowSize.y * 0.5-checkpt_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt1flag)
        ui.pushACFont("650S_big")
        ui.acText('CHECKPOINT!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()
  
        ui.beginTransparentWindow("extendPlay1Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt1flag)
        ui.pushACFont("650S_big")
        ui.acText('EXTEND PLAY!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint2Window", vec2(uiState.windowSize.x * 0.5 - checkpt_windowx_scale, uiState.windowSize.y * 0.5 - checkpt_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt2flag)
        ui.pushACFont("650S_big")
        ui.acText('CHECKPOINT!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("extendPlay2Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt2flag)
        ui.pushACFont("650S_big")
        ui.acText('EXTEND PLAY!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint3Window", vec2(uiState.windowSize.x * 0.5 - checkpt_windowx_scale, uiState.windowSize.y * 0.5 - checkpt_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt3flag)
        ui.pushACFont("650S_big")
        ui.acText('CHECKPOINT!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("extendPlay3Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt3flag)
        ui.pushACFont("650S_big")
        ui.acText('EXTEND PLAY!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint4Window", vec2(uiState.windowSize.x * 0.5 - checkpt_windowx_scale, uiState.windowSize.y * 0.5 - checkpt_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt4flag)
        ui.pushACFont("650S_big")
        ui.acText('CHECKPOINT!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("extendPlay4Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt4flag)
        ui.pushACFont("650S_big")
        ui.acText('EXTEND PLAY!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint5Window", vec2(uiState.windowSize.x * 0.5 - checkpt_windowx_scale, uiState.windowSize.y * 0.5 - checkpt_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt5flag)
        ui.pushACFont("650S_big")
        ui.acText('CHECKPOINT!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("extendPlay5Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt5flag)
        ui.pushACFont("650S_big")
        ui.acText('EXTEND PLAY!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint6Window", vec2(uiState.windowSize.x * 0.5 - checkpt_windowx_scale, uiState.windowSize.y * 0.5 - checkpt_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt6flag)
        ui.pushACFont("650S_big")
        ui.acText('CHECKPOINT!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("extendPlay6Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt6flag)
        ui.pushACFont("650S_big")
        ui.acText('EXTEND PLAY!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint7Window", vec2(uiState.windowSize.x * 0.5 - checkpt_windowx_scale, uiState.windowSize.y * 0.5 - checkpt_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt7flag)
        ui.pushACFont("650S_big")
        ui.acText('CHECKPOINT!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("extendPlay7Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt7flag)
        ui.pushACFont("650S_big")
        ui.acText('EXTEND PLAY!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint8Window", vec2(uiState.windowSize.x * 0.5 - checkpt_windowx_scale, uiState.windowSize.y * 0.5 - checkpt_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt8flag)
        ui.pushACFont("650S_big")
        ui.acText('CHECKPOINT!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("extendPlay8Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt8flag)
        ui.pushACFont("650S_big")
        ui.acText('EXTEND PLAY!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("checkpoint9Window", vec2(uiState.windowSize.x * 0.5 - checkpt_windowx_scale, uiState.windowSize.y * 0.5 - checkpt_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt9flag)
        ui.pushACFont("650S_big")
        ui.acText('CHECKPOINT!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("extendPlay9Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt9flag)
        ui.pushACFont("650S_big")
        ui.acText('EXTEND PLAY!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("finishRaceWindow", vec2(uiState.windowSize.x * 0.5 - 10*bigfont_sizex, uiState.windowSize.y * 0.5 - 4*bigfont_sizey), vec2(2000, 2000), false)
        -- ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, finishflag)
        ui.pushACFont("650S_big")
        ui.acText('FINISH! YOU MADE IT!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("gameOverWindow", vec2(uiState.windowSize.x * 0.5 - 13*bigfont_sizex, uiState.windowSize.y * 0.5 - 2*bigfont_sizey), vec2(2000, 2000), false)
        -- ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, gameOverMessage)
        ui.pushACFont("650S_big")
        ui.acText('OUTTA TIME! GAME OVER MAN!', big_fontsize, 0, rgbm(1.0, 0, 0, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()



        ui.beginTransparentWindow("totalTimeWindow", vec2(totaltime_xpos, uiState.windowSize.y * 0.1), vec2(800, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.acText("TOTAL TIME", basic_fontsize, 0, rgbm(0.1, 0.3, 1.0, 1))
        ui.popACFont()
        ui.endTransparentWindow()


        ui.beginTransparentWindow("totalMinutesWindow1", vec2(minutes10s_xpos, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-min10)
        ui.acText("0", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("totalMinutesWindow2", vec2(minutes_xpos, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-min1)
        ui.acText("0:", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        if minutesTime > 10 then
            ui.beginTransparentWindow("totalMinutesWindow3", vec2(minutes10s_xpos, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        else
            ui.beginTransparentWindow("totalMinutesWindow3", vec2(minutes_xpos, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        end
        ui.pushStyleVar(ui.StyleVar.Alpha, min1)
        ui.pushACFont('ddm_digital_odo')
        -- ui.pushACFont('fd2_speedo')
        -- ui.acText("".. math.floor(countUp10sSecs).. "", vec2(50,50), 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText("".. math.floor(minutesTime).. ":", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        -- ui.acText
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()


        ui.beginTransparentWindow("totalSecondsWindow1", vec2(seconds10s_xpos, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-sec10)
        ui.acText("0", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("totalSecondsWindow2", vec2(seconds_xpos, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-startTimer)
        ui.acText("0:", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        if secondsTime > 10 then
            ui.beginTransparentWindow("totalSecondsWindow3", vec2(seconds10s_xpos, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        else
            ui.beginTransparentWindow("totalSecondsWindow3", vec2(seconds_xpos, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        end
        ui.pushStyleVar(ui.StyleVar.Alpha, startTimer)
        ui.pushACFont('ddm_digital_odo')
        -- ui.pushACFont('fd2_speedo')
        -- ui.acText("".. math.floor(countUp10sSecs).. "", vec2(50,50), 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText("".. math.floor(secondsTime).. ":", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        -- ui.acText
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()



        ui.beginTransparentWindow("totalSubsecondsWindow1", vec2(subseconds_xpos, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-startTimer)
        ui.acText("00", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()


        ui.beginTransparentWindow("totalSubsecondsWindow2", vec2(subseconds_xpos, uiState.windowSize.y * 0.15), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, startTimer)
        -- ui.acText("".. math.floor(subSeconds).. "", vec2(50,50), 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText(string.sub(string.format("%.2f", subSeconds), -2, -1), basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()


        ui.beginTransparentWindow("musicPlayerWindow", vec2(uiState.windowSize.x*0.25, uiState.windowSize.y*0.9), vec2(1000, 1000), false)
        ui.pushFont(ui.Font.Main)
        if lastPlayedSong == 1 then
            ui.text("Now Playing: " .. song1name)
        elseif lastPlayedSong == 2 then
            ui.text("Now Playing: " .. song2name)
        elseif lastPlayedSong == 3 then
            ui.text("Now Playing: " .. song3name)
        elseif lastPlayedSong == 4 then
            ui.text("Now Playing: " .. song4name)
        end

        ui.text("Performed by: Wolf and Raven")
        ui.popFont()
        ui.endTransparentWindow()

    end
end



