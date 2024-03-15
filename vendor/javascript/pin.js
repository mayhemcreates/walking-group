import t from"request";import r from"events";var i="undefined"!==typeof globalThis?globalThis:"undefined"!==typeof self?self:global;var n={};var o=r.EventEmitter;function Ping(t,r){(this||i).url=t;(this||i).driver=r;(this||i).successCodes=["200","302","201","202","204","304"];(this||i).started=false;(this||i).validators=[];var n=this||i;var textCheck=function(t,r,i){return!n._text||~i.indexOf(n._text)};var errorCheck=function(t,r,i){return!t};var statusCheck=function(t,r,i){return~n.successCodes.indexOf(r.statusCode+"")};var perfCheck=function(t,r,i,o){return"number"!==typeof n._maxDuration||o.duration<=n._maxDuration};this.register(errorCheck,statusCheck,textCheck,perfCheck)}Ping.prototype.__proto__=o.prototype;Ping.prototype.interval=function(t){(this||i)._interval=t;return this||i};Ping.prototype.register=function(){var t=this||i;var r=Array.prototype.slice.call(arguments);r.forEach((function(r){t.validators.push(r)}));return this||i};Ping.prototype.isValid=function(t,r,n,o){var e=true;(this||i).validators.forEach((function(i){i(t,r,n,o)||(e=false)}));return e};Ping.prototype.text=function(t){(this||i)._text=t;return this||i};Ping.prototype.maxDuration=function(t){(this||i)._maxDuration=t;return this||i};Ping.prototype.up=function(t){this.on("up",t);this.monitor();return this||i};Ping.prototype.down=function(t){this.on("down",t);this.monitor();return this||i};Ping.prototype.monitor=function(){if(!(this||i).started){var t=this||i;(this||i).started=true;setInterval((function(){t.check()}),(this||i)._interval)}};Ping.prototype.check=function(){var t=this||i,r=Date.now();(this||i).driver.get((this||i).url,(function(i,n,o){var e=Date.now()-r,s={duration:e},a=t.isValid(i,n,o,s);a?t.emit("up",n,s):t.emit("down",i,n,s)}))};n=Ping;var e=n;var s={};var a=t;var u=e;var pin=function(t,r){r||(r=a);return new u(t,r)};s=pin;var f=s;export default f;

