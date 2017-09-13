//= require jquery
//= require jquery_ujs
//= require fingerprint
//= require bootstrap-sprockets
//= require_tree .

// var App = window.App || {};

// App.fingerprint = (function() {
//     console.log('First function called');

//     function setFingerprintCookie() {
//         console.log('Second function called');

//         var fingerprint = new Fingerprint().get();
//         cookieName = '2dfaeb1bd6be147c176aeb44076c11e3';
//         // the cookie name is an MD5 hash of 'browser_fingerprint` to obscure slightly what it is

//         console.log(cookieName);
//         console.log(fingerprint);

//         if (typeof Cookies.get(cookieName) === 'undefined') {
//             Cookies.set(cookieName, fingerprint, {
//                 path: '/'
//             });
//         }
//     }

//     return {
//         setFingerprintCookie: setFingerprintCookie()
//     }

// }());
