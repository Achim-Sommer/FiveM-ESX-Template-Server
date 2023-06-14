window.addEventListener('load', function() {
  console.log('PauseMenu Started')
})

window.addEventListener('message', function(event) {
  var v = event.data

  switch(v.action) {

      case 'show':
			ShowSettings()
			$('#showupdates').hide();
			$('#showabout').hide();			
      break;

  }
})



function ShowSettings() {

	$('.container').fadeIn()
  openUi = true
}

$(function(){
    $('#settings').click(function(){
      $.post('https://PauseMenu/SendAction', JSON.stringify({action: 'settings'}));
      CloseAll()
    })
    $('#map').click(function(){
      $.post('https://PauseMenu/SendAction', JSON.stringify({action: 'map'}));
      CloseAll()
    })
	$('#resume').click(function(){
      CloseAll()
    })
	
	$('#updates').click(function(){
		$('#showabout').hide();
	   setTimeout(() => { $('#showupdates').fadeIn(); }, 200);
    })
	
	$('#rules').click(function(){
		$('#showupdates').hide();
		setTimeout(() => { $('#showabout').fadeIn(); }, 200);
	   
    })
	
    $('#exit').click(function(){
		$.post('https://PauseMenu/SendAction', JSON.stringify({action: 'exit'}));
      CloseAll()
    })

    $('#discordinv').click(function(){
        window.invokeNative('openUrl', 'https://discord.gg/infernorp')
    })

    $('#ig').click(function(){
      window.invokeNative('openUrl', 'https://www.instagram.com/inferno__roleplay/')
    })
})

function CloseAll(){
  $('.container').fadeOut()
  $.post('https://PauseMenu/exit', JSON.stringify({}));
  openUi = false
}
