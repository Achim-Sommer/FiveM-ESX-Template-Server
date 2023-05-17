var prices = {}
var maxes = {}
var zone = null

// Partial Functions
function closeMain() {
	$("body").css("display", "none");
}
function openMain() {
	$("body").css("display", "block");
}
function closeAll() {
	$(".body").css("display", "none");
}
$(".close").click(function(){
    $.post('http://esx_supermarket/quit', JSON.stringify({}));
});
// Listen for NUI Events
window.addEventListener('message', function (event) {

	var item = event.data;

	// Open & Close main window
	if (item.message == "show") {
		if (item.clear == true){
			$( ".home" ).empty();
			prices = {}
			maxes = {}
			zone = null
		}
		openMain();
	}

	if (item.message == "hide") {
		closeMain();
	}

	if (item.message == "add"){
		$( ".home" ).append('<div class="card">' +
					'<div class="image-holder">' +
						'<img src="img/' + item.item + '.png" onerror="this.src = \'img/default.png\'" alt="' + item.label + '" style="width:100%">' +
					'</div>' +
					'<div class="container">' +
						'<h4><b>' + item.label + '<div class="price">' + item.price + '$' + '</div>' + '</b></h4> ' +
						'<div class="quantity">' +
							'<div class="minus-btn btnquantity" name="' + item.item + '" id="minus">' +
								'<img src="img/minus.png" alt="" />' +
							'</div>' +
							'<div class="number" name="name">1</div>' +
							'<div class="plus-btn btnquantity" name="' + item.item + '" id="plus">' +
								'<img src="img/plus.png" alt="" />' +
							'</div>' +
						'</div>' +
						'<div class="purchase">' +

							'<div class="buy" name="' + item.item + '">Buy</div>' +
						'</div>' +
					'</div>' +
				'</div>');
		prices[item.item] = item.price;
		maxes[item.item] = 99;
		zone = item.loc;
	}
});

$(".home").on("click", ".btnquantity", function() {

	var $button = $(this);
	var $name = $button.attr('name')
	var oldValue = $button.parent().find(".number").text();
	if ($button.get(0).id == "plus") {
		if (oldValue <  maxes[$name]){
			var newVal = parseFloat(oldValue) + 1;
		}else{
			var newVal = parseFloat(oldValue);
		}
	} else {
	// Don't allow decrementing below zero
		if (oldValue > 1) {
			var newVal = parseFloat(oldValue) - 1;
		} else {
			newVal = 1;
		}
	}
	$button.parent().parent().find(".price").text((prices[$name] * newVal) + "$");
	$button.parent().find(".number").text(newVal);

});

$(".home").on("click", ".buy", function() {
	var $button = $(this);
	var $name = $button.attr('name')
	var $count = parseFloat($button.parent().parent().find(".number").text());
	$.post('http://esx_supermarket/purchase', JSON.stringify({
		item: $name,
		count: $count,
		loc: zone
	}));
});
