<h1 align='center'>[ESX] Mechanicjob</a></h1><p align='center'><b><a href='https://discord.esx-framework.org/'>Discord</a> - <a href='https://documentation.esx-framework.org/legacy/installation'>Documentation</a></b></h5>

## Requirements

* Auto mode
  * No need to download another resource

* Player management (billing and boss actions)
  * [esx_society](https://github.com/esx-framework/esx_society)
  * [esx_billing](https://github.com/esx-framework/esx_billing)

## Download & Installation

### Using [fvm](https://github.com/qlaffont/fvm-installer)
```
fvm install --save --folder=esx esx-framework/esx_mechanicjob
```

### Using Git
```
cd resources
git clone https://github.com/esx-framework/esx_mechanicjob [esx]/esx_mechanicjob
```

### Manually
- Download https://github.com/esx-framework/esx_mechanicjob/archive/master.zip
- Put it in the `[esx]` directory

## Installation
- Import `esx_mechanicjob.sql` in your database
- If you want player management you have to set `Config.EnablePlayerManagement` to `true` in `config.lua`
- Add this to your `server.cfg`:

```
start esx_mechanicjob
```

# Legal
### License
esx_mechanicjob - mechanic job for ESX

Copyright (C) 2015-2023 Jérémie N'gadi

This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.

This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.

You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.
