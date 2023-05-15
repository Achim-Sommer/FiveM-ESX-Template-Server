window.addEventListener('message', function (event) {
    ShowNotif(event.data);
});

function ShowNotif(data) {
	if (data.type === 'adm') {
       launch_admin(data);
    } 
	else if (data.type === 'msg') {
		launch_msg(data);
    }
	else if (data.type === 'true') {
       launch_success(data);
    } 
	else if (data.type === 'false') {
       launch_error(data);
    } 
	else if (data.type === 'bill') {
       launch_bill(data);
    } 
	else if (data.type === 'dispatch') {
       launch_sos(data);
    } 
	else if (data.type === 'money') {
       launch_money(data);
    } 
	else if (data.type === 'light') {
       launch_light(data);
    }
}

function launch_admin(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://cdn-icons-png.flaticon.com/512/3208/3208726.png";
	document.getElementById("toast").style.backgroundColor = "rgba(227, 185, 70, 0.8)";
	document.getElementById("toast").style.borderRadius = "25px"
	document.getElementById("toast").style.borderStyle = "none"
	document.getElementById("desc").style.color = "#d43f3f"
	setTimeout(function(){ document.getElementById("desc").textContent  = data.text; }, 600);
	setTimeout(function(){ document.getElementById("desc").textContent  = ""; }, 14000);
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 15000);
}

function launch_msg(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://cdn-icons-png.flaticon.com/512/1370/1370907.png";
	document.getElementById("toast").style.backgroundColor = "rgba(20, 187, 196, 0.8)";
	document.getElementById("toast").style.borderRadius = "10px"
	document.getElementById("toast").style.borderStyle = "none"
	document.getElementById("desc").style.color = "#fff";
	setTimeout(function(){ document.getElementById("desc").textContent  = data.text; }, 600);
	setTimeout(function(){ document.getElementById("desc").textContent  = ""; }, 4000);
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 5000);
}

function launch_bill(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://cdn-icons-png.flaticon.com/512/845/845703.png";
	document.getElementById("toast").style.backgroundColor = "rgba(20, 187, 196, 0.8)";
	document.getElementById("toast").style.borderRadius = "10px"
	document.getElementById("toast").style.borderStyle = "none"
	document.getElementById("desc").style.color = "#fff";
	setTimeout(function(){ document.getElementById("desc").textContent  = data.text; }, 600);
	setTimeout(function(){ document.getElementById("desc").textContent  = ""; }, 4000);
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 5000);
}

function launch_sos(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://cdn-icons-png.flaticon.com/512/595/595031.png";
	document.getElementById("toast").style.backgroundColor = "rgba(255, 255, 255, 0.8)";
	document.getElementById("toast").style.borderRadius = "10px"
	document.getElementById("toast").style.borderStyle = "none"
	document.getElementById("desc").style.color = "#d43f3f"
	setTimeout(function(){ document.getElementById("desc").textContent  = data.text; }, 600);
	setTimeout(function(){ document.getElementById("desc").textContent  = ""; }, 4000);
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 5000);
}

function launch_money(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://cdn-icons-png.flaticon.com/512/845/845703.png";
	document.getElementById("toast").style.backgroundColor = "rgba(255, 255, 255, 1)"; 
	document.getElementById("toast").style.borderRadius = "25px"
	document.getElementById("toast").style.borderStyle = "none"
	document.getElementById("desc").style.color = "#bda833"
	setTimeout(function(){ document.getElementById("desc").textContent  = data.text; }, 600);
	setTimeout(function(){ document.getElementById("desc").textContent  = ""; }, 4000);
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 5000);
}

function launch_success(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://cdn-icons-png.flaticon.com/512/190/190411.png";
	document.getElementById("toast").style.backgroundColor = "rgba(91, 212, 159, 0.8)";
	document.getElementById("toast").style.borderRadius = "25px"
	document.getElementById("toast").style.borderStyle = "none"
	document.getElementById("desc").style.color = "#fff"
	setTimeout(function(){ document.getElementById("desc").textContent  = data.text; }, 600);
	setTimeout(function(){ document.getElementById("desc").textContent  = ""; }, 4000);
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 5000);
}

function launch_error(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://cdn-icons-png.flaticon.com/512/4457/4457164.png";
	document.getElementById("toast").style.backgroundColor = "rgba(179, 34, 27, 0.8)";
	document.getElementById("toast").style.borderRadius = "25px"
	document.getElementById("desc").style.color = "#fff"
	document.getElementById("toast").style.borderStyle = "none"
	setTimeout(function(){ document.getElementById("desc").textContent  = data.text; }, 600);
	setTimeout(function(){ document.getElementById("desc").textContent  = ""; }, 4000);
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 5000);
}

function launch_light(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://cdn-icons-png.flaticon.com/512/427/427735.png";
	document.getElementById("toast").style.backgroundColor = "rgba(255, 255, 255, 1)";
	document.getElementById("toast").style.borderRadius = "10px"
	document.getElementById("desc").style.color = "#0f0f0f"
	document.getElementById("toast").style.borderColor = "#d6c345"
	document.getElementById("toast").style.borderStyle = "solid"
	document.getElementById("toast").style.borderWidth = "medium"
	setTimeout(function(){ document.getElementById("desc").textContent  = data.text; }, 600);
	setTimeout(function(){ document.getElementById("desc").textContent  = ""; }, 4000);
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 5000);
}