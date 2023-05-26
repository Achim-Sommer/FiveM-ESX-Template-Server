window.addEventListener('load', function() {
  console.log('Roda PauseMenu Started')
})

window.addEventListener('message', function(event) {
  var v = event.data

  switch(v.action) {

      case 'show':
          ShowSettings()    
      break;

      case 'UpdateData':
          setValue(v.key, v.value)
      break;

      case 'updateJobs':
          $('.appendJobs').append(`
            <h1 class="RemoveShit">${v.label} - ${v.value}</h1>
          `)
      break;

      case 'updatePlayers': 
          $('.footer h2').text(`Connected Players ${v.total}/${v.max}`)
      break;
  }
})


function setValue(key, value){
	if ($('#'+key+'').text() != value) {
		if (!isNaN(value)){
			var $this = $('#'+key+'');
			jQuery({ Counter: parseInt($this.text(), 10) }).animate({ Counter: value }, {
				duration: 2000,
				easing: 'swing',
				step: function (now) {
					$this.text('$ '+Math.ceil(now));
				}
			});
		} else {
			$('#'+key+'').text(''+value+'')
		}
	}
}

function ShowSettings() {
  $('.container-fluid').show(500)
  openUi = true
}

$(function(){
    $('#settingsPe').click(function(){
      $.post('https://Roda_PauseMenu/SendAction', JSON.stringify({action: 'settings'}));
      CloseAll()
    })
    $('#mapita').click(function(){
      $.post('https://Roda_PauseMenu/SendAction', JSON.stringify({action: 'map'}));
      CloseAll()
    })
    $('#exit').click(function(){
      CloseAll()
    })

    $('#discordinv').click(function(){
        window.invokeNative('openUrl', 'https://discord.gg/veDufrHnAn')
    })

    $('#tebexshop').click(function(){
      window.invokeNative('openUrl', 'https://roda.tebex.io/')
    })
})

function CloseAll(){
  $('.RemoveShit').remove()
  $('.container-fluid').hide(500)
  $.post('https://Roda_PauseMenu/exit', JSON.stringify({}));
}
