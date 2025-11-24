
local splashWave = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tribute to OutRun - 03 Splashwave.mp3'
local magicalSoundShower = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tribute to OutRun - 01 Magical Sound Shower.mp3'
local passingBreeze = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tribute to OutRun - 02 Passing Breeze.mp3'
local lastWave = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tribute to OutRun - 04 Last Wave.mp3'
local letsgo = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/cruisinAC_letsGo.mp3'
local checkpoint = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/cruisinAC_checkpoint.mp3'
local congrats = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/cruisinAC_congratulations.mp3'

local tokyoTurbo = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 01 Tokyo Turbo.mp3'
local wanganLegends = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 02 Wangan Legends.mp3'
local theMidNightClub = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 03 The Mid Night Club.mp3'
local nightRain = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 04 Night Rain.mp3'
local cloudscapeDriver = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 05 Cloudscape Driver.mp3'
local tougeDriver = 'http' .. 's://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 06 Touge Warrior.mp3'

local countdownNumbers = {}
for i = 0, 9 do
    countdownNumbers[i] = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/countdown_' .. i .. '.png'
end

local digitImages = {}
for i = 0, 9 do
    digitImages[i] = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/outrun_' .. i .. '.png'
end

local extendPlayImg = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/extend_play4.png'
local timeLabel = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/time.png'
local totalTimeLabel = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/total_time.png'
local scoreLabel = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/score.png'
local goalLabel = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/goal_italic.png'
local driftLabel = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/drift.png'
local stage1Label = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/stage_1.png'
local stage2Label = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/stage_2.png'
local stage3Label = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/stage_3.png'
local stage4Label = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/stage_4.png'
local finalStageLabel = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/final_stage.png'
local letsGoLabel = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/lets_go.png'
local gameOverLabel = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/game_over.png'
local singleQuoteImg = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/single_quote.png'
local doubleQuoteImg = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/double_quote.png'
local pbImg = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/pb.png'
local totalTimeMetalLabel = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/total_time_metal.png'
local finalScoreMetalLabel = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/final_score_metal.png'
local newHighScoreLabel = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/new_high_score_metal.png'
local drift10xImg = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/drift_10x.png'
local drift100xImg = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/drift_100x.png'
local drift1000xImg = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/drift_1000x.png'

local overtakeNormalImg = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/overtake_normal.png'
local overtakeCloseImg = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/overtake_close.png'
local overtakeContactImg = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/overtake_contact2.png'

-- Stage bonus text
local stageBonusTextImg = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/stage_bonus_text.png'

-- Stage bonus digits (0-9)
local stageBonusDigits = {}
for i = 0, 9 do
    stageBonusDigits[i] = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/stage_bonus_' .. i .. '.png'
end

local warningLightImg = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/WarningLight.png'
local warningLightAlpha = 0

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

local collisionMessageTimer = 0
local collisionTimer = 0
local offRoadTimer = 0

local driftTimer = 0

local totalScore = 0
local finalScore = 0

local carsState = {}
local wheelsWarningTimeout = 0

local carName = ac.getCarName(0)

local carNames = {}
carNames[1] = 'Toyota AE86 Tuned'
carNames[2] = 'Toyota Supra MKIV'
carNames[3] = 'Toyota Supra 3.0GT Turbo A'
carNames[4] = 'Nissan Skyline GT-R V•Spec II (R32)'
carNames[5] = 'Mazda RX-7 Infini'
carNames[6] = 'BMW M3 E30 Step1'
carNames[7] = 'Subaru Impreza 22B STi-Version'
carNames[8] = 'Mitsubishi Lancer Evolution VIII MR'
carNames[9] = 'Nissan Silvia spec-R Aero'
carNames[10] = 'Honda S2000 (AP1)'

local currentCarPB = 0
local tflcarPBs = {}
tflcarPBs[1] = 0.0
tflcarPBs[2] = 0.0
tflcarPBs[3] = 0.0
tflcarPBs[4] = 0.0
tflcarPBs[5] = 0.0
tflcarPBs[6] = 0.0
tflcarPBs[7] = 0.0
tflcarPBs[8] = 0.0
tflcarPBs[9] = 0.0
tflcarPBs[10] = 0.0

local uiState = ac.getUI()

local muteToggle = true
local lastMuteKeyState = true

local musicVol = 0.35
local tflstored = {}

local startTimer = 0
local gameOverMessage = 0

local raceBegin = false

local checkpoint1 = false
local checkpoint2 = false
local checkpoint3 = false
local checkpoint10 = false

local gameStartPos = 0.0035
local checkpt1pos = 0.2527
local checkpt2pos = 0.4966
local checkpt3pos = 0.7485
local finishpos = 0.9830

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

local timeBonus = 0
local overtakePts = 100000
local closeOvertakePts = 500000
local collisionOvertakePts = 25000

local highScoreChatMsgSent = false
local nothighScoreChatMsgSent = false

local screen_ratio = uiState.windowSize.x / uiState.windowSize.y

local lastPlayedSong = 6

local driftMeterMax = 4.0  -- Maximum drift time in seconds
local driftMeterAlpha = 0  -- For fade in/out effect

-- Flash animation variables for Extend Play images
local extendPlay1Flashing = false
local extendPlay1FlashTimer = 0
local extendPlay1Alpha = 0
local extendPlay1FlashPhase = 0
local lap1Alpha = 0  

local extendPlay2Flashing = false
local extendPlay2FlashTimer = 0
local extendPlay2Alpha = 0
local extendPlay2FlashPhase = 0
local lap2Alpha = 0  

local extendPlay3Flashing = false
local extendPlay3FlashTimer = 0
local extendPlay3Alpha = 0
local extendPlay3FlashPhase = 0
local lap3Alpha = 0  

local flashDuration = 0.75  -- Duration of each on/off state (adjust to taste)

local overtakeMessages = {}


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




function addOvertakeMessage(messageType)
    local imgPath = overtakeNormalImg
    if messageType == 2 then
        imgPath = overtakeCloseImg
    elseif messageType == 3 then
        imgPath = overtakeContactImg
    end
    
    -- Check if any message is currently sliding in
    local somethingSliding = false
    for i = 1, #overtakeMessages do
        if overtakeMessages[i].state == 'slidein' then
            somethingSliding = true
            break
        end
    end
    
    -- NO MORE maxOvertakeMessages check - let them stack infinitely
    
    -- Insert new message
    table.insert(overtakeMessages, 1, {
        image = imgPath,
        isStageBonus = false,
        age = 0,
        state = somethingSliding and 'waiting' or 'slidein',
        alpha = 0,
        xOffset = 0,
        yOffset = 0,
        targetYOffset = 0,  -- NEW: smooth transition target
        holdTimer = 0
    })
end




function addStageBonusMessage(bonusPoints)
    local pointsStr = tostring(math.floor(bonusPoints))
    local imgPath = stageBonusTextImg
    
    -- Check if any message is currently sliding in
    local somethingSliding = false
    for i = 1, #overtakeMessages do
        if overtakeMessages[i].state == 'slidein' then
            somethingSliding = true
            break
        end
    end
    
    -- NO MORE maxOvertakeMessages check
    
    table.insert(overtakeMessages, 1, {
        image = imgPath,
        isStageBonus = true,
        bonusPoints = pointsStr,
        age = 0,
        state = somethingSliding and 'waiting' or 'slidein',
        alpha = 0,
        xOffset = 0,
        yOffset = 0,
        targetYOffset = 0,  -- NEW: smooth transition target
        holdTimer = 0
    })
end






local function updateOvertakeMessages(dt)
    for i = #overtakeMessages, 1, -1 do
        local m = overtakeMessages[i]
        
        -- Ensure all values exist
        m.age = m.age or 0
        m.alpha = m.alpha or 0
        m.xOffset = m.xOffset or 0
        m.yOffset = m.yOffset or 0
        m.targetYOffset = m.targetYOffset or 0
        m.holdTimer = m.holdTimer or 0
        
        -- Smoothly interpolate yOffset toward targetYOffset
        m.yOffset = math.applyLag(m.yOffset, m.targetYOffset, 0.7 , dt)
        

        local fadeStartY = -(font_sizey * 4)   -- Start fading here
        local fadeEndY = -(font_sizey * 6.5)   -- Fully transparent here
        
        local positionAlpha = 1.0
        if m.yOffset <= fadeEndY then
            positionAlpha = 0.0
        elseif m.yOffset < fadeStartY then
            -- Interpolate between fadeStart and fadeEnd
            local fadeProgress = (m.yOffset - fadeStartY) / (fadeEndY - fadeStartY)
            positionAlpha = 1.0 - fadeProgress
        end
        
        -- Remove messages that have faded out completely due to position
        if positionAlpha <= 0.0 and m.state ~= 'slideout' then
            table.remove(overtakeMessages, i)
            goto continue
        end
        
        if m.state == 'waiting' then
            -- Just wait, don't update age or state alpha
            -- Check if we can start sliding
            local stillSliding = false
            for j = 1, #overtakeMessages do
                if j ~= i and overtakeMessages[j].state == 'slidein' then
                    stillSliding = true
                    break
                end
            end
            
            if not stillSliding then
                -- SHIFT ALL OTHER MESSAGES UP (change targetYOffset, not yOffset)
                local rowHeight = font_sizey * 1.8
                for j = 1, #overtakeMessages do
                    if j ~= i and (overtakeMessages[j].state == 'hold' or overtakeMessages[j].state == 'slidein') then
                        overtakeMessages[j].targetYOffset = (overtakeMessages[j].targetYOffset or 0) - rowHeight
                    end
                end
                
                m.state = 'slidein'
                m.age = 0
            end
            
            -- State alpha for waiting
            local stateAlpha = 0
            m.alpha = stateAlpha * positionAlpha
            
        elseif m.state == 'slidein' then
            m.age = m.age + dt
            local slideProgress = math.min(m.age / 0.25, 1.0)  -- 0.25 second slide
            local stateAlpha = slideProgress
            m.xOffset = (1.0 - slideProgress) * 400
            
            -- Combine state alpha with position alpha
            m.alpha = stateAlpha * positionAlpha
            
            if slideProgress >= 1.0 then
                m.state = 'hold'
                m.holdTimer = 0
                m.xOffset = 0
                m.age = 0
            end
            
        elseif m.state == 'hold' then
            -- Hold at current position, increment timer
            m.holdTimer = m.holdTimer + dt
            local stateAlpha = 1.0
            m.xOffset = 0
            
            -- Combine state alpha with position alpha
            m.alpha = stateAlpha * positionAlpha
            
            if m.holdTimer >= 1.0 then
                m.state = 'slideout'
                m.age = 0
                m.holdTimer = 0
            end
            
        elseif m.state == 'slideout' then
            m.age = m.age + dt
            local slideoutProgress = math.min(m.age / 2.0, 1.0)
            local stateAlpha = 1.0 - slideoutProgress
            
            -- Store starting position for slideout
            if not m.slideoutStartY then
                m.slideoutStartY = m.targetYOffset
            end
            
            m.targetYOffset = m.slideoutStartY - (slideoutProgress * (font_sizey * 6))
            
            -- Combine state alpha with position alpha
            m.alpha = stateAlpha * positionAlpha
            
            if slideoutProgress >= 1.0 then
                table.remove(overtakeMessages, i)
            end
        end
        
        ::continue::
    end
end





    -- Function to draw a number using digit images
local function drawNumber(number, posX, posY, digitWidth, digitHeight, spacing)
    local numStr = tostring(math.floor(number))
    local totalWidth = #numStr * (digitWidth + spacing) - spacing
    local startX = posX 
    
    for i = 1, #numStr do
        local digit = tonumber(numStr:sub(i, i))
        ui.drawImage(digitImages[digit],
            vec2(startX + (i-1) * (digitWidth + spacing), posY),
            vec2(startX + (i-1) * (digitWidth + spacing) + digitWidth, posY + digitHeight),
            rgbm.colors.white)
    end
end


-- Function to draw a number using digit images
local function drawDigits(number, startX, startY, digitWidth, digitHeight, spacing, minDigits)
    local numStr = tostring(math.floor(number))
    -- Pad with leading zeros if needed
    while #numStr < minDigits do
        numStr = "0" .. numStr
    end
    
    for i = 1, #numStr do
        local digit = tonumber(numStr:sub(i, i))
        local xPos = startX + (i-1) * (digitWidth + spacing)
        ui.drawImage(digitImages[digit],
            vec2(xPos, startY),
            vec2(xPos + digitWidth, startY + digitHeight),
            rgbm.colors.white)
    end
    
    return startX + #numStr * (digitWidth + spacing)
end





-- Storage keys for each car
local storageKeys = {
    'ae86Score', 'supraScore', 'supra2Score', 'skylineScore', 'rx7Score',
    'm3Score', 'stiScore', 'evoScore', 'silviaScore', 's2000Score'
}

-- Initialize storage and load current car's PB
tflstored = {}  -- Move this here
for i = 1, 10 do
    tflstored[storageKeys[i]] = ac.storage(storageKeys[i], tflcarPBs[i])
    tflcarPBs[i] = tflstored[storageKeys[i]]:get()
    
    if carName == carNames[i] then
        currentCarPB = tflcarPBs[i]
    end
end



-- Helper function to handle score updates and chat messages
local function updateCarScore(carIndex, finalScore, isFinish)
    local storageKeys = {
        'ae86Score', 'supraScore', 'supra2Score', 'skylineScore', 'rx7Score',
        'm3Score', 'stiScore', 'evoScore', 'silviaScore', 's2000Score'
    }
    
    local isNewHighScore = finalScore > tflcarPBs[carIndex]
    
    if isNewHighScore then
        tflcarPBs[carIndex] = math.ceil(finalScore)
        tflstored[storageKeys[carIndex]]:set(tflcarPBs[carIndex])
        currentCarPB = finalScore
        
        if not highScoreChatMsgSent then
            local message
            if isFinish then
                message = string.format('Reached the Goal in %d:%02d:%s and has a new Highscore of %d pts in the %s',
                    math.floor(minutesTime),
                    math.floor(secondsTime),
                    string.sub(string.format("%.2f", subSeconds), -2, -1),
                    math.ceil(finalScore),
                    carName)
            else
                message = string.format('Ran out of time, but has a new Highscore of %d pts in the %s',
                    math.ceil(finalScore),
                    carName)
            end
            ac.sendChatMessage(message)
            highScoreChatMsgSent = true
        end
    else
        if not nothighScoreChatMsgSent then
            local message
            if isFinish then
                message = string.format('Reached the Goal in %d:%02d:%s with a score of %d pts in the %s',
                    math.floor(minutesTime),
                    math.floor(secondsTime),
                    string.sub(string.format("%.2f", subSeconds), -2, -1),
                    math.ceil(finalScore),
                    carName)
            else
                message = string.format('Ran out of time with a score of %d pts in the %s',
                    math.ceil(finalScore),
                    carName)
            end
            ac.sendChatMessage(message)
            nothighScoreChatMsgSent = true
        end
    end
end

-- Helper function to get car index from current car name
local function getCurrentCarIndex()
    for i = 1, 10 do
        if carName == carNames[i] then
            return i
        end
    end
    return nil
end



-- Helper function to update flash animations
local function updateFlashAnimations(dt)
    if extendPlay1Flashing then
        extendPlay1FlashTimer = extendPlay1FlashTimer + dt
        if extendPlay1FlashTimer >= flashDuration then
            extendPlay1FlashTimer = 0
            extendPlay1FlashPhase = extendPlay1FlashPhase + 1
            if extendPlay1FlashPhase >= 6 then
                extendPlay1Flashing = false
                extendPlay1Alpha = 0
                lap1Alpha = 0
            else
                extendPlay1Alpha = 1 - extendPlay1Alpha
            end
        end
    end

    if extendPlay2Flashing then
        extendPlay2FlashTimer = extendPlay2FlashTimer + dt
        if extendPlay2FlashTimer >= flashDuration then
            extendPlay2FlashTimer = 0
            extendPlay2FlashPhase = extendPlay2FlashPhase + 1
            if extendPlay2FlashPhase >= 6 then
                extendPlay2Flashing = false
                extendPlay2Alpha = 0
                lap2Alpha = 0
            else
                extendPlay2Alpha = 1 - extendPlay2Alpha
            end
        end
    end

    if extendPlay3Flashing then
        extendPlay3FlashTimer = extendPlay3FlashTimer + dt
        if extendPlay3FlashTimer >= flashDuration then
            extendPlay3FlashTimer = 0
            extendPlay3FlashPhase = extendPlay3FlashPhase + 1
            if extendPlay3FlashPhase >= 6 then
                extendPlay3Flashing = false
                extendPlay3Alpha = 0
                lap3Alpha = 0
            else
                extendPlay3Alpha = 1 - extendPlay3Alpha
            end
        end
    end
end

-- Helper function to update lap time calculations
local function updateLapTimes()
    if lap1time > 60 then
        lap1mins = 1
        lap1secs = math.floor(lap1time - 60)
        lap1subsecs = lap1time - math.floor(lap1time)
    else
        lap1mins = 0
        lap1secs = math.floor(lap1time)
        lap1subsecs = lap1time - lap1secs
    end

    if lap2time > 60 then
        lap2mins = 1
        lap2secs = math.floor(lap2time - 60)
        lap2subsecs = lap2time - math.floor(lap2time)
    else
        lap2mins = 0
        lap2secs = math.floor(lap2time)
        lap2subsecs = lap2time - lap2secs
    end

    if lap3time > 60 then
        lap3mins = 1
        lap3secs = math.floor(lap3time - 60)
        lap3subsecs = lap3time - math.floor(lap3time)
    else
        lap3mins = 0
        lap3secs = math.floor(lap3time)
        lap3subsecs = lap3time - lap3secs
    end

    if lap4time > 60 then
        lap4mins = 1
        lap4secs = math.floor(lap4time - 60)
        lap4subsecs = lap4time - math.floor(lap4time)
    else
        lap4mins = 0
        lap4secs = math.floor(lap4time)
        lap4subsecs = lap2time - lap4secs
    end

    if lap10time > 60 then
        lap10mins = 1
        lap10secs = math.floor(lap10time - 60)
        lap10subsecs = lap10time - math.floor(lap10time)
    else
        lap10mins = 0
        lap10secs = math.floor(lap10time)
        lap10subsecs = lap10time - lap10secs
    end
end



-- Helper function to handle all music player logic
local function updateMusicPlayers(dt)
    if ac.isKeyDown(ac.KeyIndex.Up) and musicVol < 1 then
        musicVol = musicVol + 0.01
    end

    if ac.isKeyDown(ac.KeyIndex.Down) and musicVol > 0 then
        musicVol = musicVol - 0.01
    end

    mediaPlayer4:setSource(magicalSoundShower):setAutoPlay(false):setVolume(musicVol)
    mediaPlayer5:setSource(passingBreeze):setAutoPlay(false):setVolume(musicVol)
    mediaPlayer6:setSource(splashWave):setAutoPlay(false):setVolume(musicVol)
    mediaPlayer7:setSource(lastWave):setAutoPlay(false):setVolume(musicVol)
    mediaPlayer8:setSource(tokyoTurbo):setAutoPlay(false):setVolume(musicVol)
    mediaPlayer9:setSource(wanganLegends):setAutoPlay(false):setVolume(musicVol)
    mediaPlayer10:setSource(theMidNightClub):setAutoPlay(false):setVolume(musicVol)
    mediaPlayer11:setSource(nightRain):setAutoPlay(false):setVolume(musicVol)
    mediaPlayer12:setSource(cloudscapeDriver):setAutoPlay(false):setVolume(musicVol)
    mediaPlayer13:setSource(tougeDriver):setAutoPlay(false):setVolume(musicVol)

    if timePassed > 5 and timePassed < 6 then
        mediaPlayer9:play()
    end

    musicTimer = musicTimer + dt

    -- Track switching logic
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

    -- Play/pause logic
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
end








local DriftTracking = ac.getCarState(1)
function script.update(dt)

    ac.debug("car name", carName)
    ac.debug("Drift timer = ", driftTimer)
    ac.debug("Drift tracking status", DriftTracking.isDriftValid)
    ac.debug("OffRoad Timer", offRoadTimer)
    ac.debug("Collision Timer", collisionTimer)



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



    mediaPlayer1:setSource(letsgo):setAutoPlay(false)
    mediaPlayer1:setVolume(1)

    mediaPlayer3:setSource(congrats):setAutoPlay(false)
    mediaPlayer3:setVolume(1)



    mediaPlayer2:setSource(checkpoint):setAutoPlay(false)
    mediaPlayer2:setVolume(1)

    -- functionalize this part and add checks for all previous checkpoints to prevent teleporting to checkpoints before previous ones have been crossed

    if player.splinePosition > checkpt1pos then

        local timeBonus = 250000 * math.ceil(countDown)
        if not checkpoint1 and gameOverMessage == 0 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            lap1time = totalTimer
            prevLaptimes = lap1time
            addStageBonusMessage(timeBonus)

            if muteToggle then
                mediaPlayer2:play()
            end
            checkpoint1 = true

            extendPlay1Flashing = true
            extendPlay1FlashTimer = 0
            extendPlay1Alpha = 1
            extendPlay1FlashPhase = 0
            lap1Alpha = 1
        end
    end

    if player.splinePosition > checkpt2pos then
        local timeBonus = 500000 * math.ceil(countDown)
        if not checkpoint2 and gameOverMessage == 0 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            lap2time = totalTimer - prevLaptimes
            prevLaptimes = prevLaptimes + lap2time
            addStageBonusMessage(timeBonus)

            if muteToggle then
                mediaPlayer2:play() 
            end
            checkpoint2 = true
            -- START FLASHING ANIMATION
            extendPlay2Flashing = true
            extendPlay2FlashTimer = 0
            extendPlay2Alpha = 1
            extendPlay2FlashPhase = 0
            lap2Alpha = 1  
        end
    end

    if player.splinePosition > checkpt3pos then
        local timeBonus = 750000 * math.ceil(countDown)
        if not checkpoint3 and gameOverMessage == 0 then
            countDown = countDownTime
            totalScore = totalScore + timeBonus
            lap3time = totalTimer - prevLaptimes
            prevLaptimes = prevLaptimes + lap3time
            addStageBonusMessage(timeBonus)

            if muteToggle then
                mediaPlayer2:play()
            end
            checkpoint3 = true
            -- START FLASHING ANIMATION
            extendPlay3Flashing = true
            extendPlay3FlashTimer = 0
            extendPlay3Alpha = 1
            extendPlay3FlashPhase = 0
            lap3Alpha = 1  
        end
    end



    updateFlashAnimations(dt)



    local isDrifting = false  -- ADD THIS LINE
    local sim = ac.getSim()
    
    if player.splinePosition > gameStartPos then

        if not raceBegin and gameOverMessage == 0 then
            if muteToggle then
                mediaPlayer1:play()
            end
            raceBegin = true
        end

        if countDown > 0 then
            if player.splinePosition < finishpos then
                countDown = countDown - dt
                totalTimer = totalTimer + dt
                startTimer = 1

                if player.wheelsOutside < 3 then
                    if DriftTracking.isDriftValid and collisionTimer < 0 and offRoadTimer < 0 then
                        isDrifting = true
                        driftTimer = driftTimer + dt
                        
                        -- Progressive multiplier based on drift duration
                        local driftMultiplier = 10
                        
                        if driftTimer > 4.0 then
                            driftMultiplier = 1000
                        
                        elseif driftTimer > 2.0 then
                            driftMultiplier = 100
                        
                        else
                            driftMultiplier = 10
                        
                        end
                        
                        totalScore = totalScore + dt * scoreRisingRate * driftMultiplier
                    else
                        totalScore = totalScore + dt * scoreRisingRate
                    end
                end

                


                while sim.carsCount > #carsState do
                    carsState[#carsState + 1] = {}
                end
            
                if wheelsWarningTimeout > 0 then
                    wheelsWarningTimeout = wheelsWarningTimeout - dt
                elseif player.wheelsOutside > 3 then

                    wheelsWarningTimeout = 15
                    offRoadTimer = 3
                end
                -- ac.debug(" player", player.collidedWith)
                for i = 1, ac.getSim().carsCount do
                    local car = ac.getCarState(i) --or error()
                    local state = carsState[i]

            
                    if car.position:closerToThan(player.position, 10) then
                        local drivingAlong = math.dot(car.look, player.look) > 0.2
                        if not drivingAlong then
                            state.drivingAlong = false
            
                            if not state.nearMiss and car.position:closerToThan(player.position, 3) then
                                state.nearMiss = true
                            end
                        end
            
                        if player.collidedWith == 0 then
                            -- if collisionMessageTimer > 5 then

                            --     collisionMessageTimer = 0
                            collisionTimer = 4
                            -- end
                        end
            
                        if not state.overtaken and not state.collided and state.drivingAlong then
                            local posDir = (car.position - player.position):normalize()
                            local posDot = math.dot(posDir, car.look)
                            state.maxPosDot = math.max(state.maxPosDot, posDot)
                            if posDot < -0.5 and state.maxPosDot > 0.5 then
                                if collisionTimer > 0 then
                                    totalScore = totalScore + collisionOvertakePts
                                    addOvertakeMessage(3) 
                                elseif car.position:closerToThan(player.position, 3) then
                                    totalScore = totalScore + closeOvertakePts
                                    addOvertakeMessage(2)
                                else
                                    totalScore = totalScore + overtakePts
                                    addOvertakeMessage(1)
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

            else
                if not checkpoint10 then
                    lap10time = totalTimer - prevLaptimes
                    local timeBonus = 1000000 * math.ceil(countDown)
                    countDown = countDown
                    totalTimer = totalTimer
                    totalScore = totalScore
                    totalScore = totalScore + timeBonus
                    finalScore = totalScore
                    addStageBonusMessage(timeBonus)

                    local carIndex = getCurrentCarIndex()
                    if carIndex then
                        updateCarScore(carIndex, finalScore, true)  -- true = finished race
                    end

                    if muteToggle then
                        mediaPlayer3:play()
                    end
                    checkpoint10 = true
                    
                end
            end
            
        else
            gameOverMessage = 1
            checkpoint1 = true
            checkpoint2 = true
            checkpoint3 = true
            checkpoint10 = true
            countDown = countDown
            totalTimer = totalTimer
            totalScore = totalScore
            finalScore = totalScore

            local carIndex = getCurrentCarIndex()
            if carIndex then
                updateCarScore(carIndex, finalScore, false)  -- false = game over
            end
        end
    else
        countDown = countDownTime
        totalScore = 0
        totalTimer = 0
        startTimer = 0

        raceBegin = false
        checkpoint1 = false
        checkpoint2 = false
        checkpoint3 = false

        checkpoint10 = false

        highScoreChatMsgSent = false
        nothighScoreChatMsgSent = false
        gameOverMessage = 0
        
        -- Reset flash animations
        extendPlay1Flashing = false
        extendPlay1Alpha = 0
        extendPlay1FlashPhase = 0
        lap1Alpha = 0  

        extendPlay2Flashing = false
        extendPlay2Alpha = 0
        extendPlay2FlashPhase = 0
        lap2Alpha = 0  

        extendPlay3Flashing = false
        extendPlay3Alpha = 0
        extendPlay3FlashPhase = 0
        lap3Alpha = 0  

        sentmessages = false
        warningLightAlpha = 0
        collisionTimer = 0
        offRoadTimer = 0

    end


    -- DRIFT METER HANDLER - runs every frame regardless of race state
    -- Check if player is in valid racing zone
    local inRacingZone = player.splinePosition > gameStartPos and player.splinePosition < finishpos and countDown > 0
    
    if inRacingZone and isDrifting then
        -- Fade in drift meter
        driftMeterAlpha = math.min(driftMeterAlpha + dt * 3, 1.0)
    else
        -- Outside racing zone OR not drifting - fade out and reset
        if driftTimer > 0 then
            driftTimer = 0

        end
        driftMeterAlpha = math.max(driftMeterAlpha - dt * 2, 0)
    end

    if (collisionTimer > 0 or offRoadTimer > 0)  and (player.splinePosition > gameStartPos and player.splinePosition < finishpos) then
    -- if driftDisabled then
        -- Fade in warning light
        warningLightAlpha = math.min(warningLightAlpha + dt * 4, 1)
    else
        -- Fade out warning light
        warningLightAlpha = math.max(warningLightAlpha - dt * 4, 0)
    end




    updateLapTimes()



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



    updateMusicPlayers(dt)


    local muteKeyState = ac.isKeyDown(ac.KeyIndex.M)
    if muteKeyState and lastMuteKeyState ~= muteKeyState then
        muteToggle = not muteToggle

        lastMuteKeyState = muteKeyState
    elseif not muteKeyState then
        lastMuteKeyState = false

    end
    




    timePassed = timePassed + dt
    ac.debug('time passed', timePassed)
    collisionTimer = collisionTimer - dt
    offRoadTimer = offRoadTimer - dt


end


local beginraceflag = 0
local checkpt1flag = 0
local checkpt2flag = 0
local checkpt3flag = 0
local checkpt4flag = 0
local finishflag = 0
local finishflagnothighscore = 0
local finishflaghighscore = 0
local headerflag = 0

local UIToggle = true
local LastKeyState = false




local totaltime_xpos = 0.9*uiState.windowSize.x - 8*font_sizex

local minutes10s_xpos = totaltime_xpos + 1*font_sizex
local minutes_xpos = minutes10s_xpos + font_sizex

local seconds10s_xpos = minutes_xpos + 2*font_sizex
local seconds_xpos = seconds10s_xpos + font_sizex

local subseconds_xpos = seconds_xpos + 2*font_sizex





-- Helper function to draw header (score, PB)
local function drawHeader(headerflag, totalScore, currentCarPB, font_sizex, font_sizey)
    ui.beginTransparentWindow('overtakeScore1', vec2(uiState.windowSize.x * 0.1, font_sizey*2), vec2(400, 400), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, headerflag)
    ui.drawImage(scoreLabel,
        vec2(-font_sizex, 0),
        vec2(font_sizex * 6, font_sizey * 1.5),
        rgbm.colors.white)
    ui.popStyleVar()
    ui.endTransparentWindow()

    ui.beginTransparentWindow('overtakeScore2', vec2(uiState.windowSize.x * 0.1, font_sizey*3.5), vec2(2000, 2000), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, headerflag)
    local spacing = font_sizex * -0.45
    drawNumber(totalScore, 10, 0, font_sizex * 1.2, font_sizey * 1.5, spacing)
    ui.popStyleVar()
    ui.endTransparentWindow()

    ui.beginTransparentWindow('overtakeScorePB', vec2(uiState.windowSize.x * 0.1, font_sizey*4.75), vec2(2000, 2000), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, headerflag)
    local digitWidth = font_sizex * 0.7
    local digitHeight = font_sizey * 1.0
    local spacing = font_sizex * - 0.275
    local currentX = 0
    local pbWidth = font_sizex * 2
    ui.drawImage(pbImg,
        vec2(currentX, -5),
        vec2(currentX + pbWidth, digitHeight*1.2),
        rgbm.colors.white)
    currentX = currentX + pbWidth
    local numStr = tostring(math.ceil(currentCarPB))
    for i = 1, #numStr do
        local digit = tonumber(numStr:sub(i, i))
        local xPos = currentX + (i-1) * (digitWidth + spacing)
        ui.drawImage(digitImages[digit],
            vec2(xPos, 0),
            vec2(xPos + digitWidth, digitHeight),
            rgbm.colors.white)
    end
    ui.popStyleVar()
    ui.endTransparentWindow()
end

-- Helper function to draw drift meter and warning light
local function drawDriftMeterAndWarning(driftMeterAlpha, warningLightAlpha, driftTimer, driftMeterMax, font_sizex, font_sizey)
    if driftMeterAlpha > 0 then
        ui.beginTransparentWindow('driftMeterWindow', 
            vec2(uiState.windowSize.x * 0.6, uiState.windowSize.y * 0.5),
            vec2(600, 100), false)
        
        ui.pushStyleVar(ui.StyleVar.Alpha, driftMeterAlpha)
        
        ui.drawImage(driftLabel,
            vec2(0, 0),
            vec2(font_sizex * 8, font_sizey * 2.5),
            rgbm.colors.white)
        
        driftMeter(ui.getCursor() + vec2(font_sizex * 6, 40), driftTimer, driftMeterMax, font_sizex*5, font_sizey*0.75)
        
        local driftImg = nil
        if driftTimer > 4.0 then
            driftImg = drift1000xImg
        elseif driftTimer > 2.0 then
            driftImg = drift100xImg
        elseif driftTimer > 0.0 then
            driftImg = drift10xImg
        end

        if driftImg then
            ui.drawImage(driftImg,
                vec2(font_sizex*7, 0),
                vec2(font_sizex*11, font_sizey*1.5),
                rgbm.colors.white)
        end

        ui.popStyleVar()
        ui.endTransparentWindow()
    end

    -- Warning Light
    if warningLightAlpha > 0.01 then
        ui.beginTransparentWindow('warningLightWindow', 
            vec2(uiState.windowSize.x * 0.6, uiState.windowSize.y * 0.5),
            vec2(600, 100), false)
        
        ui.pushStyleVar(ui.StyleVar.Alpha, warningLightAlpha)
        
        local warningSize = font_sizex * 6
        ui.drawImage(warningLightImg,
            vec2(0, font_sizey * 0.5),
            vec2(warningSize, font_sizey * 0.5 + warningSize),
            rgbm.colors.white)
        
        ui.popStyleVar()
        ui.endTransparentWindow()
    end
end





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
        -- updateMessages(uiState.dt)
        updateOvertakeMessages(uiState.dt)

        local requiredSpeed = 100 
        local speedRelative = math.saturate(math.floor(ac.getCarState(1).speedKmh) / requiredSpeed)
        local colorDark = rgbm(0.4, 0.4, 0.4, 1)
        local colorGrey = rgbm(0.7, 0.7, 0.7, 1)
        -- local colorAccent = rgbm(1.0, 0.0, 1.0, 1)   -- rgbm.new(hsv(speedRelative * 120, 1, 1):rgb(), 1)
        local colorAccent = rgbm.new(hsv(speedRelative * 120, 1, 1):rgb(), 1)


        local function progressMeter(ref, prevCheckptPos, checkptPos, meterWidth, meterHeight)
            local player = ac.getCarState(1)
            local fillAmount = math.lerpInvSat(player.splinePosition, prevCheckptPos, checkptPos)
            -- local meterWidth = 200
            -- local meterHeight = 30
            
            -- Background
            ui.drawRectFilled(ref, ref + vec2(meterWidth, meterHeight), colorDark, 3)
            
            -- Border
            ui.drawRect(ref, ref + vec2(meterWidth, meterHeight), colorGrey, 3, 2)
            
            -- Fill bar
            if fillAmount > 0 then
                ui.drawRectFilled(ref + vec2(2, 2), 
                                ref + vec2((meterWidth - 4) * fillAmount, meterHeight - 2), 
                                colorAccent, 2)
            end
        end



        local function driftMeter(ref, driftTime, maxTime, meterWidth, meterHeight)
            local fillAmount = math.min(driftTime / maxTime, 1.0)
            -- local meterWidth = 200
            -- local meterHeight = 30
            
            -- Background
            ui.drawRectFilled(ref, ref + vec2(meterWidth, meterHeight), rgbm(0.2, 0.2, 0.2, 0.8), 3)
            
            -- Border
            ui.drawRect(ref, ref + vec2(meterWidth, meterHeight), rgbm(0.7, 0.7, 0.7, 1), 3, 2)
            
            -- Fill bar with color gradient based on progress
            if fillAmount > 0 then
                local barColor
                if fillAmount < 0.33 then
                    barColor = rgbm(0.2, 1.0, 0.2, 1)  -- Green
                elseif fillAmount < 0.66 then
                    barColor = rgbm(1.0, 1.0, 0.2, 1)  -- Yellow
                elseif fillAmount < 1 then
                    barColor = rgbm(1.0, 0.2, 0.2, 1)  -- Red/Hot
                else
                    barColor = rgbm(1.0, 0.0, 1.0, 1) -- I want bright purple here
                end
                
                ui.drawRectFilled(ref + vec2(2, 2), 
                                ref + vec2((meterWidth - 4) * fillAmount, meterHeight - 2), 
                                barColor, 2)
            end

        end



 
        local function drawDriftMeterWindow()
            if driftMeterAlpha > 0 then
                ui.beginTransparentWindow('driftMeterWindow', 
                    vec2(uiState.windowSize.x * 0.6, uiState.windowSize.y * 0.5),
                    vec2(600, 100), false)
                
                ui.pushStyleVar(ui.StyleVar.Alpha, driftMeterAlpha)
                
                ui.drawImage(driftLabel,
                    vec2(0, 0),
                    vec2(font_sizex * 8, font_sizey * 2.5),
                    rgbm.colors.white)
                
                driftMeter(ui.getCursor() + vec2(font_sizex * 6, 40), driftTimer, driftMeterMax, font_sizex*5, font_sizey*0.75)
                
                local driftImg = nil
                if driftTimer > 4.0 then
                    driftImg = drift1000xImg
                elseif driftTimer > 2.0 then
                    driftImg = drift100xImg
                elseif driftTimer > 0.0 then
                    driftImg = drift10xImg
                end

                if driftImg then
                    ui.drawImage(driftImg,
                        vec2(font_sizex*7, 0),
                        vec2(font_sizex*11, font_sizey*1.5),
                        rgbm.colors.white)
                end

                ui.popStyleVar()
                ui.endTransparentWindow()
            end
            
            -- Warning Light
            if warningLightAlpha > 0.01 then
                ui.beginTransparentWindow('warningLightWindow', 
                    vec2(uiState.windowSize.x * 0.6, uiState.windowSize.y * 0.5),
                    vec2(600, uiState.windowSize.y*0.25), false)
                
                ui.pushStyleVar(ui.StyleVar.Alpha, warningLightAlpha)
                
                local warningSize = font_sizex * 6
                ui.drawImage(warningLightImg,
                    vec2(0, font_sizey * 0.5),
                    vec2(warningSize, font_sizey * 0.5 + warningSize),
                    rgbm.colors.white)
                
                ui.popStyleVar()
                ui.endTransparentWindow()
            end
        end





        local player = ac.getCarState(1)

        ui.drawImage('https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/cruisin-ac-logo.png', vec2(-0.05, font_sizey*2), vec2(uiState.windowSize.x * 0.15, font_sizey*5), rgbm.colors.white, vec2(0,0), vec2(1,1), ui.ImageFit.Fit)
        


        headerflag = math.applyLag(headerflag, player.splinePosition < finishpos and 1 or 0, 0.1, uiState.dt)

        drawHeader(headerflag, totalScore, currentCarPB, font_sizex, font_sizey)


 

        ui.beginTransparentWindow('overtakeMessageWindow', vec2(uiState.windowSize.x * 0.1, font_sizey * 6), vec2(font_sizex*20, font_sizey*8), false)

        for i = 1, #overtakeMessages do
            local m = overtakeMessages[i]
            local yPos = (font_sizey * 6) 
            local finalX = m.xOffset
            local finalY = yPos + m.yOffset
            
            if m.isStageBonus then
                -- Draw "STAGE BONUS + " text
                ui.drawImage(m.image,
                    vec2(finalX, finalY),
                    vec2(finalX + font_sizex*12, finalY + font_sizey*2),  -- Stage bonus text dimensions
                    rgbm(1, 1, 1, m.alpha))

                -- DEBUG
                ac.debug("Stage Bonus Points String", m.bonusPoints)
                ac.debug("Number of digits", #m.bonusPoints)
                
                -- Draw the number digits after the text
                local digitStartX = finalX + (font_sizex * 10)  -- Start after the text
                local digitWidth = font_sizex * 1.6
                local digitHeight = font_sizey * 2
                local digitSpacing = font_sizex * -1  -- Negative for tighter spacing

                ac.debug("Digit start X", digitStartX)  -- DEBUG
                
                for j = 1, #m.bonusPoints do
                    local digit = tonumber(m.bonusPoints:sub(j, j))
                    local digitX = digitStartX + (j - 1) * (digitWidth + digitSpacing)

                    ac.debug("Drawing digit " .. j, digit .. " at X=" .. digitX)  -- DEBUG
                    
                    ui.drawImage(stageBonusDigits[digit],
                        vec2(digitX, finalY),
                        vec2(digitX + digitWidth, finalY + digitHeight),
                        rgbm(1, 1, 1, m.alpha))
                end
            else
                -- Regular overtake message
                ui.drawImage(m.image,
                    vec2(finalX, finalY),
                    vec2(finalX + font_sizex*12, finalY + font_sizey*2),
                    rgbm(1, 1, 1, m.alpha))
            end
        end

        ui.endTransparentWindow()




        local progress_loc = vec2(-270, 60)
        local final_prog_loc = vec2((-270)-4*font_sizex, 60)
        ui.beginTransparentWindow('progressWindow', vec2(uiState.windowSize.x * 0.78, uiState.windowSize.y * 0.8), vec2(2000, 1400), false)
        -- ui.beginOutline()

        ui.setCursor(0 + vec2(0, 4 * 30))

        ui.setCursorY(0)

        local progMeterLength = font_sizex*6
        local progMeterHeight = font_sizey*0.75

        if raceBegin and not checkpoint1 then
            ui.drawImage(stage1Label,
                vec2(0, 0),
                vec2(font_sizex * 8, font_sizey * 2),
                rgbm.colors.white)
            progressMeter(ui.getCursor() + vec2(font_sizex * 2, font_sizey * 2), gameStartPos, checkpt1pos, progMeterLength, progMeterHeight) 
        end



        if checkpoint1 and not checkpoint2 then
            ui.drawImage(stage2Label,
                vec2(0, 0),
                vec2(font_sizex * 8, font_sizey * 2),
                rgbm.colors.white)
            progressMeter(ui.getCursor() + vec2(font_sizex * 2, font_sizey * 2), checkpt1pos, checkpt2pos, progMeterLength, progMeterHeight)
        end



        if checkpoint2 and not checkpoint3 then
            ui.drawImage(stage3Label,
                vec2(0, 0),
                vec2(font_sizex * 8, font_sizey * 2),
                rgbm.colors.white)
            progressMeter(ui.getCursor() + vec2(font_sizex * 2, font_sizey * 2), checkpt2pos, checkpt3pos, progMeterLength, progMeterHeight)
        end



        if checkpoint3 and not checkpoint10 then
        -- if not raceBegin then
            ui.drawImage(finalStageLabel,
                vec2(0, 0),
                vec2(font_sizex * 8, font_sizey * 2),
                rgbm.colors.white)
            progressMeter(ui.getCursor() + vec2(font_sizex * 2, font_sizey * 2), checkpt3pos, finishpos, progMeterLength, progMeterHeight)
        end


        -- ui.popFont()

        ui.endTransparentWindow()


        -- drawDriftMeterAndWarning(driftMeterAlpha, warningLightAlpha, driftTimer, driftMeterMax, font_sizex, font_sizey)
        drawDriftMeterWindow() 
        



        ui.beginTransparentWindow("countDownTimer", vec2((uiState.windowSize.x*0.5)-(3*font_sizex), font_sizey*2), vec2(400, 400), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, headerflag)
        ui.drawImage(timeLabel,
            vec2(0, 0),
            vec2(font_sizex * 6, font_sizey * 1.5),
            rgbm.colors.white)
        ui.popStyleVar()
        ui.endTransparentWindow()        


        ui.beginTransparentWindow('countDownTime', vec2((uiState.windowSize.x*0.5) - (2*font_sizex), font_sizey*3.5), vec2(400, 400), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, headerflag)
        local currentNumber = math.abs(math.ceil(countDown))

        -- Split into two digits
        local tensDigit = math.floor(currentNumber / 10)
        local onesDigit = currentNumber % 10

        local digitWidth = font_sizex * 4
        local digitHeight = 4*font_sizey 
        local digitGap = 0.5  -- Adjust this: 1.0 = touching, 0.8 = slight overlap, 0.5 = lots of overlap

        -- Draw tens digit (if countdown is 10 or more)
        if currentNumber >= 10 then
            ui.drawImage(countdownNumbers[tensDigit],
                vec2(0, 0),
                vec2(digitWidth, digitHeight),
                rgbm.colors.white)
            
            -- Draw ones digit next to it
            ui.drawImage(countdownNumbers[onesDigit],
                vec2(digitWidth * digitGap, 0),
                vec2(digitWidth * digitGap + digitWidth, digitHeight),
                rgbm.colors.white)
        else
            -- Single digit - center it
            ui.drawImage(countdownNumbers[onesDigit],
                vec2(0, 0),
                vec2(digitWidth, digitHeight),
                rgbm.colors.white)
        end
        ui.popStyleVar()
        ui.endTransparentWindow()



        local checkptflagdist = 0.005
        
        beginraceflag = math.applyLag(beginraceflag, player.splinePosition > gameStartPos and player.splinePosition < gameStartPos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        checkpt1flag = math.applyLag(checkpt1flag, player.splinePosition > checkpt1pos and player.splinePosition < checkpt1pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        checkpt2flag = math.applyLag(checkpt2flag, player.splinePosition > checkpt2pos and player.splinePosition < checkpt2pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        checkpt3flag = math.applyLag(checkpt3flag, player.splinePosition > checkpt3pos and player.splinePosition < checkpt3pos + checkptflagdist and 1 or 0, 0.1, uiState.dt)
        finishflag = math.applyLag(finishflag, player.splinePosition >= finishpos and 1 or 0, 0.1, uiState.dt)
        -- finishflag = math.applyLag(finishflag, player.splinePosition < gameStartPos and 1 or 0, 0.1, uiState.dt)
        finishflagnothighscore = math.applyLag(finishflagnothighscore, player.splinePosition >=finishpos and nothighScoreChatMsgSent == true and 1 or 0, 0.1, uiState.dt)
        finishflaghighscore = math.applyLag(finishflaghighscore, player.splinePosition >= finishpos and highScoreChatMsgSent == true and 1 or 0, 0.1, uiState.dt)

        ac.debug("not high score chat message sent? ", nothighScoreChatMsgSent)
        ac.debug("finish flag not high score state ", finishflagnothighscore)
        ac.debug("high score chat message sent? ", highScoreChatMsgSent)
        ac.debug("finish flag high score state ", finishflaghighscore)

        -- local checkpointcolor = rgbm(0.8, 0.2, 0.8, 1)
        local checkpointcolor = rgbm(1.0, 0.0, 0.0, 1)
        local extendplaycolor = rgbm(1.0, 0, 0, 1)

       local checkpt_windowx_scale = 6*bigfont_sizex
       local checkpt_windowy_scale = 6*bigfont_sizey
       local extendplay_windowx_scale = 6.5*bigfont_sizex
       local extendplay_windowy_scale = 6.5*bigfont_sizey
       local laptime_windowx_scale = 4*font_sizex
       local laptime_windowy_scale = 5*bigfont_sizey


        ui.beginTransparentWindow("beginRaceWindow", vec2(uiState.windowSize.x * 0.5 - 6*bigfont_sizex, uiState.windowSize.y * 0.5 - 5*bigfont_sizey), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, beginraceflag)
        -- ui.pushACFont("650S_big")
        -- ui.acText('Let\'s Go!', big_fontsize, 0, rgbm(1.0, 1.0, 0.0, 1.0))
        ui.drawImage(letsGoLabel,
            vec2(0, 0),
            vec2(extendplay_windowx_scale * 2, extendplay_windowy_scale * 0.4),
            rgbm.colors.white)
        -- ui.popACFont()
        ui.popStyleVar()
        ui.endTransparentWindow()



        ui.beginTransparentWindow("extendPlay1Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        -- ui.pushStyleVar(ui.StyleVar.Alpha, checkpt1flag)
        ui.pushStyleVar(ui.StyleVar.Alpha, extendPlay1Alpha)
        ui.drawImage(extendPlayImg,
            vec2(0, 0),
            vec2(extendplay_windowx_scale * 2, extendplay_windowy_scale * 0.4),
            rgbm.colors.white)
        ui.popStyleVar()
        ui.endTransparentWindow()


        local digitWidth = font_sizex * 1.2
        local digitHeight = font_sizey * 1.5
        -- local spacing = -15
        -- local quoteSpacing = 10
        local spacing = font_sizex * -0.45
        local quoteSpacing = font_sizex * 0.30


        ui.beginTransparentWindow("lap1Window", vec2(uiState.windowSize.x * 0.5 - 0.8*laptime_windowx_scale, uiState.windowSize.y * 0.55-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, lap1Alpha)

        local currentX = 0
        -- Draw minutes (at least 1 digit, or 2 if >= 10)
        local minDigits = lap1mins >= 10 and 2 or 1
        currentX = drawDigits(lap1mins, currentX, 0, digitWidth, digitHeight, spacing, minDigits)

        -- Add extra space before single quote
        currentX = currentX + quoteSpacing

        -- Draw single quote (')
        ui.drawImage(singleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing
        currentX = currentX + quoteSpacing

        -- Draw seconds (always 2 digits)
        currentX = drawDigits(lap1secs, currentX, 0, digitWidth, digitHeight, spacing, 2)

        currentX = currentX + quoteSpacing

        -- Draw double quote (")
        ui.drawImage(doubleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing
        currentX = currentX + quoteSpacing

        -- Draw subseconds (always 3 digits to match total time)
        local subsecStr = string.sub(string.format("%.3f", lap1subsecs), -3, -1)
        drawDigits(tonumber(subsecStr), currentX, 0, digitWidth, digitHeight, spacing, 3)

        ui.popStyleVar()
        ui.endTransparentWindow()


        ui.beginTransparentWindow("extendPlay2Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        -- ui.pushStyleVar(ui.StyleVar.Alpha, checkpt2flag)
        ui.pushStyleVar(ui.StyleVar.Alpha, extendPlay2Alpha)
        ui.drawImage(extendPlayImg,
            vec2(0, 0),
            vec2(extendplay_windowx_scale * 2, extendplay_windowy_scale * 0.4),
            rgbm.colors.white)
        ui.popStyleVar()
        ui.endTransparentWindow()


        ui.beginTransparentWindow("lap2Window", vec2(uiState.windowSize.x * 0.5 - 0.8*laptime_windowx_scale, uiState.windowSize.y * 0.55-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, lap2Alpha)
        local currentX = 0
        -- Draw minutes (at least 1 digit, or 2 if >= 10)
        local minDigits = lap2mins >= 10 and 2 or 1
        currentX = drawDigits(lap2mins, currentX, 0, digitWidth, digitHeight, spacing, minDigits)

        -- Add extra space before single quote
        currentX = currentX + quoteSpacing

        -- Draw single quote (')
        ui.drawImage(singleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing
        currentX = currentX + quoteSpacing

        -- Draw seconds (always 2 digits)
        currentX = drawDigits(lap2secs, currentX, 0, digitWidth, digitHeight, spacing, 2)

        currentX = currentX + quoteSpacing

        -- Draw double quote (")
        ui.drawImage(doubleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing
        currentX = currentX + quoteSpacing

        -- Draw subseconds (always 3 digits to match total time)
        local subsecStr = string.sub(string.format("%.3f", lap2subsecs), -3, -1)
        drawDigits(tonumber(subsecStr), currentX, 0, digitWidth, digitHeight, spacing, 3)

        ui.popStyleVar()
        ui.endTransparentWindow()


        ui.beginTransparentWindow("extendPlay3Window", vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, uiState.windowSize.y * 0.5-extendplay_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, extendPlay3Alpha)
        ui.drawImage(extendPlayImg,
            vec2(0, 0),
            vec2(extendplay_windowx_scale * 2, extendplay_windowy_scale * 0.4),
            rgbm.colors.white)
        ui.popStyleVar()
        ui.endTransparentWindow()



        ui.beginTransparentWindow("lap3Window", vec2(uiState.windowSize.x * 0.5 - 0.8*laptime_windowx_scale, uiState.windowSize.y * 0.55-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, lap3Alpha)
        local currentX = 0
        -- Draw minutes (at least 1 digit, or 2 if >= 10)
        local minDigits = lap3mins >= 10 and 2 or 1
        currentX = drawDigits(lap3mins, currentX, 0, digitWidth, digitHeight, spacing, minDigits)

        -- Add extra space before single quote
        currentX = currentX + quoteSpacing

        -- Draw single quote (')
        ui.drawImage(singleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing
        currentX = currentX + quoteSpacing

        -- Draw seconds (always 2 digits)
        currentX = drawDigits(lap3secs, currentX, 0, digitWidth, digitHeight, spacing, 2)

        currentX = currentX + quoteSpacing

        -- Draw double quote (")
        ui.drawImage(doubleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing
        currentX = currentX + quoteSpacing

        -- Draw subseconds (always 3 digits to match total time)
        local subsecStr = string.sub(string.format("%.3f", lap3subsecs), -3, -1)
        drawDigits(tonumber(subsecStr), currentX, 0, digitWidth, digitHeight, spacing, 3)

        ui.popStyleVar()
        ui.endTransparentWindow()




        ui.beginTransparentWindow("finishRaceWindow", vec2(uiState.windowSize.x * 0.5 - 5*bigfont_sizex, uiState.windowSize.y * 0.45 - extendplay_windowy_scale), vec2(2000, 500), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, finishflag)
        ui.drawImage(goalLabel,
            vec2(0, 0),
            vec2(10*bigfont_sizex, 2.5*bigfont_sizey),
            rgbm.colors.white)
        ui.popStyleVar()
        ui.endTransparentWindow()


        ui.beginTransparentWindow("lap1Window", vec2(uiState.windowSize.x * 0.5 - 2*laptime_windowx_scale, uiState.windowSize.y * 0.55-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, finishflag)

        -- Draw "STAGE 1:" label
        ui.drawImage(stage1Label,
            vec2(0, 0),
            vec2(font_sizex * 8, font_sizey * 2),
            rgbm.colors.white)

        -- ui.sameLine(font_sizex * 16)

        local currentX = font_sizex * 8
        -- Draw minutes (at least 1 digit, or 2 if >= 10)
        local minDigits = lap1mins >= 10 and 2 or 1
        currentX = drawDigits(lap1mins, currentX, 0, digitWidth, digitHeight, spacing, minDigits)

        -- Add extra space before single quote
        currentX = currentX + quoteSpacing

        -- Draw single quote (')
        ui.drawImage(singleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing
        currentX = currentX + quoteSpacing

        -- Draw seconds (always 2 digits)
        currentX = drawDigits(lap1secs, currentX, 0, digitWidth, digitHeight, spacing, 2)

        currentX = currentX + quoteSpacing

        -- Draw double quote (")
        ui.drawImage(doubleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing
        currentX = currentX + quoteSpacing

        -- Draw subseconds (always 3 digits to match total time)
        local subsecStr = string.sub(string.format("%.3f", lap1subsecs), -3, -1)
        drawDigits(tonumber(subsecStr), currentX, 0, digitWidth, digitHeight, spacing, 3)

        ui.popStyleVar()
        ui.endTransparentWindow()


        ui.beginTransparentWindow("lap2Window", vec2(uiState.windowSize.x * 0.5 - 2*laptime_windowx_scale, uiState.windowSize.y * 0.65-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, finishflag)

        ui.drawImage(stage2Label,
            vec2(0, 0),
            vec2(font_sizex * 8, font_sizey * 2),
            rgbm.colors.white)

        -- ui.sameLine(font_sizex * 16)

        local currentX = font_sizex * 8
        -- local currentX = 0
        -- Draw minutes (at least 1 digit, or 2 if >= 10)
        local minDigits = lap2mins >= 10 and 2 or 1
        currentX = drawDigits(lap2mins, currentX, 0, digitWidth, digitHeight, spacing, minDigits)

        -- Add extra space before single quote
        currentX = currentX + quoteSpacing

        -- Draw single quote (')
        ui.drawImage(singleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing
        currentX = currentX + quoteSpacing

        -- Draw seconds (always 2 digits)
        currentX = drawDigits(lap2secs, currentX, 0, digitWidth, digitHeight, spacing, 2)

        currentX = currentX + quoteSpacing

        -- Draw double quote (")
        ui.drawImage(doubleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing
        currentX = currentX + quoteSpacing

        -- Draw subseconds (always 3 digits to match total time)
        local subsecStr = string.sub(string.format("%.3f", lap2subsecs), -3, -1)
        drawDigits(tonumber(subsecStr), currentX, 0, digitWidth, digitHeight, spacing, 3)

        ui.popStyleVar()
        ui.endTransparentWindow()        



        ui.beginTransparentWindow("lap3Window", vec2(uiState.windowSize.x * 0.5 - 2*laptime_windowx_scale, uiState.windowSize.y * 0.75-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, finishflag)

        ui.drawImage(stage3Label,
            vec2(0, 0),
            vec2(font_sizex * 8, font_sizey * 2),
            rgbm.colors.white)

        -- ui.sameLine(font_sizex * 16)
        local currentX = font_sizex * 8
        -- local currentX = 0
        -- Draw minutes (at least 1 digit, or 2 if >= 10)
        local minDigits = lap3mins >= 10 and 2 or 1
        currentX = drawDigits(lap3mins, currentX, 0, digitWidth, digitHeight, spacing, minDigits)

        -- Add extra space before single quote
        currentX = currentX + quoteSpacing

        -- Draw single quote (')
        ui.drawImage(singleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing
        currentX = currentX + quoteSpacing

        -- Draw seconds (always 2 digits)
        currentX = drawDigits(lap3secs, currentX, 0, digitWidth, digitHeight, spacing, 2)

        currentX = currentX + quoteSpacing

        -- Draw double quote (")
        ui.drawImage(doubleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing
        currentX = currentX + quoteSpacing

        -- Draw subseconds (always 3 digits to match total time)
        local subsecStr = string.sub(string.format("%.3f", lap3subsecs), -3, -1)
        drawDigits(tonumber(subsecStr), currentX, 0, digitWidth, digitHeight, spacing, 3)

        ui.popStyleVar()
        ui.endTransparentWindow()



        ui.beginTransparentWindow("lap10Window", vec2(uiState.windowSize.x * 0.5 - 2*laptime_windowx_scale, uiState.windowSize.y * 0.85-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, finishflag)

        ui.drawImage(stage4Label,
            vec2(0, 0),
            vec2(font_sizex * 8, font_sizey * 2),
            rgbm.colors.white)

        -- ui.sameLine(font_sizex * 8 + 20)
        local currentX = font_sizex * 8
        -- local currentX = 0
        -- Draw minutes (at least 1 digit, or 2 if >= 10)
        local minDigits = lap10mins >= 10 and 2 or 1
        currentX = drawDigits(lap10mins, currentX, 0, digitWidth, digitHeight, spacing, minDigits)

        -- Add extra space before single quote
        currentX = currentX + quoteSpacing

        -- Draw single quote (')
        ui.drawImage(singleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing
        currentX = currentX + quoteSpacing

        -- Draw seconds (always 2 digits)
        currentX = drawDigits(lap10secs, currentX, 0, digitWidth, digitHeight, spacing, 2)

        currentX = currentX + quoteSpacing

        -- Draw double quote (")
        ui.drawImage(doubleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing
        currentX = currentX + quoteSpacing

        -- Draw subseconds (always 3 digits to match total time)
        local subsecStr = string.sub(string.format("%.3f", lap10subsecs), -3, -1)
        drawDigits(tonumber(subsecStr), currentX, 0, digitWidth, digitHeight, spacing, 3)

        ui.popStyleVar()
        ui.endTransparentWindow()



        ui.beginTransparentWindow("FinalTotalTimeWindow", vec2(uiState.windowSize.x * 0.5 - 4*laptime_windowx_scale, uiState.windowSize.y * 0.95-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, finishflag)

        ui.drawImage(totalTimeMetalLabel,
            vec2(0, 0),
            vec2(extendplay_windowx_scale * 1.75, extendplay_windowy_scale * 0.4),
            rgbm.colors.white)

        local currentX = extendplay_windowx_scale * 1.475
        local currentY = digitHeight * 1
        -- Draw minutes (at least 1 digit, or 2 if >= 10)
        local minDigits = minutesTime >= 10 and 2 or 1
        currentX = drawDigits(minutesTime, currentX, currentY, digitWidth, digitHeight, spacing, minDigits)

        -- Add extra space before single quote
        currentX = currentX + quoteSpacing

        -- Draw single quote (')
        ui.drawImage(singleQuoteImg,
            vec2(currentX, currentY),
            vec2(currentX + digitWidth * 0.5, 2 * digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing

        currentX = currentX + quoteSpacing

        -- Draw seconds (always 2 digits)
        currentX = drawDigits(secondsTime, currentX, currentY, digitWidth, digitHeight, spacing, 2)

        currentX = currentX + quoteSpacing

        -- Draw double quote (")
        ui.drawImage(doubleQuoteImg,
            vec2(currentX, currentY), 
            vec2(currentX + digitWidth * 0.5, 2 * digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing

        currentX = currentX + quoteSpacing

        -- Draw subseconds (always 3 digits)
        local subsecStr = string.sub(string.format("%.3f", subSeconds), -3, -1)
        drawDigits(tonumber(subsecStr), currentX, currentY, digitWidth, digitHeight, spacing, 3)
            
        ui.popStyleVar()
        ui.endTransparentWindow()



        ui.beginTransparentWindow("FinalScoreWindow", vec2(uiState.windowSize.x * 0.5 - 4.38*laptime_windowx_scale, uiState.windowSize.y * 1.05-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, finishflagnothighscore)
        ui.drawImage(finalScoreMetalLabel,
            vec2(0, 0),
            vec2(extendplay_windowx_scale * 1.95, extendplay_windowy_scale * 0.4),
            rgbm.colors.white)
        ui.popStyleVar()
        ui.endTransparentWindow()

        -- ac.debug("not high score chat message sent? ", nothighScoreChatMsgSent)

        ui.beginTransparentWindow("NewHighScoreWindow", vec2(uiState.windowSize.x * 0.5 - 5.9*laptime_windowx_scale, uiState.windowSize.y * 1.045-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, finishflaghighscore)
        ui.drawImage(newHighScoreLabel,
            vec2(0, 0),
            vec2(extendplay_windowx_scale * 2.75, extendplay_windowy_scale * 0.45),
            rgbm.colors.white)
        ui.popStyleVar()
        ui.endTransparentWindow()



        ui.beginTransparentWindow('FinalScoreNumberWindow', vec2(uiState.windowSize.x * 0.5 - 0.08*laptime_windowx_scale, uiState.windowSize.y * 1.1-laptime_windowy_scale), vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, finishflag)
        drawNumber(totalScore, 10, 0, font_sizex * 1.2, font_sizey * 1.5, -15)
        ui.popStyleVar()
        ui.endTransparentWindow()
        


        ui.beginTransparentWindow("gameOverWindow", vec2(uiState.windowSize.x * 0.5 - 7*bigfont_sizex, uiState.windowSize.y * 0.5 - 2*bigfont_sizey), vec2(2000, 2000), false)
        -- ui.beginOutline()
        ui.pushStyleVar(ui.StyleVar.Alpha, gameOverMessage)
        -- ui.pushACFont("650S_big")
        -- ui.acText('GAME OVER!', big_fontsize, 0, rgbm(1.0, 0, 0, 1))
        -- ui.popACFont()
        ui.drawImage(gameOverLabel,
            vec2(0, 0),
            -- vec2(10*bigfont_sizex, 2.5*bigfont_sizey),
            vec2(extendplay_windowx_scale * 2, extendplay_windowy_scale * 0.4),
            rgbm.colors.white)
        ui.popStyleVar()
        ui.endTransparentWindow()




        ui.beginTransparentWindow("totalTimeWindow", vec2(totaltime_xpos, font_sizey*2), vec2(800, 400), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, headerflag)
        ui.drawImage(totalTimeLabel,
            vec2(0, 0),
            vec2(font_sizex * 6, font_sizey * 1.5),
            rgbm.colors.white)
        ui.popStyleVar()
        ui.endTransparentWindow()

        -- Draw the time in format: MM ' SS " HH
        ui.beginTransparentWindow("totalTimeDisplay", vec2(minutes10s_xpos, font_sizey*3.5), vec2(1000, 400), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, headerflag)
        local digitWidth = font_sizex * 1.2
        local digitHeight = font_sizey * 1.5
        local spacing = font_sizex * -0.45 -- -15
        -- ac.debug("spacing size", spacing)
        local quoteSpacing = font_sizex * 0.30

        local currentX = 0

        -- Draw minutes (at least 1 digit, or 2 if >= 10)
        local minDigits = minutesTime >= 10 and 2 or 1
        currentX = drawDigits(minutesTime, currentX, 0, digitWidth, digitHeight, spacing, minDigits)

        -- Add extra space before single quote
        currentX = currentX + quoteSpacing

        -- Draw single quote (')
        ui.drawImage(singleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing

        currentX = currentX + quoteSpacing

        -- Draw seconds (always 2 digits)
        currentX = drawDigits(secondsTime, currentX, 0, digitWidth, digitHeight, spacing, 2)

        currentX = currentX + quoteSpacing

        -- Draw double quote (")
        ui.drawImage(doubleQuoteImg,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing

        currentX = currentX + quoteSpacing

        -- Draw subseconds (always 3 digits)
        local subsecStr = string.sub(string.format("%.3f", subSeconds), -3, -1)
        drawDigits(tonumber(subsecStr), currentX, 0, digitWidth, digitHeight, spacing, 3)
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



