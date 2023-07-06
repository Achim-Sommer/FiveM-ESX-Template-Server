$(function () {
    window.addEventListener('message', function(event) {
        var data = event.data;

        switch (data.action) {
            case 'open':
                $('.container').fadeIn(500);
            break;

            case 'progress':
                $('.progressbar').fadeIn(250);
                StartTimer(data.time);
            break;

            case 'close':
                $('.container').fadeOut(500);
            break;
        }
    });

    $('.container i').on('click', function() {
        $.post('https://5p_pilotjob/close', JSON.stringify({}));
    });

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://5p_pilotjob/close', JSON.stringify({}));
        }
    }

    $('.options__one-submit').on('click', function() {
        $.post('https://5p_pilotjob/close', JSON.stringify({}));
        $.post('https://5p_pilotjob/start', JSON.stringify({
            type: 'passengers'
        }));
    });

    $('.options__two-submit').on('click', function() {
        $.post('https://5p_pilotjob/close', JSON.stringify({}));
        $.post('https://5p_pilotjob/start', JSON.stringify({
            type: 'products'
        }));
    });

    // Credits to (https://github.com/MedinaYT/mdn_progressbar/blob/main/html/js/script.js)
    function StartTimer(time) {
        $('.line').css({'width': '0%'}).animate({'width': '100%'}, time)

        setTimeout(function(){
            $('.progressbar').fadeOut(250);
        }, time - 250)
    }
});