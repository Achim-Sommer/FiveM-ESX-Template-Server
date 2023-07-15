![msk_input](https://github.com/MSK-Scripts/msk_input/assets/49867381/fd00b19b-c3d1-460d-8d4b-973385ee9504)

## Description
* Opens an Input Window

## Usage

**Small Input Window**
```lua
exports.msk_input:openInput('This is a Header', 'This is a Placeholder', function(input)
    if not input then return end

    print(input)
end)
```

**Big Input Window**
```lua
exports.msk_input:openInput('This is a Header', 'This is a Placeholder', true, function(input)
    if not input then return end

    print(input)
end)
```

## Credits
* [Code Service](https://discord.com/invite/Z4Xv5zBQms)
