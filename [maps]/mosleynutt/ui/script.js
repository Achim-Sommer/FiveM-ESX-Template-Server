const SH_Carlift = new Vue({
    el: "#SH_Carlift",

    data: {
        // Shared
        ResourceName: "mosleynutt",
        showRemoteController: false,
    },

    methods: {

        // START OF MAIN MENU
        OpenRemote() {
            this.showRemoteController = true;
        },

        CloseRemote() {
            axios.post(`http://${this.ResourceName}/Close`, {}).then((response) => {
                this.showRemoteController = false;
            }).catch((error) => { });
        },

        Up() {
            console.log("Up")
            axios.post(`http://${this.ResourceName}/Up`, {}).then((response) => {
            }).catch((error) => { });
        },

        Down() {
            console.log("Down")
            axios.post(`http://${this.ResourceName}/Down`, {}).then((response) => {
            }).catch((error) => { });
        },

        Up2() {
            axios.post(`http://${this.ResourceName}/Up2`, {}).then((response) => {
            }).catch((error) => { });
        },

        Down2() {
            axios.post(`http://${this.ResourceName}/Down2`, {}).then((response) => {
            }).catch((error) => { });
        },

    },
});

var audioPlayer = null;

// Listener from Lua CL
document.onreadystatechange = () => {
    if (document.readyState == "complete") {
        window.addEventListener("message", (event) => {
            if (event.data.type == "openRemote") {
                SH_Carlift.OpenRemote();
            } else if (event.data.type == "playSound") {
                
                if (audioPlayer != null) {
                    audioPlayer.pause();
                }

                audioPlayer = new Howl({src: ["./sounds/" + event.data.transactionFile + ".ogg"]});
                audioPlayer.volume(event.data.transactionVolume);
                audioPlayer.play();
            }
        });
    }
}
