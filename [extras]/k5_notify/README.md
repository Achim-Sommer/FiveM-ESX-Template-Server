
# K5  Notify

![K5 Skillcheck](https://i.imgur.com/OXoB0Su.png)
  

This is a **FREE** and **open** Fivem script that lets you create multiple styles of reusable notifications. It's an easy to use and configure resource, that helps you customize your server.

  

## Demo


Watch the demo here: [YouTube](https://www.youtube.com/watch?v=ld_g5iTmuuQ)
  

# Download & Installation

**Using Git**

```
cd resources

git clone https://github.com/kac5a/k5_notify.git [scripts]/k5_notify
```

  

### Manually

  

- Download [https://github.com/kac5a/k5_notify/](https://github.com/kac5a/k5_notify/)

- Put it in your resources directory

  

### Installation

  

Add this in your `server.cfg`:

```
ensure k5_notify
```

# Usage

The script has a `notifications.js` file, in which you can edit and configure new notifications. There are default settings, so you can call the notification function by itself. The configuration follows:
| Variable | What it does |
|--|--|
| background | The background color. Can be anything that CSS accepts (rgb, rgba, hex, etc.). |
| titleColor| The color of the notification title. Can be anything that CSS accepts (rgb, rgba, hex, etc.). |
| italicTitle| Whether or not the title should be italic. Can be `true` or `false`. |
| boldTitle| Whether or not the title should be bold. Can be `true` or `false`. |
| messageColor| The color of the notification message. Can be anything that CSS accepts (rgb, rgba, hex, etc.). |
| borderRadius| The roundness of the corners. Can be any value that CSS accepts (px, em, rem, etc.). |
| border| The CSS border. For example: `"2px solid #F00"`. Can be anything that CSS accepts as border. |
| icon| The starting icon in the title. Can be any icon pack that's includable, but make sure it's include it properly. By default [fontawesome](https://fontawesome.com/search?m=free)'s free icons are available. |
| startImage| The start image leading the notification body. This image has to be included in the resource folder. For that, you can use the `assets` folder. Example value: `"assets/bennys.png"`. |
| audio| If you want to add custom notification sounds, include them in the same `assets` folder the same way. This will be played when the notification shows.|
| duration| How long should the notification be on the screen in millis.|

You can create as many notifications as you'd like. Example usage:

## notifications.js

    const k5Notifications  = {
        ['myNotification']: {
    	    background: 'rgba(0, 0, 0, 0.9)',
    	    titleColor: '#FFF',
    	    messageColor: '#FFF',
    	    icon: '<i class="fa-solid fa-circle-exclamation"></i>',
        }
    }

## Usage in LUA

Using export

    exports["k5_notify"]:notify('Notification', 'This is a notification!', 'myNotification')
Using client event

    TriggerClientEvent("k5_notify:notify", source, 'Notification', 'This is a notification', 'myNotification')

You can also overwrite the defined duration if needed as the 4th parameter of both functions

    exports["k5_notify"]:notify('Notification', 'This is a notification!', 'myNotification', 10000)
or

    TriggerClientEvent("k5_notify:notify", source, 'Notification', 'This is a notification', 'myNotification', 10000)
# Last Words

Feel free to fork this repository and edit the script as much as you'd like. This script is free to use and share. If you find anyone selling this for money, please contact me.
