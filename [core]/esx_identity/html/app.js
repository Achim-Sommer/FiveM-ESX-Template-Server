function main(){
    return {
        ready: false,
        show: false,
        firstname: '',
        lastname: '',
        dateofbirth: '',
        sex: '',
        height: 160,
        override: {
            firstname: false,
            lastname: false,
            dob: false,
            sex: false
        },
        listen() {
            document.addEventListener("DOMContentLoaded", () => {
                this.ready = true
                postData("http://esx_identity/ready", JSON.stringify({}));
            });

            window.addEventListener('message', (event) => {
                let data = event.data
                if(!this.ready) return;
                switch(data.type) {
                  case 'enableui': 
                    this.show = data.enable
                    break;
                }
            })
        },
        register() {
            this.override = {
              firstname: false,
              lastname: false,
              dob: false,
              sex: false
            }

            const dofVal = this.dateofbirth

            const dateCheck = new Date(dofVal);

            const year = new Intl.DateTimeFormat("en", { year: "numeric" }).format(
              dateCheck
            );
            const month = new Intl.DateTimeFormat("en", { month: "2-digit" }).format(
              dateCheck
            );
            const day = new Intl.DateTimeFormat("en", { day: "2-digit" }).format(
              dateCheck
            );

            const formattedDate = `${day}/${month}/${year}`;

            postData('https://esx_identity/register', {
                firstname: this.firstname,
                lastname: this.lastname,
                dateofbirth: formattedDate,
                sex: this.sex,
                height: this.height
            }).then((data)=>{
              switch(data){
                case 'firstname':
                  this.override.firstname = true
                  break;
                case 'lastname':
                  this.override.lastname = true
                  break;
                case 'dob':
                  this.override.dob = true
                  break;
                case 'sex':
                  this.override.sex = true
                  break;
              }
            })
        }
    }
}

async function postData(url = '', data = {}) {
    const response = await fetch(url, {
      method: 'POST', // *GET, POST, PUT, DELETE, etc.
      mode: 'cors', // no-cors, *cors, same-origin
      cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
      credentials: 'same-origin', // include, *same-origin, omit
      headers: {
        'Content-Type': 'application/json'
      },
      redirect: 'follow',
      referrerPolicy: 'no-referrer',
      body: JSON.stringify(data)
    });
    return response.json();
}