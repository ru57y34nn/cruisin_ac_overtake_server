
function script.update(dt)

    local function script.prepare(dt)
        ac.debug("speed", ac.getCarState(1).speedKmh)
        if ac.getCar(0).speedKmh > 0 then
            -- local countDown = 90
        return 90
        end
        -- return ac.getCarState(1).speedKmh > requiredSpeed
    end
    local countDown = script.prepare(dt)
end
local uiState = ac.getUI()
ui.beginTransparentWindow("overtakeScore", vec2(uiState.windowSize.x * 0.5, 100), vec2(400, 400), false)
ui.beginOutline()
ui.pushStyleVar(ui.StyleVar.Alpha, 1)
ui.pushFont(ui.Font.Huge)
ui.text("Time: " ..math.floor(countDown).. "secs")

ui.endTransparentWindow()