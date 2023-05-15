window.addEventListener('load', function() {
    console.log('Fog Hud Mamaste Wey')
})

let moneyFormat = Intl.NumberFormat('es-ES');
window.addEventListener('message', function(event) {
    var v = event.data
    var coche = new ldBar('#velocimetro2')
    var come = new ldBar('#comidape')
    var water = new ldBar('#waterpe')

    switch(v.action) {
        case 'showCarhud':
            $('.tipovelo').text(Math.round(v.vel))
            $('.combustibletexto').text(Math.round(v.gasolina))
            if (v.mph) {
                $('.kmh').text('Mp/h')
            } else {
                $('.kmh').text('Km/h')
            }
            coche.set(v.vel/3)
     
            if (v.door == 1) {
                $('#segurojs').attr('src', 'imgs/seguro.png')
            } else if (v.door == 2) {
                $('#segurojs').attr('src', 'imgs/seguro2.png') 
            } else {
                $('#segurojs').attr('src', 'imgs/seguro.png') 
            }

            if (v.carhealth < 2) {
                $('#motorjs').attr('src', 'imgs/motor2.png')
            } else {
                $('#motorjs').attr('src', 'imgs/motor.png')
            }
            if(v.vehicleLights == 1 && v.vehicleHighlights == 0) {
                $('#luzjs').attr('src', 'imgs/luces3.png') // alta
            } else if(v.vehicleLights == 1 && v.vehicleHighlights == 1 || v.vehicleLights == 0 && v.vehicleHighlights == 1){
                $('#luzjs').attr('src', 'imgs/luces2.png') // media
            } else {
                $('#luzjs').attr('src', 'imgs/luces.png') // apagada
            }
            $('.auto').show(500)
        break;

        case 'hideCarhud': 
            $('.auto').hide(500)
        break;
        case 'updateTalking': 
            come.set(v.hunger)
            water.set(v.thirst)
            $('.userid').text(v.pid)
            if (v.playerTalking == true) {
                $('#chatvozpe').attr('src', 'imgs/micon.png')
            } else {
                $('#chatvozpe').attr('src', 'imgs/micoff.png')
            }
        break;

        case 'UpdateData':
            UpdateData(v.key, v.value, v.key2, v.value2)
        break; 
    }
})

function UpdateData(key, value, key2, value2) {
    
    if (key2 == 'grado') {
        $(`.${key}`).text(value)
        $(`.${key2}`).text(value2)
    } else {
        $(`.${key}`).text(moneyFormat.format(value))
    }

}