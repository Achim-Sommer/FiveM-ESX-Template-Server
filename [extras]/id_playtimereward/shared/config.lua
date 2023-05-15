GlobalState.Hours = 24 -- how many hours players have to play for the reward
GlobalState.Minutes = 60 -- do not touch (I don't even know why this is here :/)

GlobalState.Reward = 'money' -- Can be "item", "vehicle" or "money"

GlobalState.VehicleReward = 'zentorno' -- vehicle will be spawned in the garage (owned_vehicles) (only if GlobalState.Reward is "vehicle")
GlobalState.MoneyReward = math.random(10000, 20000) -- amount of money that will be given (between 5000 and 10000, can be edited) as a reward (only if GlobalState.Reward is "money")
GlobalState.ItemReward = 'bread' -- item that will be given as a reward (only if GlobalState.Reward is "item")
GlobalState.ItemRewardCount = math.random(1, 5) -- count of items that will be given (between 1 and 5, can be edited) as a reward (only if GlobalState.Reward is "item")

GlobalState.PlateLetters = 3 -- How many plates letters will be created for the vehicle as a reward.
GlobalState.PlateNumbers = 3 -- How many plates numbers will be created for the vehicle as a reward.
GlobalState.PlateUseSpace = true -- If the plates uses spaces between letters and numbers

GlobalState.KickMessage = 'Cheating' -- Reason for kicking player when trying to use "TriggerServerEvent"