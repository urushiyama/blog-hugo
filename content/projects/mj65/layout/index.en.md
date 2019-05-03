---
title: "MJ65 Layout"
date: 2019-04-29T09:02:10+09:00
draft: true
type: "mj65"
tags:
    - "自作キーボード"
    - "JIS配列"
keywords:
    - "自作キーボード"
    - "PCB"
    - "プリント基板"
    - "Kailh Low Profile (Choc) 対応"
    - "JIS配列"
shorttitle: "MJ65"
navigations:
    - title: "PCB"
      url: "https://github.com/urushiyama/MJ65-PCB"
    - title: "Plate"
      url: "https://github.com/urushiyama/MJ65-Plate"
    - title: "Firmware"
      url: "https://github.com/urushiyama/qmk_firmware/tree/MJ65/keyboards/mj65"
    - title: "Build Guide"
      url: "../buildguide/"
    - title: "Layout"
      url: "#"
---

{{% toc %}}

## Layout & Keymaps of MJ65

MJ65 supports six layout using different footprints.
The IDEAL layout is, of course, the JIS layout with 65 keys.
However, it requires a 3.5u keycap, which is hard to be found.
Therefore MJ65 supports split spaces JIS layout, both of which just requires a usual 1.75u keycap.

Are you US-layout (ANSI-layout) lovers? Although MJ65 does not support actual US layout, MJ65 even supports the US-like layout with 62 keys. Some keymaps at right side is similar to HHKB.

Do you want one more key such as Menu Key? MJ65 also supports one additional key at the lower right side.

Supported layouts is below:

|Name|Description|
|----|-----------|
|[default](#default)|JIS layout, 65 keys|
|[split_space](#split_space)|JIS layout with split space, 66 keys|
|[us_like](#us_like)|US-like layout, 62 keys|
|[1app](#1app)|JIS layout with one additional Menu Key, 66 keys|
|[1app_split](#1app_split)|JIS layout with one additional Menu Key and split space, 67 keys|
|[1app_us](#1app_us)|US layout with one additional Menu Key, 63 keys|

## Soldering for each layout

### Space Key

- [split_space](#split_space) and [1app_split](#1app_split)

    Solder two switches on these two footprints:
{{% card %}}
![split_space_footprints]({{% contentref "../img/layout/split_space_footprints.png" %}})
{{% /card %}}

- [default](#default) and [1app](#1app)

    Solder one switch on these one footprint:
{{% card %}}
![jis_space_footprints]({{% contentref "../img/layout/jis_space_footprint.png" %}})
{{% /card %}}

- [us_like](#us_like) と [1app_us](#1app_us)

    Solder one switch on these one footprint:
{{% card %}}
![us_space_footprints]({{% contentref "../img/layout/us_space_footprint.png" %}})
{{% /card %}}

### Around Enter Key

- [default](#default), [split_space](#split_space), [1app](#1app), and [1app_split](#1app_split)

    Solder four switches on these four footprints:
{{% card %}}
![jis_enter_footprints]({{% contentref "../img/layout/jis_enter_footprints.png" %}})
{{% /card %}}

- [us_like](#us_like) and [1app_us](#1app_us)

    Solder three switches on these three footprints:
{{% card %}}
![us_like_enter_footprints]({{% contentref "../img/layout/us_enter_footprints.png" %}})
{{% /card %}}

### Bottom-Right Side

- [default](#default), [split_space](#split_space), and [us_like](#us_like)

    Solder two switches on these two footprints:
{{% card %}}
![1app_footprints]({{% contentref "../img/layout/no_app_footprints.png" %}})
{{% /card %}}

- [1app](#1app), [1app_split](#1app_split), and [1app_us](#1app_us)

    Solder three switches on these three footprints:
{{% card %}}
![1app_footprints]({{% contentref "../img/layout/1app_footprints.png" %}})
{{% /card %}}

## Layouts Description

On each layout, you can input based on Base Layer if you type a key without pressing shift nor Fn.
If you type a key with pressing shift, you can input based on Shift Layer.
If you type a key with pressing Fn, you can input based on Function (Fn) Layer.

|Label|Input|
|---|---|
|Esc|Escape|
|Del|Backspace/Delete (backward delete)|
|Tab|Tab|
|Enter|Enter|
|Ctr/Ctrl|Control|
|Shift|Shift|
|Caps|Caps Lock|
|Opt|Option/Alt|
|Cmd|Command/WIN/GUI|
|Space|Space|
|EN|Change IME to enter English (JIS)|
|JP|Change IME to enter Japanese (JIS)|
|Fn|Momentary shift into Fn Layer|
|Pow|System Power|
|F1~F13|Function Keys|
|Ejc|Eject|
|Ddw|Display Brightness Down|
|Dup|Display Brightness Up|
|<<|Previous Track|
|>\|\||Play/Pause|
|>>|Next Track|
|Sx|Sound Mute|
|Sdw|Sound Volume Down|
|Sup|Sound Volume Up|
|L_LOCK|Exclusively lock Fn Layer. Press once again to unlock.|
|-^|Up Arrow|
|<-|Left Arrow|
|-v|Down Arrow|
|->|Right Arrow|
|KP_Ent|Keypad Enter|
|App|Application Key|

### default

![default_layout]({{% contentref "../img/layout/default.png" %}})

```plain

- Base Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Esc| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | - | ^ | \ |Del|
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|Tab  | q | w | e | r | t | y | u | i | o | p | @ | [ |Enter|
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.    |
|Ctrl  | a | s | d | f | g | h | j | k | l | ; | : | ] |    |
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'----|
|Shift   | z | x | c | v | b | n | m | , | . | / | _ | Shift|
|-----.--'.--'-.-'--.'---'---'---'.--'-.-'--.'--.'---'.-----|
|Caps |Opt| Cmd|  EN|    Space    |JP  |Cmd |Opt| Ctrl|   Fn|
`-----'---'----'----'-------------'----'----'---'-----'-----'

- Shift Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Esc| ! | " | # | $ | % | & | ' | ( | ) |   | = | ~ | | |Del|
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|Tab  | Q | W | E | R | T | Y | U | I | O | P | ` | { |Enter|
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.    |
|Ctrl  | A | S | D | F | G | H | J | K | L | + | * | } |    |
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'----|
|Shift   | Z | X | C | V | B | N | M | < | > | ? | _ | Shift|
|-----.--'.--'-.-'--.'---'---'---'.--'-.-'--.'--.'---'.-----|
|Caps |Opt| Cmd|  EN|    Space    |JP  |Cmd |Opt| Ctrl|   Fn|
`-----'---'----'----'-------------'----'----'---'-----'-----'

- Function (Fn) Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Pow|F1 |F2 |F3 |F4 |F5 |F6 |F7 |F8 |F9 |F10|F11|F12|F13|Ejc|
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|     |Ddw|Dup|   |   |   |   |<< |>||| >>|Sx |Sdw|Sup|     |
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.    |
|      |   |   |   |   |   |   |   |   |   |-^ |   |   |    |
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'----|
|L_Lock  |   |   |   |   |   |   |   |   |<- |-v |-> |      |
|-----.--'.--'-.-'--.'---'---'---'.--'-.-'--.'--.'---'.-----|
|     |   |    |    |             |    |    |   |     |     |
`-----'---'----'----'-------------'----'----'---'-----'-----'
```

### split_space

![split_space_layout]({{% contentref "../img/layout/split_space.png" %}})

```plain

- Base Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Esc| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | - | ^ | \ |Del|
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|Tab  | q | w | e | r | t | y | u | i | o | p | @ | [ |Enter|
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.    |
|Ctrl  | a | s | d | f | g | h | j | k | l | ; | : | ] |    |
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'----|
|Shift   | z | x | c | v | b | n | m | , | . | / | _ | Shift|
|-----.--'.--'-.-'--.'---'-.-'---'.--'-.-'--.'--.'---'.-----|
|Caps |Opt| Cmd|  EN| Space|KP_Ent|JP  |Cmd |Opt| Ctrl|   Fn|
`-----'---'----'----'------'------'----'----'---'-----'-----'

- Shift Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Esc| ! | " | # | $ | % | & | ' | ( | ) |   | = | ~ | | |Del|
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|Tab  | Q | W | E | R | T | Y | U | I | O | P | ` | { |Enter|
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.    |
|Ctrl  | A | S | D | F | G | H | J | K | L | + | * | } |    |
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'----|
|Shift   | Z | X | C | V | B | N | M | < | > | ? | _ | Shift|
|-----.--'.--'-.-'--.'---'-.-'---'.--'-.-'--.'--.'---'.-----|
|Caps |Opt| Cmd|  EN| Space|KP_Ent|JP  |Cmd |Opt| Ctrl|   Fn|
`-----'---'----'----'------'------'----'----'---'-----'-----'

- Function (Fn) Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Pow|F1 |F2 |F3 |F4 |F5 |F6 |F7 |F8 |F9 |F10|F11|F12|F13|Ejc|
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|     |Ddw|Dup|   |   |   |   |<< |>||| >>|Sx |Sdw|Sup|     |
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.    |
|      |   |   |   |   |   |   |   |   |   |-^ |   |   |    |
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'----|
|L_Lock  |   |   |   |   |   |   |   |   |<- |-v |-> |      |
|-----.--'.--'-.-'--.'---'-.-'---'.--'-.-'--.'--.'---'.-----|
|     |   |    |    |      |      |    |    |   |     |     |
`-----'---'----'----'------'------'----'----'---'-----'-----'
```

### us_like

![us_like_layout]({{% contentref "../img/layout/us_like.png" %}})

```plain

- Base Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Esc| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | - | = | \ | ` |
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|Tab  | q | w | e | r | t | y | u | i | o | p | [ | ] |  Del|
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'-----|
|Ctrl  | a | s | d | f | g | h | j | k | l | ; | ' |   Enter|
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'--------|
|Shift   | z | x | c | v | b | n | m | , | . | / |     Shift|
|-----.--'.--'-.-'---'---'---'---'---'--.'--.'--.'----.-----|
|Caps |Opt| Cmd|          Space         |Cmd|Opt| Ctrl|   Fn|
`-----'---'----'------------------------'---'---'-----'-----'

- Shift Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Esc| ! | @ | # | $ | % | ^ | & | * | ( | ) | _ | + | | | ~ |
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|Tab  | Q | W | E | R | T | Y | U | I | O | P | { | } |  Del|
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'-----|
|Ctrl  | A | S | D | F | G | H | J | K | L | : | " |   Enter|
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'--------|
|Shift   | Z | X | C | V | B | N | M | < | > | ? |     Shift|
|-----.--'.--'-.-'---'---'---'---'---'--.'--.'--.'----.-----|
|Caps |Opt| Cmd|          Space         |Cmd|Opt| Ctrl|   Fn|
`-----'---'----'------------------------'---'---'-----'-----'

- Function (Fn) Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Pow|F1 |F2 |F3 |F4 |F5 |F6 |F7 |F8 |F9 |F10|F11|F12|F13|Ejc|
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|     |Ddw|Dup|   |   |   |   |<< |>||| >>|Sx |Sdw|Sup|     |
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'-----|
|      |   |   |   |   |   |   |   |   |   |-^ |   |        |
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'--------|
|L_Lock  |   |   |   |   |   |   |   |   |<- |-v |->        |
|-----.--'.--'-.-'--.'---'---'---'.--'-.-'--.'--.'----.-----|
|     |   |    |    |             |    |    |   |     |     |
`-----'---'----'----'-------------'----'----'---'-----'-----'
```

### 1app

![1app_layout]({{% contentref "../img/layout/1app.png" %}})

```plain

- Base Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Esc| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | - | ^ | \ |Del|
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|Tab  | q | w | e | r | t | y | u | i | o | p | @ | [ |Enter|
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.    |
|Ctrl  | a | s | d | f | g | h | j | k | l | ; | : | ] |    |
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'----|
|Shift   | z | x | c | v | b | n | m | , | . | / | _ | Shift|
|-----.--'.--'-.-'--.'---'---'---'.--'-.-'--.'--.'--.'--.---|
|Caps |Opt| Cmd|  EN|    Space    |JP  |Cmd |Opt|Ctr|App| Fn|
`-----'---'----'----'-------------'----'----'---'---'---'---'

- Shift Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Esc| ! | " | # | $ | % | & | ' | ( | ) |   | = | ~ | | |Del|
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|Tab  | Q | W | E | R | T | Y | U | I | O | P | ` | { |Enter|
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.    |
|Ctrl  | A | S | D | F | G | H | J | K | L | + | * | } |    |
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'----|
|Shift   | Z | X | C | V | B | N | M | < | > | ? | _ | Shift|
|-----.--'.--'-.-'--.'---'---'---'.--'-.-'--.'--.'--.'--.---|
|Caps |Opt| Cmd|  EN|    Space    |JP  |Cmd |Opt|Ctr|App| Fn|
`-----'---'----'----'-------------'----'----'---'---'---'---'

- Function (Fn) Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Pow|F1 |F2 |F3 |F4 |F5 |F6 |F7 |F8 |F9 |F10|F11|F12|F13|Ejc|
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|     |Ddw|Dup|   |   |   |   |<< |>||| >>|Sx |Sdw|Sup|     |
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.    |
|      |   |   |   |   |   |   |   |   |   |-^ |   |   |    |
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'----|
|L_Lock  |   |   |   |   |   |   |   |   |<- |-v |-> |      |
|-----.--'.--'-.-'--.'---'---'---'.--'-.-'--.'--.'--.'--.---|
|     |   |    |    |             |    |    |   |   |   |   |
`-----'---'----'----'-------------'----'----'---'---'---'---'
```

### 1app_split

![1app_split_layout]({{% contentref "../img/layout/1app_split.png" %}})

```plain

- Base Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Esc| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | - | ^ | \ |Del|
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|Tab  | q | w | e | r | t | y | u | i | o | p | @ | [ |Enter|
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.    |
|Ctrl  | a | s | d | f | g | h | j | k | l | ; | : | ] |    |
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'----|
|Shift   | z | x | c | v | b | n | m | , | . | / | _ | Shift|
|-----.--'.--'-.-'--.'---'-.-'---'.--'-.-'--.'--.'--.'--.---|
|Caps |Opt| Cmd|  EN| Space|KP_Ent|JP  |Cmd |Opt|Ctr|App| Fn|
`-----'---'----'----'------'------'----'----'---'---'---'---'

- Shift Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Esc| ! | " | # | $ | % | & | ' | ( | ) |   | = | ~ | | |Del|
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|Tab  | Q | W | E | R | T | Y | U | I | O | P | ` | { |Enter|
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.    |
|Ctrl  | A | S | D | F | G | H | J | K | L | + | * | } |    |
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'----|
|Shift   | Z | X | C | V | B | N | M | < | > | ? | _ | Shift|
|-----.--'.--'-.-'--.'---'-.-'---'.--'-.-'--.'--.'--.'--.---|
|Caps |Opt| Cmd|  EN| Space|KP_Ent|JP  |Cmd |Opt|Ctr|App| Fn|
`-----'---'----'----'------'------'----'----'---'---'---'---'

- Function (Fn) Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Pow|F1 |F2 |F3 |F4 |F5 |F6 |F7 |F8 |F9 |F10|F11|F12|F13|Ejc|
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|     |Ddw|Dup|   |   |   |   |<< |>||| >>|Sx |Sdw|Sup|     |
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.    |
|      |   |   |   |   |   |   |   |   |   |-^ |   |   |    |
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'----|
|L_Lock  |   |   |   |   |   |   |   |   |<- |-v |-> |      |
|-----.--'.--'-.-'--.'---'-.-'---'.--'-.-'--.'--.'--.'--.---|
|     |   |    |    |      |      |    |    |   |   |   |   |
`-----'---'----'----'------'------'----'----'---'---'---'---'
```

### 1app_us

![1app_us_layout]({{% contentref "../img/layout/1app_us.png" %}})

```plain

- Base Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Esc| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | - | = | \ | ` |
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|Tab  | q | w | e | r | t | y | u | i | o | p | [ | ] |  Del|
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'-----|
|Ctrl  | a | s | d | f | g | h | j | k | l | ; | ' |   Enter|
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'--------|
|Shift   | z | x | c | v | b | n | m | , | . | / |     Shift|
|-----.--'.--'-.-'---'---'---'---'---'--.'--.'--.'--.---.---|
|Caps |Opt| Cmd|          Space         |Cmd|Opt|Ctr|App| Fn|
`-----'---'----'------------------------'---'---'---'---'---'

- Shift Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Esc| ! | @ | # | $ | % | ^ | & | * | ( | ) | _ | + | | | ~ |
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|Tab  | Q | W | E | R | T | Y | U | I | O | P | { | } |  Del|
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'-----|
|Ctrl  | A | S | D | F | G | H | J | K | L | : | " |   Enter|
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'--------|
|Shift   | Z | X | C | V | B | N | M | < | > | ? |     Shift|
|-----.--'.--'-.-'---'---'---'---'---'--.'--.'--.'--.---.---|
|Caps |Opt| Cmd|          Space         |Cmd|Opt|Ctr|App| Fn|
`-----'---'----'------------------------'---'---'---'---'---'

- Function (Fn) Layer

,---.---.---.---.---.---.---.---.---.---.---.---.---.---.---.
|Pow|F1 |F2 |F3 |F4 |F5 |F6 |F7 |F8 |F9 |F10|F11|F12|F13|Ejc|
|---'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'---|
|     |Ddw|Dup|   |   |   |   |<< |>||| >>|Sx |Sdw|Sup|     |
|-----'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'.--'-----|
|      |   |   |   |   |   |   |   |   |   |-^ |   |        |
|------'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'--------|
|L_Lock  |   |   |   |   |   |   |   |   |<- |-v |->        |
|-----.--'.--'-.-'--.'---'---'---'.--'-.-'--.'--.'--.---.---|
|     |   |    |    |             |    |    |   |   |   |   |
`-----'---'----'----'-------------'----'----'---'---'---'---'
```

## Extra Keys

MJ65 provide extra 11 footprints to sold key switches (or some momentary switches you prefer) at the upper right of the PCB.

By default, there are no keymaps for them. So you have to configure QMK firmware to utilize them.

```plain

,---.---.---.---. ,---.---.---. ,---.---.---. ,---.
|Ex0|Ex1|Ex2|Ex3| |Ex4|Ex5|Ex6| |Ex7|Ex8|Ex9| |ExA|
`---'---'---'---' `---'---'---' `---'---'---' `---'
```

There is a macro function to configure extra keys as below：
```cpp
LAYOUT_WITH_EXTRA( \
  LAYOUT_[LAYOUT NAME](...), \ /* Layout settings except Extra Keys */
  ex0, ex1, ex2, ex3, ex4, ex5, ex6, ex7, ex8, ex9, exA \
)
```
