Locales['de'] = { 

    -- want to use your own, custom coloring? Use:
    -- https://wiki.rage.mp/index.php?title=Fonts_and_Colors

    ['lottery_name'] = 'Scratch&Win', -- name in result of ticket notification
    ['lottery_subject'] = 'Ergebniss', -- subject in result of ticket notification
    ['active_cooldown'] = 'Du hast geade erst ein Ticket benutzt! Bitte warte: ~r~%s~s~ more Sekunden.~s~', -- %s <cooldown in seconds>
    ['used_scratchticket'] = 'Du hast ~g~erfolgreich~s~ ein ~p~Rubellos~s~ genutzt.',
    ['currency'] = '$',
    ['scratch_lost'] = 'Leider Verloren :(', -- default UPPERCASE
    ['scratch_won'] = 'Du hast Gewonnen!',

    -- Webhooks
    -- Want to use Discords markdown text? Use:
    -- https://support.discord.com/hc/en-us/articles/210298617-Markdown-Text-101-Chat-Formatting-Bold-Italic-Underline-

    ['webhook_resourceName'] = "[ %s ]", -- %s <resource name>
    ['webhook_identifier'] = 'Identifier', -- current player his/her identifier
    ['webhook_winMessage_cash'] = '**%s** won $%s whilst using a scratch ticket!', -- (1) %s <name> (2) %s <cash amount>
    ['webhook_winMessage_item'] = '**%s** won %sx %s whilst using a scratch ticket!', -- (1) %s <name> (2) %s <amount> (3) <item name>
    ['webhook_loseMessage'] = '**%s** lost whilst using a scratch ticket.', -- %s <name>
    ['webhook_possibleCheatingAttempt'] = '**%s** triggered the *possible* cheatting attempt.', -- %s <name>
    ['webhook_message'] = 'Message' -- cheating attempt message header
}