Config = {
    Radio = {
        useRadioAsItem = true, -- true/false [boolean] -- > Do you want to use radio as item ?
        radioItemName = "radio", -- the item name [string] -- > If "useRadioAsItem" is true, set the radio item name
        openRadioMenuKeyValue = "F9", -- the key [string] -- > Set the key to open the radio. You can set to nil if you want the player to only be able to open the menu using the radio item
        openRadioMenuKeyDesc = "Öffne das Funkmenü", -- description [string] -- > Set the description of the key
        maxFrequencySize = 3, -- number of digits [integer] -- > Set the maximum number of numbers in the frequency (example: 3 makes three-digit frequencies like "374", 4 makes four-digit frequencies like "7854", 5 makes five-digit frequencies like "98763")
        disconnectRadioOnDeath = true, -- true/false [boolean] -- > Do you want the radio to automatically disconnect when the player dies?
        canChangeVolume = true, -- true/false [boolean] -- > Do you want players to be able to change their radio volume?
        Sounds = {
            radioOn = true, -- true/false [boolean] -- > Do you want the script play a sound when the radio is turned on ?
            radioOff = true, -- true/false [boolean] -- > Do you want the script play a sound when the radio is turned off ?
            radioClicks = true, -- true/false [boolean] -- > Do you want the script play a sound when the player is talking on the radio ?
        },
        PrivateJobsFrequency = {
            [1] = {"police", "fbi"},
            [2] = {"police", "fbi"},
            [3] = {"police", "fbi"},
            [4] = {"ambulance", "police", "fbi"},
            [5] = {"fbi"},
        },
    },
    RageUI = {
        menuTitle = "Funkmenü", -- the menu title [string] -- > Set the menu title
        menuSubtitle = "Dies ist das Funkmenü", -- the menu subtitle [string] -- > Set the menu subtitle
        marginLeft = 10, -- the margin left [integer] -- > Set the margin between the left side of the screen and the right side of the menu
        marginTop = 10, -- the margin top [integer] -- > Set the margin between the top of the screen and the top of the menu
        customBanner = {
            url = nil, -- nil/an url [nil/string] -- > If you want, you can set here an url pointing to an image to have a custom RageUI banner.
            imageWidth = 512, -- width of custom banner [integer] -- > If "customBanner.url" is set, set this to the width of the image
            imageHeight = 128, -- height of custom banner [integer] -- > If "customBanner.url" is set, set this to the the height of the image
        },
        defaultBanner = {
            colorR = 255, -- red color of the banner [integer] -- > If "customBanner.url" isn't set (nil value), set this to the red value (RGB) for the banner color
            colorG = 100, -- green color of the banner [integer] -- > If "customBanner.url" isn't set (nil value), set this to the green value (RGB) for the banner color
            colorB = 100, -- blue color of the banner [integer] -- > If "customBanner.url" isn't set (nil value), set this to the blue value (RGB) for the banner color
            colorA = 100, -- alpha of the banner [integer] -- > If "customBanner.url" isn't set (nil value), set this to the alpha value (transparency) for the banner
        }
    }
}

Locale = {
    missingRadioItem = "Du hast kein Funkgerät in deinem Inventar",
    changeFrequency = "Ändern die Funkfrequenz",
    changeFrequencyDescription = "Drück ~r~[ENTER] ~s~um die Funkfrequenz zu ändern",
    noFrequencySelectedMenu = "Keine Frequenz ausgewählt",
    noFrequencySelectedNotification = "Du kannst das Funkgerät nicht einschalten, da du keine Frequenz ausgewählt hast",
    cantJoinFrequencyDueToPrivateFrequency = "Du kannst dich nicht mit dieser Funkfrequenz verbinden, da diese privat ist.",
    frequencySymbol = " Hz",
    frequencyColor = "~r~",
    textEntryDescription = "Gib die ~r~neue Funkfrequenz ein",
    enableRadio = "Funkgerät einschalten",
    enableRadioDescription = "Drücke ~r~[ENTER] ~s~um das Funkgerät einzuschalten",
    disableRadio = "Funkgerät aussschalten",
    disableRadioDescription = "Drücke ~r~[ENTER] ~s~tum das Funkgerät auszuschalten",
    changeRadioVolume = "Änder die Lautstärke",
    changeRadioVolumeDescription = "Nutze die ~r~Pfeiltasten~s~ tum die Lautstärke zu ändern",
    onlyNumbers = "Du kannst nur Zahlen nutzen.",
    firstCharacterError = "TDie erste Zahl kann nicht 0 sein",
    radioState = "Status: ",
    radioFrequency = "Aktive Funkfrequenz: ",
    radioVolume = "Lautstärke: ~r~",
    stateOn = "~g~AN",
    stateOff = "~r~AUS",
}