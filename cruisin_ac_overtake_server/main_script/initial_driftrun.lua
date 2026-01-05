 -- ============================================================================
-- CONSOLIDATED ASSET URLS
-- ============================================================================
local assets = {
    music = {
        outrun = {
            splashWave = 'https://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tribute to OutRun - 03 Splashwave.mp3',
            magicalSoundShower = 'https://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tribute to OutRun - 01 Magical Sound Shower.mp3',
            passingBreeze = 'https://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tribute to OutRun - 02 Passing Breeze.mp3',
            lastWave = 'https://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tribute to OutRun - 04 Last Wave.mp3'
        },
        tokyo = {
            tokyoTurbo = 'https://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 01 Tokyo Turbo.mp3',
            wanganLegends = 'https://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 02 Wangan Legends.mp3',
            theMidNightClub = 'https://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 03 The Mid Night Club.mp3',
            nightRain = 'https://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 04 Night Rain.mp3',
            cloudscapeDriver = 'https://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 05 Cloudscape Driver.mp3',
            tougeDriver = 'https://www.codyblackburn.com/storage/cruisin_ac_music/Wolf and Raven - Tokyo Turbo - 06 Touge Warrior.mp3'
        },
        sfx = {
            letsgo = 'https://www.codyblackburn.com/storage/cruisin_ac_music/cruisinAC_letsGo.mp3',
            checkpoint = 'https://www.codyblackburn.com/storage/cruisin_ac_music/cruisinAC_checkpoint.mp3',
            congrats = 'https://www.codyblackburn.com/storage/cruisin_ac_music/cruisinAC_congratulations.mp3'
        }
    },
    images = {
        baseUrl = 'https://raw.githubusercontent.com/ru57y34nn/cruisin_ac_overtake_server/refs/heads/main/ingame_images/',
        -- Labels
        extendPlay = 'extend_play4.png',
        timeLabel = 'time.png',
        totalTimeLabel = 'total_time.png',
        scoreLabel = 'score.png',
        goalLabel = 'goal_italic.png',
        driftLabel = 'drift.png',
        letsGoLabel = 'lets_go.png',
        gameOverLabel = 'game_over.png',
        singleQuote = 'single_quote.png',
        doubleQuote = 'double_quote.png',
        pbImg = 'pb.png',
        totalTimeMetal = 'total_time_metal.png',
        finalScoreMetal = 'final_score_metal.png',
        newHighScore = 'new_high_score_metal.png',
        warningLight = 'WarningLight.png',
        cruisinLogo = 'cruisin-ac-logo.png',
        -- Stage labels
        stage1 = 'stage_1.png',
        stage2 = 'stage_2.png',
        stage3 = 'stage_3.png',
        stage4 = 'stage_4.png',
        finalStage = 'final_stage.png',
        stageBonusText = 'stage_bonus_text.png',
        passwordUnlock = 'password_unlock_momiji.png',
        -- Drift multipliers
        drift10x = 'drift_10x.png',
        drift100x = 'drift_100x.png',
        drift1000x = 'drift_1000x.png',
        -- Overtake
        overtakeNormal = 'overtake_normal.png',
        overtakeClose = 'overtake_close.png',
        overtakeContact = 'overtake_contact2.png'
    }
}

-- Build full URLs for images
for k, v in pairs(assets.images) do
    if k ~= 'baseUrl' then
        assets.images[k] = assets.images.baseUrl .. v
    end
end

-- Generate countdown number images (0-9)
assets.images.countdownNumbers = {}
for i = 0, 9 do
    assets.images.countdownNumbers[i] = assets.images.baseUrl .. 'countdown_' .. i .. '.png'
end

-- Generate digit images (0-9)
assets.images.digitImages = {}
for i = 0, 9 do
    assets.images.digitImages[i] = assets.images.baseUrl .. 'outrun_' .. i .. '.png'
end

-- Generate stage bonus digits (0-9)
assets.images.stageBonusDigits = {}
for i = 0, 9 do
    assets.images.stageBonusDigits[i] = assets.images.baseUrl .. 'stage_bonus_' .. i .. '.png'
end

-- Note: passwordUnlock image will be set from musicConfig after it's loaded (see line ~240)


-- ============================================================================
-- GAME STATE
-- ============================================================================
local gameState = {
    -- Timing
    countDown = 99,
    countDownTime = 99,
    timePassed = 0,
    totalTimer = 0,
    startTimer = 0,
    collisionTimer = 0,
    offRoadTimer = 0,
    driftTimer = 0,
    musicTimer = 0,
    
    -- Scoring
    totalScore = 0,
    finalScore = 0,
    timeBonus = 0,
    overtakePts = 100000,
    closeOvertakePts = 500000,
    collisionOvertakePts = 25000,
    
    -- Flags
    raceBegin = false,
    checkpoint1 = false,
    checkpoint2 = false,
    checkpoint3 = false,
    checkpoint10 = false,
    gameOverMessage = 0,
    highScoreChatMsgSent = false,
    nothighScoreChatMsgSent = false,
    muteToggle = true,
    lastMuteKeyState = true,
    UIToggle = true,
    LastKeyState = false,
    lastDebugKeyState = false,
    
    -- Password progression
    showPassword = false,
    isNewCarCompletion = false,
    checkedCarCompletion = false,
    debugMode = false,
    
    -- Music
    musicVol = 0.55,
    lastPlayedSong = 10
}


-- ============================================================================
-- LAP TIMES STATE
-- ============================================================================
local lapTimes = {
    -- Lap 1
    lap1time = 0,
    lap1mins = 0,
    lap1secs = 0,
    lap1subsecs = 0,
    
    -- Lap 2
    lap2time = 0,
    lap2mins = 0,
    lap2secs = 0,
    lap2subsecs = 0,
    
    -- Lap 3
    lap3time = 0,
    lap3mins = 0,
    lap3secs = 0,
    lap3subsecs = 0,
    
    -- Lap 4
    lap4time = 0,
    lap4mins = 0,
    lap4secs = 0,
    lap4subsecs = 0,
    
    -- Lap 10 (final)
    lap10time = 0,
    lap10mins = 0,
    lap10secs = 0,
    lap10subsecs = 0,
    
    -- Other
    prevLaptimes = 0
}

-- ============================================================================
-- TRACK POSITIONS
-- ============================================================================

-- Load track configuration from server
local trackConfig = ac.INIConfig.onlineExtras():mapSection('INITIAL_OUTRUN_TRACK_CONFIG', {
    -- Default values if not configured
    GAMESTART_POS = 0,
    CHECKPOINT1_POS = 0,
    CHECKPOINT2_POS = 0,
    CHECKPOINT3_POS = 0,
    FINISH_POS = 0,
    STAGE1_TIME_EXTEND = 0,
    STAGE2_TIME_EXTEND = 0,
    STAGE3_TIME_EXTEND = 0
})
ac.debug('START position: ', trackConfig.GAMESTART_POS)
ac.debug('CHECKPOINT1 position: ', trackConfig.CHECKPOINT1_POS)
ac.debug('CHECKPOINT2 position: ', trackConfig.CHECKPOINT2_POS)
ac.debug('CHECKPOINT3 position: ', trackConfig.CHECKPOINT3_POS)
ac.debug('FINISH position: ', trackConfig.FINISH_POS)
ac.debug('STAGE1 TIME EXTEND: ', trackConfig.STAGE1_TIME_EXTEND)
ac.debug('STAGE2 TIME EXTEND: ', trackConfig.STAGE2_TIME_EXTEND)
ac.debug('STAGE3 TIME EXTEND: ', trackConfig.STAGE3_TIME_EXTEND)

local trackPositions = {
    gameStart = trackConfig.GAMESTART_POS,
    checkpoint1 = trackConfig.CHECKPOINT1_POS,
    checkpoint2 = trackConfig.CHECKPOINT2_POS,
    checkpoint3 = trackConfig.CHECKPOINT3_POS,
    finish = trackConfig.FINISH_POS,
    stage1timeExtend = trackConfig.STAGE1_TIME_EXTEND,
    stage2timeExtend = trackConfig.STAGE2_TIME_EXTEND,
    stage3timeExtend = trackConfig.STAGE3_TIME_EXTEND
}

-- ============================================================================
-- LEVEL CONFIGURATION
-- ============================================================================

-- Load level configuration from server
local levelConfig = ac.INIConfig.onlineExtras():mapSection('INITIAL_OUTRUN_LEVEL_CONFIG', {
    -- Default values if not configured
    CURRENT_LEVEL = 1,
    NEXT_LEVEL = 2,
    NEXT_LEVEL_PASSWORD = 'DRIFT-KING-7734',
    NEXT_LEVEL_SERVER_NAME = 'Level 2 - Akina Downhill',
    PASSWORD_UNLOCK_IMAGE = 'password_unlock.png',
    FIRST_SONG_INDEX = 13,
    LAST_PLAYED_SONG = 10
})
ac.debug('Current Level: ', levelConfig.CURRENT_LEVEL)
ac.debug('Next Level: ', levelConfig.NEXT_LEVEL)
-- ac.debug('Next Level Password: ', levelConfig.NEXT_LEVEL_PASSWORD)
ac.debug('Next Level Server Name: ', levelConfig.NEXT_LEVEL_SERVER_NAME)
ac.debug('Password Unlock Image: ', levelConfig.PASSWORD_UNLOCK_IMAGE)
ac.debug('First Song Index: ', levelConfig.FIRST_SONG_INDEX)
ac.debug('Last Played Song: ', levelConfig.LAST_PLAYED_SONG)

-- Set password unlock image from levelConfig
assets.images.passwordUnlock = assets.images.baseUrl .. levelConfig.PASSWORD_UNLOCK_IMAGE

-- Update gameState music settings from levelConfig
gameState.lastPlayedSong = levelConfig.LAST_PLAYED_SONG

-- ============================================================================
-- UI STATE & ANIMATIONS
-- ============================================================================
local uiState = ac.getUI()

local uiAnimations = {
    -- Warning light
    warningLightAlpha = 0,
    
    -- Drift meter
    driftMeterMax = 4.0,
    driftMeterAlpha = 0,
    
    -- Extend play animations
    extendPlay1 = {
        flashing = false,
        flashTimer = 0,
        alpha = 0,
        flashPhase = 0
    },
    extendPlay2 = {
        flashing = false,
        flashTimer = 0,
        alpha = 0,
        flashPhase = 0
    },
    extendPlay3 = {
        flashing = false,
        flashTimer = 0,
        alpha = 0,
        flashPhase = 0
    },
    
    -- Lap time alphas
    lap1Alpha = 0,
    lap2Alpha = 0,
    lap3Alpha = 0,
    
    flashDuration = 0.75,
    
    -- UI flags for fade effects
    headerflag = 0,
    beginraceflag = 0,
    checkpt1flag = 0,
    checkpt2flag = 0,
    checkpt3flag = 0,
    finishflag = 0,
    finishflagnothighscore = 0,
    finishflaghighscore = 0
}

-- ============================================================================
-- DISPLAY TIME STATE
-- ============================================================================
local displayTime = {
    sec10 = 0,
    min10 = 0,
    min1 = 0,
    secondsTime = 0,
    minutesTime = 0,
    subSeconds = 0
}

-- ============================================================================
-- CAR DATA
-- ============================================================================
local carName = ac.getCarName(0)

local carConfig = ac.INIConfig.onlineExtras():mapSection('INITIAL_OUTRUN_CAR_CONFIG', {
    -- Default values
    CAR_NAMES = 'Toyota AE86 Tuned,Toyota Supra MKIV,Toyota Supra 3.0GT Turbo A,Nissan Skyline GT-R V•Spec II (R32),Mazda RX-7 Infini,BMW M3 E30 Step1,Subaru Impreza 22B STi-Version,Mitsubishi Lancer Evolution VIII MR,Nissan Silvia spec-R Aero,Honda S2000 (AP1)',
    STORAGE_KEYS = 'ae86Score,supraScore,supra2Score,skylineScore,rx7Score,m3Score,stiScore,evoScore,silviaScore,s2000Score'
})

-- Parse comma-separated strings into tables
local function parseCSV(str)
    local result = {}
    for item in string.gmatch(str, '([^,]+)') do
        table.insert(result, item)
    end
    return result
end

-- Convert config strings to tables
local carNames = parseCSV(carConfig.CAR_NAMES)
local storageKeys = parseCSV(carConfig.STORAGE_KEYS)
-- ac.debug('Car names ', carNames)
-- ac.debug('Storage keys ', storageKeys)

local carData = {
    names = carNames,
    storageKeys = storageKeys,
    personalBests = {},
    currentCarPB = 0,
    storage = {}
}

-- Track which cars have completed (for password unlock)
local carsCompleted = {}

-- Initialize storage and load current car's PB
for i = 1, #carData.storageKeys do
    carData.personalBests[i] = 0
    carData.storage[carData.storageKeys[i]] = ac.storage(carData.storageKeys[i], carData.personalBests[i])
    carData.personalBests[i] = carData.storage[carData.storageKeys[i]]:get()
    
    if carName == carData.names[i] then
        carData.currentCarPB = carData.personalBests[i]
    end
end

-- ============================================================================
-- SONG NAMES
-- ============================================================================
local songNames = {
    "Magical Sound Shower",
    "Passing Breeze",
    "Splash Wave",
    "Last Wave",
    "Tokyo Turbo",
    "Wangan Legends",
    "The Mid Night Club",
    "Night Rain",
    "Cloudscape Driver",
    "Touge Warrior"
}

-- ============================================================================
-- MEDIA PLAYERS
-- ============================================================================
local mediaPlayers = {
    ui.MediaPlayer(),  -- 1: letsgo
    ui.MediaPlayer(),  -- 2: checkpoint
    ui.MediaPlayer(),  -- 3: congrats
    ui.MediaPlayer(),  -- 4: Magical Sound Shower
    ui.MediaPlayer(),  -- 5: Passing Breeze
    ui.MediaPlayer(),  -- 6: Splash Wave
    ui.MediaPlayer(),  -- 7: Last Wave
    ui.MediaPlayer(),  -- 8: Tokyo Turbo
    ui.MediaPlayer(),  -- 9: Wangan Legends
    ui.MediaPlayer(),  -- 10: The Mid Night Club
    ui.MediaPlayer(),  -- 11: Night Rain
    ui.MediaPlayer(),  -- 12: Cloudscape Driver
    ui.MediaPlayer()   -- 13: Touge Warrior
}

-- ============================================================================
-- FONT SIZES
-- ============================================================================
local screen_ratio = uiState.windowSize.x / uiState.windowSize.y

local fonts = {
    small = {
        scale = 0.015,
        sizex = 0.015 * uiState.windowSize.x / screen_ratio,
        sizey = 0.015 * uiState.windowSize.y
    },
    basic = {
        scale = 0.03,
        sizex = 0.03 * uiState.windowSize.x / screen_ratio,
        sizey = 0.03 * uiState.windowSize.y
    },
    big = {
        scale = 0.05,
        sizex = 0.05 * uiState.windowSize.x / screen_ratio,
        sizey = 0.05 * uiState.windowSize.y
    }
}

-- Create vec2 objects for convenience
fonts.small.vec = vec2(fonts.small.sizex, fonts.small.sizey)
fonts.basic.vec = vec2(fonts.basic.sizex, fonts.basic.sizey)
fonts.big.vec = vec2(fonts.big.sizex, fonts.big.sizey)

-- ============================================================================
-- OTHER STATES
-- ============================================================================
local carsState = {}
local overtakeMessages = {}
local DriftTracking = ac.getCarState(1)


-- ============================================================================
-- HELPER FUNCTIONS
-- ============================================================================

function addOvertakeMessage(messageType)
    local imgPath = assets.images.overtakeNormal
    if messageType == 2 then
        imgPath = assets.images.overtakeClose
    elseif messageType == 3 then
        imgPath = assets.images.overtakeContact
    end
    
    local somethingSliding = false
    for i = 1, #overtakeMessages do
        if overtakeMessages[i].state == 'slidein' then
            somethingSliding = true
            break
        end
    end
    
    table.insert(overtakeMessages, 1, {
        image = imgPath,
        isStageBonus = false,
        age = 0,
        state = somethingSliding and 'waiting' or 'slidein',
        alpha = 0,
        xOffset = 0,
        yOffset = 0,
        targetYOffset = 0,
        holdTimer = 0
    })
end

function addStageBonusMessage(bonusPoints)
    local pointsStr = tostring(math.floor(bonusPoints))
    local imgPath = assets.images.stageBonusText
    
    local somethingSliding = false
    for i = 1, #overtakeMessages do
        if overtakeMessages[i].state == 'slidein' then
            somethingSliding = true
            break
        end
    end
    
    table.insert(overtakeMessages, 1, {
        image = imgPath,
        isStageBonus = true,
        bonusPoints = pointsStr,
        age = 0,
        state = somethingSliding and 'waiting' or 'slidein',
        alpha = 0,
        xOffset = 0,
        yOffset = 0,
        targetYOffset = 0,
        holdTimer = 0
    })
end

local function updateOvertakeMessages(dt)
    for i = #overtakeMessages, 1, -1 do
        local m = overtakeMessages[i]
        
        m.age = m.age or 0
        m.alpha = m.alpha or 0
        m.xOffset = m.xOffset or 0
        m.yOffset = m.yOffset or 0
        m.targetYOffset = m.targetYOffset or 0
        m.holdTimer = m.holdTimer or 0
        
        m.yOffset = math.applyLag(m.yOffset, m.targetYOffset, 0.7, dt)
        
        local fadeStartY = -(fonts.basic.sizey * 4)
        local fadeEndY = -(fonts.basic.sizey * 6.5)
        
        local positionAlpha = 1.0
        if m.yOffset <= fadeEndY then
            positionAlpha = 0.0
        elseif m.yOffset < fadeStartY then
            local fadeProgress = (m.yOffset - fadeStartY) / (fadeEndY - fadeStartY)
            positionAlpha = 1.0 - fadeProgress
        end
        
        if positionAlpha <= 0.0 and m.state ~= 'slideout' then
            table.remove(overtakeMessages, i)
            goto continue
        end
        
        if m.state == 'waiting' then
            local stillSliding = false
            for j = 1, #overtakeMessages do
                if j ~= i and overtakeMessages[j].state == 'slidein' then
                    stillSliding = true
                    break
                end
            end
            
            if not stillSliding then
                local rowHeight = fonts.basic.sizey * 1.8
                for j = 1, #overtakeMessages do
                    if j ~= i and (overtakeMessages[j].state == 'hold' or overtakeMessages[j].state == 'slidein') then
                        overtakeMessages[j].targetYOffset = (overtakeMessages[j].targetYOffset or 0) - rowHeight
                    end
                end
                
                m.state = 'slidein'
                m.age = 0
            end
            
            local stateAlpha = 0
            m.alpha = stateAlpha * positionAlpha
            
        elseif m.state == 'slidein' then
            m.age = m.age + dt
            local slideProgress = math.min(m.age / 0.25, 1.0)
            local stateAlpha = slideProgress
            m.xOffset = (1.0 - slideProgress) * 400
            
            m.alpha = stateAlpha * positionAlpha
            
            if slideProgress >= 1.0 then
                m.state = 'hold'
                m.holdTimer = 0
                m.xOffset = 0
                m.age = 0
            end
            
        elseif m.state == 'hold' then
            m.holdTimer = m.holdTimer + dt
            local stateAlpha = 1.0
            m.xOffset = 0
            
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
            
            if not m.slideoutStartY then
                m.slideoutStartY = m.targetYOffset
            end
            
            m.targetYOffset = m.slideoutStartY - (slideoutProgress * (fonts.basic.sizey * 6))
            
            m.alpha = stateAlpha * positionAlpha
            
            if slideoutProgress >= 1.0 then
                table.remove(overtakeMessages, i)
            end
        end
        
        ::continue::
    end
end

local function drawNumber(number, posX, posY, digitWidth, digitHeight, spacing)
    local numStr = tostring(math.floor(number))
    local startX = posX
    
    for i = 1, #numStr do
        local digit = tonumber(numStr:sub(i, i))
        ui.drawImage(assets.images.digitImages[digit],
            vec2(startX + (i-1) * (digitWidth + spacing), posY),
            vec2(startX + (i-1) * (digitWidth + spacing) + digitWidth, posY + digitHeight),
            rgbm.colors.white)
    end
end

local function drawDigits(number, startX, startY, digitWidth, digitHeight, spacing, minDigits)
    local numStr = tostring(math.floor(number))
    while #numStr < minDigits do
        numStr = "0" .. numStr
    end
    
    for i = 1, #numStr do
        local digit = tonumber(numStr:sub(i, i))
        local xPos = startX + (i-1) * (digitWidth + spacing)
        ui.drawImage(assets.images.digitImages[digit],
            vec2(xPos, startY),
            vec2(xPos + digitWidth, startY + digitHeight),
            rgbm.colors.white)
    end
    
    return startX + #numStr * (digitWidth + spacing)
end

local function updateCarScore(carIndex, finalScore, isFinish)
    local isNewHighScore = finalScore > carData.personalBests[carIndex]
    
    if isNewHighScore then
        carData.personalBests[carIndex] = math.ceil(finalScore)
        carData.storage[carData.storageKeys[carIndex]]:set(carData.personalBests[carIndex])
        carData.currentCarPB = finalScore
        
        if not gameState.highScoreChatMsgSent then
            local message
            if isFinish then
                message = string.format('Reached the Goal in %d:%02d:%s and has a new Highscore of %d pts in the %s',
                    math.floor(displayTime.minutesTime),
                    math.floor(displayTime.secondsTime),
                    string.sub(string.format("%.2f", displayTime.subSeconds), -2, -1),
                    math.ceil(finalScore),
                    carName)
                    ac.sendChatMessage(message)
                    gameState.highScoreChatMsgSent = true
            else
                message = string.format('Ran out of time, but has a new Highscore of %d pts in the %s',
                    math.ceil(finalScore),
                    carName)
            end

        end
    else
        if not gameState.nothighScoreChatMsgSent then
            local message
            if isFinish then
                message = string.format('Reached the Goal in %d:%02d:%s with a score of %d pts in the %s',
                    math.floor(displayTime.minutesTime),
                    math.floor(displayTime.secondsTime),
                    string.sub(string.format("%.2f", displayTime.subSeconds), -2, -1),
                    math.ceil(finalScore),
                    carName)
                    ac.sendChatMessage(message)
                    gameState.nothighScoreChatMsgSent = true
            else
                message = string.format('Ran out of time with a score of %d pts in the %s',
                    math.ceil(finalScore),
                    carName)
            end

        end
    end
end

local function getCurrentCarIndex()
    for i = 1, #carData.names do
        if carName == carData.names[i] then
            return i
        end
    end
    return nil
end

local function updateFlashAnimations(dt)
    for i = 1, 3 do
        local ep = uiAnimations['extendPlay' .. i]
        if ep.flashing then
            ep.flashTimer = ep.flashTimer + dt
            if ep.flashTimer >= uiAnimations.flashDuration then
                ep.flashTimer = 0
                ep.flashPhase = ep.flashPhase + 1
                if ep.flashPhase >= 6 then
                    ep.flashing = false
                    ep.alpha = 0
                    uiAnimations['lap' .. i .. 'Alpha'] = 0
                else
                    ep.alpha = 1 - ep.alpha
                end
            end
        end
    end
end

local function updateLapTimes()
    for i = 1, 3 do
        local lap = 'lap' .. i
        if lapTimes[lap .. 'time'] > 60 then
            lapTimes[lap .. 'mins'] = 1
            lapTimes[lap .. 'secs'] = math.floor(lapTimes[lap .. 'time'] - 60)
            lapTimes[lap .. 'subsecs'] = lapTimes[lap .. 'time'] - math.floor(lapTimes[lap .. 'time'])
        else
            lapTimes[lap .. 'mins'] = 0
            lapTimes[lap .. 'secs'] = math.floor(lapTimes[lap .. 'time'])
            lapTimes[lap .. 'subsecs'] = lapTimes[lap .. 'time'] - lapTimes[lap .. 'secs']
        end
    end

    -- Lap 4
    if lapTimes.lap4time > 60 then
        lapTimes.lap4mins = 1
        lapTimes.lap4secs = math.floor(lapTimes.lap4time - 60)
        lapTimes.lap4subsecs = lapTimes.lap4time - math.floor(lapTimes.lap4time)
    else
        lapTimes.lap4mins = 0
        lapTimes.lap4secs = math.floor(lapTimes.lap4time)
        lapTimes.lap4subsecs = lapTimes.lap4time - lapTimes.lap4secs
    end

    -- Lap 10
    if lapTimes.lap10time > 60 then
        lapTimes.lap10mins = 1
        lapTimes.lap10secs = math.floor(lapTimes.lap10time - 60)
        lapTimes.lap10subsecs = lapTimes.lap10time - math.floor(lapTimes.lap10time)
    else
        lapTimes.lap10mins = 0
        lapTimes.lap10secs = math.floor(lapTimes.lap10time)
        lapTimes.lap10subsecs = lapTimes.lap10time - lapTimes.lap10secs
    end
end

local function updateMusicPlayers(dt)
    if ac.isKeyDown(ac.KeyIndex.Up) and gameState.musicVol < 1 then
        gameState.musicVol = gameState.musicVol + 0.01
    end

    if ac.isKeyDown(ac.KeyIndex.Down) and gameState.musicVol > 0 then
        gameState.musicVol = gameState.musicVol - 0.01
    end

    -- Set up all music sources and volumes
    mediaPlayers[4]:setSource(assets.music.outrun.magicalSoundShower):setAutoPlay(false):setVolume(gameState.musicVol)
    mediaPlayers[5]:setSource(assets.music.outrun.passingBreeze):setAutoPlay(false):setVolume(gameState.musicVol)
    mediaPlayers[6]:setSource(assets.music.outrun.splashWave):setAutoPlay(false):setVolume(gameState.musicVol)
    mediaPlayers[7]:setSource(assets.music.outrun.lastWave):setAutoPlay(false):setVolume(gameState.musicVol)
    mediaPlayers[8]:setSource(assets.music.tokyo.tokyoTurbo):setAutoPlay(false):setVolume(gameState.musicVol)
    mediaPlayers[9]:setSource(assets.music.tokyo.wanganLegends):setAutoPlay(false):setVolume(gameState.musicVol)
    mediaPlayers[10]:setSource(assets.music.tokyo.theMidNightClub):setAutoPlay(false):setVolume(gameState.musicVol)
    mediaPlayers[11]:setSource(assets.music.tokyo.nightRain):setAutoPlay(false):setVolume(gameState.musicVol)
    mediaPlayers[12]:setSource(assets.music.tokyo.cloudscapeDriver):setAutoPlay(false):setVolume(gameState.musicVol)
    mediaPlayers[13]:setSource(assets.music.tokyo.tougeDriver):setAutoPlay(false):setVolume(gameState.musicVol)

    if gameState.timePassed > 5 and gameState.timePassed < 6 and not mediaPlayers[levelConfig.FIRST_SONG_INDEX]:playing() then
        mediaPlayers[levelConfig.FIRST_SONG_INDEX]:play()
    end

    gameState.musicTimer = gameState.musicTimer + dt

    -- Track switching logic (simplified with loop)
    local musicTrackConfig = {
        {4, 5, 2},   -- player 4 -> 5, set lastPlayed to 2
        {5, 6, 3},
        {6, 7, 4},
        {7, 8, 5},
        {8, 9, 6},
        {9, 10, 7},
        {10, 11, 8},
        {11, 12, 9},
        {12, 13, 10},
        {13, 4, 1}   -- wrap back to start
    }

    for _, config in ipairs(musicTrackConfig) do
        local current, next, songNum = config[1], config[2], config[3]
        if mediaPlayers[current]:currentTime() > math.floor(mediaPlayers[current]:duration(), 1) or 
           (mediaPlayers[current]:playing() == true and ac.isKeyDown(ac.KeyIndex.Left)) then
            if gameState.musicTimer > 0.2 then
                mediaPlayers[current]:pause():setCurrentTime(0.00)
                mediaPlayers[next]:play()
                gameState.lastPlayedSong = songNum
                gameState.musicTimer = 0
            end
        end
    end

    -- Play/pause logic
    for i = 4, 13 do
        local songIndex = i - 3
        if mediaPlayers[i]:playing() == true and ac.isKeyDown(ac.KeyIndex.Right) and gameState.musicTimer > 0.2 then
            mediaPlayers[i]:pause()
            gameState.musicTimer = 0
        elseif mediaPlayers[i]:playing() == false and gameState.lastPlayedSong == songIndex and 
               ac.isKeyDown(ac.KeyIndex.Right) and gameState.musicTimer > 0.2 then
            mediaPlayers[i]:play()
            gameState.musicTimer = 0
        end
    end
end

local function handleCheckpoints(player, dt)
    if player.splinePosition > trackPositions.checkpoint1 then
        local timeBonus = 250000 * math.ceil(gameState.countDown)
        if not gameState.checkpoint1 and gameState.gameOverMessage == 0 then
            gameState.countDown = gameState.countDown + trackPositions.stage1timeExtend
            if gameState.countDown > 99 then
                gameState.countDown = 99
            end 
            gameState.totalScore = gameState.totalScore + timeBonus
            lapTimes.lap1time = gameState.totalTimer
            lapTimes.prevLaptimes = lapTimes.lap1time
            addStageBonusMessage(timeBonus)

            if gameState.muteToggle then
                mediaPlayers[2]:play()
            end
            gameState.checkpoint1 = true

            uiAnimations.extendPlay1.flashing = true
            uiAnimations.extendPlay1.flashTimer = 0
            uiAnimations.extendPlay1.alpha = 1
            uiAnimations.extendPlay1.flashPhase = 0
            uiAnimations.lap1Alpha = 1
        end
    end

    if player.splinePosition > trackPositions.checkpoint2 then
        local timeBonus = 500000 * math.ceil(gameState.countDown)
        if not gameState.checkpoint2 and gameState.gameOverMessage == 0 then
            gameState.countDown = gameState.countDown + trackPositions.stage2timeExtend
            if gameState.countDown > 99 then
                gameState.countDown = 99
            end 
            gameState.totalScore = gameState.totalScore + timeBonus
            lapTimes.lap2time = gameState.totalTimer - lapTimes.prevLaptimes
            lapTimes.prevLaptimes = lapTimes.prevLaptimes + lapTimes.lap2time
            addStageBonusMessage(timeBonus)

            if gameState.muteToggle then
                mediaPlayers[2]:play()
            end
            gameState.checkpoint2 = true
            uiAnimations.extendPlay2.flashing = true
            uiAnimations.extendPlay2.flashTimer = 0
            uiAnimations.extendPlay2.alpha = 1
            uiAnimations.extendPlay2.flashPhase = 0
            uiAnimations.lap2Alpha = 1
        end
    end

    if player.splinePosition > trackPositions.checkpoint3 then
        local timeBonus = 750000 * math.ceil(gameState.countDown)
        if not gameState.checkpoint3 and gameState.gameOverMessage == 0 then
            gameState.countDown = gameState.countDown + trackPositions.stage3timeExtend
            if gameState.countDown > 99 then
                gameState.countDown = 99
            end 
            gameState.totalScore = gameState.totalScore + timeBonus
            lapTimes.lap3time = gameState.totalTimer - lapTimes.prevLaptimes
            lapTimes.prevLaptimes = lapTimes.prevLaptimes + lapTimes.lap3time
            addStageBonusMessage(timeBonus)

            if gameState.muteToggle then
                mediaPlayers[2]:play()
            end
            gameState.checkpoint3 = true
            uiAnimations.extendPlay3.flashing = true
            uiAnimations.extendPlay3.flashTimer = 0
            uiAnimations.extendPlay3.alpha = 1
            uiAnimations.extendPlay3.flashPhase = 0
            uiAnimations.lap3Alpha = 1
        end
    end
end

local function handleCarTracking(player, sim, dt, scoreRisingRate)
    while sim.carsCount > #carsState do
        carsState[#carsState + 1] = {}
    end

    for i = 1, sim.carsCount do
        local car = ac.getCarState(i)
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
                gameState.collisionTimer = 3
            end

            if not state.overtaken and not state.collided and state.drivingAlong then
                local posDir = (car.position - player.position):normalize()
                local posDot = math.dot(posDir, car.look)
                state.maxPosDot = math.max(state.maxPosDot, posDot)
                if posDot < -0.5 and state.maxPosDot > 0.5 then
                    if gameState.collisionTimer > 0 then
                        gameState.totalScore = gameState.totalScore + gameState.collisionOvertakePts
                        addOvertakeMessage(3) 
                    elseif car.position:closerToThan(player.position, 3) then
                        gameState.totalScore = gameState.totalScore + gameState.closeOvertakePts
                        addOvertakeMessage(2)
                    else
                        gameState.totalScore = gameState.totalScore + gameState.overtakePts
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
end

local function handleFinishLine(player)
    if not gameState.checkpoint10 then
        lapTimes.lap10time = gameState.totalTimer - lapTimes.prevLaptimes
        local timeBonus = 1000000 * math.ceil(gameState.countDown)
        gameState.totalScore = gameState.totalScore + timeBonus
        gameState.finalScore = math.ceil(gameState.totalScore)
        addStageBonusMessage(timeBonus)

        local carIndex = getCurrentCarIndex()
        if carIndex then
            updateCarScore(carIndex, gameState.finalScore, true)
        end

        -- Check if we should show password
        if gameState.isNewCarCompletion then
            gameState.showPassword = true
            
            -- Track this car as completed
            carsCompleted[carIndex] = true
            
            -- Count how many cars have completed
            local completedCount = 0
            for i = 1, #carData.names do
                if carsCompleted[i] then
                    completedCount = completedCount + 1
                end
            end
            
            ac.log(string.format("PASSWORD UNLOCKED! Completed with %d/%d cars", completedCount, #carData.names))
            
            -- Chat message
            ac.sendChatMessage("═══════════════════════════════════")
            ac.sendChatMessage(string.format("🔓 LEVEL %d PASSWORD UNLOCKED!", levelConfig.NEXT_LEVEL))
            ac.sendChatMessage(string.format("Cars completed: %d/%d", completedCount, #carData.names))
            ac.sendChatMessage("═══════════════════════════════════")
        else
            ac.log("Password not shown - car already completed before")
        end

        if gameState.muteToggle then
            mediaPlayers[3]:play()
        end
        gameState.checkpoint10 = true
    end
end

local function calculateTimeDisplays()
    displayTime.secondsTime = gameState.totalTimer/60
    if displayTime.secondsTime > 1 then
        displayTime.secondsTime = displayTime.secondsTime - math.floor(displayTime.secondsTime)
    end
    displayTime.secondsTime = displayTime.secondsTime * 60

    displayTime.sec10 = (displayTime.secondsTime > 10) and 1 or 0
    displayTime.minutesTime = gameState.totalTimer/60
    displayTime.min10 = (displayTime.minutesTime > 10) and 1 or 0
    displayTime.min1 = (displayTime.minutesTime > 1) and 1 or 0
    displayTime.subSeconds = gameState.totalTimer
end


-- ============================================================================
-- MAIN UPDATE FUNCTION
-- ============================================================================
function script.update(dt)
    ac.debug("car name", carName)
    -- ac.debug("Drift timer = ", gameState.driftTimer)
    -- ac.debug("Drift tracking status", DriftTracking.isDriftValid)
    -- ac.debug("OffRoad Timer", gameState.offRoadTimer)
    -- ac.debug("Collision Timer", gameState.collisionTimer)

    local player = ac.getCarState(1)
    local scoreRisingRate = 20 * (math.lerp(0, 10, math.lerpInvSat(player.speedKmh, 0, 120))) * 
                            math.lerp(0, 10, math.lerpInvSat(player.speedKmh, 0, 120))
    
    ac.debug("player pos", player.position)
    ac.debug("spline pos", player.splinePosition)
    -- ac.debug("collided with", player.collidedWith)
    ac.debug("race begin status: ", gameState.raceBegin)
    ac.debug("checkpoint 1 status: ", gameState.checkpoint1)
    ac.debug("checkpoint 2 status: ", gameState.checkpoint2)
    ac.debug("checkpoint 3 status: ", gameState.checkpoint3)
    ac.debug("final checkpoint status: ", gameState.checkpoint10)
    ac.debug("countdown timer: ", gameState.countDown)
    ac.debug("total timer: ", gameState.totalTimer)
    ac.debug("total score: ", gameState.totalScore)
    ac.debug("time passed: ", gameState.timePassed)
    ac.debug('Music volume set to: ', gameState.musicVol)

    -- Flip car if stuck
    local playerPos = player.position
    local playerDir = ac.getCameraForward()
    if ac.isKeyDown(ac.KeyIndex.Delete) and player.speedKmh < 15 then
        physics.setCarPosition(0, playerPos, playerDir)
    end

    -- Setup SFX media players
    mediaPlayers[1]:setSource(assets.music.sfx.letsgo):setAutoPlay(false):setVolume(1)
    mediaPlayers[2]:setSource(assets.music.sfx.checkpoint):setAutoPlay(false):setVolume(1)
    mediaPlayers[3]:setSource(assets.music.sfx.congrats):setAutoPlay(false):setVolume(1)

    local isDrifting = false
    local sim = ac.getSim()
    
    if player.splinePosition > trackPositions.gameStart then
        if not gameState.raceBegin and gameState.gameOverMessage == 0 then
            -- Check if this is a new car completion (first time with this car)
            if not gameState.checkedCarCompletion then
                gameState.checkedCarCompletion = true
                local currentCarIndex = getCurrentCarIndex()
                
                if currentCarIndex and carData.personalBests[currentCarIndex] == 0 then
                    gameState.isNewCarCompletion = true
                    ac.log("First time with this car - will show password on completion")
                else
                    gameState.isNewCarCompletion = false
                    ac.log("Not first time with this car - password will not be shown")
                end
            end
            
            if gameState.muteToggle then
                mediaPlayers[1]:play()
            end
            gameState.raceBegin = true
        end

        if gameState.countDown > 0 then
            if player.splinePosition < trackPositions.finish and not gameState.checkpoint10 then
                gameState.countDown = gameState.countDown - dt
                gameState.totalTimer = gameState.totalTimer + dt
                gameState.startTimer = 1

                if player.wheelsOutside < 3 then
                    if DriftTracking.isDriftValid and gameState.collisionTimer < 0 and gameState.offRoadTimer < 0 then
                        isDrifting = true
                        gameState.driftTimer = gameState.driftTimer + dt
                        
                        local driftMultiplier = 10
                        if gameState.driftTimer > 4.0 then
                            driftMultiplier = 1000
                        elseif gameState.driftTimer > 2.0 then
                            driftMultiplier = 100
                        else
                            driftMultiplier = 10
                        end
                        
                        gameState.totalScore = gameState.totalScore + dt * scoreRisingRate * driftMultiplier
                    else
                        gameState.totalScore = gameState.totalScore + dt * scoreRisingRate
                    end
                end

                handleCheckpoints(player, dt)
                handleCarTracking(player, sim, dt, scoreRisingRate)
            else
                handleFinishLine(player)
            end
        else
            gameState.gameOverMessage = 1
            gameState.checkpoint1 = true
            gameState.checkpoint2 = true
            gameState.checkpoint3 = true
            gameState.checkpoint10 = true
            gameState.finalScore = 0

            local carIndex = getCurrentCarIndex()
            if carIndex then
                updateCarScore(carIndex, gameState.finalScore, false)
            end
        end
    else
        -- Reset race state
        gameState.countDown = gameState.countDownTime
        gameState.totalScore = 0
        gameState.totalTimer = 0
        gameState.startTimer = 0
        gameState.raceBegin = false
        gameState.checkpoint1 = false
        gameState.checkpoint2 = false
        gameState.checkpoint3 = false
        gameState.checkpoint10 = false
        gameState.highScoreChatMsgSent = false
        gameState.nothighScoreChatMsgSent = false
        gameState.gameOverMessage = 0
        gameState.showPassword = false
        gameState.isNewCarCompletion = false
        gameState.checkedCarCompletion = false
        gameState.lastDebugKeyState = false
        gameState.debugMode = false
        
        -- Reset animations
        for i = 1, 3 do
            uiAnimations['extendPlay' .. i].flashing = false
            uiAnimations['extendPlay' .. i].alpha = 0
            uiAnimations['extendPlay' .. i].flashPhase = 0
            uiAnimations['lap' .. i .. 'Alpha'] = 0
        end
        
        uiAnimations.warningLightAlpha = 0
        gameState.collisionTimer = 0
        gameState.offRoadTimer = 0
    end

    -- Drift meter handler
    local inRacingZone = player.splinePosition > trackPositions.gameStart and 
                         player.splinePosition < trackPositions.finish and 
                         gameState.countDown > 0
    
    if inRacingZone and isDrifting then
        uiAnimations.driftMeterAlpha = math.min(uiAnimations.driftMeterAlpha + dt * 3, 1.0)
    else
        if gameState.driftTimer > 0 then
            gameState.driftTimer = 0
        end
        uiAnimations.driftMeterAlpha = math.max(uiAnimations.driftMeterAlpha - dt * 2, 0)
    end

    -- Warning light
    if (gameState.collisionTimer > 0 or gameState.offRoadTimer > 0) and 
       (player.splinePosition > trackPositions.gameStart and player.splinePosition < trackPositions.finish) then
        uiAnimations.warningLightAlpha = math.min(uiAnimations.warningLightAlpha + dt * 4, 1)
    else
        uiAnimations.warningLightAlpha = math.max(uiAnimations.warningLightAlpha - dt * 4, 0)
    end

    updateLapTimes()
    updateFlashAnimations(dt)
    calculateTimeDisplays()
    updateMusicPlayers(dt)

    -- Mute toggle
    local muteKeyState = ac.isKeyDown(ac.KeyIndex.M)
    if muteKeyState and gameState.lastMuteKeyState ~= muteKeyState then
        gameState.muteToggle = not gameState.muteToggle
        gameState.lastMuteKeyState = muteKeyState
    elseif not muteKeyState then
        gameState.lastMuteKeyState = false
    end

    -- DEBUG: Test password display with Ctrl+P (press once)
    -- local debugKeyState = ac.isKeyDown(ac.KeyIndex.Control) and ac.isKeyDown(ac.KeyIndex.P)
    -- if debugKeyState and not (gameState.lastDebugKeyState or false) then
    --     gameState.debugMode = not gameState.debugMode
    --     gameState.showPassword = gameState.debugMode
    --     gameState.checkpoint10 = true
    --     gameState.raceBegin = true
    --     uiAnimations.finishflag = gameState.debugMode and 1 or 0
    --     ac.log("DEBUG: Password display toggled - " .. (gameState.debugMode and "ON" or "OFF"))
    -- end
    -- gameState.lastDebugKeyState = debugKeyState

    gameState.timePassed = gameState.timePassed + dt
    -- ac.debug('time passed', gameState.timePassed)
    -- ac.debug('total score', gameState.totalScore)
    gameState.collisionTimer = gameState.collisionTimer - dt
    gameState.offRoadTimer = gameState.offRoadTimer - dt
end


-- ============================================================================
-- DRAW UI FUNCTION
-- ============================================================================
function script.drawUI()
    local keyState = ac.isKeyDown(ac.KeyIndex.Control) and ac.isKeyDown(ac.KeyIndex.D)
    if keyState and gameState.LastKeyState ~= keyState then
        gameState.UIToggle = not gameState.UIToggle
        gameState.LastKeyState = keyState
    elseif not keyState then
        gameState.LastKeyState = false
    end

    if not gameState.UIToggle then return end

    local uiState = ac.getUI()
    updateOvertakeMessages(uiState.dt)

    local requiredSpeed = 100 
    local speedRelative = math.saturate(math.floor(ac.getCarState(1).speedKmh) / requiredSpeed)
    local colorDark = rgbm(0.4, 0.4, 0.4, 1)
    local colorGrey = rgbm(0.7, 0.7, 0.7, 1)
    local colorAccent = rgbm.new(hsv(speedRelative * 120, 1, 1):rgb(), 1)

    local function progressMeter(ref, prevCheckptPos, checkptPos, meterWidth, meterHeight)
        local player = ac.getCarState(1)
        local fillAmount = math.lerpInvSat(player.splinePosition, prevCheckptPos, checkptPos)
        
        ui.drawRectFilled(ref, ref + vec2(meterWidth, meterHeight), colorDark, 3)
        ui.drawRect(ref, ref + vec2(meterWidth, meterHeight), colorGrey, 3, 2)
        
        if fillAmount > 0 then
            ui.drawRectFilled(ref + vec2(2, 2), 
                            ref + vec2((meterWidth - 4) * fillAmount, meterHeight - 2), 
                            colorAccent, 2)
        end
    end

    local function driftMeter(ref, driftTime, maxTime, meterWidth, meterHeight)
        local fillAmount = math.min(driftTime / maxTime, 1.0)
        
        ui.drawRectFilled(ref, ref + vec2(meterWidth, meterHeight), rgbm(0.2, 0.2, 0.2, 0.8), 3)
        ui.drawRect(ref, ref + vec2(meterWidth, meterHeight), rgbm(0.7, 0.7, 0.7, 1), 3, 2)
        
        if fillAmount > 0 then
            local barColor
            if fillAmount < 0.33 then
                barColor = rgbm(0.2, 1.0, 0.2, 1)
            elseif fillAmount < 0.66 then
                barColor = rgbm(1.0, 1.0, 0.2, 1)
            elseif fillAmount < 1 then
                barColor = rgbm(1.0, 0.2, 0.2, 1)
            else
                barColor = rgbm(1.0, 0.0, 1.0, 1)
            end
            
            ui.drawRectFilled(ref + vec2(2, 2), 
                            ref + vec2((meterWidth - 4) * fillAmount, meterHeight - 2), 
                            barColor, 2)
        end
    end

    local player = ac.getCarState(1)

    -- Draw logo
    ui.drawImage(assets.images.cruisinLogo, 
        vec2(-0.05, fonts.basic.sizey*2), 
        vec2(uiState.windowSize.x * 0.15, fonts.basic.sizey*5), 
        rgbm.colors.white, vec2(0,0), vec2(1,1), ui.ImageFit.Fit)

    -- Update and draw header
    uiAnimations.headerflag = math.applyLag(uiAnimations.headerflag, 
        gameState.gameOverMessage == 0 and not gameState.checkpoint10 and 1 or 0, 0.1, uiState.dt)
        -- player.splinePosition < trackPositions.finish and 
    -- Score header
    ui.beginTransparentWindow('overtakeScore1', vec2(uiState.windowSize.x * 0.1, fonts.basic.sizey*2), vec2(400, 400), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.headerflag)
    ui.drawImage(assets.images.scoreLabel,
        vec2(-fonts.basic.sizex, 0),
        vec2(fonts.basic.sizex * 6, fonts.basic.sizey * 1.5),
        rgbm.colors.white)
    ui.popStyleVar()
    ui.endTransparentWindow()

    ui.beginTransparentWindow('overtakeScore2', vec2(uiState.windowSize.x * 0.1, fonts.basic.sizey*3.5), vec2(2000, 2000), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.headerflag)
    local spacing = fonts.basic.sizex * -0.45
    drawNumber(math.ceil(gameState.totalScore), 10, 0, fonts.basic.sizex * 1.2, fonts.basic.sizey * 1.5, spacing)
    ui.popStyleVar()
    ui.endTransparentWindow()

    -- PB display
    ui.beginTransparentWindow('overtakeScorePB', vec2(uiState.windowSize.x * 0.1, fonts.basic.sizey*4.75), vec2(2000, 2000), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.headerflag)
    local digitWidth = fonts.basic.sizex * 0.7
    local digitHeight = fonts.basic.sizey * 1.0
    local spacing = fonts.basic.sizex * -0.275
    local currentX = 0
    local pbWidth = fonts.basic.sizex * 2
    ui.drawImage(assets.images.pbImg,
        vec2(currentX, -5),
        vec2(currentX + pbWidth, digitHeight*1.2),
        rgbm.colors.white)
    currentX = currentX + pbWidth
    local numStr = tostring(math.ceil(carData.currentCarPB))
    for i = 1, #numStr do
        local digit = tonumber(numStr:sub(i, i))
        local xPos = currentX + (i-1) * (digitWidth + spacing)
        ui.drawImage(assets.images.digitImages[digit],
            vec2(xPos, 0),
            vec2(xPos + digitWidth, digitHeight),
            rgbm.colors.white)
    end
    ui.popStyleVar()
    ui.endTransparentWindow()

    -- Drift meter and warning light
    if uiAnimations.driftMeterAlpha > 0 then
        ui.beginTransparentWindow('driftMeterWindow', 
            vec2(uiState.windowSize.x * 0.6, uiState.windowSize.y * 0.5),
            vec2(600, 100), false)
        
        ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.driftMeterAlpha)
        
        ui.drawImage(assets.images.driftLabel,
            vec2(0, 0),
            vec2(fonts.basic.sizex * 8, fonts.basic.sizey * 2.5),
            rgbm.colors.white)
        
        driftMeter(ui.getCursor() + vec2(fonts.basic.sizex * 6, 40), 
                   gameState.driftTimer, uiAnimations.driftMeterMax, 
                   fonts.basic.sizex*5, fonts.basic.sizey*0.75)
        
        local driftImg = nil
        if gameState.driftTimer > 4.0 then
            driftImg = assets.images.drift1000x
        elseif gameState.driftTimer > 2.0 then
            driftImg = assets.images.drift100x
        elseif gameState.driftTimer > 0.0 then
            driftImg = assets.images.drift10x
        end

        if driftImg then
            ui.drawImage(driftImg,
                vec2(fonts.basic.sizex*7, 0),
                vec2(fonts.basic.sizex*11, fonts.basic.sizey*1.5),
                rgbm.colors.white)
        end

        ui.popStyleVar()
        ui.endTransparentWindow()
    end

    -- Warning Light
    if uiAnimations.warningLightAlpha > 0.01 then
        local warningWindowSize = fonts.basic.sizex * 7
        ui.beginTransparentWindow('warningLightWindow', 
            vec2(uiState.windowSize.x * 0.6, uiState.windowSize.y * 0.5),
            vec2(warningWindowSize, uiState.windowSize.y * 0.5 + warningWindowSize), false)
        
        ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.warningLightAlpha)
        
        local warningSize = fonts.basic.sizex * 6
        ui.drawImage(assets.images.warningLight,
            vec2(0, fonts.basic.sizey * 0.5),
            vec2(warningSize, fonts.basic.sizey * 0.5 + warningSize),
            rgbm.colors.white)
        
        ui.popStyleVar()
        ui.endTransparentWindow()
    end

    -- Overtake messages
    ui.beginTransparentWindow('overtakeMessageWindow', 
        vec2(uiState.windowSize.x * 0.1, fonts.basic.sizey * 6), 
        vec2(fonts.basic.sizex*20, fonts.basic.sizey*8), false)

    for i = 1, #overtakeMessages do
        local m = overtakeMessages[i]
        local yPos = (fonts.basic.sizey * 6) 
        local finalX = m.xOffset
        local finalY = yPos + m.yOffset
        
        if m.isStageBonus then
            ui.drawImage(m.image,
                vec2(finalX, finalY),
                vec2(finalX + fonts.basic.sizex*12, finalY + fonts.basic.sizey*2),
                rgbm(1, 1, 1, m.alpha))

            local digitStartX = finalX + (fonts.basic.sizex * 10)
            local digitWidth = fonts.basic.sizex * 1.6
            local digitHeight = fonts.basic.sizey * 2
            local digitSpacing = fonts.basic.sizex * -1
            
            for j = 1, #m.bonusPoints do
                local digit = tonumber(m.bonusPoints:sub(j, j))
                local digitX = digitStartX + (j - 1) * (digitWidth + digitSpacing)
                
                ui.drawImage(assets.images.stageBonusDigits[digit],
                    vec2(digitX, finalY),
                    vec2(digitX + digitWidth, finalY + digitHeight),
                    rgbm(1, 1, 1, m.alpha))
            end
        else
            ui.drawImage(m.image,
                vec2(finalX, finalY),
                vec2(finalX + fonts.basic.sizex*12, finalY + fonts.basic.sizey*2),
                rgbm(1, 1, 1, m.alpha))
        end
    end

    ui.endTransparentWindow()

    -- Progress windows (stage indicators)
    local progMeterLength = fonts.basic.sizex*6
    local progMeterHeight = fonts.basic.sizey*0.75

    ui.beginTransparentWindow('progressWindow', 
        vec2(uiState.windowSize.x * 0.78, uiState.windowSize.y * 0.8), 
        vec2(2000, 1400), false)
    ui.setCursorY(0)

    if gameState.raceBegin and not gameState.checkpoint1 then
        ui.drawImage(assets.images.stage1,
            vec2(0, 0),
            vec2(fonts.basic.sizex * 8, fonts.basic.sizey * 2),
            rgbm.colors.white)
        progressMeter(ui.getCursor() + vec2(fonts.basic.sizex * 2, fonts.basic.sizey * 2), 
                     trackPositions.gameStart, trackPositions.checkpoint1, 
                     progMeterLength, progMeterHeight) 
    end

    if gameState.checkpoint1 and not gameState.checkpoint2 then
        ui.drawImage(assets.images.stage2,
            vec2(0, 0),
            vec2(fonts.basic.sizex * 8, fonts.basic.sizey * 2),
            rgbm.colors.white)
        progressMeter(ui.getCursor() + vec2(fonts.basic.sizex * 2, fonts.basic.sizey * 2), 
                     trackPositions.checkpoint1, trackPositions.checkpoint2, 
                     progMeterLength, progMeterHeight)
    end

    if gameState.checkpoint2 and not gameState.checkpoint3 then
        ui.drawImage(assets.images.stage3,
            vec2(0, 0),
            vec2(fonts.basic.sizex * 8, fonts.basic.sizey * 2),
            rgbm.colors.white)
        progressMeter(ui.getCursor() + vec2(fonts.basic.sizex * 2, fonts.basic.sizey * 2), 
                     trackPositions.checkpoint2, trackPositions.checkpoint3, 
                     progMeterLength, progMeterHeight)
    end

    if gameState.checkpoint3 and not gameState.checkpoint10 then
        ui.drawImage(assets.images.finalStage,
            vec2(0, 0),
            vec2(fonts.basic.sizex * 8, fonts.basic.sizey * 2),
            rgbm.colors.white)
        progressMeter(ui.getCursor() + vec2(fonts.basic.sizex * 2, fonts.basic.sizey * 2), 
                     trackPositions.checkpoint3, trackPositions.finish, 
                     progMeterLength, progMeterHeight)
    end

    ui.endTransparentWindow()

    -- Countdown timer
    ui.beginTransparentWindow("countDownTimer", 
        vec2((uiState.windowSize.x*0.5)-(3*fonts.basic.sizex), fonts.basic.sizey*2), 
        vec2(400, 400), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.headerflag)
    ui.drawImage(assets.images.timeLabel,
        vec2(0, 0),
        vec2(fonts.basic.sizex * 6, fonts.basic.sizey * 1.5),
        rgbm.colors.white)
    ui.popStyleVar()
    ui.endTransparentWindow()        

    ui.beginTransparentWindow('countDownTime', 
        vec2((uiState.windowSize.x*0.5) - (2*fonts.basic.sizex), fonts.basic.sizey*3.5), 
        vec2(400, 400), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.headerflag)
    local currentNumber = math.abs(math.ceil(gameState.countDown))
    local tensDigit = math.floor(currentNumber / 10)
    local onesDigit = currentNumber % 10
    local digitWidth = fonts.basic.sizex * 4
    local digitHeight = 4*fonts.basic.sizey 
    local digitGap = 0.5

    if currentNumber >= 10 then
        ui.drawImage(assets.images.countdownNumbers[tensDigit],
            vec2(0, 0),
            vec2(digitWidth, digitHeight),
            rgbm.colors.white)
        
        ui.drawImage(assets.images.countdownNumbers[onesDigit],
            vec2(digitWidth * digitGap, 0),
            vec2(digitWidth * digitGap + digitWidth, digitHeight),
            rgbm.colors.white)
    else
        ui.drawImage(assets.images.countdownNumbers[onesDigit],
            vec2(0, 0),
            vec2(digitWidth, digitHeight),
            rgbm.colors.white)
    end
    ui.popStyleVar()
    ui.endTransparentWindow()

    -- Checkpoint flags
    local checkptflagdist = 0.005
    
    uiAnimations.beginraceflag = math.applyLag(uiAnimations.beginraceflag, 
        player.splinePosition > trackPositions.gameStart and 
        player.splinePosition < trackPositions.gameStart + checkptflagdist and 1 or 0, 0.1, uiState.dt)
    
    uiAnimations.checkpt1flag = math.applyLag(uiAnimations.checkpt1flag, 
        player.splinePosition > trackPositions.checkpoint1 and 
        player.splinePosition < trackPositions.checkpoint1 + checkptflagdist and 1 or 0, 0.1, uiState.dt)
    
    uiAnimations.checkpt2flag = math.applyLag(uiAnimations.checkpt2flag, 
        player.splinePosition > trackPositions.checkpoint2 and 
        player.splinePosition < trackPositions.checkpoint2 + checkptflagdist and 1 or 0, 0.1, uiState.dt)
    
    uiAnimations.checkpt3flag = math.applyLag(uiAnimations.checkpt3flag, 
        player.splinePosition > trackPositions.checkpoint3 and 
        player.splinePosition < trackPositions.checkpoint3 + checkptflagdist and 1 or 0, 0.1, uiState.dt)
            
    uiAnimations.finishflag = math.applyLag(uiAnimations.finishflag, 
        ((gameState.gameOverMessage == 0 and gameState.checkpoint1 and gameState.checkpoint2 and gameState.checkpoint3 and gameState.checkpoint10) or gameState.debugMode) and 1 or 0, 0.1, uiState.dt)
        -- player.splinePosition >= trackPositions.finish and 

    uiAnimations.finishflagnothighscore = math.applyLag(uiAnimations.finishflagnothighscore, 
        -- player.splinePosition >= trackPositions.finish and 
        gameState.nothighScoreChatMsgSent == true and gameState.gameOverMessage == 0 and gameState.checkpoint10 and 1 or 0, 0.1, uiState.dt)

    uiAnimations.finishflaghighscore = math.applyLag(uiAnimations.finishflaghighscore, 
        -- player.splinePosition >= trackPositions.finish and 
        gameState.highScoreChatMsgSent == true and gameState.gameOverMessage == 0 and gameState.checkpoint10 and 1 or 0, 0.1, uiState.dt) 
    local extendplay_windowx_scale = 6.5*fonts.big.sizex
    local extendplay_windowy_scale = 6.5*fonts.big.sizey
    local laptime_windowx_scale = 4*fonts.basic.sizex
    local laptime_windowy_scale = 5*fonts.big.sizey

    -- Begin race window
    ui.beginTransparentWindow("beginRaceWindow", 
        vec2(uiState.windowSize.x * 0.5 - 6*fonts.big.sizex, uiState.windowSize.y * 0.5 - 5*fonts.big.sizey), 
        vec2(2000, 2000), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.beginraceflag)
    ui.drawImage(assets.images.letsGoLabel,
        vec2(0, 0),
        vec2(extendplay_windowx_scale * 2, extendplay_windowy_scale * 0.4),
        rgbm.colors.white)
    ui.popStyleVar()
    ui.endTransparentWindow()

    -- Extend play windows and lap time displays
    for i = 1, 3 do
        local ep = uiAnimations['extendPlay' .. i]
        
        ui.beginTransparentWindow("extendPlay" .. i .. "Window", 
            vec2(uiState.windowSize.x * 0.5 - extendplay_windowx_scale, 
                 uiState.windowSize.y * 0.5 - extendplay_windowy_scale), 
            vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, ep.alpha)
        ui.drawImage(assets.images.extendPlay,
            vec2(0, 0),
            vec2(extendplay_windowx_scale * 2, extendplay_windowy_scale * 0.4),
            rgbm.colors.white)
        ui.popStyleVar()
        ui.endTransparentWindow()

        local lap = 'lap' .. i
        local digitWidth = fonts.basic.sizex * 1.2
        local digitHeight = fonts.basic.sizey * 1.5
        local spacing = fonts.basic.sizex * -0.45
        local quoteSpacing = fonts.basic.sizex * 0.30

        ui.beginTransparentWindow(lap .. "Window", 
            vec2(uiState.windowSize.x * 0.5 - 0.8*laptime_windowx_scale, 
                 uiState.windowSize.y * 0.55 - laptime_windowy_scale), 
            vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations[lap .. 'Alpha'])

        local currentX = 0
        local minDigits = lapTimes[lap .. 'mins'] >= 10 and 2 or 1
        currentX = drawDigits(lapTimes[lap .. 'mins'], currentX, 0, digitWidth, digitHeight, spacing, minDigits)
        currentX = currentX + quoteSpacing
        
        ui.drawImage(assets.images.singleQuote,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing + quoteSpacing
        
        currentX = drawDigits(lapTimes[lap .. 'secs'], currentX, 0, digitWidth, digitHeight, spacing, 2)
        currentX = currentX + quoteSpacing
        
        ui.drawImage(assets.images.doubleQuote,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing + quoteSpacing
        
        local subsecStr = string.sub(string.format("%.3f", lapTimes[lap .. 'subsecs']), -3, -1)
        drawDigits(tonumber(subsecStr), currentX, 0, digitWidth, digitHeight, spacing, 3)

        ui.popStyleVar()
        ui.endTransparentWindow()
    end

    -- Finish race window
    ui.beginTransparentWindow("finishRaceWindow", 
        vec2(uiState.windowSize.x * 0.5 - 5*fonts.big.sizex, uiState.windowSize.y * 0.45 - extendplay_windowy_scale), 
        vec2(2000, 500), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.finishflag)
    ui.drawImage(assets.images.goalLabel,
        vec2(0, 0),
        vec2(10*fonts.big.sizex, 2.5*fonts.big.sizey),
        rgbm.colors.white)
    ui.popStyleVar()
    ui.endTransparentWindow()

    -- Stage results at finish
    local digitWidth = fonts.basic.sizex * 1.2
    local digitHeight = fonts.basic.sizey * 1.5
    local spacing = fonts.basic.sizex * -0.45
    local quoteSpacing = fonts.basic.sizex * 0.30

    for i = 1, 4 do
        local yOffset = 0.65 + (i-1) * 0.1
        local stageLabel = i <= 3 and assets.images['stage' .. i] or assets.images.stage4
        local lap = i == 4 and 'lap10' or 'lap' .. i
        
        ui.beginTransparentWindow(lap .. "FinishWindow", 
            vec2(uiState.windowSize.x * 0.5 - 2*laptime_windowx_scale, 
                 uiState.windowSize.y * yOffset - extendplay_windowy_scale), 
            vec2(2000, 2000), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.finishflag)

        ui.drawImage(stageLabel,
            vec2(0, 0),
            vec2(fonts.basic.sizex * 8, fonts.basic.sizey * 2),
            rgbm.colors.white)

        local currentX = fonts.basic.sizex * 8
        local minDigits = lapTimes[lap .. 'mins'] >= 10 and 2 or 1
        currentX = drawDigits(lapTimes[lap .. 'mins'], currentX, 0, digitWidth, digitHeight, spacing, minDigits)
        currentX = currentX + quoteSpacing
        
        ui.drawImage(assets.images.singleQuote,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing + quoteSpacing
        
        currentX = drawDigits(lapTimes[lap .. 'secs'], currentX, 0, digitWidth, digitHeight, spacing, 2)
        currentX = currentX + quoteSpacing
        
        ui.drawImage(assets.images.doubleQuote,
            vec2(currentX, 0),
            vec2(currentX + digitWidth * 0.5, digitHeight),
            rgbm.colors.white)
        currentX = currentX + digitWidth * 0.5 + spacing + quoteSpacing
        
        local subsecStr = string.sub(string.format("%.3f", lapTimes[lap .. 'subsecs']), -3, -1)
        drawDigits(tonumber(subsecStr), currentX, 0, digitWidth, digitHeight, spacing, 3)

        ui.popStyleVar()
        ui.endTransparentWindow()
    end

    -- Final total time
    ui.beginTransparentWindow("FinalTotalTimeWindow", 
        vec2(uiState.windowSize.x * 0.5 - 4*laptime_windowx_scale, 
             uiState.windowSize.y * 1.0 - extendplay_windowy_scale), 
        vec2(2000, 2000), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.finishflag)

    ui.drawImage(assets.images.totalTimeMetal,
        vec2(0, 0),
        vec2(extendplay_windowx_scale * 1.75, extendplay_windowy_scale * 0.4),
        rgbm.colors.white)

    local currentX = extendplay_windowx_scale * 1.475
    local currentY = digitHeight * 1
    local minDigits = displayTime.minutesTime >= 10 and 2 or 1
    currentX = drawDigits(displayTime.minutesTime, currentX, currentY, digitWidth, digitHeight, spacing, minDigits)
    currentX = currentX + quoteSpacing
    
    ui.drawImage(assets.images.singleQuote,
        vec2(currentX, currentY),
        vec2(currentX + digitWidth * 0.5, 2 * digitHeight),
        rgbm.colors.white)
    currentX = currentX + digitWidth * 0.5 + spacing + quoteSpacing
    
    currentX = drawDigits(displayTime.secondsTime, currentX, currentY, digitWidth, digitHeight, spacing, 2)
    currentX = currentX + quoteSpacing
    
    ui.drawImage(assets.images.doubleQuote,
        vec2(currentX, currentY), 
        vec2(currentX + digitWidth * 0.5, 2 * digitHeight),
        rgbm.colors.white)
    currentX = currentX + digitWidth * 0.5 + spacing + quoteSpacing
    
    local subsecStr = string.sub(string.format("%.3f", displayTime.subSeconds), -3, -1)
    drawDigits(tonumber(subsecStr), currentX, currentY, digitWidth, digitHeight, spacing, 3)
        
    ui.popStyleVar()
    ui.endTransparentWindow()

    -- Final score labels
    ui.beginTransparentWindow("FinalScoreWindow", 
        vec2(uiState.windowSize.x * 0.5 - 4.38*laptime_windowx_scale, 
             uiState.windowSize.y * 1.1 - extendplay_windowy_scale), 
        vec2(2000, 2000), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.finishflagnothighscore)
    ui.drawImage(assets.images.finalScoreMetal,
        vec2(0, 0),
        vec2(extendplay_windowx_scale * 1.95, extendplay_windowy_scale * 0.4),
        rgbm.colors.white)
    ui.popStyleVar()
    ui.endTransparentWindow()

    ui.beginTransparentWindow("NewHighScoreWindow", 
        vec2(uiState.windowSize.x * 0.5 - 5.9*laptime_windowx_scale, 
             uiState.windowSize.y * 1.1 - extendplay_windowy_scale), 
        vec2(2000, 2000), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.finishflaghighscore)
    ui.drawImage(assets.images.newHighScore,
        vec2(0, 0),
        vec2(extendplay_windowx_scale * 2.75, extendplay_windowy_scale * 0.45),
        rgbm.colors.white)
    ui.popStyleVar()
    ui.endTransparentWindow()

    ui.beginTransparentWindow('FinalScoreNumberWindow', 
        vec2(uiState.windowSize.x * 0.5 - 0.08*laptime_windowx_scale, 
             uiState.windowSize.y * 1.15 - extendplay_windowy_scale), 
        vec2(2000, 2000), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.finishflag)
    drawNumber(math.ceil(gameState.finalScore), 10, 0, fonts.basic.sizex * 1.2, fonts.basic.sizey * 1.5, -15)
    ui.popStyleVar()
    ui.endTransparentWindow()

    -- PASSWORD UNLOCK DISPLAY
    if uiAnimations.finishflag > 0.01 and gameState.showPassword then
        -- Password unlock window
        ui.beginTransparentWindow("passwordDisplay", 
            vec2(uiState.windowSize.x * 0.5 - 3*fonts.big.sizex, uiState.windowSize.y * 0.55 - extendplay_windowy_scale), 
            vec2(2000, 500), false)
        ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.finishflag)
        ui.drawImage(assets.images.passwordUnlock,
            vec2(0, 0),
            vec2(6*fonts.big.sizex, 2.25*fonts.big.sizey),
            rgbm.colors.white)
        ui.popStyleVar()
        ui.endTransparentWindow()
    end

    -- Game over window
    ui.beginTransparentWindow("gameOverWindow", 
        vec2(uiState.windowSize.x * 0.5 - 7*fonts.big.sizex, uiState.windowSize.y * 0.5 - 2*fonts.big.sizey), 
        vec2(2000, 2000), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, gameState.gameOverMessage)
    ui.drawImage(assets.images.gameOverLabel,
        vec2(0, 0),
        vec2(extendplay_windowx_scale * 2, extendplay_windowy_scale * 0.4),
        rgbm.colors.white)
    ui.popStyleVar()
    ui.endTransparentWindow()

    -- Total time display (top right)
    local totaltime_xpos = 0.9*uiState.windowSize.x - 8*fonts.basic.sizex

    ui.beginTransparentWindow("totalTimeWindow", 
        vec2(totaltime_xpos, fonts.basic.sizey*2), 
        vec2(800, 400), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.headerflag)
    ui.drawImage(assets.images.totalTimeLabel,
        vec2(0, 0),
        vec2(fonts.basic.sizex * 6, fonts.basic.sizey * 1.5),
        rgbm.colors.white)
    ui.popStyleVar()
    ui.endTransparentWindow()

    ui.beginTransparentWindow("totalTimeDisplay", 
        vec2(totaltime_xpos + fonts.basic.sizex, fonts.basic.sizey*3.5), 
        vec2(1000, 400), false)
    ui.pushStyleVar(ui.StyleVar.Alpha, uiAnimations.headerflag)

    local currentX = 0
    local minDigits = displayTime.minutesTime >= 10 and 2 or 1
    currentX = drawDigits(displayTime.minutesTime, currentX, 0, digitWidth, digitHeight, spacing, minDigits)
    currentX = currentX + quoteSpacing
    
    ui.drawImage(assets.images.singleQuote,
        vec2(currentX, 0),
        vec2(currentX + digitWidth * 0.5, digitHeight),
        rgbm.colors.white)
    currentX = currentX + digitWidth * 0.5 + spacing + quoteSpacing
    
    currentX = drawDigits(displayTime.secondsTime, currentX, 0, digitWidth, digitHeight, spacing, 2)
    currentX = currentX + quoteSpacing
    
    ui.drawImage(assets.images.doubleQuote,
        vec2(currentX, 0),
        vec2(currentX + digitWidth * 0.5, digitHeight),
        rgbm.colors.white)
    currentX = currentX + digitWidth * 0.5 + spacing + quoteSpacing
    
    local subsecStr = string.sub(string.format("%.3f", displayTime.subSeconds), -3, -1)
    drawDigits(tonumber(subsecStr), currentX, 0, digitWidth, digitHeight, spacing, 3)
    
    ui.popStyleVar()
    ui.endTransparentWindow()

    -- Music player window
    ui.beginTransparentWindow("musicPlayerWindow", 
        vec2(uiState.windowSize.x*0.25, uiState.windowSize.y*0.9), 
        vec2(1000, 1000), false)
    ui.pushFont(ui.Font.Main)

    local songIndex = gameState.lastPlayedSong
    if songIndex >= 1 and songIndex <= 10 and mediaPlayers[songIndex + 3]:playing() == true then
        ui.text("Now Playing: " .. songNames[songIndex])
        ui.text("performed by: Wolf and Raven")
    end
    
    ui.popFont()
    ui.endTransparentWindow()
end
