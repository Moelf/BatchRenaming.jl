# BatchRenaming

Example:
```
using BatchRenaming

julia> readdir()
51-element Array{String,1}:
 "No Credits Ending 1.mkv"
 "No Credits Ending 2.mkv"
 "No Credits Opening 1.mkv"
 "No Credits Opening 2.mkv"
 "Your Lie in April - 1x08 - Let It Ring.mkv"
 "Your Lie in April - 1x09 - Resonance.mkv"
 "Your Lie in April - 1x10 - The Scenery I Shared With You.mkv"
 "Your Lie in April - 1x11 - Light of Life.mkv"
 "Your Lie in April - 1x12 - Twinkle Little Star.mkv"
 "Your Lie in April - 1x13 - Love's Sadness.mkv"
 ⋮
 "[Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [18][Hi10p_1080p][x264_flac].Sumisora&CASO.sc.ass"
 "[Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [19][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass"
 "[Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [20][Hi10p_1080p][x264_flac].Sumisora&CASO.sc.ass"
 "[Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [21][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass"
 "[Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [22][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass"

```

You want to provide 2 `Regex` expressions each with a captured number `(\d+)` which will be used to sort the files.

`presuffix` allows you to prepend the subtitles' suffix, useful for Plex where it needs language code.

Default is a `dryrun=true`, and it prints what it will do:
```
julia> rename!(r"Your Lie.*1x(\d+).*mkv",r"\[Mabors.*\[(\d+)\].*ass"; presuffix=".zh")
suf = ".zh.ass"
File matching:
Your Lie in April - 1x01 - Monotone Colorful.mkv             <---- [Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [01][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass
Your Lie in April - 1x02 - Friend A.mkv                      <---- [Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [02][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass
Your Lie in April - 1x03 - Inside Spring.mkv                 <---- [Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [03][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass
Your Lie in April - 1x04 - Set Out.mkv                       <---- [Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [04][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass
Your Lie in April - 1x05 - Gray Skies.mkv                    <---- [Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [05][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass
Your Lie in April - 1x06 - On The Way Home.mkv               <---- [Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [06][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass
Your Lie in April - 1x07 - The Shadows Whisper.mkv           <---- [Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [07][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass
Your Lie in April - 1x08 - Let It Ring.mkv                   <---- [Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [08][Hi10p_1080p][x264_flac].Sumisora&CASO.sc.ass
Your Lie in April - 1x09 - Resonance.mkv                     <---- [Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [09][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass
...# displayed full in reality
Renaming:
[Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [01][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass ----> Your Lie in April - 1x01 - Monotone Colorful.zh.ass
[Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [02][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass ----> Your Lie in April - 1x02 - Friend A.zh.ass
[Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [03][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass ----> Your Lie in April - 1x03 - Inside Spring.zh.ass
[Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [04][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass ----> Your Lie in April - 1x04 - Set Out.zh.ass
[Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [05][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass ----> Your Lie in April - 1x05 - Gray Skies.zh.ass
[Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [06][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass ----> Your Lie in April - 1x06 - On The Way Home.zh.ass
[Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [07][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass ----> Your Lie in April - 1x07 - The Shadows Whisper.zh.ass
[Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [08][Hi10p_1080p][x264_flac].Sumisora&CASO.sc.ass  ----> Your Lie in April - 1x08 - Let It Ring.zh.ass
[Mabors&VCB-Studio] Shigatsu wa Kimi no Uso [09][Hi10p_1080p][x264_2flac].Sumisora&CASO.sc.ass ----> Your Lie in April - 1x09 - Resonance.zh.ass
...# displayed full in reality
```

when you're ready, do real run:
```
julia> rename!(r"Your Lie.*1x(\d+).*mkv",r"\[Mabors.*\[(\d+)\].*ass"; dryrun=false, presuffix=".zh")
```
