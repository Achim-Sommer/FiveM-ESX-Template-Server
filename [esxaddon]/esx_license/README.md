<h1 align='center'>[ESX] License</a></h1><p align='center'><b><a href='https://discord.esx-framework.org/'>Discord</a> - <a href='https://documentation.esx-framework.org/legacy/installation'>Documentation</a></b></h5>

## Download & Installation

### Using [fvm](https://github.com/qlaffont/fvm-installer)
```
fvm install --save --folder=esx esx-framework/esx_license
```

### Using Git
```
cd resources
git clone https://github.com/esx-framework/esx_license [esx]/esx_license
```

### Manually
- Download https://github.com/esx-framework/esx_license/archive/master.zip
- Put it in the `[esx]` directory

## Installation
- Import `esx_license.sql` in your database
- Add this to your `server.cfg`:

```
start esx_license
```

### Available triggers
- `'esx_license:addLicense', function(target, type, cb)`
- `'esx_license:removeLicense', function(target, type, cb)`
- `'esx_license:getLicense', function(source, cb, type)` (callback)
- `'esx_license:getLicenses', function(source, cb, target)` (callback)
- `'esx_license:checkLicense', function(source, cb, target, type)` (callback)
- `'esx_license:getLicensesList', function(source, cb)` (callback)
