import{i as y}from"./is-browser.d3e5def6.js";import{q as c,p as n,v as P,x as u,d as g,z as T,A as x,C as I,B as j,j as p,D as E,h as v,k as S,bI as _,a as $,o as w,a5 as H,n as N}from"./index.c5429249.js";import{r as A}from"./resolve-slot.7c241306.js";var O=c("breadcrumb",`
 white-space: nowrap;
 cursor: default;
 line-height: var(--n-item-line-height);
`,[n("ul",`
 list-style: none;
 padding: 0;
 margin: 0;
 `),n("a",`
 color: inherit;
 text-decoration: inherit;
 `),c("breadcrumb-item",`
 font-size: var(--n-font-size);
 transition: color .3s var(--n-bezier);
 display: inline-flex;
 align-items: center;
 `,[c("icon",`
 font-size: 18px;
 vertical-align: -.2em;
 transition: color .3s var(--n-bezier);
 color: var(--n-item-text-color);
 `),n("&:not(:last-child)",[P("clickable",[u("link",`
 cursor: pointer;
 `,[n("&:hover",`
 background-color: var(--n-item-color-hover);
 `),n("&:active",`
 background-color: var(--n-item-color-pressed); 
 `)])])]),u("link",`
 padding: 4px;
 border-radius: var(--n-item-border-radius);
 transition:
 background-color .3s var(--n-bezier),
 color .3s var(--n-bezier);
 color: var(--n-item-text-color);
 position: relative;
 `,[n("&:hover",`
 color: var(--n-item-text-color-hover);
 `,[c("icon",`
 color: var(--n-item-text-color-hover);
 `)]),n("&:active",`
 color: var(--n-item-text-color-pressed);
 `,[c("icon",`
 color: var(--n-item-text-color-pressed);
 `)])]),u("separator",`
 margin: 0 8px;
 color: var(--n-separator-color);
 transition: color .3s var(--n-bezier);
 user-select: none;
 `),n("&:last-child",[u("link",`
 font-weight: var(--n-font-weight-active);
 cursor: unset;
 color: var(--n-item-text-color-active);
 `,[c("icon",`
 color: var(--n-item-text-color-active);
 `)]),u("separator",`
 display: none;
 `)])])]);const C=S("n-breadcrumb"),V=Object.assign(Object.assign({},x.props),{separator:{type:String,default:"/"}});var G=g({name:"Breadcrumb",props:V,setup(e){const{mergedClsPrefixRef:o,inlineThemeDisabled:r}=T(e),s=x("Breadcrumb","-breadcrumb",O,_,e,o);I(C,{separatorRef:j(e,"separator"),mergedClsPrefixRef:o});const l=p(()=>{const{common:{cubicBezierEaseInOut:d},self:{separatorColor:m,itemTextColor:a,itemTextColorHover:i,itemTextColorPressed:h,itemTextColorActive:b,fontSize:f,fontWeightActive:k,itemBorderRadius:B,itemColorHover:R,itemColorPressed:z,itemLineHeight:L}}=s.value;return{"--n-font-size":f,"--n-bezier":d,"--n-item-text-color":a,"--n-item-text-color-hover":i,"--n-item-text-color-pressed":h,"--n-item-text-color-active":b,"--n-separator-color":m,"--n-item-color-hover":R,"--n-item-color-pressed":z,"--n-item-border-radius":B,"--n-font-weight-active":k,"--n-item-line-height":L}}),t=r?E("breadcrumb",void 0,l,e):void 0;return{mergedClsPrefix:o,cssVars:r?void 0:l,themeClass:t==null?void 0:t.themeClass,onRender:t==null?void 0:t.onRender}},render(){var e;return(e=this.onRender)===null||e===void 0||e.call(this),v("nav",{class:[`${this.mergedClsPrefix}-breadcrumb`,this.themeClass],style:this.cssVars,"aria-label":"Breadcrumb"},v("ul",null,this.$slots))}});const D=y?window:null,K=(e=D)=>{const o=()=>{const{hash:l,host:t,hostname:d,href:m,origin:a,pathname:i,port:h,protocol:b,search:f}=(e==null?void 0:e.location)||{};return{hash:l,host:t,hostname:d,href:m,origin:a,pathname:i,port:h,protocol:b,search:f}},r=()=>{s.value=o()},s=$(o());return w(()=>{e&&(e.addEventListener("popstate",r),e.addEventListener("hashchange",r))}),H(()=>{e&&(e.removeEventListener("popstate",r),e.removeEventListener("hashchange",r))}),s},M={separator:String,href:String,clickable:{type:Boolean,default:!0},onClick:Function};var J=g({name:"BreadcrumbItem",props:M,setup(e,{slots:o}){const r=N(C,null);if(!r)return()=>null;const{separatorRef:s,mergedClsPrefixRef:l}=r,t=K(),d=p(()=>e.href?"a":"span"),m=p(()=>t.value.href===e.href?"location":null);return()=>{const{value:a}=l;return v("li",{class:[`${a}-breadcrumb-item`,e.clickable&&`${a}-breadcrumb-item--clickable`]},v(d.value,{class:`${a}-breadcrumb-item__link`,"aria-current":m.value,href:e.href,onClick:e.onClick},o),v("span",{class:`${a}-breadcrumb-item__separator`,"aria-hidden":"true"},A(o.separator,()=>{var i;return[(i=e.separator)!==null&&i!==void 0?i:s.value]})))}}});export{G as N,J as a};
