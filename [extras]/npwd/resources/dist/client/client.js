(() => {
  var __create = Object.create;
  var __defProp = Object.defineProperty;
  var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
  var __getOwnPropNames = Object.getOwnPropertyNames;
  var __getOwnPropSymbols = Object.getOwnPropertySymbols;
  var __getProtoOf = Object.getPrototypeOf;
  var __hasOwnProp = Object.prototype.hasOwnProperty;
  var __propIsEnum = Object.prototype.propertyIsEnumerable;
  var __defNormalProp = (obj, key, value) => key in obj ? __defProp(obj, key, { enumerable: true, configurable: true, writable: true, value }) : obj[key] = value;
  var __spreadValues = (a, b) => {
    for (var prop2 in b || (b = {}))
      if (__hasOwnProp.call(b, prop2))
        __defNormalProp(a, prop2, b[prop2]);
    if (__getOwnPropSymbols)
      for (var prop2 of __getOwnPropSymbols(b)) {
        if (__propIsEnum.call(b, prop2))
          __defNormalProp(a, prop2, b[prop2]);
      }
    return a;
  };
  var __esm = (fn, res) => function __init() {
    return fn && (res = (0, fn[__getOwnPropNames(fn)[0]])(fn = 0)), res;
  };
  var __commonJS = (cb, mod) => function __require() {
    return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  };
  var __copyProps = (to, from, except, desc) => {
    if (from && typeof from === "object" || typeof from === "function") {
      for (let key of __getOwnPropNames(from))
        if (!__hasOwnProp.call(to, key) && key !== except)
          __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
    }
    return to;
  };
  var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
    isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
    mod
  ));
  var __async = (__this, __arguments, generator) => {
    return new Promise((resolve, reject) => {
      var fulfilled = (value) => {
        try {
          step(generator.next(value));
        } catch (e) {
          reject(e);
        }
      };
      var rejected = (value) => {
        try {
          step(generator.throw(value));
        } catch (e) {
          reject(e);
        }
      };
      var step = (x) => x.done ? resolve(x.value) : Promise.resolve(x.value).then(fulfilled, rejected);
      step((generator = generator.apply(__this, __arguments)).next());
    });
  };

  // utils/fivem.ts
  var Delay, uuidv4;
  var init_fivem = __esm({
    "utils/fivem.ts"() {
      Delay = (ms) => new Promise((res) => setTimeout(res, ms));
      uuidv4 = () => {
        let uuid = "";
        for (let ii = 0; ii < 32; ii += 1) {
          switch (ii) {
            case 8:
            case 20:
              uuid += "-";
              uuid += (Math.random() * 16 | 0).toString(16);
              break;
            case 12:
              uuid += "-";
              uuid += "4";
              break;
            case 16:
              uuid += "-";
              uuid += (Math.random() * 4 | 8).toString(16);
              break;
            default:
              uuid += (Math.random() * 16 | 0).toString(16);
          }
        }
        return uuid;
      };
    }
  });

  // client/cl_utils.ts
  var ClientUtils, RegisterNuiCB, playerLoaded, RegisterNuiProxy, verifyExportArgType;
  var init_cl_utils = __esm({
    "client/cl_utils.ts"() {
      init_fivem();
      init_client();
      ClientUtils = class {
        constructor(settings) {
          this._defaultSettings = {
            promiseTimeout: 15e3
          };
          this.setSettings(settings);
        }
        setSettings(settings) {
          this._settings = __spreadValues(__spreadValues({}, this._defaultSettings), settings);
        }
        emitNetPromise(eventName, ...args) {
          return new Promise((resolve, reject) => {
            let hasTimedOut = false;
            setTimeout(() => {
              hasTimedOut = true;
              reject(`${eventName} has timed out after ${this._settings.promiseTimeout} ms`);
            }, this._settings.promiseTimeout);
            const uniqId = uuidv4();
            const listenEventName = `${eventName}:${uniqId}`;
            emitNet(eventName, listenEventName, ...args);
            const handleListenEvent = (data) => {
              removeEventListener(listenEventName, handleListenEvent);
              if (hasTimedOut)
                return;
              resolve(data);
            };
            onNet(listenEventName, handleListenEvent);
          });
        }
      };
      RegisterNuiCB = (event, callback) => {
        RegisterNuiCallbackType(event);
        on(`__cfx_nui:${event}`, callback);
      };
      playerLoaded = () => {
        return new Promise((resolve) => {
          const id = setInterval(() => {
            if (global.isPlayerLoaded)
              resolve(id);
          }, 50);
        }).then((id) => clearInterval(id));
      };
      RegisterNuiProxy = (event) => {
        RegisterNuiCallbackType(event);
        on(`__cfx_nui:${event}`, (data, cb) => __async(void 0, null, function* () {
          if (!global.isPlayerLoaded)
            yield playerLoaded();
          try {
            const res = yield ClUtils.emitNetPromise(event, data);
            cb(res);
          } catch (e) {
            console.error("Error encountered while listening to resp. Error:", e);
            cb({ status: "error" });
          }
        }));
      };
      verifyExportArgType = (exportName, passedArg, validTypes) => {
        const passedArgType = typeof passedArg;
        if (!validTypes.includes(passedArgType))
          throw new Error(
            `Export ${exportName} was called with incorrect argument type (${validTypes.join(
              ", "
            )}. Passed: ${passedArg}, Type: ${passedArgType})`
          );
      };
    }
  });

  // ../shared/deepMergeObjects.ts
  function isObject(item) {
    return item && typeof item === "object" && !Array.isArray(item);
  }
  function deepMergeObjects(target, ...sources) {
    if (!sources.length)
      return target;
    const source = sources.shift();
    if (isObject(target) && isObject(source)) {
      for (const key in source) {
        if (isObject(source[key])) {
          if (!target[key])
            Object.assign(target, { [key]: {} });
          deepMergeObjects(target[key], source[key]);
        } else {
          Object.assign(target, { [key]: source[key] });
        }
      }
    }
    return deepMergeObjects(target, ...sources);
  }
  var init_deepMergeObjects = __esm({
    "../shared/deepMergeObjects.ts"() {
    }
  });

  // ../config.default.json
  var config_default_default;
  var init_config_default = __esm({
    "../config.default.json"() {
      config_default_default = {
        PhoneAsItem: {
          enabled: false,
          exportResource: "my-core-resource",
          exportFunction: "myCheckerFunction"
        },
        general: {
          useResourceIntegration: false,
          toggleKey: "f1",
          toggleCommand: "phone",
          defaultLanguage: "en",
          showId: false
        },
        database: {
          useIdentifierPrefix: false,
          playerTable: "users",
          identifierColumn: "identifier",
          identifierType: "license",
          profileQueries: true,
          phoneNumberColumn: "phone_number"
        },
        images: {
          url: "https://api.projecterror.dev/image",
          type: "pe_image",
          imageEncoding: "webp",
          contentType: "multipart/form-data",
          useContentType: false,
          useWebhook: false,
          authorizationHeader: "PE-Secret",
          authorizationPrefix: "",
          useAuthorization: true,
          returnedDataIndexes: ["url"]
        },
        imageSafety: {
          filterUnsafeImageUrls: true,
          embedUnsafeImages: false,
          embedUrl: "https://i.example.com/embed",
          safeImageUrls: [
            "i.imgur.com",
            "i.file.glass",
            "dropbox.com",
            "c.tenor.com",
            "discord.com",
            "cdn.discordapp.com",
            "media.discordapp.com",
            "upload.wikipedia.org",
            "i.projecterror.dev"
          ]
        },
        profanityFilter: {
          enabled: false,
          badWords: ["esx"]
        },
        twitter: {
          showNotifications: true,
          generateProfileNameFromUsers: true,
          allowEditableProfileName: true,
          allowDeleteTweets: true,
          allowReportTweets: true,
          allowRetweet: true,
          characterLimit: 160,
          newLineLimit: 10,
          enableAvatars: true,
          enableEmojis: true,
          enableImages: true,
          maxImages: 3
        },
        match: {
          generateProfileNameFromUsers: true,
          allowEditableProfileName: true
        },
        marketplace: {
          persistListings: false
        },
        debug: {
          level: "error",
          enabled: true,
          sentryEnabled: true
        },
        apps: [],
        voiceMessage: {
          enabled: false,
          authorizationHeader: "PE-Secret",
          url: "",
          returnedDataIndexes: ["url"]
        }
      };
    }
  });

  // client/cl_config.ts
  var config;
  var init_cl_config = __esm({
    "client/cl_config.ts"() {
      init_deepMergeObjects();
      init_config_default();
      config = (() => {
        const resourceName = GetCurrentResourceName();
        const config2 = JSON.parse(LoadResourceFile(resourceName, "config.json"));
        let phoneAsItem = GetConvar("npwd:phoneAsItem", "");
        if (phoneAsItem !== "") {
          phoneAsItem = JSON.parse(phoneAsItem);
          Object.entries(config2.PhoneAsItem).forEach(([key, value]) => {
            if (phoneAsItem[key] && typeof value === typeof phoneAsItem[key]) {
              config2.PhoneAsItem[key] = phoneAsItem[key];
            }
          });
        }
        return deepMergeObjects({}, config_default_default, config2);
      })();
    }
  });

  // utils/apps.ts
  var apps_default;
  var init_apps = __esm({
    "utils/apps.ts"() {
      apps_default = {
        TWITTER: "TWITTER",
        MATCH: "MATCH",
        MESSAGES: "MESSAGES",
        NOTES: "NOTES",
        MARKETPLACE: "MARKETPLACE",
        CONTACTS: "CONTACTS",
        CAMERA: "CAMERA",
        PHONE: "PHONE"
      };
    }
  });

  // utils/messages.ts
  function sendMessage(app, method, data) {
    return SendNUIMessage({
      app,
      method,
      data
    });
  }
  function sendTwitterMessage(method, data = {}) {
    return sendMessage(apps_default.TWITTER, method, data);
  }
  function sendMessageEvent(method, data = {}) {
    return sendMessage(apps_default.MESSAGES, method, data);
  }
  function sendNotesEvent(method, data = {}) {
    return sendMessage(apps_default.NOTES, method, data);
  }
  function sendMarketplaceEvent(method, data = {}) {
    sendMessage(apps_default.MARKETPLACE, method, data);
  }
  function sendContactsEvent(method, data = {}) {
    sendMessage(apps_default.CONTACTS, method, data);
  }
  function sendCameraEvent(method, data = {}) {
    sendMessage(apps_default.CAMERA, method, data);
  }
  function sendMatchEvent(method, data = {}) {
    return sendMessage(apps_default.MATCH, method, data);
  }
  function sendPhoneEvent(method, data = {}) {
    return sendMessage(apps_default.PHONE, method, data);
  }
  var init_messages = __esm({
    "utils/messages.ts"() {
      init_apps();
    }
  });

  // ../typings/phone.ts
  var init_phone = __esm({
    "../typings/phone.ts"() {
    }
  });

  // ../typings/settings.ts
  var init_settings = __esm({
    "../typings/settings.ts"() {
    }
  });

  // client/settings/client-kvp.service.ts
  var _KvpService, KvpService, client_kvp_service_default;
  var init_client_kvp_service = __esm({
    "client/settings/client-kvp.service.ts"() {
      _KvpService = class {
        setKvp(key, value) {
          SetResourceKvp(key, value);
        }
        setKvpFloat(key, value) {
          SetResourceKvpFloat(key, value);
        }
        setKvpInt(key, value) {
          SetResourceKvpInt(key, value);
        }
        getKvpString(key) {
          return GetResourceKvpString(key);
        }
        getKvpInt(key) {
          return GetResourceKvpInt(key);
        }
        getKvpFloat(key) {
          return GetResourceKvpFloat(key);
        }
      };
      KvpService = new _KvpService();
      client_kvp_service_default = KvpService;
    }
  });

  // client/functions.ts
  function removePhoneProp() {
    if (prop != 0) {
      DeleteEntity(prop);
      prop = 0;
      propCreated = false;
    }
  }
  var prop, propCreated, newPhoneProp;
  var init_functions = __esm({
    "client/functions.ts"() {
      init_settings();
      init_client_kvp_service();
      init_fivem();
      prop = 0;
      propCreated = false;
      newPhoneProp = () => __async(void 0, null, function* () {
        const hasNPWDProps = GetConvarInt("NPWD_PROPS", 0);
        let phoneModel;
        if (hasNPWDProps) {
          phoneModel = client_kvp_service_default.getKvpString("npwd-frame" /* NPWD_FRAME */) || "prop_npwd_default";
        } else {
          phoneModel = "prop_amb_phone";
        }
        removePhoneProp();
        if (!propCreated) {
          RequestModel(phoneModel);
          while (!HasModelLoaded(phoneModel)) {
            yield Delay(1);
          }
          const playerPed = PlayerPedId();
          const [x, y, z] = GetEntityCoords(playerPed, true);
          prop = CreateObject(GetHashKey(phoneModel), x, y, z + 0.2, true, true, true);
          const boneIndex = GetPedBoneIndex(playerPed, 28422);
          AttachEntityToEntity(
            prop,
            playerPed,
            boneIndex,
            0,
            0,
            0,
            0,
            0,
            -0,
            true,
            true,
            false,
            true,
            1,
            true
          );
          propCreated = true;
        } else if (propCreated) {
          console.log("prop already created");
        }
      });
    }
  });

  // client/animations/animation.service.ts
  var AnimationService;
  var init_animation_service = __esm({
    "client/animations/animation.service.ts"() {
      init_functions();
      init_fivem();
      AnimationService = class {
        constructor() {
          this.onCall = false;
          this.phoneOpen = false;
          this.onCamera = false;
        }
        createAnimationInterval() {
          this.animationInterval = setInterval(() => __async(this, null, function* () {
            const playerPed = PlayerPedId();
            if (this.onCall) {
              this.handleCallAnimation(playerPed);
            } else if (this.phoneOpen && !this.onCamera) {
              this.handleOpenAnimation(playerPed);
            }
          }), 250);
        }
        setPhoneState(state, stateValue) {
          switch (state) {
            case 0 /* ON_CALL */:
              this.onCall = stateValue;
              break;
            case 1 /* PHONE_OPEN */:
              this.phoneOpen = stateValue;
              break;
            case 2 /* ON_CAMERA */:
              this.onCamera = stateValue;
              break;
          }
          if (!this.onCall && !this.phoneOpen) {
            if (this.animationInterval) {
              clearInterval(this.animationInterval);
              this.animationInterval = null;
            }
          } else if (!this.animationInterval) {
            this.createAnimationInterval();
          }
        }
        handleCallAnimation(playerPed) {
          if (IsPedInAnyVehicle(playerPed, true)) {
            this.handleOnCallInVehicle(playerPed);
          } else {
            this.handleOnCallNormal(playerPed);
          }
        }
        handleOpenAnimation(playerPed) {
          if (IsPedInAnyVehicle(playerPed, true)) {
            this.handleOpenVehicleAnim(playerPed);
          } else {
            this.handleOpenNormalAnim(playerPed);
          }
        }
        handleCallEndAnimation(playerPed) {
          if (IsPedInAnyVehicle(playerPed, true)) {
            this.handleCallEndVehicleAnim(playerPed);
          } else {
            this.handleCallEndNormalAnim(playerPed);
          }
        }
        handleCloseAnimation(playerPed) {
          if (IsPedInAnyVehicle(playerPed, true)) {
            this.handleCloseVehicleAnim(playerPed);
          } else {
            this.handleCloseNormalAnim(playerPed);
          }
        }
        openPhone() {
          return __async(this, null, function* () {
            newPhoneProp();
            if (!this.onCall) {
              this.handleOpenAnimation(PlayerPedId());
            }
            this.setPhoneState(1 /* PHONE_OPEN */, true);
          });
        }
        closePhone() {
          return __async(this, null, function* () {
            removePhoneProp();
            this.setPhoneState(1 /* PHONE_OPEN */, false);
            if (!this.onCall) {
              this.handleCloseAnimation(PlayerPedId());
            }
          });
        }
        startPhoneCall() {
          return __async(this, null, function* () {
            this.handleCallAnimation(PlayerPedId());
            this.setPhoneState(0 /* ON_CALL */, true);
          });
        }
        endPhoneCall() {
          return __async(this, null, function* () {
            this.handleCallEndAnimation(PlayerPedId());
            this.setPhoneState(0 /* ON_CALL */, false);
          });
        }
        openCamera() {
          return __async(this, null, function* () {
            this.setPhoneState(2 /* ON_CAMERA */, true);
          });
        }
        closeCamera() {
          return __async(this, null, function* () {
            this.setPhoneState(2 /* ON_CAMERA */, false);
          });
        }
        loadAnimDict(dict) {
          return __async(this, null, function* () {
            RequestAnimDict(dict);
            while (!HasAnimDictLoaded(dict)) {
              yield Delay(100);
            }
          });
        }
        handleOpenVehicleAnim(playerPed) {
          return __async(this, null, function* () {
            const dict = "anim@cellphone@in_car@ps";
            const anim = "cellphone_text_in";
            yield this.loadAnimDict(dict);
            if (!IsEntityPlayingAnim(playerPed, dict, anim, 3)) {
              SetCurrentPedWeapon(playerPed, 2725352035, true);
              TaskPlayAnim(playerPed, dict, anim, 7, -1, -1, 50, 0, false, false, false);
            }
          });
        }
        handleOpenNormalAnim(playerPed) {
          return __async(this, null, function* () {
            const dict = "cellphone@";
            const anim = "cellphone_text_in";
            yield this.loadAnimDict(dict);
            if (!IsEntityPlayingAnim(playerPed, dict, anim, 3)) {
              SetCurrentPedWeapon(playerPed, 2725352035, true);
              TaskPlayAnim(playerPed, dict, anim, 8, -1, -1, 50, 0, false, false, false);
            }
          });
        }
        handleCloseVehicleAnim(playerPed) {
          return __async(this, null, function* () {
            const DICT = "anim@cellphone@in_car@ps";
            StopAnimTask(playerPed, DICT, "cellphone_text_in", 1);
            StopAnimTask(playerPed, DICT, "cellphone_call_to_text", 1);
            removePhoneProp();
          });
        }
        handleCloseNormalAnim(playerPed) {
          return __async(this, null, function* () {
            const DICT = "cellphone@";
            const ANIM = "cellphone_text_out";
            StopAnimTask(playerPed, DICT, "cellphone_text_in", 1);
            yield Delay(100);
            yield this.loadAnimDict(DICT);
            TaskPlayAnim(playerPed, DICT, ANIM, 7, -1, -1, 50, 0, false, false, false);
            yield Delay(200);
            StopAnimTask(playerPed, DICT, ANIM, 1);
            removePhoneProp();
          });
        }
        handleOnCallInVehicle(playerPed) {
          return __async(this, null, function* () {
            const DICT = "anim@cellphone@in_car@ps";
            const ANIM = "cellphone_call_listen_base";
            if (!IsEntityPlayingAnim(playerPed, DICT, ANIM, 3)) {
              yield this.loadAnimDict(DICT);
              TaskPlayAnim(playerPed, DICT, ANIM, 3, 3, -1, 49, 0, false, false, false);
            }
          });
        }
        handleOnCallNormal(playerPed) {
          return __async(this, null, function* () {
            const DICT = "cellphone@";
            const ANIM = "cellphone_call_listen_base";
            if (!IsEntityPlayingAnim(playerPed, DICT, ANIM, 3)) {
              yield this.loadAnimDict(DICT);
              TaskPlayAnim(playerPed, DICT, ANIM, 3, 3, -1, 49, 0, false, false, false);
            }
          });
        }
        handleCallEndVehicleAnim(playerPed) {
          return __async(this, null, function* () {
            const DICT = "anim@cellphone@in_car@ps";
            const ANIM = "cellphone_call_to_text";
            StopAnimTask(playerPed, DICT, "cellphone_call_listen_base", 1);
            yield this.loadAnimDict(DICT);
            TaskPlayAnim(playerPed, DICT, ANIM, 1.3, 5, -1, 50, 0, false, false, false);
          });
        }
        handleCallEndNormalAnim(playerPed) {
          return __async(this, null, function* () {
            const DICT = "cellphone@";
            const ANIM = "cellphone_call_to_text";
            if (IsEntityPlayingAnim(playerPed, "cellphone@", "cellphone_call_listen_base", 49)) {
              yield this.loadAnimDict(DICT);
              TaskPlayAnim(playerPed, DICT, ANIM, 2.5, 8, -1, 50, 0, false, false, false);
            }
          });
        }
      };
    }
  });

  // client/animations/animation.controller.ts
  var animationService;
  var init_animation_controller = __esm({
    "client/animations/animation.controller.ts"() {
      init_animation_service();
      animationService = new AnimationService();
    }
  });

  // client/cl_main.ts
  function togglePhone() {
    return __async(this, null, function* () {
      const canAccess = yield checkHasPhone();
      if (!canAccess)
        return;
      if (global.isPhoneOpen)
        return yield hidePhone();
      yield showPhone();
    });
  }
  var exps, getCurrentGameTime, showPhone, hidePhone, checkHasPhone;
  var init_cl_main = __esm({
    "client/cl_main.ts"() {
      init_messages();
      init_phone();
      init_cl_config();
      init_animation_controller();
      init_cl_utils();
      global.isPhoneOpen = false;
      global.isPhoneDisabled = false;
      global.isPlayerLoaded = false;
      global.clientPhoneNumber = null;
      exps = global.exports;
      onNet("npwd:setPlayerLoaded" /* SET_PLAYER_LOADED */, (state) => {
        global.isPlayerLoaded = state;
        if (!state) {
          sendMessage("PHONE", "npwd:unloadCharacter" /* UNLOAD_CHARACTER */, {});
        }
      });
      RegisterKeyMapping(
        config.general.toggleCommand,
        "Toggle Phone",
        "keyboard",
        config.general.toggleKey
      );
      setTimeout(() => {
        emit(
          "chat:addSuggestion",
          `/${config.general.toggleCommand}`,
          "Toggle displaying your cellphone"
        );
      }, 1e3);
      getCurrentGameTime = () => {
        let hour = GetClockHours();
        let minute = GetClockMinutes();
        if (hour < 10)
          hour = `0${hour}`;
        if (minute < 10)
          minute = `0${minute}`;
        return `${hour}:${minute}`;
      };
      showPhone = () => __async(void 0, null, function* () {
        global.isPhoneOpen = true;
        const time = getCurrentGameTime();
        yield animationService.openPhone();
        emitNet("npwd:getCredentials" /* FETCH_CREDENTIALS */);
        SetCursorLocation(0.9, 0.922);
        sendMessage("PHONE", "npwd:setVisibility" /* SET_VISIBILITY */, true);
        sendMessage("PHONE", "npwd:setGameTime" /* SET_TIME */, time);
        SetNuiFocus(true, true);
        SetNuiFocusKeepInput(true);
        emit("npwd:disableControlActions", true);
      });
      hidePhone = () => __async(void 0, null, function* () {
        global.isPhoneOpen = false;
        sendMessage("PHONE", "npwd:setVisibility" /* SET_VISIBILITY */, false);
        yield animationService.closePhone();
        SetNuiFocus(false, false);
        SetNuiFocusKeepInput(false);
        emit("npwd:disableControlActions", false);
      });
      RegisterCommand(
        config.general.toggleCommand,
        () => __async(void 0, null, function* () {
          if (!global.isPhoneDisabled && !IsPauseMenuActive())
            yield togglePhone();
        }),
        false
      );
      RegisterCommand(
        "phone:restart",
        () => __async(void 0, null, function* () {
          yield hidePhone();
          sendMessage("PHONE", "phoneRestart", {});
        }),
        false
      );
      checkHasPhone = () => __async(void 0, null, function* () {
        if (!config.PhoneAsItem.enabled)
          return true;
        const exportResp = yield Promise.resolve(
          exps[config.PhoneAsItem.exportResource][config.PhoneAsItem.exportFunction]()
        );
        if (typeof exportResp !== "number" && typeof exportResp !== "boolean") {
          throw new Error("You must return either a boolean or number from your export function");
        }
        return !!exportResp;
      });
      onNet("npwd:sendCredentials" /* SEND_CREDENTIALS */, (number, playerSource) => {
        global.clientPhoneNumber = number;
        sendMessage("SIMCARD", "npwd:setNumber" /* SET_NUMBER */, number);
        sendMessage("PHONE", "npwd:sendPlayerSource" /* SEND_PLAYER_SOURCE */, playerSource);
      });
      on("onResourceStop", (resource) => {
        if (resource === GetCurrentResourceName()) {
          sendMessage("PHONE", "npwd:setVisibility" /* SET_VISIBILITY */, false);
          SetNuiFocus(false, false);
          animationService.endPhoneCall();
          animationService.closePhone();
          ClearPedTasks(PlayerPedId());
        }
      });
      RegisterNuiCB("npwd:close" /* CLOSE_PHONE */, (_, cb) => __async(void 0, null, function* () {
        yield hidePhone();
        cb();
      }));
      RegisterNuiCB(
        "npwd:toggleAllControls" /* TOGGLE_KEYS */,
        (_0, _1) => __async(void 0, [_0, _1], function* ({ keepGameFocus }, cb) {
          if (global.isPhoneOpen)
            SetNuiFocusKeepInput(keepGameFocus);
          cb({});
        })
      );
      if (config.PhoneAsItem.enabled) {
        setTimeout(() => {
          let doesExportExist = false;
          const { exportResource, exportFunction } = config.PhoneAsItem;
          emit(`__cfx_export_${exportResource}_${exportFunction}`, () => {
            doesExportExist = true;
          });
          if (!doesExportExist) {
            console.log("\n^1Incorrect PhoneAsItem configuration detected. Export does not exist.^0\n");
          }
        }, 100);
      }
      setInterval(() => {
        const time = getCurrentGameTime();
        sendMessage("PHONE", "npwd:setGameTime" /* SET_TIME */, time);
      }, 2e3);
    }
  });

  // ../typings/twitter.ts
  var init_twitter = __esm({
    "../typings/twitter.ts"() {
    }
  });

  // client/cl_twitter.ts
  var init_cl_twitter = __esm({
    "client/cl_twitter.ts"() {
      init_twitter();
      init_messages();
      init_cl_utils();
      RegisterNuiProxy("npwd:getOrCreateTwitterProfile" /* GET_OR_CREATE_PROFILE */);
      RegisterNuiProxy("npwd:deleteTweet" /* DELETE_TWEET */);
      RegisterNuiProxy("npwd:updateTwitterProfile" /* UPDATE_PROFILE */);
      RegisterNuiProxy("npwd:createTwitterProfile" /* CREATE_PROFILE */);
      RegisterNuiProxy("npwd:fetchTweets" /* FETCH_TWEETS */);
      RegisterNuiProxy("npwd:createTweet" /* CREATE_TWEET */);
      RegisterNuiProxy("npwd:fetchTweetsFiltered" /* FETCH_TWEETS_FILTERED */);
      RegisterNuiProxy("npwd:toggleLike" /* TOGGLE_LIKE */);
      RegisterNuiProxy("npwd:reportTweet" /* REPORT */);
      RegisterNuiProxy("npwd:retweet" /* RETWEET */);
      onNet("createTweetBroadcast" /* CREATE_TWEET_BROADCAST */, (tweet) => {
        sendTwitterMessage("createTweetBroadcast" /* CREATE_TWEET_BROADCAST */, tweet);
      });
    }
  });

  // ../typings/contact.ts
  var init_contact = __esm({
    "../typings/contact.ts"() {
    }
  });

  // client/cl_contacts.ts
  var init_cl_contacts = __esm({
    "client/cl_contacts.ts"() {
      init_contact();
      init_cl_utils();
      RegisterNuiProxy("npwd:getContacts" /* GET_CONTACTS */);
      RegisterNuiProxy("npwd:addContacts" /* ADD_CONTACT */);
      RegisterNuiProxy("npwd:deleteContact" /* DELETE_CONTACT */);
      RegisterNuiProxy("npwd:updateContact" /* UPDATE_CONTACT */);
    }
  });

  // ../typings/marketplace.ts
  var init_marketplace = __esm({
    "../typings/marketplace.ts"() {
    }
  });

  // client/cl_marketplace.ts
  var init_cl_marketplace = __esm({
    "client/cl_marketplace.ts"() {
      init_marketplace();
      init_cl_utils();
      init_messages();
      RegisterNuiProxy("npwd:fetchAllListings" /* FETCH_LISTING */);
      RegisterNuiProxy("npwd:addListing" /* ADD_LISTING */);
      RegisterNuiProxy("npwd:marketplaceDeleteListing" /* DELETE_LISTING */);
      RegisterNuiProxy("npwd:reportListing" /* REPORT_LISTING */);
      onNet("npwd:sendMarketplaceBroadcastAdd" /* BROADCAST_ADD */, (broadcastEvent) => {
        sendMarketplaceEvent("npwd:sendMarketplaceBroadcastAdd" /* BROADCAST_ADD */, broadcastEvent);
      });
      onNet("npwd:sendMarketplaceBroadcastDelete" /* BROADCAST_DELETE */, (broadcastEvent) => {
        sendMarketplaceEvent("npwd:sendMarketplaceBroadcastDelete" /* BROADCAST_DELETE */, broadcastEvent);
      });
    }
  });

  // ../typings/notes.ts
  var init_notes = __esm({
    "../typings/notes.ts"() {
    }
  });

  // client/cl_notes.ts
  var init_cl_notes = __esm({
    "client/cl_notes.ts"() {
      init_notes();
      init_cl_utils();
      RegisterNuiProxy("npwd:addNote" /* ADD_NOTE */);
      RegisterNuiProxy("npwd:fetchAllNotes" /* FETCH_ALL_NOTES */);
      RegisterNuiProxy("npwd:updateNote" /* UPDATE_NOTE */);
      RegisterNuiProxy("npwd:deleteNote" /* DELETE_NOTE */);
    }
  });

  // ../typings/photo.ts
  var init_photo = __esm({
    "../typings/photo.ts"() {
    }
  });

  // client/cl_photo.ts
  var require_cl_photo = __commonJS({
    "client/cl_photo.ts"(exports) {
      init_photo();
      init_fivem();
      init_messages();
      init_phone();
      init_client();
      init_animation_controller();
      init_cl_utils();
      var exp2 = global.exports;
      var inCameraMode = false;
      function closePhoneTemp() {
        SetNuiFocus(false, false);
        sendMessage("PHONE", "npwd:setVisibility" /* SET_VISIBILITY */, false);
      }
      function openPhoneTemp() {
        SetNuiFocus(true, true);
        sendMessage("PHONE", "npwd:setVisibility" /* SET_VISIBILITY */, true);
      }
      function CellFrontCamActivate(activate) {
        return Citizen.invokeNative("0x2491A93618B7D838", activate);
      }
      var displayHelperText = () => {
        BeginTextCommandDisplayHelp("THREESTRINGS");
        AddTextComponentString("Exit Camera Mode: ~INPUT_CELLPHONE_CANCEL~");
        AddTextComponentString("Toggle Front/Back: ~INPUT_PHONE~");
        AddTextComponentString("Take Picture: ~INPUT_CELLPHONE_SELECT~");
        EndTextCommandDisplayHelp(0, true, false, -1);
      };
      RegisterNuiCB("npwd:TakePhoto" /* TAKE_PHOTO */, (_, cb) => __async(exports, null, function* () {
        yield animationService.openCamera();
        emit("npwd:disableControlActions", false);
        let frontCam = false;
        CreateMobilePhone(1);
        CellCamActivate(true, true);
        closePhoneTemp();
        SetNuiFocus(false, false);
        inCameraMode = true;
        emit("npwd:PhotoModeStarted" /* NPWD_PHOTO_MODE_STARTED */);
        while (inCameraMode) {
          yield Delay(0);
          if (IsControlJustPressed(1, 27)) {
            frontCam = !frontCam;
            CellFrontCamActivate(frontCam);
          } else if (IsControlJustPressed(1, 176)) {
            const resp = yield handleTakePicture();
            cb(resp);
            break;
          } else if (IsControlJustPressed(1, 194)) {
            yield handleCameraExit();
            break;
          }
          displayHelperText();
        }
        ClearHelp(true);
        emit("npwd:PhotoModeEnded" /* NPWD_PHOTO_MODE_ENDED */);
        emit("npwd:disableControlActions", true);
        yield animationService.closeCamera();
      }));
      var handleTakePicture = () => __async(exports, null, function* () {
        ClearHelp(true);
        yield Delay(0);
        setTimeout(() => {
          DestroyMobilePhone();
          CellCamActivate(false, false);
          openPhoneTemp();
          animationService.openPhone();
          emit("npwd:disableControlActions", true);
        }, 200);
        const resp = yield ClUtils.emitNetPromise("npwd:UploadPhoto" /* UPLOAD_PHOTO */);
        inCameraMode = false;
        return resp;
      });
      var handleCameraExit = () => __async(exports, null, function* () {
        sendCameraEvent("npwd:cameraExited" /* CAMERA_EXITED */);
        ClearHelp(true);
        yield animationService.closeCamera();
        emit("npwd:disableControlActions", true);
        DestroyMobilePhone();
        CellCamActivate(false, false);
        openPhoneTemp();
        inCameraMode = false;
      });
      RegisterNuiProxy("npwd:FetchPhotos" /* FETCH_PHOTOS */);
      RegisterNuiProxy("npwd:deletePhoto" /* DELETE_PHOTO */);
      RegisterNuiProxy("npwd:saveImage" /* SAVE_IMAGE */);
      RegisterNuiProxy("npwd:deleteMultiplePhotos" /* DELETE_MULTIPLE_PHOTOS */);
    }
  });

  // ../typings/messages.ts
  var init_messages2 = __esm({
    "../typings/messages.ts"() {
    }
  });

  // client/cl_messages.ts
  var init_cl_messages = __esm({
    "client/cl_messages.ts"() {
      init_messages2();
      init_messages();
      init_cl_utils();
      RegisterNuiProxy("npwd:fetchMessageGroups" /* FETCH_MESSAGE_CONVERSATIONS */);
      RegisterNuiProxy("npwd:deleteMessage" /* DELETE_MESSAGE */);
      RegisterNuiProxy("npwd:fetchMessages" /* FETCH_MESSAGES */);
      RegisterNuiProxy("npwd:createMessageGroup" /* CREATE_MESSAGE_CONVERSATION */);
      RegisterNuiProxy("nwpd:deleteConversation" /* DELETE_CONVERSATION */);
      RegisterNuiProxy("npwd:sendMessage" /* SEND_MESSAGE */);
      RegisterNuiProxy("npwd:setReadMessages" /* SET_MESSAGE_READ */);
      RegisterNuiProxy("npwd:getMessageLocation" /* GET_MESSAGE_LOCATION */);
      RegisterNuiCB("npwd:setWaypoint" /* MESSAGES_SET_WAYPOINT */, ({ coords }) => {
        SetNewWaypoint(coords[0], coords[1]);
      });
      onNet("npwd:sendMessageSuccess" /* SEND_MESSAGE_SUCCESS */, (messageDto) => {
        sendMessageEvent("npwd:sendMessageSuccess" /* SEND_MESSAGE_SUCCESS */, messageDto);
      });
      onNet("npwd:createMessagesBroadcast" /* CREATE_MESSAGE_BROADCAST */, (result) => {
        sendMessageEvent("npwd:createMessagesBroadcast" /* CREATE_MESSAGE_BROADCAST */, result);
      });
      onNet("npwd:createMessageConversationSuccess" /* CREATE_MESSAGE_CONVERSATION_SUCCESS */, (result) => {
        sendMessageEvent("npwd:createMessageConversationSuccess" /* CREATE_MESSAGE_CONVERSATION_SUCCESS */, result);
      });
    }
  });

  // ../typings/call.ts
  var init_call = __esm({
    "../typings/call.ts"() {
    }
  });

  // client/sounds/client-sound.class.ts
  var Sound;
  var init_client_sound_class = __esm({
    "client/sounds/client-sound.class.ts"() {
      Sound = class {
        constructor(soundName, soundSetName) {
          this._soundName = soundName;
          this._soundSetName = soundSetName;
          this._soundId = GetSoundId();
        }
        play() {
          PlaySoundFrontend(this._soundId, this._soundName, this._soundSetName, false);
        }
        stop() {
          StopSound(this._soundId);
        }
      };
    }
  });

  // client/sounds/client-ringtone.class.ts
  var Ringtone;
  var init_client_ringtone_class = __esm({
    "client/sounds/client-ringtone.class.ts"() {
      Ringtone = class {
        constructor(ringtoneName) {
          this.ringtoneName = ringtoneName;
        }
        play() {
          PlayPedRingtone(this.ringtoneName, PlayerPedId(), true);
        }
        stop() {
          StopPedRingtone(PlayerPedId());
        }
        static isPlaying() {
          return IsPedRingtonePlaying(PlayerPedId());
        }
      };
    }
  });

  // client/calls/cl_calls.service.ts
  var exp, CallService, callService;
  var init_cl_calls_service = __esm({
    "client/calls/cl_calls.service.ts"() {
      init_cl_main();
      init_call();
      init_client_sound_class();
      init_client_ringtone_class();
      init_settings();
      init_client_kvp_service();
      exp = global.exports;
      CallService = class {
        constructor() {
          this.callSoundName = "Remote_Ring";
          this.hangUpSoundName = "Hang_Up";
          this.soundSet = "Phone_SoundSet_Default";
          this.hangUpSoundSet = "Phone_SoundSet_Michael";
          this.currentCall = 0;
        }
        static sendCallAction(method, data) {
          SendNUIMessage({
            app: "CALL",
            method,
            data
          });
        }
        static sendDialerAction(method, data) {
          SendNUIMessage({
            app: "DIALER",
            method,
            data
          });
        }
        isInCall() {
          return this.currentCall !== 0;
        }
        isCurrentCall(tgtCall) {
          return this.currentCall === tgtCall;
        }
        getCurrentCall() {
          return this.currentPendingCall;
        }
        isInPendingCall() {
          return !!this.currentPendingCall;
        }
        isCurrentPendingCall(target) {
          return target === this.currentPendingCall;
        }
        openCallModal(show) {
          CallService.sendCallAction("npwd:callModal" /* SET_CALL_MODAL */, show);
        }
        handleRejectCall(receiver) {
          if (this.isInCall() || !this.isCurrentPendingCall(receiver))
            return;
          if (this.callSound)
            this.callSound.stop();
          if (Ringtone.isPlaying())
            this.ringtone.stop();
          this.currentPendingCall = null;
          this.openCallModal(false);
          CallService.sendCallAction("npwd:setCaller" /* SET_CALL_INFO */, null);
          const hangUpSound = new Sound(this.hangUpSoundName, this.hangUpSoundSet);
          hangUpSound.play();
        }
        handleStartCall(transmitter, receiver, isTransmitter, isUnavailable) {
          return __async(this, null, function* () {
            if (this.isInCall() || !(yield checkHasPhone()) || this.currentPendingCall)
              return emitNet(
                "npwd:rejectCall" /* REJECTED */,
                { transmitterNumber: transmitter },
                1 /* BUSY_LINE */
              );
            this.currentPendingCall = receiver;
            this.openCallModal(true);
            if (isTransmitter) {
              this.callSound = new Sound(this.callSoundName, this.soundSet);
              this.callSound.play();
            }
            if (!isTransmitter) {
              const ringtone = client_kvp_service_default.getKvpString("npwd-ringtone" /* NPWD_RINGTONE */);
              this.ringtone = new Ringtone(ringtone);
              this.ringtone.play();
            }
            CallService.sendCallAction("npwd:setCaller" /* SET_CALL_INFO */, {
              active: true,
              transmitter,
              receiver,
              isTransmitter,
              accepted: false,
              isUnavailable
            });
          });
        }
        handleCallAccepted(callData) {
          this.currentCall = callData.channelId;
          if (this.callSound)
            this.callSound.stop();
          if (Ringtone.isPlaying())
            this.ringtone.stop();
          exp["pma-voice"].setCallChannel(callData.channelId);
          CallService.sendCallAction("npwd:setCaller" /* SET_CALL_INFO */, callData);
        }
        handleEndCall() {
          if (this.callSound)
            this.callSound.stop();
          this.currentCall = 0;
          exp["pma-voice"].setCallChannel(0);
          this.currentPendingCall = null;
          this.openCallModal(false);
          CallService.sendCallAction("npwd:setCaller" /* SET_CALL_INFO */, null);
          const hangUpSound = new Sound(this.hangUpSoundName, this.hangUpSoundSet);
          hangUpSound.play();
        }
        handleMute(state, callData) {
          if (state) {
            exp["pma-voice"].setCallChannel(0);
          } else {
            exp["pma-voice"].setCallChannel(callData.channelId);
          }
        }
        handleSendAlert(alert) {
          SendNUIMessage({
            app: "DIALER",
            method: "npwd:callSetAlert" /* SEND_ALERT */,
            data: alert
          });
        }
      };
      callService = new CallService();
    }
  });

  // server/utils/miscUtils.ts
  var onNetTyped, emitNetTyped;
  var init_miscUtils = __esm({
    "server/utils/miscUtils.ts"() {
      onNetTyped = (eventName, cb) => onNet(eventName, cb);
      emitNetTyped = (eventName, data, src) => {
        if (src) {
          return emitNet(eventName, src, data);
        }
        emitNet(eventName, data);
      };
    }
  });

  // client/calls/cl_calls.controller.ts
  var initializeCallHandler;
  var init_cl_calls_controller = __esm({
    "client/calls/cl_calls.controller.ts"() {
      init_call();
      init_cl_calls_service();
      init_animation_controller();
      init_miscUtils();
      init_cl_utils();
      init_client();
      initializeCallHandler = (data, cb) => __async(void 0, null, function* () {
        if (callService.isInCall())
          return;
        try {
          const serverRes = yield ClUtils.emitNetPromise(
            "npwd:beginCall" /* INITIALIZE_CALL */,
            data
          );
          animationService.startPhoneCall();
          if (serverRes.status !== "ok") {
            return cb == null ? void 0 : cb(serverRes);
          }
          const { transmitter, isTransmitter, receiver, isUnavailable } = serverRes.data;
          callService.handleStartCall(transmitter, receiver, isTransmitter, isUnavailable);
          cb == null ? void 0 : cb(serverRes);
        } catch (e) {
          console.error(e);
          cb == null ? void 0 : cb({ status: "error", errorMsg: "CLIENT_TIMED_OUT" });
        }
      });
      RegisterNuiCB("npwd:beginCall" /* INITIALIZE_CALL */, initializeCallHandler);
      onNetTyped("npwd:startCall" /* START_CALL */, (data) => __async(void 0, null, function* () {
        const { transmitter, isTransmitter, receiver, isUnavailable } = data;
        callService.handleStartCall(transmitter, receiver, isTransmitter, isUnavailable);
      }));
      RegisterNuiCB("npwd:acceptCall" /* ACCEPT_CALL */, (data, cb) => {
        animationService.startPhoneCall();
        emitNetTyped("npwd:acceptCall" /* ACCEPT_CALL */, data);
        cb({});
      });
      onNetTyped("npwd:callAccepted" /* WAS_ACCEPTED */, (callData) => {
        callService.handleCallAccepted(callData);
      });
      RegisterNuiCB("npwd:rejectCall" /* REJECTED */, (data, cb) => {
        emitNetTyped("npwd:rejectCall" /* REJECTED */, data);
        cb({});
      });
      onNet("npwd:callRejected" /* WAS_REJECTED */, (currentCall) => __async(void 0, null, function* () {
        callService.handleRejectCall(currentCall.receiver);
        animationService.endPhoneCall();
        CallService.sendDialerAction("npwd:callRejected" /* WAS_REJECTED */, currentCall);
      }));
      RegisterNuiCB("npwd:endCall" /* END_CALL */, (data, cb) => __async(void 0, null, function* () {
        try {
          const serverRes = yield ClUtils.emitNetPromise(
            "npwd:endCall" /* END_CALL */,
            data
          );
          if (serverRes.status === "error")
            return console.error(serverRes.errorMsg);
          cb({});
        } catch (e) {
          console.error(e);
          cb({ status: "error", errorMsg: "CLIENT_TIMED_OUT" });
        }
        animationService.endPhoneCall();
      }));
      onNet("npwd:callEnded" /* WAS_ENDED */, (callStarter, currentCall) => {
        if (callService.isInCall() && !callService.isCurrentCall(callStarter))
          return;
        callService.handleEndCall();
        animationService.endPhoneCall();
        if (currentCall) {
          CallService.sendDialerAction("npwd:callRejected" /* WAS_REJECTED */, currentCall);
        }
      });
      RegisterNuiProxy("npwd:fetchCalls" /* FETCH_CALLS */);
      onNet("npwd:callSetAlert" /* SEND_ALERT */, (alert) => {
        callService.handleSendAlert(alert);
      });
      RegisterNuiCB("npwd:toggleMuteCall" /* TOGGLE_MUTE_CALL */, (data, cb) => {
        const { state, call } = data;
        callService.handleMute(state, call);
        cb({});
      });
    }
  });

  // ../typings/match.ts
  var init_match = __esm({
    "../typings/match.ts"() {
    }
  });

  // client/cl_match.ts
  var init_cl_match = __esm({
    "client/cl_match.ts"() {
      init_match();
      init_messages();
      init_cl_utils();
      RegisterNuiProxy("phone:getMatchProfiles" /* GET_PROFILES */);
      RegisterNuiProxy("phone:getMyProfile" /* GET_MY_PROFILE */);
      RegisterNuiProxy("phone:getMatches" /* GET_MATCHES */);
      RegisterNuiProxy("phone:saveLikes" /* SAVE_LIKES */);
      RegisterNuiProxy("phone:createMyProfile" /* CREATE_MY_PROFILE */);
      RegisterNuiProxy("phone:updateMyProfile" /* UPDATE_MY_PROFILE */);
      onNet("phone:saveLikesBroadcast" /* SAVE_LIKES_BROADCAST */, (result) => {
        sendMatchEvent("phone:saveLikesBroadcast" /* SAVE_LIKES_BROADCAST */, result);
      });
      onNet("phone:matchAccountBroadcast" /* CREATE_MATCH_ACCOUNT_BROADCAST */, (result) => {
        sendMatchEvent("phone:matchAccountBroadcast" /* CREATE_MATCH_ACCOUNT_BROADCAST */, result);
      });
    }
  });

  // ../typings/darkchat.ts
  var init_darkchat = __esm({
    "../typings/darkchat.ts"() {
    }
  });

  // client/darkchat-client.ts
  var init_darkchat_client = __esm({
    "client/darkchat-client.ts"() {
      init_cl_utils();
      init_darkchat();
      init_messages();
      RegisterNuiProxy("npwd:darkchatFetchChannels" /* FETCH_CHANNELS */);
      RegisterNuiProxy("npwd:darkchatFetchMessages" /* FETCH_MESSAGES */);
      RegisterNuiProxy("npwd:darkchatAddChannel" /* ADD_CHANNEL */);
      RegisterNuiProxy("npwd:darkchatSendMessage" /* SEND_MESSAGE */);
      RegisterNuiProxy("npwd:darkchatLeaveChannel" /* LEAVE_CHANNEL */);
      RegisterNuiProxy("npwd:darkchatUpdateChannelLabel" /* UPDATE_CHANNEL_LABEL */);
      RegisterNuiProxy("npwd:darkchatFetchMembers" /* FETCH_MEMBERS */);
      RegisterNuiProxy("npwd:darkchatTransferOwnership" /* TRANSFER_OWNERSHIP */);
      RegisterNuiProxy("npwd:darkchatDeleteChannel" /* DELETE_CHANNEL */);
      onNet("npwd:darkchatBroadcastMessage" /* BROADCAST_MESSAGE */, (data) => {
        sendMessage("DARKCHAT", "npwd:darkchatBroadcastMessage" /* BROADCAST_MESSAGE */, data);
      });
      onNet("npwd:darkchatBroadcastLabelUpdate" /* BROADCAST_LABEL_UPDATE */, (data) => {
        sendMessage("DARKCHAT", "npwd:darkchatBroadcastLabelUpdate" /* BROADCAST_LABEL_UPDATE */, data);
      });
      onNet("npwd:darkchatTransferOwnershipSuccess" /* TRANSFER_OWNERSHIP_SUCCESS */, (dto) => {
        sendMessage("DARKCHAT", "npwd:darkchatTransferOwnershipSuccess" /* TRANSFER_OWNERSHIP_SUCCESS */, dto);
      });
      onNet("npwd:darkchatDeleteChannelSuccess" /* DELETE_CHANNEL_SUCCESS */, (dto) => {
        sendMessage("DARKCHAT", "npwd:darkchatDeleteChannelSuccess" /* DELETE_CHANNEL_SUCCESS */, dto);
      });
    }
  });

  // ../typings/audio.ts
  var init_audio = __esm({
    "../typings/audio.ts"() {
    }
  });

  // client/client-audio.ts
  var init_client_audio = __esm({
    "client/client-audio.ts"() {
      init_cl_utils();
      init_audio();
      RegisterNuiProxy("npwd:audio:uploadAudio" /* UPLOAD_AUDIO */);
    }
  });

  // ../typings/notifications.ts
  var init_notifications = __esm({
    "../typings/notifications.ts"() {
    }
  });

  // ../typings/alerts.ts
  var init_alerts = __esm({
    "../typings/alerts.ts"() {
    }
  });

  // client/cl_notifications.ts
  var NotificationFuncRefs;
  var init_cl_notifications = __esm({
    "client/cl_notifications.ts"() {
      init_cl_utils();
      init_alerts();
      init_client_kvp_service();
      init_settings();
      init_client_sound_class();
      NotificationFuncRefs = /* @__PURE__ */ new Map();
      RegisterNuiCB("npwd:playAlert" /* PLAY_ALERT */, () => {
        const notifSoundset = client_kvp_service_default.getKvpString("npwd-notification" /* NPWD_NOTIFICATION */);
        const sound = new Sound("Text_Arrive_Tone", notifSoundset);
        sound.play();
      });
      RegisterNuiCB("npwd:onNotificationConfirm", (notisId, cb) => {
        const funcRef = NotificationFuncRefs.get(`${notisId}:confirm`);
        if (!funcRef)
          return console.log(`NPWD could not find any function ref for notification: ${notisId}`);
        funcRef();
        NotificationFuncRefs.delete(`${notisId}:confirm`);
        cb({});
      });
      RegisterNuiCB("npwd:onNotificationCancel", (notisId, cb) => {
        const funcRef = NotificationFuncRefs.get(`${notisId}:cancel`);
        if (!funcRef)
          return console.log(`NPWD could not find any function ref for notification: ${notisId}`);
        funcRef();
        NotificationFuncRefs.delete(`${notisId}:cancel`);
        cb({});
      });
    }
  });

  // client/cl_exports.ts
  var require_cl_exports = __commonJS({
    "client/cl_exports.ts"(exports) {
      init_messages();
      init_phone();
      init_cl_utils();
      init_cl_calls_controller();
      init_contact();
      init_notes();
      init_cl_main();
      init_client();
      init_cl_calls_service();
      init_animation_controller();
      init_call();
      init_notifications();
      init_cl_notifications();
      var exps2 = global.exports;
      exps2("openApp", (app) => {
        verifyExportArgType("openApp", app, ["string"]);
        sendMessage("PHONE", "npwd:openApp" /* OPEN_APP */, app);
      });
      exps2("setPhoneVisible", (bool) => __async(exports, null, function* () {
        verifyExportArgType("setPhoneVisible", bool, ["boolean", "number"]);
        const isPhoneDisabled = global.isPhoneDisabled;
        const isPhoneOpen = global.isPhoneOpen;
        if (isPhoneDisabled && !bool && isPhoneOpen)
          return;
        const coercedType = !!bool;
        if (coercedType)
          yield showPhone();
        else
          yield hidePhone();
      }));
      exps2("isPhoneVisible", () => global.isPhoneOpen);
      exps2("setPhoneDisabled", (bool) => {
        verifyExportArgType("setPhoneVisible", bool, ["boolean", "number"]);
        const coercedType = !!bool;
        global.isPhoneDisabled = coercedType;
        sendPhoneEvent("npwd:isPhoneDisabled" /* IS_PHONE_DISABLED */, bool);
      });
      exps2("isPhoneDisabled", () => global.isPhoneDisabled);
      exps2("startPhoneCall", (number) => {
        verifyExportArgType("startPhoneCall", number, ["string"]);
        initializeCallHandler({ receiverNumber: number });
      });
      exps2("fillNewContact", (contactData) => {
        verifyExportArgType("fillNewContact", contactData, ["object"]);
        sendContactsEvent("npwd:addContactExport" /* ADD_CONTACT_EXPORT */, contactData);
      });
      exps2("fillNewNote", (noteData) => {
        verifyExportArgType("fillNewNote", noteData, ["object"]);
        sendNotesEvent("npwd:addNoteExport" /* ADD_NOTE_EXPORT */, noteData);
      });
      exps2("getPhoneNumber", () => __async(exports, null, function* () {
        if (!global.clientPhoneNumber) {
          const res = yield ClUtils.emitNetPromise("npwd:getPhoneNumber" /* GET_PHONE_NUMBER */);
          global.clientPhoneNumber = res.data;
        }
        return global.clientPhoneNumber;
      }));
      exps2("isInCall", () => {
        return callService.isInCall();
      });
      exps2("endCall", () => __async(exports, null, function* () {
        if (callService.isInCall()) {
          CallService.sendCallAction("npwd:endCall" /* END_CALL */, null);
          animationService.endPhoneCall();
        }
      }));
      exps2("sendUIMessage", (action) => {
        SendNUIMessage(action);
      });
      exps2("createNotification", (dto) => {
        verifyExportArgType("createSystemNotification", dto, ["object"]);
        verifyExportArgType("createSystemNotification", dto.notisId, ["string"]);
        sendMessage("PHONE", "npwd:createNotification" /* CREATE_NOTIFICATION */, dto);
      });
      exps2("createSystemNotification", (dto) => {
        verifyExportArgType("createSystemNotification", dto, ["object"]);
        verifyExportArgType("createSystemNotification", dto.uniqId, ["string"]);
        const actionSet = dto.onConfirm || dto.onCancel;
        if (dto.controls && !dto.keepOpen)
          return console.log("Notification must be set to keepOpen in order to use notifcation actions");
        if (!dto.controls && actionSet)
          return console.log("Controls must be set to true in order to use notifcation actions");
        if (dto.controls) {
          NotificationFuncRefs.set(`${dto.uniqId}:confirm`, dto.onConfirm);
          NotificationFuncRefs.set(`${dto.uniqId}:cancel`, dto.onCancel);
        }
        sendMessage("SYSTEM", "npwd:createSystemNotification" /* CREATE_SYSTEM_NOTIFICATION */, dto);
      });
      exps2("removeSystemNotification", (uniqId) => {
        verifyExportArgType("createSystemNotification", uniqId, ["string"]);
        sendMessage("SYSTEM", "npwd:removeSystemNotification" /* REMOVE_SYSTEM_NOTIFICATION */, { uniqId });
      });
    }
  });

  // client/settings/client-settings.ts
  var init_client_settings = __esm({
    "client/settings/client-settings.ts"() {
      init_cl_utils();
      init_settings();
      init_client_kvp_service();
      init_client_sound_class();
      init_client_ringtone_class();
      RegisterNuiCB("npwd:nuiSettingsUpdated" /* NUI_SETTINGS_UPDATED */, (cfg, cb) => {
        global.exports["pma-voice"].setCallVolume(cfg.callVolume);
        client_kvp_service_default.setKvp("npwd-ringtone" /* NPWD_RINGTONE */, cfg.ringtone.value);
        client_kvp_service_default.setKvp("npwd-notification" /* NPWD_NOTIFICATION */, cfg.notiSound.value);
        const frameValue = cfg.frame.value;
        const frameName = frameValue.substr(0, frameValue.lastIndexOf("."));
        client_kvp_service_default.setKvp("npwd-frame" /* NPWD_FRAME */, `prop_npwd_${frameName}`);
        cb({});
      });
      RegisterNuiCB("npwd:previewAlert" /* PREVIEW_ALERT */, () => {
        const notifSoundset = client_kvp_service_default.getKvpString("npwd-notification" /* NPWD_NOTIFICATION */);
        const sound = new Sound("Text_Arrive_Tone", notifSoundset);
        sound.play();
      });
      RegisterNuiCB("npwd:previewRingtone" /* PREVIEW_RINGTONE */, () => {
        if (Ringtone.isPlaying())
          return;
        const ringtoneSound = client_kvp_service_default.getKvpString("npwd-ringtone" /* NPWD_RINGTONE */);
        const ringtone = new Ringtone(ringtoneSound);
        ringtone.play();
        setTimeout(ringtone.stop, 3e3);
      });
    }
  });

  // client/client.ts
  var import_cl_photo, import_cl_exports, ClUtils;
  var init_client = __esm({
    "client/client.ts"() {
      init_cl_utils();
      init_cl_config();
      init_cl_main();
      init_cl_twitter();
      init_cl_contacts();
      init_cl_marketplace();
      init_cl_notes();
      import_cl_photo = __toESM(require_cl_photo());
      init_cl_messages();
      init_cl_calls_controller();
      init_cl_match();
      init_darkchat_client();
      init_client_audio();
      init_functions();
      import_cl_exports = __toESM(require_cl_exports());
      init_client_settings();
      init_cl_notifications();
      ClUtils = new ClientUtils();
    }
  });
  init_client();
})();
