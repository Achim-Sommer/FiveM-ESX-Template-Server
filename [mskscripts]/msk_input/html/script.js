var field = false 

window.addEventListener("message", function(event) {
    var data = event.data;

    if (data.action = "openInput") {
        var input = 'small-input'

        if (data.field) {
            input = 'big-input'
            field = true
            $("#big-input").show()
            $("#small-input").hide()
        } else {
            field = false
            $("#big-input").hide()
            $("#small-input").show()
        }

        document.getElementById(input).placeholder = data.placeholder;
        $(".msk-input-container").fadeIn()
        $("#msk-input-title").text(data.header)
    }
})

function closeUI(send) {
    $(".msk-input-container").fadeOut()
    if (!send) { $.post(`http://${GetParentResourceName()}/close`, JSON.stringify({})) }
}

document.onkeyup = function(data) {
    if (data.which == 27) {
        closeUI()
    }
}

function input() {
    var textfield = '#small-input'
    if (field) {textfield = '#big-input'}

    $.post(`http://${GetParentResourceName()}/submit`, JSON.stringify({input: $(textfield).val()}));
    $(textfield).val('');
    closeUI(true)
}