(self.webpackChunkweb=self.webpackChunkweb||[]).push([[617],{617:function(module,__unused_webpack_exports,__webpack_require__){eval('!function(e,t){ true?module.exports=t(__webpack_require__(6778)):0}(this,(function(e){"use strict";function t(e){return e&&"object"==typeof e&&"default"in e?e:{default:e}}var a=t(e),r={words:{m:["jedan minut","jednog minuta"],mm:["%d minut","%d minuta","%d minuta"],h:["jedan sat","jednog sata"],hh:["%d sat","%d sata","%d sati"],d:["jedan dan","jednog dana"],dd:["%d dan","%d dana","%d dana"],M:["jedan mesec","jednog meseca"],MM:["%d mesec","%d meseca","%d meseci"],y:["jednu godinu","jedne godine"],yy:["%d godinu","%d godine","%d godina"]},correctGrammarCase:function(e,t){return e%10>=1&&e%10<=4&&(e%100<10||e%100>=20)?e%10==1?t[0]:t[1]:t[2]},relativeTimeFormatter:function(e,t,a,d){var n=r.words[a];if(1===a.length)return"y"===a&&t?"jedna godina":d||t?n[0]:n[1];var i=r.correctGrammarCase(e,n);return"yy"===a&&t&&"%d godinu"===i?e+" godina":i.replace("%d",e)}},d={name:"sr",weekdays:"Nedelja_Ponedeljak_Utorak_Sreda_Četvrtak_Petak_Subota".split("_"),weekdaysShort:"Ned._Pon._Uto._Sre._Čet._Pet._Sub.".split("_"),weekdaysMin:"ne_po_ut_sr_če_pe_su".split("_"),months:"Januar_Februar_Mart_April_Maj_Jun_Jul_Avgust_Septembar_Oktobar_Novembar_Decembar".split("_"),monthsShort:"Jan._Feb._Mar._Apr._Maj_Jun_Jul_Avg._Sep._Okt._Nov._Dec.".split("_"),weekStart:1,relativeTime:{future:"za %s",past:"pre %s",s:"nekoliko sekundi",m:r.relativeTimeFormatter,mm:r.relativeTimeFormatter,h:r.relativeTimeFormatter,hh:r.relativeTimeFormatter,d:r.relativeTimeFormatter,dd:r.relativeTimeFormatter,M:r.relativeTimeFormatter,MM:r.relativeTimeFormatter,y:r.relativeTimeFormatter,yy:r.relativeTimeFormatter},ordinal:function(e){return e+"."},formats:{LT:"H:mm",LTS:"H:mm:ss",L:"D. M. YYYY.",LL:"D. MMMM YYYY.",LLL:"D. MMMM YYYY. H:mm",LLLL:"dddd, D. MMMM YYYY. H:mm"}};return a.default.locale(d,null,!0),d}));//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiNjE3LmpzIiwibWFwcGluZ3MiOiJBQUFBLGVBQWUsS0FBb0Qsa0JBQWtCLG1CQUFPLENBQUMsSUFBTyxHQUFHLENBQTBJLENBQUMsbUJBQW1CLGFBQWEsY0FBYywrQ0FBK0MsV0FBVyxjQUFjLE9BQU8sK1ZBQStWLGtDQUFrQyxzRUFBc0UseUNBQXlDLGlCQUFpQiwrREFBK0QsZ0NBQWdDLGtFQUFrRSxJQUFJLG1aQUFtWiwyVEFBMlQscUJBQXFCLGFBQWEsVUFBVSxzSEFBc0gscUNBQXFDIiwic291cmNlcyI6WyJ3ZWJwYWNrOi8vd2ViLy4vbm9kZV9tb2R1bGVzL2RheWpzL2xvY2FsZS9zci5qcz9mMWU5Il0sInNvdXJjZXNDb250ZW50IjpbIiFmdW5jdGlvbihlLHQpe1wib2JqZWN0XCI9PXR5cGVvZiBleHBvcnRzJiZcInVuZGVmaW5lZFwiIT10eXBlb2YgbW9kdWxlP21vZHVsZS5leHBvcnRzPXQocmVxdWlyZShcImRheWpzXCIpKTpcImZ1bmN0aW9uXCI9PXR5cGVvZiBkZWZpbmUmJmRlZmluZS5hbWQ/ZGVmaW5lKFtcImRheWpzXCJdLHQpOihlPVwidW5kZWZpbmVkXCIhPXR5cGVvZiBnbG9iYWxUaGlzP2dsb2JhbFRoaXM6ZXx8c2VsZikuZGF5anNfbG9jYWxlX3NyPXQoZS5kYXlqcyl9KHRoaXMsKGZ1bmN0aW9uKGUpe1widXNlIHN0cmljdFwiO2Z1bmN0aW9uIHQoZSl7cmV0dXJuIGUmJlwib2JqZWN0XCI9PXR5cGVvZiBlJiZcImRlZmF1bHRcImluIGU/ZTp7ZGVmYXVsdDplfX12YXIgYT10KGUpLHI9e3dvcmRzOnttOltcImplZGFuIG1pbnV0XCIsXCJqZWRub2cgbWludXRhXCJdLG1tOltcIiVkIG1pbnV0XCIsXCIlZCBtaW51dGFcIixcIiVkIG1pbnV0YVwiXSxoOltcImplZGFuIHNhdFwiLFwiamVkbm9nIHNhdGFcIl0saGg6W1wiJWQgc2F0XCIsXCIlZCBzYXRhXCIsXCIlZCBzYXRpXCJdLGQ6W1wiamVkYW4gZGFuXCIsXCJqZWRub2cgZGFuYVwiXSxkZDpbXCIlZCBkYW5cIixcIiVkIGRhbmFcIixcIiVkIGRhbmFcIl0sTTpbXCJqZWRhbiBtZXNlY1wiLFwiamVkbm9nIG1lc2VjYVwiXSxNTTpbXCIlZCBtZXNlY1wiLFwiJWQgbWVzZWNhXCIsXCIlZCBtZXNlY2lcIl0seTpbXCJqZWRudSBnb2RpbnVcIixcImplZG5lIGdvZGluZVwiXSx5eTpbXCIlZCBnb2RpbnVcIixcIiVkIGdvZGluZVwiLFwiJWQgZ29kaW5hXCJdfSxjb3JyZWN0R3JhbW1hckNhc2U6ZnVuY3Rpb24oZSx0KXtyZXR1cm4gZSUxMD49MSYmZSUxMDw9NCYmKGUlMTAwPDEwfHxlJTEwMD49MjApP2UlMTA9PTE/dFswXTp0WzFdOnRbMl19LHJlbGF0aXZlVGltZUZvcm1hdHRlcjpmdW5jdGlvbihlLHQsYSxkKXt2YXIgbj1yLndvcmRzW2FdO2lmKDE9PT1hLmxlbmd0aClyZXR1cm5cInlcIj09PWEmJnQ/XCJqZWRuYSBnb2RpbmFcIjpkfHx0P25bMF06blsxXTt2YXIgaT1yLmNvcnJlY3RHcmFtbWFyQ2FzZShlLG4pO3JldHVyblwieXlcIj09PWEmJnQmJlwiJWQgZ29kaW51XCI9PT1pP2UrXCIgZ29kaW5hXCI6aS5yZXBsYWNlKFwiJWRcIixlKX19LGQ9e25hbWU6XCJzclwiLHdlZWtkYXlzOlwiTmVkZWxqYV9Qb25lZGVsamFrX1V0b3Jha19TcmVkYV/EjGV0dnJ0YWtfUGV0YWtfU3Vib3RhXCIuc3BsaXQoXCJfXCIpLHdlZWtkYXlzU2hvcnQ6XCJOZWQuX1Bvbi5fVXRvLl9TcmUuX8SMZXQuX1BldC5fU3ViLlwiLnNwbGl0KFwiX1wiKSx3ZWVrZGF5c01pbjpcIm5lX3BvX3V0X3NyX8SNZV9wZV9zdVwiLnNwbGl0KFwiX1wiKSxtb250aHM6XCJKYW51YXJfRmVicnVhcl9NYXJ0X0FwcmlsX01hal9KdW5fSnVsX0F2Z3VzdF9TZXB0ZW1iYXJfT2t0b2Jhcl9Ob3ZlbWJhcl9EZWNlbWJhclwiLnNwbGl0KFwiX1wiKSxtb250aHNTaG9ydDpcIkphbi5fRmViLl9NYXIuX0Fwci5fTWFqX0p1bl9KdWxfQXZnLl9TZXAuX09rdC5fTm92Ll9EZWMuXCIuc3BsaXQoXCJfXCIpLHdlZWtTdGFydDoxLHJlbGF0aXZlVGltZTp7ZnV0dXJlOlwiemEgJXNcIixwYXN0OlwicHJlICVzXCIsczpcIm5la29saWtvIHNla3VuZGlcIixtOnIucmVsYXRpdmVUaW1lRm9ybWF0dGVyLG1tOnIucmVsYXRpdmVUaW1lRm9ybWF0dGVyLGg6ci5yZWxhdGl2ZVRpbWVGb3JtYXR0ZXIsaGg6ci5yZWxhdGl2ZVRpbWVGb3JtYXR0ZXIsZDpyLnJlbGF0aXZlVGltZUZvcm1hdHRlcixkZDpyLnJlbGF0aXZlVGltZUZvcm1hdHRlcixNOnIucmVsYXRpdmVUaW1lRm9ybWF0dGVyLE1NOnIucmVsYXRpdmVUaW1lRm9ybWF0dGVyLHk6ci5yZWxhdGl2ZVRpbWVGb3JtYXR0ZXIseXk6ci5yZWxhdGl2ZVRpbWVGb3JtYXR0ZXJ9LG9yZGluYWw6ZnVuY3Rpb24oZSl7cmV0dXJuIGUrXCIuXCJ9LGZvcm1hdHM6e0xUOlwiSDptbVwiLExUUzpcIkg6bW06c3NcIixMOlwiRC4gTS4gWVlZWS5cIixMTDpcIkQuIE1NTU0gWVlZWS5cIixMTEw6XCJELiBNTU1NIFlZWVkuIEg6bW1cIixMTExMOlwiZGRkZCwgRC4gTU1NTSBZWVlZLiBIOm1tXCJ9fTtyZXR1cm4gYS5kZWZhdWx0LmxvY2FsZShkLG51bGwsITApLGR9KSk7Il0sIm5hbWVzIjpbXSwic291cmNlUm9vdCI6IiJ9\n//# sourceURL=webpack-internal:///617\n')}}]);