
-- Please do not share this script without permission from the author.
-- Author: JBoondock and Rusty
-- Version: 1.0
-- Patreon: www.patreon.com/JBoondock

local requiredSpeed = 40

-- local tedleo = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1193724302571343943/11_Lui_Prima_Mobile.mp3'
-- local ween = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1195125566303633478/24_-_Old_Man_Thunder.mp3'

local splashWave = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1193677215276216584/Wolf_and_Raven_-_Tribute_to_OutRun_-_03_Splashwave.mp3'
local magicalSoundShower = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1193696762121162812/Wolf_and_Raven_-_Tribute_to_OutRun_-_01_Magical_Sound_Shower.mp3'
local passingBreeze = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1195154796248838234/Wolf_and_Raven_-_Tribute_to_OutRun_-_02_Passing_Breeze.mp3'
local lastWave = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1195154824417771690/Wolf_and_Raven_-_Tribute_to_OutRun_-_04_Last_Wave.mp3'

local PBlink = 'http' .. 's://www.myinstants.com/media/sounds/holy-shit.mp3'

local killingSpree = 'http' ..
    's://cdn.discordapp.com/attachments/140183723348852736/1001011172641878016/killingSpree.mp3'

local killingFrenzy = 'http' ..
    's://cdn.discordapp.com/attachments/140183723348852736/1001011172335702096/KillingFrenzy.mp3'

local runningRiot = 'http' .. 's://cdn.discordapp.com/attachments/140183723348852736/1001011170272100352/RunningRiot.mp3'
local rampage = 'http' .. 's://cdn.discordapp.com/attachments/140183723348852736/1001011169944932453/Rampage.mp3'
local untouchable = 'http' .. 's://cdn.discordapp.com/attachments/140183723348852736/1001011170959954060/untouchable.mp3'
local invincible = 'http' .. 's://cdn.discordapp.com/attachments/140183723348852736/1001011171974983710/invincible.mp3'
local inconcievable = 'http' ..
    's://cdn.discordapp.com/attachments/140183723348852736/1001011171236782160/inconceivable.mp3'
local unfriggenbelievable = 'http' ..
    's://cdn.discordapp.com/attachments/140183723348852736/1001011170574094376/unfriggenbelievable.mp3'


local noti = 'http' .. 's://cdn.discordapp.com/attachments/140183723348852736/1000988999877394512/pog_noti_sound.mp3'
local mediaPlayer = ui.MediaPlayer()
local mediaPlayer2 = ui.MediaPlayer()
local mediaPlayer3 = ui.MediaPlayer()
local mediaPlayer4 = ui.MediaPlayer()
local mediaPlayer5 = ui.MediaPlayer()
local mediaPlayer6 = ui.MediaPlayer()
local mediaPlayer7 = ui.MediaPlayer()

local hasPlayedSpree = false
local hasPlayedFrenzy = false
local hasPlayedRiot = false
local hasPlayedRampage = false
local hasPlayedUntouchable = false
local hasPlayedInvincible = false
local hasPlayedInconcievable = false
local hasPlayedUnfriggenbelievable = false



function script.prepare(dt)
    ac.debug('speed', ac.getCarState(1).speedKmh)
    return ac.getCarState(1).speedKmh > requiredSpeed
end

local countDown = 100
local timePassed = 0
local speedMessageTimer = 0
local mackMessageTimer = 0
local totalScore = 0
local comboMeter = 1
local comboColor = 0
local dangerouslySlowTimer = 0
local carsState = {}
local wheelsWarningTimeout = 0
local personalBest = 0
local MackMessages = { 'BRUTAL!!!!', 'OUCH!!!', 'Watch it!!!', 'WANKER!!!', 'Caution! Student Driver!',
    'Ain\'t no way you were makin that.' }
local CloseMessages = { 'Way to Go! 3x', 'Close One! 3x', 'Near Miss! 3x', 'Wow! 3x' }
local KindaCloseMessages = {'Pretty Close! 1x', 'Not bad! 1x', 'That was almost scary! 1x', 'I think you scared them! 1x'}

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


stored.playerscore = ac.storage('playerscore', personalBest) --default value
personalBest = stored.playerscore:set(0.0)
personalBest = stored.playerscore:get()

-- ac.sendChatMessage("has a highscore of " .. personalBest .. " pts.")
 
local function sendhighscore(connectedCarIndex, connectedSessionID)
    ac.sendChatMessage("has a highscore of " .. personalBest .. " pts.")
end
 
ac.onClientConnected(sendhighscore)


function script.update(dt)

    local player = ac.getCar(0)
    ac.debug("player pos", player.position)
    ac.debug("spline pos", player.splinePosition)

    if player.engineLifeLeft < 1 then
        if totalScore > personalBest then
            personalBest = math.floor(totalScore)
            stored.playerscore:set(personalBest)
            ac.sendChatMessage("has a NEW highscore of " .. totalScore .. " pts.")
        end
        totalScore = 0
        comboMeter = 1
        -- countDown = 0
        return
    end

    local playerPos = player.position
    local playerDir = ac.getCameraForward()
    if ac.isKeyDown(ac.KeyIndex.Delete) and player.speedKmh < 15 then
        physics.setCarPosition(0, playerPos, playerDir)
    end

    if timePassed == 0 then
        addMessage('Let’s go!', 0)
    end

    if player.splinePosition > 0.016 and countDown > 0 then
        countDown = countDown - dt
    end

    if player.splinePosition > 0.10 then
        if checkpoint1 == false then
            countDown = 99
            addMessage("CHECKPOINT!!!", 1)
            checkpoint1 = true
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


    if countDown < 0 then
        totalScore = 0
        comboMeter = 1
        countDown = 0
        addMessage('Out of Time!', -1)
    end

    if countDown > 100 then
        countDown = 100
    end

    -- if timePassed > 15 then
    -- if countDown > 0 then
    --     countDown = countDown - dt
    -- end
    -- end


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




    -- local player = ac.getCar(0)
    -- if player.engineLifeLeft < 1 then
    --     ac.console('Overtake score: ' .. totalScore)
    --     return
    -- end

    -- local playerPos = player.position
    -- local playerDir = ac.getCameraForward()
    -- if ac.isKeyDown(ac.KeyIndex.Delete) and player.speedKmh < 15 then
    --     physics.setCarPosition(0, playerPos, playerDir)
    -- end

    timePassed = timePassed + dt
    speedMessageTimer = speedMessageTimer + dt
    mackMessageTimer = mackMessageTimer + dt



    local comboFadingRate = 0.1 * math.lerp(1, 0.1, math.lerpInvSat(player.speedKmh, 45, 160)) + player.wheelsOutside / 4
    comboMeter = math.max(1, comboMeter - dt * comboFadingRate)

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
        wheelsWarningTimeout = 30
    end

    if player.speedKmh < requiredSpeed then

        if dangerouslySlowTimer > 3 then
            ac.console('Overtake score: ' .. totalScore)
            comboMeter = 1
            totalScore = 0
            -- countDown = 0

            hasPlayedSpree = false
            hasPlayedFrenzy = false
            hasPlayedRiot = false
            hasPlayedRampage = false
            hasPlayedUntouchable = false
            hasPlayedInvincible = false
            hasPlayedInconcievable = false
            hasPlayedUnfriggenbelievable = false
            if totalScore > personalBest then
                personalBest = totalScore
                ac.sendChatMessage('just scored a ' .. personalBest)
            end
        else
            if dangerouslySlowTimer < 3 then
                if speedMessageTimer > 5 and not timePassed == 0 then
                    addMessage('3 Seconds until score reset!', -1)
                    speedMessageTimer = 0
                end
            end

            if dangerouslySlowTimer == 0 and not timePassed == 0 then
                addMessage('Speed up!', -1)
            end

        end
        dangerouslySlowTimer = dangerouslySlowTimer + dt
        -- comboMeter = 1
        if totalScore > personalBest and dangerouslySlowTimer > 3 then
            personalBest = totalScore
            stored.playerscore:set(personalBest)
            -- ac.sendChatMessage("has a NEW highscore of " .. totalScore .. " pts.")

            if muteToggle then
                mediaPlayer:setSource(PBlink)
                mediaPlayer:setVolume(.25)
                mediaPlayer:play()
            else
                mediaPlayer:setSource(PBlink)
                mediaPlayer:setVolume(0)
                mediaPlayer:pause()
            end

            ac.sendChatMessage('just scored a ' .. personalBest)
        end

        return
    else
        dangerouslySlowTimer = 0
    end

    if player.collidedWith == 0 then

        if totalScore >= personalBest then
            personalBest = totalScore
            stored.playerscore:set(personalBest)
            ac.sendChatMessage("has a NEW highscore of " .. totalScore .. " pts.")
            if muteToggle then
                mediaPlayer:setSource(PBlink)
                mediaPlayer:setVolume(1)
                mediaPlayer:play()
            else
                mediaPlayer:setSource(PBlink)
                mediaPlayer:setVolume(0)
                mediaPlayer:pause()
            end
            ac.sendChatMessage('just scored a ' .. personalBest)
        end
        comboMeter = 1
        totalScore = 0
        -- countDown = 0

        hasPlayedSpree = false
        hasPlayedFrenzy = false
        hasPlayedRiot = false
        hasPlayedRampage = false
        hasPlayedUntouchable = false
        hasPlayedInvincible = false
        hasPlayedInconcievable = false
        hasPlayedUnfriggenbelievable = false

        if mackMessageTimer > 1 then
            addMessage(MackMessages[math.random(1, #MackMessages)], -1)
            mackMessageTimer = 0

        end
    end


    if comboMeter >= 5 then

        if muteToggle then
            if not hasPlayedSpree then
                mediaPlayer2:setSource(killingSpree)
                mediaPlayer2:setVolume(1)
                mediaPlayer2:play()
                hasPlayedSpree = true
            end
        else
            mediaPlayer2:setVolume(0)
            mediaPlayer2:pause()
        end
    end

    if comboMeter >= 10 and comboMeter <= 11 then
        if not hasPlayedFrenzy then
            if muteToggle then
                mediaPlayer2:setSource(killingFrenzy)
                mediaPlayer2:setVolume(1)
                mediaPlayer2:play()
                hasPlayedFrenzy = true
            else
                mediaPlayer2:setVolume(0)
                mediaPlayer2:pause()
            end
        end
    end

    if comboMeter >= 15 and comboMeter <= 16 then
        if not hasPlayedRiot then
            if muteToggle then
                mediaPlayer2:setSource(runningRiot)
                mediaPlayer2:setVolume(1)
                mediaPlayer2:play()
                hasPlayedRiot = true
            else
                mediaPlayer2:setVolume(0)
                mediaPlayer2:pause()
            end
        end
    end

    if comboMeter >= 20 and comboMeter <= 21 then
        if not hasPlayedRampage then
            if muteToggle then
                mediaPlayer2:setSource(rampage)
                mediaPlayer2:setVolume(1)
                mediaPlayer2:play()
                hasPlayedRampage = true
            else
                mediaPlayer2:setVolume(0)
                mediaPlayer2:pause()
            end
        end
    end

    if comboMeter >= 25 and comboMeter <= 26 then
        if not hasPlayedUntouchable then
            if muteToggle then
                mediaPlayer2:setSource(untouchable)
                mediaPlayer2:setVolume(1)
                mediaPlayer2:play()
                hasPlayedUntouchable = true
            else
                mediaPlayer2:setVolume(0)
                mediaPlayer2:pause()
            end
        end
    end

    if comboMeter >= 30 and comboMeter <= 31 then
        if not hasPlayedInvincible then
            if muteToggle then
                mediaPlayer2:setSource(invincible)
                mediaPlayer2:setVolume(1)
                mediaPlayer2:play()
                hasPlayedInvincible = true
            else
                mediaPlayer2:setVolume(0)
                mediaPlayer2:pause()
            end
        end
    end

    if comboMeter >= 35 and comboMeter <= 36 then
        if not hasPlayedInconcievable then
            if muteToggle then
                mediaPlayer2:setSource(inconcievable)
                mediaPlayer2:setVolume(1)
                mediaPlayer2:play()
                hasPlayedInconcievable = true
            else
                mediaPlayer2:setVolume(0)
                mediaPlayer2:pause()
            end
        end
    end

    if comboMeter >= 40 and comboMeter <= 41 then
        if not hasPlayedUnfriggenbelievable then
            if muteToggle then
                mediaPlayer2:setSource(unfriggenbelievable)
                mediaPlayer2:setVolume(1)
                mediaPlayer2:play()
                hasPlayedUnfriggenbelievable = true
            else
                mediaPlayer2:setVolume(0)
                mediaPlayer2:pause()
            end
        end
    end


    -- local car = ac.getCarState(1)
    -- if car.pos:closerToThan(player.pos,2.5) then

    -- end
    ac.debug(" player", player.collidedWith)
    for i = 2, ac.getSim().carsCount do
        local car = ac.getCar(i-1) --or error()
        local state = carsState[i]
        ac.debug(" car " .. i-1, car.collidedWith)


        if car.position:closerToThan(player.position, 7) then
            local drivingAlong = math.dot(car.look, player.look) > 0.2
            if not drivingAlong then
                state.drivingAlong = false

                if not state.nearMiss and car.position:closerToThan(player.position, 3) then
                    state.nearMiss = true
                    comboMeter = comboMeter + 3
                    comboColor = comboColor + math.random(1, 90)
                    comboColor = comboColor + 90
                    addMessage(CloseMessages[math.random(#CloseMessages)], 2)

                    -- if car.position:closerToThan(player.position, 2.5) then
                    --     comboMeter = comboMeter + 3
                    --     comboColor = comboColor + math.random(1, 90)
                    --     comboColor = comboColor + 90
                    --     addMessage(CloseMessages[math.random(#CloseMessages)], 2)
                    -- else
                    --     comboMeter = comboMeter + 1
                    --     comboColor = comboColor + math.random(1, 90)
                    --     comboColor = comboColor + 90
                    --     addMessage(KindaCloseMessages[math.random(#KindaCloseMessages)], 1)

                    -- end
                end
            end

            -- if car.collidedWith == 0 then --and not state.collided then
            --     comboMeter = 1
            --     totalScore = 0
            --     countDown = 0
            --     addMessage('WEINER!!!', -1)
            --     state.collided = true
            --     -- if mackMessageTimer > 1 then
            --     --     addMessage(MackMessages[math.random(1, #MackMessages)], -1)
            --     --     mackMessageTimer = 0
            --     -- end
            -- end
    
            -- if car.collidedWith == 1 and not state.collided then

            --     if totalScore >= personalBest then
            --         personalBest = totalScore
            --         stored.playerscore:set(personalBest)
            --         -- ac.sendChatMessage("has a NEW highscore of " .. totalScore .. " pts.")
            --         if muteToggle then
            --             mediaPlayer:setSource(PBlink)
            --             mediaPlayer:setVolume(1)
            --             mediaPlayer:play()
            --         else
            --             mediaPlayer:setSource(PBlink)
            --             mediaPlayer:setVolume(0)
            --             mediaPlayer:pause()
            --         end
            --         ac.sendChatMessage('just scored a ' .. personalBest)
            --     end
            --     comboMeter = 1
            --     totalScore = 0
            --     countDown = 0
            --     state.collided = true
        
            --     hasPlayedSpree = false
            --     hasPlayedFrenzy = false
            --     hasPlayedRiot = false
            --     hasPlayedRampage = false
            --     hasPlayedUntouchable = false
            --     hasPlayedInvincible = false
            --     hasPlayedInconcievable = false
            --     hasPlayedUnfriggenbelievable = false
        
            --     if mackMessageTimer > 1 then
            --         addMessage(MackMessages[math.random(1, #MackMessages)], -1)
            --         mackMessageTimer = 0
        
            --     end
            -- end


            if not state.overtaken and not state.collided and state.drivingAlong then
                local posDir = (car.position - player.position):normalize()
                local posDot = math.dot(posDir, car.look)
                state.maxPosDot = math.max(state.maxPosDot, posDot)
                if posDot < -0.5 and state.maxPosDot > 0.5 then
                    -- countDown = countDown + 5 * math.lerp(0.2, 1, math.lerpInvSat(player.speedKmh, 45, 160))
                    totalScore = totalScore + math.ceil(10 * comboMeter) --* math.floor(countDown)
                    addMessage('Overtake 1x ' , comboMeter > 50 and 1 or 0)
                    addMessage(math.ceil(10*comboMeter) .. 'x combo bonus',  comboMeter > 50 and 1 or 0)
                    -- addMessage(math.floor(countDown) .. 'x time bonus', comboMeter > 50 and 1 or 0)
                    comboMeter = comboMeter + 1
                    comboColor = comboColor + 90
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

                    -- if car.position:closerToThan(player.position, 3) then
                    --     comboMeter = comboMeter + 3
                    --     comboColor = comboColor + math.random(1, 90)
                    --     comboColor = comboColor + 90
                    -- if muteToggle then
                    --     mediaPlayer3:setSource(noti)
                    --     mediaPlayer3:setVolume(1)
                    --     mediaPlayer3:play()
                    -- else
                    --     mediaPlayer3:setSource(noti)
                    --     mediaPlayer3:setVolume(0)
                    --     mediaPlayer3:pause()
                    -- end

                        
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

local messages = {}
local glitter = {}
local glitterCount = 0
local numMssgs = 8

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

local player = ac.getCar(0)
-- local playerPos = player.position
local speedWarning = 0
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

        local speedRelative = math.saturate(math.floor(ac.getCarState(1).speedKmh) / requiredSpeed)
        speedWarning = math.applyLag(speedWarning, speedRelative < 1 and 1 or 0, 0.5, uiState.dt)

        local colorDark = rgbm(0.4, 0.4, 0.4, 1)
        local colorGrey = rgbm(0.7, 0.7, 0.7, 1)
        local colorAccent = rgbm.new(hsv(speedRelative * 120, 1, 1):rgb(), 1)
        local colorCombo = rgbm.new(hsv(comboColor, math.saturate(comboMeter / 10), 1):rgb(),
            math.saturate(comboMeter / 4))

        local function speedMeter(ref)
            ui.drawRectFilled(ref + vec2(0, -4), ref + vec2(180, 5), colorDark, 1)
            ui.drawLine(ref + vec2(0, -4), ref + vec2(0, 4), colorGrey, 1)
            ui.drawLine(ref + vec2(requiredSpeed, -4), ref + vec2(requiredSpeed, 4), colorGrey, 1)

            local speed = math.min(ac.getCarState(1).speedKmh, 180)
            if speed > 1 then
                ui.drawLine(ref + vec2(0, 0), ref + vec2(speed, 0), colorAccent, 4)
            end
        end

        -- original
        -- ui.beginTransparentWindow('overtakeScore', vec2(uiState.windowSize.x * 0.5 - 600, 100), vec2(1400, 1400), true)
        ui.beginTransparentWindow('overtakeScore', uiCustomPos, vec2(1400, 1400), true)
        ui.beginOutline()

        ui.pushStyleVar(ui.StyleVar.Alpha, 1 - speedWarning)
        ui.pushFont(ui.Font.Title)
        ui.text('Cruisin\' AC: Outrun Overtake')
        -- ui.sameLine(0, 20)
        ui.pushFont(ui.Font.Huge)
        ui.text('High Score: ' .. personalBest .. ' pts')
        ui.popFont()
        ui.popStyleVar()

        ui.pushFont(ui.Font.Huge)
        ui.textColored(totalScore .. ' pts', colorCombo)
        ui.sameLine(0, 40)
        ui.beginRotation()
        ui.textColored(math.ceil(comboMeter * 10) / 10 .. 'x', colorCombo)
        -- if comboMeter > 20 then
        if comboMeter > 10 then
            ui.endRotation(math.sin(comboMeter / 180 * 3141.5) * 3 * math.lerpInvSat(comboMeter, 20, 30) + 90)
        end
        -- if comboMeter > 50 then
        if comboMeter > 20 then
            ui.endRotation(math.sin(comboMeter / 220 * 3141.5) * 3 * math.lerpInvSat(comboMeter, 20, 30) + 90)
        end
        -- if comboMeter > 100 then
        if comboMeter > 30 then
            ui.endRotation(math.sin(comboMeter / 260 * 3141.5) * 3 * math.lerpInvSat(comboMeter, 20, 30) + 90)
        end
        -- if comboMeter > 250 then
        if comboMeter > 40 then
            ui.endRotation(math.sin(comboMeter / 360 * 3141.5) * 3 * math.lerpInvSat(comboMeter, 20, 30) + 90)
        end

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

        ui.pushStyleVar(ui.StyleVar.Alpha, speedWarning)
        ui.setCursorY(0)
        ui.pushFont(ui.Font.Main)
        ui.textColored('Keep speed above ' .. requiredSpeed .. ' km/h:', colorAccent)
        speedMeter(ui.getCursor() + vec2(-9, 4))
        ui.popFont()
        ui.popStyleVar()

        ui.endTransparentWindow()

        ui.beginTransparentWindow("countDownTimer", vec2(uiState.windowSize.x * 0.5, 100), vec2(1400, 1400), false)
        ui.beginOutline()
        -- ui.pushStyleVar(ui.StyleVar.Alpha, 1 - speedWarning)
        ui.pushFont(ui.Font.Huge)
        ui.text("Time") 
        -- ui.text(player.splinePosition)
        ui.pushFont(ui.Font.Huge)
        ui.text(math.floor(countDown).. "")
        -- ui.pushFont(ui.Font.Huge)
        -- ui.text((mediaPlayer4:duration()).. " duration")

        ui.endTransparentWindow()

    else
        ui.text('')

    end



end
