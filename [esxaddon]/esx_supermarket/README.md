<a href="https://www.patreon.com/vidat"><img src="https://img.shields.io/badge/Patreon-Donate-orange.svg" alt="Patreon donate button" /> </a>

# esx_supermarket

This resource based on esx_shops, I just changed the UI.

## Download & Installation

### Using Git
```
cd resources
git clone https://github.com/gapadana/esx_supermarket [esx]/esx_supermarket
```

### Manually
- Download https://github.com/gapadana/esx_supermarket/archive/master.zip
- Put it in the `[esx]` directory

## Installation
### Instal the resource
If you already have esx_shops, just stop esx_shops( and remove it from server.cfg) and start esx_supermarket( and add it to server.cfg), otherwise:
- Import `esx_shops.sql` to your database
- Add `start esx_supermarket` in your `server.cfg`:
```
start esx_supermarket
```

### How to add your items in the shop
- Add items to the database:
```mysql
	INSERT INTO `items` (`name`, `label`, `weight`) VALUES ('banana', 'Banana', 10);
```
- Add items to the shop:
```mysql
	INSERT INTO `shops` (store, item, price) VALUES ('TwentyFourSeven','banana',50);
```
- Add an image for your item in `html/img` folder
- Add path to the image into `__resource.lua` file like other images
- Restart the resource:
```
refresh
restart esx_supermarket
```

## ScreenShot

![alt text](https://raw.githubusercontent.com/gapadana/esx_supermarket/master/screenshot/screenshot.jpg)
