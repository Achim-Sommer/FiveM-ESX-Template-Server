# s1lent_keybinds
Menu to display (default) keybinds and commands. Keybinds/commands can be sorted and displayed in categories, such as Vehicle and General.

## Download
Download the latest release [here](https://github.com/jwritz/s1lent_keybinds/releases/latest)

## Installation
1. Unzip the downloaded file
2. Place `s1lent_keybinds` into the `resources` directory
3. Add `start s1lent_keybinds` to `server.cfg`

_The resource must be named exactly_ `s1lent_keybinds` _for the UI to properly work._

## How to add keybinds/commands
See `config.lua` for examples

## How to open keybinds/commands menu
Use command `/keybinds` or `/commands` to open the keybinds/commands menu

## Screenshot
![v0 1 1](https://user-images.githubusercontent.com/29800465/91195168-67ed4880-e6be-11ea-8696-ebd0b92236f6.png)

## Color Customization (Advanced)

1. Git clone the [GitHub Repo](https://github.com/jwritz/s1lent_keybinds)
2. Modify the css file to the desired colors
    * File location: `src_html/src/css/index.css`
    * Available colors and shades: See [Tailwind CSS Documentation](https://tailwindcss.com/docs/background-color#app)

3. Build for production in `src_html` using `npm run build` (See README in src_html)
4. Move `src_html/dist/index.html` to the `s1lent_keybinds/client` directory
