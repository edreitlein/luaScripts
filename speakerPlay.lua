tArgs = {...}
audioFile = (tArgs[1])
local dfpwm = require("cc.audio.dfpwm")
local speaker = peripheral.find("speaker")



local decoder = dfpwm.make_decoder()
for chunk in io.lines(audioFile, 16 * 1024) do --this is where the file name that is played should be
    local buffer = decoder(chunk)

    while not speaker.playAudio(buffer) do
        os.pullEvent("speaker_audio_empty")
    end
end