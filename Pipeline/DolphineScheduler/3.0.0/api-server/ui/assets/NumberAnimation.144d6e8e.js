import{u as y}from"./use-locale.be539345.js";import{bh as h,aK as I,d as R,a as S,j as v,o as V,J as A}from"./index.c5429249.js";import{t as b}from"./toNumber.5d1af176.js";var F=1/0,T=17976931348623157e292;function x(t){if(!t)return t===0?t:0;if(t=b(t),t===F||t===-F){var e=t<0?-1:1;return e*T}return t===t?t:0}function E(t){var e=x(t),o=e%1;return e===e?o?e-o:e:0}var j=I.isFinite,B=Math.min;function L(t){var e=Math[t];return function(o,n){if(o=b(o),n=n==null?0:B(E(n),292),n&&j(o)){var r=(h(o)+"e").split("e"),i=e(r[0]+"e"+(+r[1]+n));return r=(h(i)+"e").split("e"),+(r[0]+"e"+(+r[1]-n))}return e(o)}}var O=L("round"),P=O;const U=t=>1-Math.pow(1-t,5);function _(t){const{from:e,to:o,duration:n,onUpdate:r,onFinish:i}=t,u=()=>{const s=performance.now(),c=Math.min(s-m,n),f=e+(o-e)*U(c/n);if(c===n){i();return}r(f),requestAnimationFrame(u)},m=performance.now();u()}const k={to:{type:Number,default:0},precision:{type:Number,default:0},showSeparator:Boolean,locale:String,from:{type:Number,default:0},active:{type:Boolean,default:!0},duration:{type:Number,default:2e3}};var K=R({name:"NumberAnimation",props:k,setup(t){const{localeRef:e}=y("name"),{duration:o}=t,n=S(t.from),r=v(()=>{const{locale:a}=t;return a!==void 0?a:e.value});let i=!1;const u=a=>{n.value=a},m=()=>{n.value=t.to,i=!1},s=(a=t.from,d=t.to)=>{i=!0,n.value=t.from,a!==d&&_({from:a,to:d,duration:o,onUpdate:u,onFinish:m})},c=v(()=>{var a;const l=P(n.value,t.precision).toFixed(t.precision).split("."),N=new Intl.NumberFormat(r.value),M=(a=N.formatToParts(.5).find(w=>w.type==="decimal"))===null||a===void 0?void 0:a.value,g=t.showSeparator?N.format(Number(l[0])):l[0],p=l[1];return{integer:g,decimal:p,decimalSeparator:M}});function f(){i||s()}return V(()=>{A(()=>{t.active&&s()})}),Object.assign({formattedValue:c},{play:f})},render(){const{formattedValue:{integer:t,decimal:e,decimalSeparator:o}}=this;return[t,e?o:null,e]}});export{K as N};