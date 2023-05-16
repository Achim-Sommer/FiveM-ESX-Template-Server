// You can add or remove any notification
// type from here. Make sure you use the
// same name as the one in the brackets

const k5Notifications = {
  ['error']: {
    background: 'rgba(173, 38, 38, 0.9)',
    titleColor: '#FFF',
    messageColor: '#FFF',
    borderRadius: '5px',
    icon: '<i class="fa-solid fa-circle-exclamation"></i>',
  },
  ['success']: {
    background: 'rgba(47, 156, 20, 0.9)',
    titleColor: '#FFF',
    messageColor: '#FFF',
    borderRadius: '5px',
    icon: '<i class="fa-solid fa-circle-check"></i>',
  },
  ['warn']: {
    background: 'rgba(255, 152, 0, 0.9)',
    titleColor: '#FFF',
    messageColor: '#FFF',
    borderRadius: '5px',
    icon: '<i class="fa-solid fa-triangle-exclamation"></i>',
  },
  ['info']: {
    background: 'rgba(20, 100, 219, 0.9)',
    titleColor: '#FFF',
    messageColor: '#FFF',
    borderRadius: '5px',
    icon: '<i class="fa-solid fa-circle-info"></i>',
  },
  ['bet']: {
    background: 'rgba(20, 100, 219, 0.9)',
    titleColor: '#FFF',
    messageColor: '#FFF',
    borderRadius: '5px',
    icon: '<i class="fa-solid fa-coins"></i>',
    audio: 'assets/bet.ogg',
  },
  ['won']: {
    background: 'rgba(139, 136, 16, 0.9)',
    titleColor: '#FFF',
    messageColor: '#FFF',
    borderRadius: '5px',
    icon: '<i class="fa-solid fa-coins"></i>',
    audio: 'assets/won.ogg',
  },
  ['loss']: {
    background: 'rgba(140, 17, 17, 0.9)',
    titleColor: '#FFF',
    messageColor: '#FFF',
    borderRadius: '5px',
    icon: '<i class="fa-solid fa-face-sad-tear"></i>',
    audio: 'assets/loss.ogg',
  },
}
