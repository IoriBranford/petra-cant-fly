local Config = require "Config"
local Audio = {}
local GameMusicEmu-- = require "GameMusicEmu"

local clips = {}
local music
local musicfadespeed = 0

local types = {
    ogg = true,
    wav = true,
    xm = true,
    it = true,
    s3m = true,
    mod = true
}

function Audio.clear()
    Audio.stopMusic()
    love.audio.stop()
    clips = {}
end

function Audio.isAudioFile(file)
    return types[string.match(file, "%.(%w+)$")]
end

function Audio.load(file, mode)
    local clip
    if GameMusicEmu and GameMusicEmu.isSupported(file) then
        clip = GameMusicEmu.new(file)
    elseif Audio.isAudioFile(file) then
        clip = love.audio.newSource(file, mode or "static")
    end
    clips[file] = clip
    return clip
end

function Audio.play(file, track)
    local clip = clips[file] or Audio.load(file)
    if clip then
        clip:stop()
        clip:play(track)
        clip:setVolume(Config.soundvolume)
    end
    return clip
end

function Audio.setMusicVolume(volume)
    if music then
        music:setVolume(volume)
    end
end

function Audio.update(dsecs)
    if music then
        if music.update then
            music:update()
        end

        if musicfadespeed > 0 then
            local volume = music:getVolume() - musicfadespeed * dsecs
            if volume <= 0 then
                Audio.stopMusic()
            else
                music:setVolume(volume)
            end
        end
    end
end

function Audio.stopMusic()
    if music then
        music:stop()
    end
    music = nil
    musicfadespeed = 0
end

function Audio.playMusic(file, track)
    Audio.stopMusic()
    music = Audio.play(file, track)
    music:setVolume(Config.musicvolume)
    return music
end

function Audio.fadeMusic(time)
    if music then
        time = time or 3
        musicfadespeed = music:getVolume() / time
    end
    return music
end

return Audio
