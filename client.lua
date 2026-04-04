-- Register radio stations
for _, station in ipairs(CustomStations) do
    AddTextEntry(station.id, station.label)
    ForceMusicTrackList(station.id, station.trackList, GetNetworkTimeAccurate())
end

-- Register song titles and artists
for k, v in pairs(SongInfo) do
    AddTextEntry(k .. 'S', v[1]) -- Song title
    AddTextEntry(k .. 'A', v[2]) -- Artist
end

-- Hide default radio stations
local function DisableRadioStations()
    for _, radioStation in ipairs(DisabledStations) do
        SetRadioStationIsVisible(radioStation, false)
    end
end

CreateThread(function()
    DisableRadioStations()
end)

-- Disable radio control in Emergency Vehicles
local isRadioControlDisabled = false

lib.onCache('vehicle', function(value)
    if not value then
        if isRadioControlDisabled then
            SetUserRadioControlEnabled(true)
            isRadioControlDisabled = false
        end
        return
    end

    if GetVehicleClass(value) == 18 then
        SetUserRadioControlEnabled(false)
        SetVehRadioStation(value, 'OFF')
        isRadioControlDisabled = true
    elseif isRadioControlDisabled then
        SetUserRadioControlEnabled(true)
        isRadioControlDisabled = false
    end
end)
