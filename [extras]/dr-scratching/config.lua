Config = {}
Config.Locale = 'de'

 -- You don't have to sum to sum the chances of all of the prices to 100. The totel will be decided based on the
 -- <chance of one price>/<total of all prices>. e.g. Price: 'Common' has a chance of '50' and the total of all chances is 100, so 50/100 (50%)
 -- chance of packing common. You may add as many prices as you want. Follow the preset logic.
 Config.Prices = {
  Nothing = {
    chance = 50,
    message = '~c~Leider hast du nichts gewonnen :(~s~',
    price = {
      price_money = 0,
      item = {
        price_is_item = false,
        item_name = '',
        item_label = '',
        item_amount = 1
      }
    }
  },
  Common = {
    chance = 20,
    message = '~g~Du hast ein neues Rubellos gewonnen!',
    price = {
      price_money = 0,
      item = {
        price_is_item = true,
        item_name = 'scratch_ticket',
        item_label = 'Scratch Ticket',
        item_amount = 1
      }
    }
  },
  Rare = {
    chance = 15,
    message = '~g~Du hast gewonnen!~s~ Gönn dir etwas für ~g~$350~s~!',
    price = {
      price_money = 350,
      item = {
        price_is_item = false,
        item_name = '',
        item_label = '',
        item_amount = 1
      }
    }
  },
  Epic = {
    chance = 9,
    message = '~g~Du hast dick gewonnen! ~g~+ $1250~s~!',
    price = {
      price_money = 1250,
      item = {
        price_is_item = false,
        item_name = '',
        item_label = '',
        item_amount = 1
      }
    }
  },
  Legendary = {
    chance = 1,
    message = '~r~L~b~E~g~G~y~E~p~N~q~D~o~A~r~R~b~Y~s~! YDu gewinnst ~g~$10000~s~!',
    price = {
      price_money = 10000,
      item = {
        price_is_item = false,
        item_name = '',
        item_label = '',
        item_amount = 1
      }
    }
  }
}

Config.Webhooks = {
  webhooksEnabled = false, -- enable/disable webhooks. Place your 'Discord WEBHOOK URL' in server/s_webhooks.lua:1
  logProperties = {
    possibleCheatingAttempt = true, -- will trigger on possible cheating attempt
    winMessages = true, -- will trigger on win (both money and item)
    loseMessages = false, -- will trigger on lose
    earlyMessage = false -- will trigger if person doesn't fully scratch ticket
  },
}

Config.ScratchCooldownInSeconds = 10 -- Cooldown in SECONDS, when will player be able to scratch another ticket?
Config.ShowCooldownNotifications = true -- Show a notification to player with the remaining cooldown timer
Config.ShowUsedTicketNotification = true  -- Show a notification to player whenever a ticket is used
Config.ShowResultTicketNotification = true  -- Show a notification with message of price ticket. See Config.Prices.message
Config.ScratchAmount = 80    -- Percentage of the ticket that needs to be scrapped away for the price to be 'seen'