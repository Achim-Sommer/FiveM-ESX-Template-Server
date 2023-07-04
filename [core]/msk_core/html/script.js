window.addEventListener('message', (event) => {
    if (event.data.map == true) {
        $('.container').removeClass('mapOff').addClass('mapOn');
    } else {
        $('.container').removeClass('mapOn').addClass('mapOff');
    }

    notification(event.data.message, event.data.duration, event.data.type);
})

const colors = {
    "~r~": "red",
    "~b~": "#378cbf",
    "~g~": "green",
    "~y~": "yellow",
    "~p~": "purple",
    "~c~": "grey",
    "~m~": "#212121",
    "~u~": "black",
    "~o~": "orange"
}

const replaceColors = (str, obj) => {
    let strToReplace = str;

    for (let id in obj) {
        strToReplace = strToReplace.replace(new RegExp(id, "g"), obj[id]);
    }

    return strToReplace
}

notification = (message, duration, type) => {
    for (color in colors) {
        if (message.includes(color)) {
            let obj = {};

            obj[color] = `<span style='color: ${colors[color]}'>`;
            obj['~s~'] = '</span>';

            message = replaceColors(message, obj);
        }
    }

    const notification = $(`
        <div class="notify" id="${type}">
            <p>${message}</p>
        </div>
    `).appendTo(`.container`);

    setTimeout(() => {
        notification.fadeOut(700);
    }, duration);

    return notification;
}