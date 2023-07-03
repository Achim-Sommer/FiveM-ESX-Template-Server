window.addEventListener('message', function (event) {
    var data = event.data;
	
	if (data !== undefined && data.display == true) {
	
		$(".animal_list").append(`
			<div class="animal">
				<img id="animal_avata" src="img/`+event.data.pet+`.png"><br>
				<span id="animal_name">`+event.data.label+`</span><br>
				<span id="animal_price">Giá : <span style="color:#7FFF00;">`+event.data.price+`$</span></span><br>
				<input id="animal_buy" type="image" src="img/button/buy.png" onclick="animal_buy('`+event.data.pet+`','`+event.data.label+`','`+event.data.price+`')" onmouseover="this.src='img/button/buy_hover.png'" onmouseout="this.src='img/button/buy.png'">
			</div>
		`);
		
		$(".container").show();	
	}
	
	if (data.display == false) {
		$(".animal_list").empty();
		$(".container").fadeOut(100);
    }
});


function animal_buy(pet, label, price) {
	$('.popup').fadeIn(200);
	$(".animal_list").empty();
	$(".container").fadeOut(100);

	$('#popupYes').on('click', function (e){
		$.post('http://fivem_pets/animal_buy', JSON.stringify({ pet: pet, label: label, price: price}));
		pet = '';
		label = '';
		price = 0;
		$('.popup').fadeOut(100);
		$.post('http://fivem_pets/NUIFocusOff');
		return;
	});
	
	$('#popupNo').on('click', function (e) {
		pet = '';
		label = '';
		price = 0;
		$('.popup').fadeOut(100);
		$.post('http://fivem_pets/NUIFocusOff');
		return;
	});
}


		
document.addEventListener('DOMContentLoaded', function () {
    $(".container").hide();
});

