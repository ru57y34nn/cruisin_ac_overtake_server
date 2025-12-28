
-- -- local splashWave = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1193677215276216584/Wolf_and_Raven_-_Tribute_to_OutRun_-_03_Splashwave.mp3'
local splashWave = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tribute to OutRun - 03 Splashwave.mp3'
-- -- local magicalSoundShower = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1193696762121162812/Wolf_and_Raven_-_Tribute_to_OutRun_-_01_Magical_Sound_Shower.mp3'
local magicalSoundShower = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tribute to OutRun - 01 Magical Sound Shower.mp3'
-- -- local passingBreeze = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1195154796248838234/Wolf_and_Raven_-_Tribute_to_OutRun_-_02_Passing_Breeze.mp3'
local passingBreeze = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tribute to OutRun - 02 Passing Breeze.mp3'
-- -- local lastWave = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1195154824417771690/Wolf_and_Raven_-_Tribute_to_OutRun_-_04_Last_Wave.mp3'
local lastWave = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tribute to OutRun - 04 Last Wave.mp3'
-- local checkpoint = 'http' .. 's://cdn.discordapp.com/attachments/1193340713123983500/1200650001995542548/checkpoint_-voice_sample.mp3'
-- local checkpoint = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/checkpoint_-voice_sample.mp3'
local letsgo = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/cruisinAC_letsGo.mp3'
local checkpoint = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/cruisinAC_checkpoint.mp3'
local congrats = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/cruisinAC_congratulations.mp3'

local tokyoTurbo = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 01 Tokyo Turbo.mp3'
local wanganLegends = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 02 Wangan Legends.mp3'
local theMidNightClub = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 03 The Mid Night Club.mp3'
local nightRain = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 04 Night Rain.mp3'
local cloudscapeDriver = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 05 Cloudscape Driver.mp3'
local tougeDriver = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 06 Touge Warrior.mp3'


local musicTimer = 0

local song1name = "Magical Sound Shower"
local song2name = "Passing Breeze"
local song3name = "Splash Wave"
local song4name = "Last Wave"

local song5name = "Tokyo Turbo"
local song6name = "Wangan Legends"
local song7name = "The Mid Night Club"
local song8name = "Night Rain"
local song9name = "Cloudscape Driver"
local song10name = "Touge Warrior"

local mediaPlayer1 = ui.MediaPlayer()
local mediaPlayer2 = ui.MediaPlayer()
local mediaPlayer3 = ui.MediaPlayer()
local mediaPlayer4 = ui.MediaPlayer()
local mediaPlayer5 = ui.MediaPlayer()
local mediaPlayer6 = ui.MediaPlayer()
local mediaPlayer7 = ui.MediaPlayer()
local mediaPlayer8 = ui.MediaPlayer()
local mediaPlayer9 = ui.MediaPlayer()
local mediaPlayer10 = ui.MediaPlayer()
local mediaPlayer11 = ui.MediaPlayer()
local mediaPlayer12 = ui.MediaPlayer()
local mediaPlayer13 = ui.MediaPlayer()


local countDown = 99
local countDownTime = 99
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

local offRoadTimer = 0
-- local offRoadMessageTimer = 0
local driftTimer = 0
-- local driftMessageTimer = 0
local driftMessage1sent = false
local driftMessage2sent = false
local driftMessage3sent = false

local totalScore = 0
local finalScore = 0
-- local comboMeter = 1
-- local comboColor = 0



local carsState = {}
local wheelsWarningTimeout = 0
-- local personalBest = 0
local carName = ac.getCarName(0)
-- local pbcarName = ac.getCarName(0)

local carNames = {}
carNames[1] = 'Toyota AE86 Coupe Tuned'
carNames[2] = 'Toyota Sprinter Trueno GT-Apex Kouki Hatchback'
carNames[3] = "Mazda ɛ̃fini RX-7 FD3S [SPEED FACTORY RGO]"
carNames[4] = 'Nissan Skyline GT-R V•Spec II (R32)'
carNames[5] = 'Mazda RX-7 Infini'
carNames[6] = 'Eunos Roadster Tuned'
carNames[7] = 'Subaru Impreza 22B STi-Version'
carNames[8] = 'Mitsubishi Lancer Evolution IV GSR'
carNames[9] = "Nissan Silvia K's Aero (S14) Option"
carNames[10] = 'Honda Civic EK Cup'


-- local testarosaName = 'Ferrari 512 TR Canyon Spec'
-- local corvetteName = 'Chevrolet Corvette C4 ZR-1 Canyon Spec'
-- local countachName = 'Lamborghini Countach'
-- local diabloName = 'Lamborghini Diablo SE30 Jota'
-- local f40Name = 'Ferrari F40 Stage 3'
-- local viperName = 'Dodge Viper RT/10'
-- local gtoName = 'Ferrari GTO'
-- local porscheName = 'Porsche 911 (993) Carrera 4'
local currentCarPB = 0
local momijicarPBs = {}
momijicarPBs[1] = 0.0
momijicarPBs[2] = 0.0
momijicarPBs[3] = 0.0
momijicarPBs[4] = 0.0
momijicarPBs[5] = 0.0
momijicarPBs[6] = 0.0
momijicarPBs[7] = 0.0
momijicarPBs[8] = 0.0
momijicarPBs[9] = 0.0
momijicarPBs[10] = 0.0


-- local testarosaPB = 0.0
-- local corvettePB = 0.0 
-- local countachPB = 0.0
-- local diabloPB = 0.0
-- local f40PB = 0.0
-- local viperPB = 0.0
-- local gtoPB = 0.0
-- local porschePB = 0.0

local offRoadMessages = { 'KEEP IT BETWEEN THE LINES, BUDDY!', 'GET BACK ON THE ROAD!', 'HEY, YOU ARE BREAKING THE CAR!' }
local CollisionMessages = { 'D\'Oh!', 'BRUTAL!!!!', 'OUCH!!!', 'WATCH IT!!!', 'WANKER!!!', 'OOF!!!', 'CAUTION! STUDENT DRIVER!','NOPE!' }
local CloseMessages = { 'CLOSE ONE! 5x: + 500000 pts!', 'NEAR MISS! 5x: + 500000 pts!', 'SOOO CLOSE! 5x + 500000 pts!', 'WHOA! 5x + 500000 pts!' }

local uiState = ac.getUI()
-- local uiCustomPos = vec2(uiState.windowSize.x * 0.5 - 1000, 100)
-- local uiMoveMode = false
-- local lastUiMoveKeyState = false


local muteToggle = true
local lastMuteKeyState = true
local messageState = false

local musicVol = 0.25
local momijistored = {}

local startTimer = 0
local gameOverMessage = 0

local raceBegin = false
-- local raceEnd = false
local checkpoint1 = false
local checkpoint2 = false
local checkpoint3 = false
local checkpoint10 = false

local gameStartPos = 0.1320
local checkpt1pos = 0.3495
local checkpt2pos = 0.5585
local checkpt3pos = 0.7767
local finishpos = 0.9999

local lap1time = 0
local lap1mins = 0
local lap1secs = 0
local lap1subsecs = 0

local lap2time = 0
local lap2mins = 0
local lap2secs = 0
local lap2subsecs = 0

local lap3time = 0
local lap3mins = 0
local lap3secs = 0
local lap3subsecs = 0

local lap4time = 0
local lap4mins = 0
local lap4secs = 0
local lap4subsecs = 0

local lap10time = 0
local lap10mins = 0
local lap10secs = 0
local lap10subsecs = 0

local prevLaptimes = 0

local messages = {}
local glitter = {}
local glitterCount = 0
local numMssgs = 6

local timeBonus = 0
local overtakePts = 100000
local closeOvertakePts = 500000
local collisionOvertakePts = 25000

local highScoreChatMsgSent = false
local nothighScoreChatMsgSent = false
-- local connectedHighScoreMsgSent = false

local screen_ratio = uiState.windowSize.x / uiState.windowSize.y

local lastPlayedSong = 10
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
                pos = vec2(50, 50) + dir * vec2(40, 20),
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
    -- if comboMeter > 10 and math.random() > 0.98 then
    --     for i = 1, math.floor(comboMeter) do
    --         local dir = vec2(math.random() - 0.5, math.random() - 0.5)
    --         glitterCount = glitterCount + 1
    --         glitter[glitterCount] = {
    --             color = rgbm.new(hsv(math.random() * 360, 1, 1):rgb(), 1),
    --             pos = vec2(195, 75) + dir * vec2(40, 20),
    --             velocity = dir:normalize():scale(0.2 + math.random()),
    --             life = 0.5 + 0.5 * math.random()
    --         }
    --     end
    -- end
end

if carName == carNames[1] then
    momijistored.ae86Score001 = ac.storage('ae86Score001', momijicarPBs[1])
    momijicarPBs[1] = momijistored.ae86Score001:get()
    currentCarPB = momijicarPBs[1]

elseif carName == carNames[2] then
    momijistored.truenoScore001 = ac.storage('truenoScore001', momijicarPBs[2])
    momijicarPBs[2] = momijistored.truenoScore001:get()
    currentCarPB = momijicarPBs[2]

elseif carName == carNames[3] then
    momijistored.fd3sScore001 = ac.storage('fd3sScore001', momijicarPBs[3])
    momijicarPBs[3] = momijistored.fd3sScore001:get()
    currentCarPB = momijicarPBs[3]

elseif carName == carNames[4] then
    momijistored.skylineScore001 = ac.storage('skylineScore001', momijicarPBs[4])
    momijicarPBs[4] = momijistored.skylineScore001:get()
    currentCarPB = momijicarPBs[4]

elseif carName == carNames[5] then
    momijistored.rx7Score001 = ac.storage('rx7Score001', momijicarPBs[5])
    momijicarPBs[5] = momijistored.rx7Score001:get()
    currentCarPB = momijicarPBs[5]

elseif carName == carNames[6] then
    momijistored.mx5Score001 = ac.storage('mx5Score001', momijicarPBs[6])
    momijicarPBs[6] = momijistored.mx5Score001:get()
    currentCarPB = momijicarPBs[6]

elseif carName == carNames[7] then
    momijistored.stiScore001 = ac.storage('stiScore001', momijicarPBs[7])
    momijicarPBs[7] = momijistored.stiScore001:get()
    currentCarPB = momijicarPBs[7]

elseif carName == carNames[8] then
    momijistored.evoScore001 = ac.storage('evoScore001', momijicarPBs[8])
    momijicarPBs[8] = momijistored.evoScore001:get()
    currentCarPB = momijicarPBs[8]

elseif carName == carNames[9] then
    momijistored.silviaScore001 = ac.storage('silviaScore001', momijicarPBs[9])
    momijicarPBs[9] = momijistored.silviaScore001:get()
    currentCarPB = momijicarPBs[9]

elseif carName == carNames[10] then
    momijistored.civicScore001 = ac.storage('civicScore001', momijicarPBs[10])
    momijicarPBs[10] = momijistored.civicScore001:get()
    currentCarPB = momijicarPBs[10]
end    -- corvetteName = stored.corvetteName:get()
-- elseif carName == corvette then
-- stored.carName = ac.storage('corvette', corvette)

-- end

-- stored.playerscore = ac.storage('playerscore', personalBest) --default value
-- stored.carName = ac.storage('carName', pbcarName)
-- -- personalBest = stored.playerscore:set(0.0)
-- personalBest = stored.playerscore:get()
-- pbcarName = stored.carName:get()

-- local function sendhighscore(connectedCarIndex, connectedSessionID)
--     ac.sendChatMessage("has a current highscore of " .. personalBest .. " pts in the " .. pbcarName)
-- end

-- if not connectedHighScoreMsgSent then
--     ac.onClientConnected(sendhighscore)
--     connectedHighScoreMsgSent = true
-- end

-- ac.debug("connected car index", connectedCarIndex)
-- ac.debug("connected session id", connectedSessionID)
-- ac.debug("hi score msg sent", highScoreChatMsgSent)
-- ac.debug("connected msg sent", connectedHighScoreMsgSent)
local DriftTracking = ac.getCarState(1)
function script.update(dt)

    ac.debug("car name", carName)
    -- ac.debug("ae86 high score", momijicarPBs[1])
    -- ac.debug("supra high score", momijicarPBs[2])
    -- ac.debug("supra3.0 high score", momijicarPBs[3])
    -- ac.debug("skyline high score", momijicarPBs[4])
    -- ac.debug("rx7 high score", momijicarPBs[5])
    -- ac.debug("m3 high score", momijicarPBs[6])
    -- ac.debug("sti high score", momijicarPBs[7])
    -- ac.debug("evo high score", momijicarPBs[8])


    local player = ac.getCarState(1)
    -- this line sets the rate at which the player's score rises, based on player speed
    local scoreRisingRate = 100 * (math.lerp(0, 10, math.lerpInvSat(player.speedKmh, 0, 260))) * math.lerp(0, 10, math.lerpInvSat(player.speedKmh, 0, 260))
    ac.debug("player pos", player.position)
    ac.debug("spline pos", player.splinePosition)
    ac.debug("collided with", player.collidedWith)
    ac.debug("car name 2", carNames[2])
    

    -- this will flip your car 180 degrees in case you are stuck if you press delete
    local playerPos = player.position
    local playerDir = ac.getCameraForward()
    if ac.isKeyDown(ac.KeyIndex.Delete) and player.speedKmh < 15 then
        physics.setCarPosition(0, playerPos, playerDir)
    end

    
    -- if timePassed == 0 then
    --     addMessage('Let’s go!', 0)
    -- end



    mediaPlayer1:setSource(letsgo):setAutoPlay(false)
    mediaPlayer1:setVolume(1)

    mediaPlayer3:setSource(congrats):setAutoPlay(false)
    mediaPlayer3:setVolume(1)
    -- if player.splinePosition > gameStartPos then
    --     if not raceBegin and gameOverMessage == 0 then
    --         if muteToggle then
    --             mediaPlayer1:play()
    --         end
    --         raceBegin = true
    --     end
    -- end


    mediaPlayer2:setSource(checkpoint):setAutoPlay(false)
    mediaPlayer2:setVolume(1)
    -- functionalize this part and add checks for all previous checkpoints to prevent teleporting to checkpoints before previous ones have been crossed
    if player.splinePosition > checkpt1pos then
        timeBonus = 250000 * math.ceil(countDown)
        if not checkpoint1 and gameOverMessage == 0 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            lap1time = totalTimer
            prevLaptimes = lap1time
            addMessage("250000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            addMessage("STAGE 1 CLEAR! 3 to go!", 1)
            if muteToggle then
                mediaPlayer2:play()
            end
            checkpoint1 = true
        end
    end

    if player.splinePosition > checkpt2pos then
        timeBonus = 500000 * math.ceil(countDown)
        if not checkpoint2 and gameOverMessage == 0 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            lap2time = totalTimer - prevLaptimes
            prevLaptimes = prevLaptimes + lap2time
            addMessage("500000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            addMessage("STAGE 2 CLEAR! 2 to Go!", 1)
            if muteToggle then
                mediaPlayer2:play() 
            end
            checkpoint2 = true
        end
    end

    if player.splinePosition > checkpt3pos then
        timeBonus = 750000 * math.ceil(countDown)
        if not checkpoint3 and gameOverMessage == 0 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            lap3time = totalTimer - prevLaptimes
            prevLaptimes = prevLaptimes + lap3time
            addMessage("750000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
            addMessage("STAGE 3 CLEAR! 1 to Go!", 1)
            if muteToggle then
                mediaPlayer2:play()
            end
            checkpoint3 = true
        end
    end

    -- if player.splinePosition > finishpos then
    --     if not checkpoint10
    -- end





    local sim = ac.getSim()
    if player.splinePosition > gameStartPos then
        if not raceBegin and gameOverMessage == 0 then
            if muteToggle then
                mediaPlayer1:play()
            end
            raceBegin = true
        end
        -- if player.splinePosition < finishpos then
            -- if countDown > -0.001 then
        if countDown > 0 then
            if player.splinePosition < finishpos then
                if not checkpoint10 then
                    countDown = countDown - dt
                    totalTimer = totalTimer + dt
                    startTimer = 1
                    if player.wheelsOutside < 1 then
                        if DriftTracking.isDriftValid and collisionTimer < -3 and offRoadTimer < 0 then
                            driftTimer = driftTimer + dt
                            totalScore = totalScore + dt * scoreRisingRate * 10
                            if driftTimer > 0 and not driftMessage1sent then
                                addMessage('DRIFT IT! 10x Drift Bonus!', 1)
                                driftMessage1sent = true
                            end
                            if driftTimer > 2 and not driftMessage2sent then
                                totalScore = totalScore + dt * scoreRisingRate * 100
                                addMessage('KEEP IT GOING! 100x Drift Bonus!!', 1)
                                driftMessage2sent = true
                            end
                            if driftTimer > 4 and not driftMessage3sent then
                                totalScore = totalScore + dt * scoreRisingRate * 1000
                                addMessage('MAXIMUM DRIFT!!! 1000x Drift Bonus!!!', 1)
                                driftMessage3sent = true
                            end
                        else
                            driftTimer = 0
                            driftMessage1sent = false
                            driftMessage2sent = false
                            driftMessage3sent = false
                            totalScore = totalScore + dt * scoreRisingRate
                        end
                    end

                    
                    while sim.carsCount > #carsState do
                        carsState[#carsState + 1] = {}
                    end
                
                    if wheelsWarningTimeout > 0 then
                        wheelsWarningTimeout = wheelsWarningTimeout - dt
                    elseif player.wheelsOutside > 0 then
                        -- if wheelsWarningTimeout == 0 then
                        -- end
                        addMessage(offRoadMessages[math.random(1, #offRoadMessages)], -1)
                        wheelsWarningTimeout = 15
                    end
                    -- ac.debug(" player", player.collidedWith)
                    for i = 1, ac.getSim().carsCount do
                        local car = ac.getCarState(i) --or error()
                        local state = carsState[i]
                        -- ac.debug(" player ", player.collidedWith)
                        -- ac.debug(" collision timer ", collisionTimer)
                
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

                                    -- if muteToggle then
                                    --     mediaPlayer3:setSource(noti)
                                    --     mediaPlayer3:setVolume(1)
                                    --     mediaPlayer3:play()
                                    -- else
                                    --     mediaPlayer3:setSource(noti)
                                    --     mediaPlayer3:setVolume(0)
                                    --     mediaPlayer3:pause()
                                    -- end
                
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
                else
                    countDown = countDown
                    totalTimer = totalTimer
                    totalScore = totalScore
                end
            else
                if not checkpoint10 then
                    lap10time = totalTimer - prevLaptimes
                    -- raceEnd = true
                    timeBonus = 1000000 * math.ceil(countDown)
                    countDown = countDown
                    totalTimer = totalTimer
                    totalScore = totalScore
                    totalScore = totalScore + timeBonus
                    finalScore = totalScore
                    addMessage("1000000 x TIME BONUS! + " .. timeBonus .. " pts", 1)
                    addMessage("FINAL STAGE CLEAR!", 1)
                    if carName == carNames[1] then
                        if finalScore > momijicarPBs[1] then
                            momijicarPBs[1] = math.ceil(finalScore)
                            momijistored.ae86Score001:set(momijicarPBs[1])
                            currentCarPB = finalScore
                            if not highScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' and has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' ..carName)
                                highScoreChatMsgSent = true
                            end
                        else
                            if not nothighScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' with a score of ' ..math.ceil(finalScore) .. ' pts in the ' ..carName)
                                nothighScoreChatMsgSent = true
                            end
                        end
                    elseif carName == carNames[2] then
                        if finalScore > momijicarPBs[2] then
                            momijicarPBs[2] = math.ceil(finalScore)
                            momijistored.truenoScore001:set(momijicarPBs[2])
                            currentCarPB = finalScore
                            if not highScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' and has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' ..carName)
                                highScoreChatMsgSent = true
                            end
                        else
                            if not nothighScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' with a score of ' ..math.ceil(finalScore) .. ' pts in the ' ..carName)
                                nothighScoreChatMsgSent = true
                            end
                        end
                    elseif carName == carNames[3] then
                        if finalScore > momijicarPBs[3] then
                            momijicarPBs[3] = math.ceil(finalScore)
                            momijistored.fd3sScore001:set(momijicarPBs[3])
                            currentCarPB = finalScore
                            if not highScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' and has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' ..carName)
                                highScoreChatMsgSent = true
                            end
                        else
                            if not nothighScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' with a score of ' ..math.ceil(finalScore) .. ' pts in the ' ..carName)
                                nothighScoreChatMsgSent = true
                            end
                        end
                    elseif carName == carNames[4] then
                        if finalScore > momijicarPBs[4] then
                            momijicarPBs[4] = math.ceil(finalScore)
                            momijistored.skylineScore001:set(momijicarPBs[4])
                            currentCarPB = finalScore
                            if not highScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' and has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' ..carName)
                                highScoreChatMsgSent = true
                            end
                        else
                            if not nothighScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' with a score of ' ..math.ceil(finalScore) .. ' pts in the ' ..carName)
                                nothighScoreChatMsgSent = true
                            end
                        end
                    elseif carName == carNames[5] then
                        if finalScore > momijicarPBs[5] then
                            momijicarPBs[5] = math.ceil(finalScore)
                            momijistored.rx7Score001:set(momijicarPBs[5])
                            currentCarPB = finalScore
                            if not highScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' and has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' ..carName)
                                highScoreChatMsgSent = true
                            end
                        else
                            if not nothighScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' with a score of ' ..math.ceil(finalScore) .. ' pts in the ' ..carName)
                                nothighScoreChatMsgSent = true
                            end
                        end
                    elseif carName == carNames[6] then
                        if finalScore > momijicarPBs[6] then
                            momijicarPBs[6] = math.ceil(finalScore)
                            momijistored.mx5Score001:set(momijicarPBs[6])
                            currentCarPB = finalScore
                            if not highScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' and has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' ..carName)
                                highScoreChatMsgSent = true
                            end
                        else
                            if not nothighScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' with a score of ' ..math.ceil(finalScore) .. ' pts in the ' ..carName)
                                nothighScoreChatMsgSent = true
                            end
                        end
                    elseif carName == carNames[7] then
                        if finalScore > momijicarPBs[7] then
                            momijicarPBs[7] = math.ceil(finalScore)
                            momijistored.stiScore001:set(momijicarPBs[7])
                            currentCarPB = finalScore
                            if not highScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' and has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' ..carName)
                                highScoreChatMsgSent = true
                            end
                        else
                            if not nothighScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' with a score of ' ..math.ceil(finalScore) .. ' pts in the ' ..carName)
                                nothighScoreChatMsgSent = true
                            end
                        end
                    elseif carName == carNames[8] then
                        if finalScore > momijicarPBs[8] then
                            momijicarPBs[8] = math.ceil(finalScore)
                            momijistored.evoScore001:set(momijicarPBs[8])
                            currentCarPB = finalScore
                            if not highScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' and has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' ..carName)
                                highScoreChatMsgSent = true
                            end
                        else
                            if not nothighScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' with a score of ' ..math.ceil(finalScore) .. ' pts in the ' ..carName)
                                nothighScoreChatMsgSent = true
                            end
                        end
                    elseif carName == carNames[9] then
                        if finalScore > momijicarPBs[9] then
                            momijicarPBs[9] = math.ceil(finalScore)
                            momijistored.silviaScore001:set(momijicarPBs[9])
                            currentCarPB = finalScore
                            if not highScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' and has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' ..carName)
                                highScoreChatMsgSent = true
                            end
                        else
                            if not nothighScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' with a score of ' ..math.ceil(finalScore) .. ' pts in the ' ..carName)
                                nothighScoreChatMsgSent = true
                            end
                        end
                    elseif carName == carNames[10] then
                        if finalScore > momijicarPBs[10] then
                            momijicarPBs[10] = math.ceil(finalScore)
                            momijistored.civicScore001:set(momijicarPBs[10])
                            currentCarPB = finalScore
                            if not highScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' and has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' ..carName)
                                highScoreChatMsgSent = true
                            end
                        else
                            if not nothighScoreChatMsgSent then
                                ac.sendChatMessage('Reached the Goal' .. ' in ' .. math.floor(minutesTime).. ":" .. string.format("%02d", math.floor(secondsTime)).. ":" .. string.sub(string.format("%.2f", subSeconds), -2, -1) .. ' with a score of ' ..math.ceil(finalScore) .. ' pts in the ' ..carName)
                                nothighScoreChatMsgSent = true
                            end
                        end
                    end
                    -- if finalScore > personalBest then
                    --     personalBest = math.ceil(finalScore)
                    --     momijistored.playerscore:set(personalBest)
                    --     momijistored.carName:set(carName)
                    if muteToggle then
                        mediaPlayer3:play()
                    end
                    checkpoint10 = true
                else
                    countDown = countDown
                    totalTimer = totalTimer
                    totalScore = totalScore
                end
            end
            
        else
            -- raceStarted = false
            -- endReached = false
            -- mediaPlayer8:setSource(wilhelmScream):setAutoPlay(false)
            -- mediaPlayer8:setVolume(1.0)
            gameOverMessage = 1
            checkpoint1 = true
            checkpoint2 = true
            checkpoint3 = true
            -- checkpoint4 = true
            -- checkpoint5 = true
            -- checkpoint6 = true
            -- checkpoint7 = true
            -- checkpoint8 = true
            -- checkpoint9 = true
            checkpoint10 = true
            countDown = countDown
            totalTimer = totalTimer
            totalScore = totalScore
            finalScore = totalScore

            if carName == carNames[1] then
                if finalScore > momijicarPBs[1] then
                    momijicarPBs[1] = math.ceil(finalScore)
                    momijistored.ae86Score001:set(momijicarPBs[1])
                    if not highScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time, but has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        highScoreChatMsgSent = true
                    end
                else
                    if not nothighScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time with a score of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        nothighScoreChatMsgSent = true
                    end
                end
            elseif carName == carNames[2] then
                if finalScore > momijicarPBs[2] then
                    momijicarPBs[2] = math.ceil(finalScore)
                    momijistored.truenoScore001:set(momijicarPBs[2])
                    if not highScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time, but has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        highScoreChatMsgSent = true
                    end
                else
                    if not nothighScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time with a score of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        nothighScoreChatMsgSent = true
                    end
                end
            elseif carName == carNames[3] then
                if finalScore > momijicarPBs[3] then
                    momijicarPBs[3] = math.ceil(finalScore)
                    momijistored.fd3sScore001:set(momijicarPBs[3])
                    if not highScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time, but has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        highScoreChatMsgSent = true
                    end
                else
                    if not nothighScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time with a score of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        nothighScoreChatMsgSent = true
                    end
                end
            elseif carName == carNames[4] then
                if finalScore > momijicarPBs[4] then
                    momijicarPBs[4] = math.ceil(finalScore)
                    momijistored.skylineScore001:set(momijicarPBs[4])
                    if not highScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time, but has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        highScoreChatMsgSent = true
                    end
                else
                    if not nothighScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time with a score of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        nothighScoreChatMsgSent = true
                    end
                end
            elseif carName == carNames[5] then
                if finalScore > momijicarPBs[5] then
                    momijicarPBs[5] = math.ceil(finalScore)
                    momijistored.rx7Score001:set(momijicarPBs[5])
                    if not highScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time, but has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        highScoreChatMsgSent = true
                    end
                else
                    if not nothighScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time with a score of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        nothighScoreChatMsgSent = true
                    end
                end
            elseif carName == carNames[6] then
                if finalScore > momijicarPBs[6] then
                    momijicarPBs[6] = math.ceil(finalScore)
                    momijistored.mx5Score001:set(momijicarPBs[6])
                    if not highScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time, but has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        highScoreChatMsgSent = true
                    end
                else
                    if not nothighScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time with a score of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        nothighScoreChatMsgSent = true
                    end
                end
            elseif carName == carNames[7] then
                if finalScore > momijicarPBs[7] then
                    momijicarPBs[7] = math.ceil(finalScore)
                    momijistored.stiScore001:set(momijicarPBs[7])
                    if not highScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time, but has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        highScoreChatMsgSent = true
                    end
                else
                    if not nothighScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time with a score of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        nothighScoreChatMsgSent = true
                    end
                end
            elseif carName == carNames[8] then
                if finalScore > momijicarPBs[8] then
                    momijicarPBs[8] = math.ceil(finalScore)
                    momijistored.evoScore001:set(momijicarPBs[8])
                    if not highScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time, but has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        highScoreChatMsgSent = true
                    end
                else
                    if not nothighScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time with a score of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        nothighScoreChatMsgSent = true
                    end
                end
            elseif carName == carNames[9] then
                if finalScore > momijicarPBs[9] then
                    momijicarPBs[9] = math.ceil(finalScore)
                    momijistored.silviaScore001:set(momijicarPBs[9])
                    if not highScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time, but has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        highScoreChatMsgSent = true
                    end
                else
                    if not nothighScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time with a score of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        nothighScoreChatMsgSent = true
                    end
                end
            elseif carName == carNames[10] then
                if finalScore > momijicarPBs[10] then
                    momijicarPBs[10] = math.ceil(finalScore)
                    momijistored.civicScore001:set(momijicarPBs[10])
                    if not highScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time, but has a new Highscore of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        highScoreChatMsgSent = true
                    end
                else
                    if not nothighScoreChatMsgSent then
                        ac.sendChatMessage('Ran out of time with a score of ' .. math.ceil(finalScore) .. ' pts in the ' .. carName)
                        nothighScoreChatMsgSent = true
                    end
                end
            end
            -- if finalScore > personalBest then
            --     personalBest = math.ceil(finalScore)
            --     stored.playerscore:set(personalBest)
            --     stored.carName:set(carName)
            -- if not highScoreChatMsgSent then
            --     ac.sendChatMessage('has a NEW Highscore of ' .. math.ceil(personalBest) .. ' pts in the ' .. carName)
            --     highScoreChatMsgSent = true
            -- end
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
        -- checkpoint4 = false
        -- checkpoint5 = false
        -- checkpoint6 = false
        -- checkpoint7 = false
        -- checkpoint8 = false
        -- checkpoint9 = false
        checkpoint10 = false
        -- raceEnd = false
        highScoreChatMsgSent = false
        nothighScoreChatMsgSent = false
        gameOverMessage = 0
    end



    if lap1time > 60 then
        lap1mins = 1
        lap1secs = math.floor(lap1time - 60)
        lap1subsecs =  lap1time - math.floor(lap1time)
    else
        lap1mins = 0
        lap1secs = math.floor(lap1time)
        lap1subsecs = lap1time - lap1secs
    end

    if lap2time > 60 then
        lap2mins = 1
        lap2secs = math.floor(lap2time - 60)
        lap2subsecs =  lap2time - math.floor(lap2time)
    else
        lap2mins = 0
        lap2secs = math.floor(lap2time)
        lap2subsecs = lap2time - lap2secs
    end

    if lap3time > 60 then
        lap3mins = 1
        lap3secs = math.floor(lap3time - 60)
        lap3subsecs =  lap3time - math.floor(lap3time)
    else
        lap3mins = 0
        lap3secs = math.floor(lap3time)
        lap3subsecs = lap3time - lap3secs
    end

    if lap4time > 60 then
        lap4mins = 1
        lap4secs = math.floor(lap4time - 60)
        lap4subsecs =  lap4time - math.floor(lap4time)
    else
        lap4mins = 0
        lap4secs = math.floor(lap4time)
        lap4subsecs = lap2time - lap4secs
    end

    if lap10time > 60 then
        lap10mins = 1
        lap10secs = math.floor(lap10time - 60)
        lap10subsecs =  lap10time - math.floor(lap10time)
    else
        lap10mins = 0
        lap10secs = math.floor(lap10time)
        lap10subsecs = lap10time - lap10secs
    end


    -- ac.debug("total timer", totalTimer)
    -- ac.debug("rounded timer", math.round(totalTimer, 3))
    -- ac.debug("subseconds", string.sub(string.format("%.2f", subSeconds), -2, -1))

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



    if ac.isKeyDown(ac.KeyIndex.Up) and musicVol < 1 then
        musicVol = musicVol + 0.01
    end

    if ac.isKeyDown(ac.KeyIndex.Down) and musicVol > 0 then
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

    mediaPlayer8:setSource(tokyoTurbo):setAutoPlay(false)
    mediaPlayer8:setVolume(musicVol)

    mediaPlayer9:setSource(wanganLegends):setAutoPlay(false)
    mediaPlayer9:setVolume(musicVol)

    mediaPlayer10:setSource(theMidNightClub):setAutoPlay(false)
    mediaPlayer10:setVolume(musicVol)

    mediaPlayer11:setSource(nightRain):setAutoPlay(false)
    mediaPlayer11:setVolume(musicVol)

    mediaPlayer12:setSource(cloudscapeDriver):setAutoPlay(false)
    mediaPlayer12:setVolume(musicVol)

    mediaPlayer13:setSource(tougeDriver):setAutoPlay(false)
    mediaPlayer13:setVolume(musicVol)


    if timePassed > 5 and timePassed < 6 then
        mediaPlayer13:play()
    end

    musicTimer = musicTimer + dt

    if mediaPlayer4:currentTime() > math.round(mediaPlayer4:duration(), 2) or (mediaPlayer4:playing() == true and ac.isKeyDown(ac.KeyIndex.Left)) then
        if musicTimer > 0.2 then
            mediaPlayer4:pause():setCurrentTime(0.00)
            mediaPlayer5:play()
            lastPlayedSong = 2
            musicTimer = 0
        end
    end

    if mediaPlayer5:currentTime() > math.round(mediaPlayer5:duration(), 2) or (mediaPlayer5:playing() == true and ac.isKeyDown(ac.KeyIndex.Left)) then
        if musicTimer > 0.2 then
            mediaPlayer5:pause():setCurrentTime(0.00)
            mediaPlayer6:play()
            lastPlayedSong = 3
            musicTimer = 0
        end
    end

    if mediaPlayer6:currentTime() > math.round(mediaPlayer6:duration(), 2) or (mediaPlayer6:playing() == true and ac.isKeyDown(ac.KeyIndex.Left)) then
        if musicTimer > 0.2 then
            mediaPlayer6:pause():setCurrentTime(0.00)
            mediaPlayer7:play()
            lastPlayedSong = 4
            musicTimer = 0
        end
    end

    if mediaPlayer7:currentTime() > math.round(mediaPlayer7:duration(),2) or (mediaPlayer7:playing() == true and ac.isKeyDown(ac.KeyIndex.Left)) then
        if musicTimer > 0.2 then
            mediaPlayer7:pause():setCurrentTime(0.00)
            mediaPlayer8:play()
            lastPlayedSong = 5
            musicTimer = 0
        end
    end

    if mediaPlayer8:currentTime() > math.round(mediaPlayer8:duration(),2) or (mediaPlayer8:playing() == true and ac.isKeyDown(ac.KeyIndex.Left)) then
        if musicTimer > 0.2 then
            mediaPlayer8:pause():setCurrentTime(0.00)
            mediaPlayer9:play()
            lastPlayedSong = 6
            musicTimer = 0
        end
    end

    if mediaPlayer9:currentTime() > math.round(mediaPlayer9:duration(),2) or (mediaPlayer9:playing() == true and ac.isKeyDown(ac.KeyIndex.Left)) then
        if musicTimer > 0.2 then
            mediaPlayer9:pause():setCurrentTime(0.00)
            mediaPlayer10:play()
            lastPlayedSong = 7
            musicTimer = 0
        end
    end

    if mediaPlayer10:currentTime() > math.round(mediaPlayer10:duration(),2) or (mediaPlayer10:playing() == true and ac.isKeyDown(ac.KeyIndex.Left)) then
        if musicTimer > 0.2 then
            mediaPlayer10:pause():setCurrentTime(0.00)
            mediaPlayer11:play()
            lastPlayedSong = 8
            musicTimer = 0
        end
    end

    if mediaPlayer11:currentTime() > math.round(mediaPlayer11:duration(),2) or (mediaPlayer11:playing() == true and ac.isKeyDown(ac.KeyIndex.Left)) then
        if musicTimer > 0.2 then
            mediaPlayer11:pause():setCurrentTime(0.00)
            mediaPlayer12:play()
            lastPlayedSong = 9
            musicTimer = 0
        end
    end

    if mediaPlayer12:currentTime() > math.round(mediaPlayer12:duration(),2) or (mediaPlayer12:playing() == true and ac.isKeyDown(ac.KeyIndex.Left)) then
        if musicTimer > 0.2 then
            mediaPlayer12:pause():setCurrentTime(0.00)
            mediaPlayer13:play()
            lastPlayedSong = 10
            musicTimer = 0
        end
    end

    if mediaPlayer13:currentTime() > math.round(mediaPlayer13:duration(),2) or (mediaPlayer13:playing() == true and ac.isKeyDown(ac.KeyIndex.Left)) then
        if musicTimer > 0.2 then
            mediaPlayer13:pause():setCurrentTime(0.00)
            mediaPlayer4:play()
            lastPlayedSong = 1
            musicTimer = 0
        end
    end




    if mediaPlayer4:playing() == true and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer4:pause()
        musicTimer = 0
    elseif mediaPlayer4:playing() == false and lastPlayedSong == 1 and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer4:play()
        musicTimer = 0
    end

    if mediaPlayer5:playing() == true and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer5:pause()
        musicTimer = 0
    elseif mediaPlayer5:playing() == false and lastPlayedSong == 2 and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer5:play()
        musicTimer = 0
    end

    if mediaPlayer6:playing() == true and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer6:pause()
        musicTimer = 0
    elseif mediaPlayer6:playing() == false and lastPlayedSong == 3 and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer6:play()
        musicTimer = 0
    end

    if mediaPlayer7:playing() == true and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer7:pause()
        musicTimer = 0
    elseif mediaPlayer7:playing() == false and lastPlayedSong == 4 and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer7:play()
        musicTimer = 0
    end


    if mediaPlayer8:playing() == true and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer8:pause()
        musicTimer = 0
    elseif mediaPlayer8:playing() == false and lastPlayedSong == 5 and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer8:play()
        musicTimer = 0
    end

    if mediaPlayer9:playing() == true and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer9:pause()
        musicTimer = 0
    elseif mediaPlayer9:playing() == false and lastPlayedSong == 6 and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer9:play()
        musicTimer = 0
    end

    if mediaPlayer10:playing() == true and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer10:pause()
        musicTimer = 0
    elseif mediaPlayer10:playing() == false and lastPlayedSong == 7 and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer10:play()
        musicTimer = 0
    end

    if mediaPlayer11:playing() == true and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer11:pause()
        musicTimer = 0
    elseif mediaPlayer11:playing() == false and lastPlayedSong == 8 and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer11:play()
        musicTimer = 0
    end

    if mediaPlayer12:playing() == true and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer12:pause()
        musicTimer = 0
    elseif mediaPlayer12:playing() == false and lastPlayedSong == 9 and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer12:play()
        musicTimer = 0
    end

    
    if mediaPlayer13:playing() == true and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer13:pause()
        musicTimer = 0
    elseif mediaPlayer13:playing() == false and lastPlayedSong == 10 and ac.isKeyDown(ac.KeyIndex.Right) and musicTimer > 0.2 then
        mediaPlayer13:play()
        musicTimer = 0
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
        addMessage('CTRL + D to toggle UI.', -1)
        addMessage('M to toggle sound FX', -1)
        -- addMessage('B to toggle UI move mode', -1)
        addMessage('Up arrow/Down arrow to increase/decrease music volume', -1)
        addMessage('Right arrow to play/pause music, Left arrow to skip track', -1)
        addMessage('Delete to re-orient car 180 degrees', -1)
        -- addMessage('Based on Overtake by Ilja, Modded by Boon and Rusty', 2)
    end


    timePassed = timePassed + dt
    ac.debug('time passed', timePassed)
    -- speedMessageTimer = speedMessageTimer + dt
    collisionMessageTimer = collisionMessageTimer + dt
    collisionTimer = collisionTimer - dt
    offRoadTimer = offRoadTimer - dt

    -- ac.debug("lap1 timer", lap1time)
    -- ac.debug("lap2 timer", lap2time)
    -- ac.debug("lap3 timer", lap3time)
    -- ac.debug("lap4 timer", lap4time)
    -- ac.debug("lap5 timer", lap5time)
    -- ac.debug("lap6 timer", lap6time)
    -- ac.debug("lap7 timer", lap7time)
    -- ac.debug("lap8 timer", lap8time)
    -- ac.debug("lap9 timer", lap9time)
    -- ac.debug("lap10timer", lap10time)

    -- local comboFadingRate = 0.1 * math.lerp(1, 0.1, math.lerpInvSat(player.speedKmh, 45, 160)) + player.wheelsOutside / 4
    -- comboMeter = math.max(1, comboMeter - dt * comboFadingRate) 
end


local beginraceflag = 0
local checkpt1flag = 0
local checkpt2flag = 0
local checkpt3flag = 0
local checkpt4flag = 0
local finishflag = 0

local UIToggle = true
local LastKeyState = false

local smallfontscale = 0.015
local smallfont_sizex = smallfontscale*uiState.windowSize.x/screen_ratio
local smallfont_sizey = smallfontscale*uiState.windowSize.y
local small_fontsize = vec2(smallfont_sizex, smallfont_sizey)

local fontscale = 0.03
local font_sizex = fontscale*uiState.windowSize.x/screen_ratio
local font_sizey = fontscale*uiState.windowSize.y
local basic_fontsize = vec2(font_sizex, font_sizey)

local bigfontscale = 0.05
local bigfont_sizex = bigfontscale*uiState.windowSize.x/screen_ratio
local bigfont_sizey = bigfontscale*uiState.windowSize.y
local big_fontsize = vec2(bigfont_sizex, bigfont_sizey)


local totaltime_xpos = 0.9*uiState.windowSize.x - 8*font_sizex

local minutes10s_xpos = totaltime_xpos + 1*font_sizex
local minutes_xpos = minutes10s_xpos + font_sizex

local seconds10s_xpos = minutes_xpos + 2*font_sizex
local seconds_xpos = seconds10s_xpos + font_sizex

local subseconds_xpos = seconds_xpos + 2*font_sizex


-- ac.debug("font size", basic_fontsize)
-- ac.debug("x_dim", uiState.windowSize.x)
-- ac.debug("font size x_dim", font_sizex)

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


        
        -- ac.debug('screen ratio', screen_ratio)
        -- ui.beginTransparentWindow('cruisinAcWindow', vec2(uiState.windowSize.x * 0.25, uiState.windowSize.y * 0.1), vec2(400, 400), false)
        ui.drawImage('https://cdn.discordapp.com/attachments/1193340713123983500/1199189350429241497/cruisin-ac-logo.png?ex=68522e1d&is=6850dc9d&hm=8a09426624847a58cc869221a9f772c2a4b832a056a241a9430d060097b82007&', vec2(-0.05, font_sizey*2), vec2(uiState.windowSize.x * 0.15, font_sizey*5), rgbm.colors.white, vec2(0,0), vec2(1,1), ui.ImageFit.Fit)
        
        ui.beginTransparentWindow('overtakeScore1', vec2(uiState.windowSize.x * 0.1, font_sizey*2), vec2(400, 400), false)
        ui.pushACFont('ddm_digital_odo')
        ui.acText('SCORE', basic_fontsize, 0, rgbm(1.0, 0.0, 1.0, 1.0))
        ui.popACFont()
        ui.endTransparentWindow()
        -- ui.pushACFont('ddm_digital_odo')
        -- ui.acText("SCORE", vec2(50,50), 0, rgbm(0.5, 0.0, 1.0, 1))
        -- ui.popACFont()
        ui.beginTransparentWindow('overtakeScore2', vec2(uiState.windowSize.x * 0.1, font_sizey*3.5), vec2(2000, 2000), false)
        ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.acText(math.ceil(totalScore) .. ' pts', basic_fontsize, 0, rgbm(0.8, 0.8, 1.0, 1.0))
        ui.popACFont()
        ui.endTransparentWindow()

        ui.beginTransparentWindow('overtakeScorePB', vec2(uiState.windowSize.x * 0.1, font_sizey*4.75), vec2(2000, 2000), false)
        ui.beginOutline()
        ui.pushACFont('650S_big')
        ui.acText('PB: ' .. math.ceil(currentCarPB) .. ' pts', small_fontsize, 0, rgbm(0.8, 0.8, 1.0, 1.0))
        ui.popACFont()
        ui.endTransparentWindow()
        -- ui.pushACFont('ddm_digital_odo')
        -- ui.acText(math.ceil(totalScore) .. ' pts', vec2(50,50), 2, rgbm(0.75, 0.5, 0.0, 1))
        -- ui.popACFont()

        -- ui.endOutline(rgbm(0, 0, 0, 0.3))

        -- ui.offsetCursorY(150)
        -- ui.offsetCursorX(-300)
        ui.beginTransparentWindow('messageWindow', vec2(uiState.windowSize.x * 0.1, font_sizey * 8), vec2(2000, 2000), false)
        ui.pushFont(ui.Font.Title)
        ui.offsetCursorY(50)
        ui.offsetCursorX(50)
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
        local final_prog_loc = vec2((-270)-4*font_sizex, 60)
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


        if checkpoint3 and not checkpoint10 then
            ui.pushACFont('ddm_digital_odo')
            ui.acText('FINAL STAGE: ', basic_fontsize, 0, rgbm(1.0, 1.0, 0.0, 1.0))
            ui.popACFont()
            progressMeter(ui.getCursor() + final_prog_loc, checkpt3pos, finishpos)
        end

        -- ui.popFont()

        ui.endTransparentWindow()


        ui.beginTransparentWindow("countDownTimer", vec2((uiState.windowSize.x*0.5)-(3*font_sizex), font_sizey*2), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.acText("TIME", basic_fontsize, 0, rgbm(0.8, 0.5, 0.0, 1))
        ui.popACFont()
        ui.endTransparentWindow()

        ui.beginTransparentWindow('countDownTime', vec2((uiState.windowSize.x*0.5) - (2*font_sizex), font_sizey*3), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('giulia')
        -- local textsize = vec2(0,0)
        -- textsize = ui.calculateACTextSize(" " .. math.abs(math.ceil(countDown)).. "", vec2(10,10*screen_ratio), 0, 0, monospace)
        -- ac.debug("text size", textsize)
        -- ui.pushACFont('fd2_speedo')
        ui.acText("" .. math.abs(math.ceil(countDown)).. "", vec2(2.0*font_sizex, 2.75*font_sizey), 2, rgbm(1.0, 1.0, 0.0, 1))
        ui.popACFont()
        ui.endTransparentWindow()



        local checkptflagdist = 0.005
        local player = ac.getCarState(1)
        beginraceflag = math.applyLag(beginraceflag, player.splinePosition > gameStartPos and player.splinePosition < gameStartPos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        checkpt1flag = math.applyLag(checkpt1flag, player.splinePosition > checkpt1pos and player.splinePosition < checkpt1pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        checkpt2flag = math.applyLag(checkpt2flag, player.splinePosition > checkpt2pos and player.splinePosition < checkpt2pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        checkpt3flag = math.applyLag(checkpt3flag, player.splinePosition > checkpt3pos and player.splinePosition < checkpt3pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        finishflag = math.applyLag(finishflag, player.splinePosition >= finishpos and 1 or 0, 0.1, uiState.dt)

        -- local checkpointcolor = rgbm(0.8, 0.2, 0.8, 1)
        local checkpointcolor = rgbm(1.0, 0.0, 0.0, 1)
        local extendplaycolor = rgbm(1.0, 0, 0, 1)

       local checkpt_windowx_scale = 6*bigfont_sizex
       local checkpt_windowy_scale = 6*bigfont_sizey
       local extendplay_windowx_scale = 6.5*bigfont_sizex
       local extendplay_windowy_scale = 6.5*bigfont_sizey
       local laptime_windowx_scale = 6.5*font_sizex
       local laptime_windowy_scale = 5*bigfont_sizey


        ui.beginTransparentWindow("beginRaceWindow", vec2(uiState.windowSize.x * 0.5 - 4.5*bigfont_sizex, uiState.windowSize.y * 0.5 - 5*bigfont_sizey), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, beginraceflag)
        ui.pushACFont("650S_big")
        ui.acText('Let\'s Go!', big_fontsize, 0, rgbm(1.0, 1.0, 0.0, 1.0))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        -- ui.beginTransparentWindow("checkpoint1Window", vec2(uiState.windowSize.x * 0.5 - checkpt_windowx_scale, uiState.windowSize.y * 0.5-checkpt_windowy_scale), vec2(2000, 2000), false)
        -- ui.pushStyleVar(ui.StyleVar.Alpha, checkpt1flag)
        -- ui.pushACFont("650S_big")
        -- ui.acText('CHECKPOINT!', big_fontsize, 0, checkpointcolor)
        -- ui.popACFont()
        -- ui.popStyleVar()
        -- ui.endTransparentWindow()
  
        ui.beginTransparentWindow("extendPlay1Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt1flag)
        ui.pushACFont("650S_big")
        ui.acText('EXTEND PLAY!', big_fontsize, 0, extendplaycolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("lap1Window", vec2(uiState.windowSize.x * 0.5 - laptime_windowx_scale, uiState.windowSize.y * 0.5-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt1flag)
        ui.pushACFont("ddm_digital_odo")
        ui.acText('LAP ', basic_fontsize, 0, rgbm(0.1, 0.3, 1.0, 1))
        ui.acText(string.format("%02d", lap1mins).. ":", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText(string.format("%02d", lap1secs).. ":", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText(string.sub(string.format("%.02f", lap1subsecs), -2, -1), basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        -- ui.beginTransparentWindow("checkpoint2Window", vec2(uiState.windowSize.x * 0.5 - checkpt_windowx_scale, uiState.windowSize.y * 0.5 - checkpt_windowy_scale), vec2(2000, 2000), false)
        -- ui.pushStyleVar(ui.StyleVar.Alpha, checkpt2flag)
        -- ui.pushACFont("650S_big")
        -- ui.acText('CHECKPOINT!', big_fontsize, 0, checkpointcolor)
        -- ui.popACFont()
        -- ui.popStyleVar()
        -- ui.endTransparentWindow()

        ui.beginTransparentWindow("extendPlay2Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt2flag)
        ui.pushACFont("650S_big")
        ui.acText('EXTEND PLAY!', big_fontsize, 0, extendplaycolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("lap2Window", vec2(uiState.windowSize.x * 0.5 - laptime_windowx_scale, uiState.windowSize.y * 0.5-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt2flag)
        ui.pushACFont("ddm_digital_odo")
        ui.acText('LAP ', basic_fontsize, 0, rgbm(0.1, 0.3, 1.0, 1))
        ui.acText(string.format("%02d", lap2mins).. ":", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText(string.format("%02d", lap2secs).. ":", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText(string.sub(string.format("%.02f", lap2subsecs), -2, -1), basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        -- ui.beginTransparentWindow("checkpoint3Window", vec2(uiState.windowSize.x * 0.5 - checkpt_windowx_scale, uiState.windowSize.y * 0.5 - checkpt_windowy_scale), vec2(2000, 2000), false)
        -- ui.pushStyleVar(ui.StyleVar.Alpha, checkpt3flag)
        -- ui.pushACFont("650S_big")
        -- ui.acText('CHECKPOINT!', big_fontsize, 0, checkpointcolor)
        -- ui.popACFont()
        -- ui.popStyleVar()
        -- ui.endTransparentWindow()

        ui.beginTransparentWindow("extendPlay3Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt3flag)
        ui.pushACFont("650S_big")
        ui.acText('EXTEND PLAY!', big_fontsize, 0, extendplaycolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("lap3Window", vec2(uiState.windowSize.x * 0.5 - laptime_windowx_scale, uiState.windowSize.y * 0.5-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt3flag)
        ui.pushACFont("ddm_digital_odo")
        ui.acText('LAP ', basic_fontsize, 0, rgbm(0.1, 0.3, 1.0, 1))
        ui.acText(string.format("%02d", lap3mins).. ":", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText(string.format("%02d", lap3secs).. ":", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText(string.sub(string.format("%.02f", lap3subsecs), -2, -1), basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        -- ui.beginTransparentWindow("checkpoint4Window", vec2(uiState.windowSize.x * 0.5 - checkpt_windowx_scale, uiState.windowSize.y * 0.5 - checkpt_windowy_scale), vec2(2000, 2000), false)
        -- ui.pushStyleVar(ui.StyleVar.Alpha, checkpt4flag)
        -- ui.pushACFont("650S_big")
        -- ui.acText('CHECKPOINT!', big_fontsize, 0, checkpointcolor)
        -- ui.popACFont()
        -- ui.popStyleVar()
        -- ui.endTransparentWindow()

        ui.beginTransparentWindow("extendPlay4Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt4flag)
        ui.pushACFont("650S_big")
        ui.acText('EXTEND PLAY!', big_fontsize, 0, extendplaycolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("lap4Window", vec2(uiState.windowSize.x * 0.5 - laptime_windowx_scale, uiState.windowSize.y * 0.5-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, checkpt4flag)
        ui.pushACFont("ddm_digital_odo")
        ui.acText('LAP ', basic_fontsize, 0, rgbm(0.1, 0.3, 1.0, 1))
        ui.acText(string.format("%02d", lap4mins).. ":", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText(string.format("%02d", lap4secs).. ":", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText(string.sub(string.format("%.02f", lap4subsecs), -2, -1), basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()


        -- ui.beginTransparentWindow("finishRaceWindow", vec2(uiState.windowSize.x * 0.5 - 10*bigfont_sizex, uiState.windowSize.y * 0.5 - 4*bigfont_sizey), vec2(2000, 2000), false)
        ui.beginTransparentWindow("finishRaceWindow", vec2(uiState.windowSize.x * 0.5 - 2.5*bigfont_sizex, uiState.windowSize.y * 0.5 - 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        -- ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, finishflag)
        ui.pushACFont("650S_big")
        ui.acText('GOAL!', big_fontsize, 0, checkpointcolor)
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("lap10Window", vec2(uiState.windowSize.x * 0.5 - laptime_windowx_scale, uiState.windowSize.y * 0.5-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, finishflag)
        ui.pushACFont("ddm_digital_odo")
        ui.acText('LAP ', basic_fontsize, 0, rgbm(0.1, 0.3, 1.0, 1))
        ui.acText(string.format("%02d", lap10mins).. ":", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText(string.format("%02d", lap10secs).. ":", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.acText(string.sub(string.format("%.02f", lap10subsecs), -2, -1), basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("gameOverWindow", vec2(uiState.windowSize.x * 0.5 - 4.5*bigfont_sizex, uiState.windowSize.y * 0.5 - 2*bigfont_sizey), vec2(2000, 2000), false)
        -- ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, gameOverMessage)
        ui.pushACFont("650S_big")
        ui.acText('GAME OVER!', big_fontsize, 0, rgbm(1.0, 0, 0, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()



        ui.beginTransparentWindow("totalTimeWindow", vec2(totaltime_xpos, font_sizey*2), vec2(800, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.acText("TOTAL TIME", basic_fontsize, 0, rgbm(0.1, 0.3, 1.0, 1))
        ui.popACFont()
        ui.endTransparentWindow()


        ui.beginTransparentWindow("totalMinutesWindow1", vec2(minutes10s_xpos, font_sizey*3.5), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-min10)
        ui.acText("0", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("totalMinutesWindow2", vec2(minutes_xpos, font_sizey*3.5), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-min1)
        ui.acText("0:", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        if minutesTime > 10 then
            ui.beginTransparentWindow("totalMinutesWindow3", vec2(minutes10s_xpos, font_sizey*3.5), vec2(400, 400), false)
        else
            ui.beginTransparentWindow("totalMinutesWindow3", vec2(minutes_xpos, font_sizey*3.5), vec2(400, 400), false)
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


        ui.beginTransparentWindow("totalSecondsWindow1", vec2(seconds10s_xpos, font_sizey*3.5), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-sec10)
        ui.acText("0", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        ui.beginTransparentWindow("totalSecondsWindow2", vec2(seconds_xpos, font_sizey*3.5), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-startTimer)
        ui.acText("0:", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()

        if secondsTime > 10 then
            ui.beginTransparentWindow("totalSecondsWindow3", vec2(seconds10s_xpos, font_sizey*3.5), vec2(400, 400), false)
        else
            ui.beginTransparentWindow("totalSecondsWindow3", vec2(seconds_xpos, font_sizey*3.5), vec2(400, 400), false)
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



        ui.beginTransparentWindow("totalSubsecondsWindow1", vec2(subseconds_xpos, font_sizey*3.5), vec2(400, 400), false)
        -- ui.beginOutline()
        ui.pushACFont('ddm_digital_odo')
        ui.pushStyleVar(ui.StyleVar.Alpha, 1-startTimer)
        ui.acText("00", basic_fontsize, 0, rgbm(0.2, 1.0, 0.2, 1))
        ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()


        ui.beginTransparentWindow("totalSubsecondsWindow2", vec2(subseconds_xpos, font_sizey*3.5), vec2(400, 400), false)
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

        if lastPlayedSong == 1 and mediaPlayer4:playing() == true then
            ui.text("Now Playing: " .. song1name)
            ui.text("performed by: Wolf and Raven")
        elseif lastPlayedSong == 2 and mediaPlayer5:playing() == true then
            ui.text("Now Playing: " .. song2name)
            ui.text("performed by: Wolf and Raven")
        elseif lastPlayedSong == 3 and mediaPlayer6:playing() == true then
            ui.text("Now Playing: " .. song3name)
            ui.text("performed by: Wolf and Raven")
        elseif lastPlayedSong == 4 and mediaPlayer7:playing() == true then
            ui.text("Now Playing: " .. song4name)
            ui.text("performed by: Wolf and Raven")

        elseif lastPlayedSong == 5 and mediaPlayer8:playing() == true then
            ui.text("Now Playing: " .. song5name)
            ui.text("by: Wolf and Raven")
        elseif lastPlayedSong == 6 and mediaPlayer9:playing() == true then
            ui.text("Now Playing: " .. song6name)
            ui.text("by: Wolf and Raven")
        elseif lastPlayedSong == 7 and mediaPlayer10:playing() == true then
            ui.text("Now Playing: " .. song7name)
            ui.text("by: Wolf and Raven")
        elseif lastPlayedSong == 8 and mediaPlayer11:playing() == true then
            ui.text("Now Playing: " .. song8name)
            ui.text("by: Wolf and Raven")
        elseif lastPlayedSong == 9 and mediaPlayer12:playing() == true then
            ui.text("Now Playing: " .. song9name)
            ui.text("by: Wolf and Raven")
        elseif lastPlayedSong == 10 and mediaPlayer13:playing() == true then
            ui.text("Now Playing: " .. song10name)
            ui.text("by: Wolf and Raven")
        end

        
        ui.popFont()
        ui.endTransparentWindow()

    end
end



