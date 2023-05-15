# chCasinowall
chCasinoWall enables the video walls inside the Diamond Casino & Resort, and adds an event that can be triggered to cause confetti to burst on the screens.

## Requirements

* Game build 2060 or greater using `sv_enforceGameBuild 2060`. This resource has not been tested with, and is not guaranteed to work with, streamed casino interiors.
* Some sort of teleport script that can fire events when the player enters and exits the casino.

## Configuration

All configuration can be done in `config.lua`.

|Field|Description|Default|
|--|--|--|
|`VideoType`|Default video wall animation. There are three options to choose from; diamonds, skulls, and snowflakes.|`CASINO_DIA_PL` _(Diamonds)_|
|`EnterEvent`|This event must be fired when the player enters the casino to enable the video wall.|`chCasinoWall:enteredCasino`|
|`ExitEvent`|This event must be fired when the player exits the casino.|`chCasinoWall:exitedCasino`|
|`BigWinEvent`|Firing this event causes confetti to burst on the video screens before returning to the default animation.|`chCasinoWall:bigWin`|

## Usage

Install and start the resource, ensure the `EnterEvent` is fired when you enter the casino, and you're pretty much done. Firing the `ExitEvent` as the player exits the casino is strongly encouraged for performance reasons.

If you have any gambling scripts that could benefit from some extra excitement, fire the `BigWinEvent` and the player will see confetti bursting on the screens.

## Support

Support is not offered for this resource. If you have discovered a bug, please open an issue on the Github repository with detailed reproduction steps and I will do my best to fix it.

## Contributing

Pull requests are welcomed! Please be consistent with the existing code formatting and style, including 4 space indentation, TitleCase configuration values and camelCase function names, etc.

## Known Issues

- The video sometimes stutters or restarts randomly. This is most likely due to how the video is stopped and started when entering/exiting the casino, and when playing the big win screen. PRs are welcome!

## License

chCasinoWall is licensed under the MIT License. More details are available in [LICENSE.md](LICENSE.md).