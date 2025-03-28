import{d as B,h as t,bD as Ie,aE as Ne,bc as Oe,ay as Ue,az as _e,aD as je,au as Le,bO as Me,at as $e,k as Ee,n as $,j as R,R as M,a as V,T as Ae,bP as qe,a2 as He,N as Z,B as Xe,p as y,q as S,v as N,x as O,y as Ke,z as We,A as le,M as G,C as Ge,E as Ye,r as Ze,br as Je,u as Qe,w as et,t as tt,c as P,_ as rt,F as J,O as Q}from"./index.c5429249.js";import{a as at,b as it}from"./index.bbb6cfa3.js";import{e as st,f as nt}from"./index.3b5bce66.js";import{g as ot,h as lt,i as ut,j as ct}from"./index.8259a597.js";import{a as dt,b as ft}from"./index.e24493be.js";import{a as ht,b as mt,e as gt,f as pt,h as vt}from"./index.f239614a.js";import{M as bt}from"./index.20e11ec3.js";import{a as ue}from"./Checkbox.7506e5f5.js";import{g as Ct,N as xt,V as zt}from"./Selection.a106a9c5.js";import{N as kt,u as St}from"./Scrollbar.12b40993.js";import{N as yt}from"./Input.97d5419b.js";import{f as Rt}from"./fade-in.cssr.9da325c6.js";import{u as Tt,N as ee}from"./Button.c43a24dc.js";import{d as wt}from"./index.16077d24.js";import{u as Pt}from"./use-locale.be539345.js";import{C as Ft}from"./ChevronRight.f70a9c2d.js";import{c as Y}from"./resolve-slot.7c241306.js";import{N as te}from"./RadioButton.2ddd4a35.js";import{N as Vt}from"./Space.e50db48f.js";import{N as Bt}from"./RadioGroup.47f9a37a.js";import{N as re}from"./TreeSelect.b9641da1.js";import"./service.0215c8a4.js";import"./lodash.084a01e7.js";import"./index.3b9f9e63.js";import"./keysOf.963e6f6c.js";import"./Card.c707a1eb.js";import"./use-rtl.c78ffbd8.js";import"./index.3e01cddc.js";import"./flatten.a7868693.js";import"./fade-in-scale-up.cssr.05526022.js";import"./utils.3eee947a.js";import"./is-browser.d3e5def6.js";import"./VResizeObserver.14b04bb7.js";import"./Popover.df2981b4.js";import"./format-length.e7c2072e.js";import"./use-compitable.b0459e69.js";import"./next-frame-once.da993024.js";import"./Suffix.9ee1fead.js";import"./get-slot.c85d6606.js";var Dt=B({name:"ChevronLeft",render(){return t("svg",{viewBox:"0 0 16 16",fill:"none",xmlns:"http://www.w3.org/2000/svg"},t("path",{d:"M10.3536 3.14645C10.5488 3.34171 10.5488 3.65829 10.3536 3.85355L6.20711 8L10.3536 12.1464C10.5488 12.3417 10.5488 12.6583 10.3536 12.8536C10.1583 13.0488 9.84171 13.0488 9.64645 12.8536L5.14645 8.35355C4.95118 8.15829 4.95118 7.84171 5.14645 7.64645L9.64645 3.14645C9.84171 2.95118 10.1583 2.95118 10.3536 3.14645Z",fill:"currentColor"}))}}),It=B({name:"Search",render(){return t("svg",{version:"1.1",xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 512 512",style:"enable-background: new 0 0 512 512"},t("path",{d:`M443.5,420.2L336.7,312.4c20.9-26.2,33.5-59.4,33.5-95.5c0-84.5-68.5-153-153.1-153S64,132.5,64,217s68.5,153,153.1,153
  c36.6,0,70.1-12.8,96.5-34.2l106.1,107.1c3.2,3.4,7.6,5.1,11.9,5.1c4.1,0,8.2-1.5,11.3-4.5C449.5,437.2,449.7,426.8,443.5,420.2z
   M217.1,337.1c-32.1,0-62.3-12.5-85-35.2c-22.7-22.7-35.2-52.9-35.2-84.9c0-32.1,12.5-62.3,35.2-84.9c22.7-22.7,52.9-35.2,85-35.2
  c32.1,0,62.3,12.5,85,35.2c22.7,22.7,35.2,52.9,35.2,84.9c0,32.1-12.5,62.3-35.2,84.9C279.4,324.6,249.2,337.1,217.1,337.1z`}))}});const Nt=e=>{const{fontWeight:s,iconColorDisabled:o,iconColor:d,fontSizeLarge:l,fontSizeMedium:n,fontSizeSmall:h,heightLarge:f,heightMedium:p,heightSmall:i,borderRadius:a,cardColor:r,tableHeaderColor:v,textColor1:b,textColorDisabled:g,textColor2:c,borderColor:m,hoverColor:z}=e;return Object.assign(Object.assign({},Me),{itemHeightSmall:i,itemHeightMedium:p,itemHeightLarge:f,fontSizeSmall:h,fontSizeMedium:n,fontSizeLarge:l,borderRadius:a,borderColor:m,listColor:r,headerColor:$e(r,v),titleTextColor:b,titleTextColorDisabled:g,extraTextColor:c,filterDividerColor:m,itemTextColor:c,itemTextColorDisabled:g,itemColorPending:z,titleFontWeight:s,iconColor:d,iconColorDisabled:o})},Ot=Ie({name:"Transfer",common:Ne,peers:{Checkbox:Oe,Scrollbar:Ue,Input:_e,Empty:je,Button:Le},self:Nt});var Ut=Ot;const _=Ee("n-transfer");var ae=B({name:"TransferHeader",props:{source:{type:Boolean,default:!1},onChange:{type:Function,required:!0},title:String},setup(e){const{srcOptsRef:s,tgtOptsRef:o,srcCheckedStatusRef:d,tgtCheckedStatusRef:l,srcCheckedValuesRef:n,tgtCheckedValuesRef:h,mergedThemeRef:f,disabledRef:p,mergedClsPrefixRef:i}=$(_),a=R(()=>{const{source:r}=e;return r?d.value:l.value});return()=>{const{source:r}=e,{value:v}=a,{value:b}=f,{value:g}=i;return t("div",{class:`${g}-transfer-list-header`},t("div",{class:`${g}-transfer-list-header__checkbox`},t(ue,{theme:b.peers.Checkbox,themeOverrides:b.peerOverrides.Checkbox,checked:v.checked,indeterminate:v.indeterminate,disabled:v.disabled||p.value,onUpdateChecked:e.onChange})),t("div",{class:`${g}-transfer-list-header__header`},e.title),t("div",{class:`${g}-transfer-list-header__extra`},r?n.value.length:h.value.length,"/",r?s.value.length:o.value.length))}}}),ie=B({name:"NTransferListItem",props:{source:{type:Boolean,default:!1},label:{type:String,required:!0},value:{type:[String,Number],required:!0},disabled:{type:Boolean,default:!1}},setup(e){const{source:s}=e,{mergedClsPrefixRef:o,mergedThemeRef:d,srcCheckedValuesRef:l,tgtCheckedValuesRef:n,handleSrcCheckboxClick:h,handleTgtCheckboxClick:f}=$(_),p=s?M(()=>l.value.includes(e.value)):M(()=>n.value.includes(e.value));return{mergedClsPrefix:o,mergedTheme:d,checked:p,handleClick:s?()=>{e.disabled||h(!p.value,e.value)}:()=>{e.disabled||f(!p.value,e.value)}}},render(){const{disabled:e,mergedTheme:s,mergedClsPrefix:o,label:d,checked:l,source:n}=this;return t("div",{class:[`${o}-transfer-list-item`,e&&`${o}-transfer-list-item--disabled`,n?`${o}-transfer-list-item--source`:`${o}-transfer-list-item--target`],onClick:this.handleClick},t("div",{class:`${o}-transfer-list-item__checkbox`},t(ue,{theme:s.peers.Checkbox,themeOverrides:s.peerOverrides.Checkbox,disabled:e,checked:l})),t("div",{class:`${o}-transfer-list-item__label`,title:Ct(d)},d))}}),se=B({name:"TransferList",props:{virtualScroll:{type:Boolean,required:!0},itemSize:{type:Number,required:!0},options:{type:Array,required:!0},disabled:{type:Boolean,required:!0},isMounted:{type:Boolean,required:!0},isInputing:{type:Boolean,required:!0},source:{type:Boolean,default:!1}},setup(){const{mergedThemeRef:e,mergedClsPrefixRef:s}=$(_),o=V(null),d=V(null);function l(){var f;(f=o.value)===null||f===void 0||f.sync()}function n(){const{value:f}=d;if(!f)return null;const{listElRef:p}=f;return p}function h(){const{value:f}=d;if(!f)return null;const{itemsElRef:p}=f;return p}return{mergedTheme:e,mergedClsPrefix:s,scrollerInstRef:o,vlInstRef:d,syncVLScroller:l,scrollContainer:n,scrollContent:h}},render(){const{mergedTheme:e,mergedClsPrefix:s,virtualScroll:o,syncVLScroller:d}=this;return t(He,null,t(kt,{ref:"scrollerInstRef",theme:e.peers.Scrollbar,themeOverrides:e.peerOverrides.Scrollbar,container:o?this.scrollContainer:void 0,content:o?this.scrollContent:void 0},{default:()=>o?t(zt,{ref:"vlInstRef",style:{height:"100%"},class:`${s}-transfer-list-content`,items:this.options,itemSize:this.itemSize,showScrollbar:!1,onResize:d,onScroll:d,keyField:"value"},{default:({item:l})=>{const{source:n,disabled:h}=this;return t(ie,{source:n,key:l.value,value:l.value,disabled:l.disabled||h,label:l.label})}}):t("div",{class:`${s}-transfer-list-content`},t(qe,{name:"item",appear:this.isMounted,css:!this.isInputing},{default:()=>{const{source:l,disabled:n}=this;return this.options.map(h=>t(ie,{source:l,key:h.value,value:h.value,disabled:h.disabled||n,label:h.label}))}}))}),t(Ae,{name:"fade-in-transition",appear:this.isMounted,css:!this.isInputing},{default:()=>this.options.length?null:t(xt,{theme:e.peers.Empty,themeOverrides:e.peerOverrides.Empty})}))}}),ne=B({name:"TransferFilter",props:{value:String,placeholder:String,disabled:Boolean,onFocus:{type:Function,required:!0},onBlur:{type:Function,required:!0},onUpdateValue:{type:Function,required:!0}},setup(){const{mergedThemeRef:e,mergedClsPrefixRef:s}=$(_);return{mergedClsPrefix:s,mergedTheme:e}},render(){const{mergedTheme:e,mergedClsPrefix:s}=this;return t("div",{class:`${s}-transfer-filter`},t(yt,{value:this.value,onUpdateValue:this.onUpdateValue,disabled:this.disabled,theme:e.peers.Input,themeOverrides:e.peerOverrides.Input,clearable:!0,size:"small",placeholder:this.placeholder,onFocus:this.onFocus,onBlur:this.onBlur},{"clear-icon-placeholder":()=>t(Z,{clsPrefix:s,class:`${s}-transfer-icon`},{default:()=>t(It,null)})}))}});function _t(e,s){const o=V(e.defaultValue),d=Xe(e,"value"),l=St(d,o),n=R(()=>{const u=new Map;return(e.options||[]).forEach(k=>u.set(k.value,k)),u}),h=R(()=>new Set(l.value||[])),f=R(()=>e.options.filter(u=>!h.value.has(u.value))),p=R(()=>{const u=n.value;return(l.value||[]).map(k=>u.get(k))}),i=V(""),a=V(""),r=R(()=>{if(!e.filterable)return f.value;const{filter:u}=e;return f.value.filter(k=>u(i.value,k,"source"))}),v=R(()=>{if(!e.filterable)return p.value;const{filter:u}=e;return p.value.filter(k=>u(a.value,k,"target"))}),b=R(()=>new Set(r.value.filter(u=>!u.disabled).map(u=>u.value))),g=R(()=>new Set(v.value.filter(u=>!u.disabled).map(u=>u.value))),c=V([]),m=V([]),z=R(()=>{const u=c.value.filter(I=>b.value.has(I)).length,k=b.value.size;return k===0?{checked:!1,indeterminate:!1,disabled:!0}:u===0?{checked:!1,indeterminate:!1}:u===k?{checked:!0,indeterminate:!1}:{checked:!1,indeterminate:!0}}),T=R(()=>{const u=m.value.filter(I=>g.value.has(I)).length,k=g.value.size;return k===0?{checked:!1,indeterminate:!1,disabled:!0}:u===0?{checked:!1,indeterminate:!1}:u===k?{checked:!0,indeterminate:!1}:{checked:!1,indeterminate:!0}}),D=M(()=>s.value?!0:m.value.length===0),E=M(()=>s.value?!0:c.value.length===0),U=V(!1);function A(){U.value=!0}function q(){U.value=!1}function H(u){i.value=u!=null?u:""}function X(u){a.value=u!=null?u:""}return{uncontrolledValue:o,mergedValue:l,avlSrcValueSet:b,avlTgtValueSet:g,tgtOpts:p,srcOpts:f,filteredSrcOpts:r,filteredTgtOpts:v,srcCheckedValues:c,tgtCheckedValues:m,srcCheckedStatus:z,tgtCheckedStatus:T,srcPattern:i,tgtPattern:a,isInputing:U,fromButtonDisabled:D,toButtonDisabled:E,handleInputFocus:A,handleInputBlur:q,handleTgtFilterUpdateValue:X,handleSrcFilterUpdateValue:H}}const jt=y([y("@keyframes transfer-slide-in-from-left",`
 0% {
 transform: translateX(-150%);
 }
 100% {
 transform: translateX(0);
 }
 `),y("@keyframes transfer-slide-out-to-right",`
 0% {
 transform: translateX(0);
 }
 100% {
 transform: translateX(150%);
 }
 `),y("@keyframes transfer-slide-in-from-right",`
 0% {
 transform: translateX(150%);
 }
 100% {
 transform: translateX(0);
 }
 `),y("@keyframes transfer-slide-out-to-left",`
 0% {
 transform: translateX(0);
 }
 100% {
 transform: translateX(-150%);
 }
 `),y("@keyframes transfer-height-collapse",`
 0% {
 max-height: var(--n-item-height);
 }
 100% {
 max-height: 0;
 }
 `),y("@keyframes transfer-height-expand",`
 0% {
 max-height: 0;
 }
 100% {
 max-height: var(--n-item-height);
 }
 `)]);var Lt=y([S("transfer",`
 display: flex;
 width: var(--n-width);
 font-size: var(--n-font-size);
 height: 240px;
 display: flex;
 flex-wrap: nowrap;
 `,[S("transfer-icon",`
 color: var(--n-icon-color);
 transition: color .3s var(--n-bezier);
 `),N("disabled",[S("transfer-icon",{color:"var(--n-icon-color-disabled)"})]),S("transfer-list",`
 height: inherit;
 display: flex;
 flex-direction: column;
 background-clip: padding-box;
 width: calc(50% - 36px);
 position: relative;
 transition: background-color .3s var(--n-bezier);
 border-radius: var(--n-border-radius);
 background-color: var(--n-list-color);
 `,[O("border",`
 border: 1px solid var(--n-border-color);
 transition: border-color .3s var(--n-bezier);
 pointer-events: none;
 border-radius: inherit;
 position: absolute;
 left: 0;
 right: 0;
 top: 0;
 bottom: 0;
 `),S("transfer-list-header",`
 height: calc(var(--n-item-height) + 4px);
 box-sizing: border-box;
 display: flex;
 align-items: center;
 background-clip: padding-box;
 border-radius: inherit;
 border-bottom-left-radius: 0;
 border-bottom-right-radius: 0;
 background-color: var(--n-header-color);
 transition:
 border-color .3s var(--n-bezier),
 background-color .3s var(--n-bezier);
 `,[O("checkbox",`
 display: flex;
 align-items: center;
 position: relative;
 padding: 0 9px 0 14px;
 `),O("header",`
 flex: 1;
 line-height: 1;
 font-weight: var(--n-header-font-weight);
 transition: color .3s var(--n-bezier);
 color: var(--n-header-text-color);
 `,[N("disabled",{color:"var(--n-header-text-color-disabled)"})]),O("extra",`
 transition: color .3s var(--n-bezier);
 font-size: var(--n-extra-font-size);
 justify-self: flex-end;
 margin-right: 14px;
 white-space: nowrap;
 color: var(--n-header-extra-text-color);
 `)]),S("transfer-list-body",`
 flex-basis: 0;
 flex-grow: 1;
 box-sizing: border-box;
 position: relative;
 display: flex;
 flex-direction: column;
 border-radius: inherit;
 border-top-left-radius: 0;
 border-top-right-radius: 0;
 `,[S("transfer-filter",`
 padding: 0 8px 8px 8px;
 box-sizing: border-box;
 background-color: var(--n-header-color);
 transition:
 border-color .3s var(--n-bezier),
 background-color .3s var(--n-bezier);
 border-bottom: 1px solid var(--n-filter-divider-color);
 `),S("transfer-list-flex-container",`
 flex: 1;
 position: relative;
 `,[S("scrollbar",`
 position: absolute;
 left: 0;
 right: 0;
 top: 0;
 bottom: 0;
 height: unset;
 `,[S("scrollbar-content",{width:"100%"})]),S("empty",`
 position: absolute;
 left: 50%;
 top: 50%;
 transform: translateY(-50%) translateX(-50%);
 `,[Rt()]),S("transfer-list-content",`
 padding: 0;
 margin: 0;
 position: relative;
 `,[N("transition-disabled",[S("transfer-list-item",{animation:"none !important"})]),S("transfer-list-item",`
 height: var(--n-item-height);
 max-height: var(--n-item-height);
 transition:
 background-color .3s var(--n-bezier),
 color .3s var(--n-bezier);
 position: relative;
 cursor: pointer;
 display: flex;
 align-items: center;
 color: var(--n-item-text-color);
 `,[Ke("disabled",[y("&:hover",{backgroundColor:"var(--n-item-color-pending)"})]),O("extra",`
 text-overflow: ellipsis;
 overflow: hidden;
 white-space: nowrap;
 padding-right: 4px;
 `),O("checkbox",`
 display: flex;
 align-items: center;
 position: relative;
 padding: 0 9px 0 14px;
 `),N("disabled",`
 cursor: not-allowed
 background-color: #0000;
 color: var(--n-item-text-color-disabled);
 `),N("source",{animationFillMode:"forwards"},[y("&.item-enter-active",`
 transform: translateX(150%);
 animation-duration: .25s, .25s;
 animation-timing-function: var(--n-bezier), var(--n-bezier-ease-out);
 animation-delay: 0s, .25s;
 animation-name: transfer-height-expand, transfer-slide-in-from-right;
 `),y("&.item-leave-active",`
 transform: translateX(-150%);
 animation-duration: .25s, .25s;
 animation-timing-function: var(--n-bezier), var(--n-bezier-ease-in);
 animation-delay: .25s, 0s;
 animation-name: transfer-height-collapse, transfer-slide-out-to-right;
 `)]),N("target",{animationFillMode:"forwards"},[y("&.item-enter-active",`
 transform: translateX(-150%);
 animation-duration: .25s, .25s;
 animation-timing-function: var(--n-bezier), var(--n-bezier-ease-out);
 animation-delay: 0s, .25s;
 animation-name: transfer-height-expand, transfer-slide-in-from-left;
 `),y("&.item-leave-active",`
 transform: translateX(150%);
 animation-duration: .25s, .25s;
 animation-timing-function: var(--n-bezier), var(--n-bezier-ease-in);
 animation-delay: .25s, 0s;
 animation-name: transfer-height-collapse, transfer-slide-out-to-left;
 `)])])])])])]),S("transfer-gap",{width:"72px",display:"flex",alignItems:"center",justifyContent:"center",flexDirection:"column"}),S("button",[y("&:first-child",{marginBottom:"12px"})])]),jt]);const Mt=Object.assign(Object.assign({},le.props),{value:Array,defaultValue:{type:Array,default:null},options:{type:Array,default:()=>[]},disabled:{type:Boolean,default:void 0},virtualScroll:Boolean,sourceTitle:String,targetTitle:String,filterable:Boolean,sourceFilterPlaceholder:String,targetFilterPlaceholder:String,filter:{type:Function,default:(e,s)=>e?~(""+s.label).toLowerCase().indexOf((""+e).toLowerCase()):!0},size:String,"onUpdate:value":[Function,Array],onUpdateValue:[Function,Array],onChange:{type:[Function,Array],validator:()=>!0,default:void 0}});var j=B({name:"Transfer",props:Mt,setup(e){const{mergedClsPrefixRef:s}=We(e),o=le("Transfer","-transfer",Lt,Ut,e,s),d=Tt(e),{mergedSizeRef:l,mergedDisabledRef:n}=d,h=R(()=>{const{value:C}=l,{self:{[G("itemHeight",C)]:x}}=o.value;return wt(x)}),{uncontrolledValue:f,mergedValue:p,avlSrcValueSet:i,avlTgtValueSet:a,tgtOpts:r,srcOpts:v,filteredSrcOpts:b,filteredTgtOpts:g,srcCheckedValues:c,tgtCheckedValues:m,srcCheckedStatus:z,tgtCheckedStatus:T,srcPattern:D,tgtPattern:E,isInputing:U,fromButtonDisabled:A,toButtonDisabled:q,handleInputFocus:H,handleInputBlur:X,handleTgtFilterUpdateValue:u,handleSrcFilterUpdateValue:k}=_t(e,n);function I(C){const{onUpdateValue:x,"onUpdate:value":w,onChange:F}=e,{nTriggerFormInput:K,nTriggerFormChange:W}=d;x&&Y(x,C),w&&Y(w,C),F&&Y(F,C),f.value=C,K(),W()}function ce(C){const{value:{checked:x,indeterminate:w}}=z;w||x?c.value=[]:c.value=Array.from(i.value)}function de(){const{value:{checked:C,indeterminate:x}}=T;x||C?m.value=[]:m.value=Array.from(a.value)}function fe(C,x){if(C)m.value.push(x);else{const w=m.value.findIndex(F=>F===x);~w&&m.value.splice(w,1)}}function he(C,x){if(C)c.value.push(x);else{const w=c.value.findIndex(F=>F===x);~w&&c.value.splice(w,1)}}function me(){I(c.value.concat(p.value||[])),c.value=[]}function ge(){const C=new Set(m.value);I((p.value||[]).filter(x=>!C.has(x))),m.value=[]}Ge(_,{mergedClsPrefixRef:s,mergedSizeRef:l,disabledRef:n,mergedThemeRef:o,srcCheckedValuesRef:c,tgtCheckedValuesRef:m,srcOptsRef:v,tgtOptsRef:r,srcCheckedStatusRef:z,tgtCheckedStatusRef:T,handleSrcCheckboxClick:he,handleTgtCheckboxClick:fe});const{localeRef:pe}=Pt("Transfer");return{locale:pe,mergedClsPrefix:s,mergedDisabled:n,itemSize:h,isMounted:Ye(),isInputing:U,mergedTheme:o,filteredSrcOpts:b,filteredTgtOpts:g,srcPattern:D,tgtPattern:E,toButtonDisabled:q,fromButtonDisabled:A,handleSrcHeaderCheck:ce,handleTgtHeaderCheck:de,handleToSrcClick:ge,handleToTgtClick:me,handleInputFocus:H,handleInputBlur:X,handleTgtFilterUpdateValue:u,handleSrcFilterUpdateValue:k,cssVars:R(()=>{const{value:C}=l,{common:{cubicBezierEaseInOut:x,cubicBezierEaseIn:w,cubicBezierEaseOut:F},self:{width:K,borderRadius:W,borderColor:ve,listColor:be,headerColor:Ce,titleTextColor:xe,titleTextColorDisabled:ze,extraTextColor:ke,filterDividerColor:Se,itemTextColor:ye,itemColorPending:Re,itemTextColorDisabled:Te,extraFontSize:we,titleFontWeight:Pe,iconColor:Fe,iconColorDisabled:Ve,[G("fontSize",C)]:Be,[G("itemHeight",C)]:De}}=o.value;return{"--n-bezier":x,"--n-bezier-ease-in":w,"--n-bezier-ease-out":F,"--n-border-color":ve,"--n-border-radius":W,"--n-extra-font-size":we,"--n-filter-divider-color":Se,"--n-font-size":Be,"--n-header-color":Ce,"--n-header-extra-text-color":ke,"--n-header-font-weight":Pe,"--n-header-text-color":xe,"--n-header-text-color-disabled":ze,"--n-item-color-pending":Re,"--n-item-height":De,"--n-item-text-color":ye,"--n-item-text-color-disabled":Te,"--n-list-color":be,"--n-width":K,"--n-icon-color":Fe,"--n-icon-color-disabled":Ve}})}},render(){const{mergedClsPrefix:e}=this;return t("div",{class:[`${e}-transfer`,this.mergedDisabled&&`${e}-transfer--disabled`,this.filterable&&`${e}-transfer--filterable`],style:this.cssVars},t("div",{class:`${e}-transfer-list`},t(ae,{source:!0,onChange:this.handleSrcHeaderCheck,title:this.sourceTitle||this.locale.sourceTitle}),t("div",{class:`${e}-transfer-list-body`},this.filterable?t(ne,{onUpdateValue:this.handleSrcFilterUpdateValue,value:this.srcPattern,disabled:this.mergedDisabled,placeholder:this.sourceFilterPlaceholder,onFocus:this.handleInputFocus,onBlur:this.handleInputBlur}):null,t("div",{class:`${e}-transfer-list-flex-container`},t(se,{source:!0,options:this.filteredSrcOpts,disabled:this.mergedDisabled,virtualScroll:this.virtualScroll,isMounted:this.isMounted,isInputing:this.isInputing,itemSize:this.itemSize}))),t("div",{class:`${e}-transfer-list__border`})),t("div",{class:`${e}-transfer-gap`},t(ee,{disabled:this.toButtonDisabled||this.mergedDisabled,theme:this.mergedTheme.peers.Button,themeOverrides:this.mergedTheme.peerOverrides.Button,onClick:this.handleToTgtClick},{icon:()=>t(Z,{clsPrefix:e},{default:()=>t(Ft,null)})}),t(ee,{disabled:this.fromButtonDisabled||this.mergedDisabled,theme:this.mergedTheme.peers.Button,themeOverrides:this.mergedTheme.peerOverrides.Button,onClick:this.handleToSrcClick},{icon:()=>t(Z,{clsPrefix:e},{default:()=>t(Dt,null)})})),t("div",{class:`${e}-transfer-list`},t(ae,{onChange:this.handleTgtHeaderCheck,title:this.targetTitle||this.locale.targetTitle}),t("div",{class:`${e}-transfer-list-body`},this.filterable?t(ne,{onUpdateValue:this.handleTgtFilterUpdateValue,value:this.tgtPattern,disabled:this.mergedDisabled,placeholder:this.targetFilterPlaceholder,onFocus:this.handleInputFocus,onBlur:this.handleInputBlur}):null,t("div",{class:`${e}-transfer-list-flex-container`},t(se,{options:this.filteredTgtOpts,disabled:this.mergedDisabled,virtualScroll:this.virtualScroll,isMounted:this.isMounted,isInputing:this.isInputing,itemSize:this.itemSize}))),t("div",{class:`${e}-transfer-list__border`})))}});function $t(){const e=Ze({saving:!1,loading:!1,authorizedProjects:[],unauthorizedProjects:[],authorizedDatasources:[],unauthorizedDatasources:[],authorizedUdfs:[],unauthorizedUdfs:[],authorizedNamespaces:[],unauthorizedNamespaces:[],resourceType:"file",fileResources:[],udfResources:[],authorizedFileResources:[],authorizedUdfResources:[]}),s=async i=>{if(e.loading)return;e.loading=!0;const a=await Promise.all([at({userId:i}),it({userId:i})]);e.loading=!1,e.authorizedProjects=a[0].map(r=>r.id),e.unauthorizedProjects=[...a[0],...a[1]].map(r=>({label:r.name,value:r.id}))},o=async i=>{if(e.loading)return;e.loading=!0;const a=await Promise.all([st({userId:i}),nt({userId:i})]);e.loading=!1,e.authorizedDatasources=a[0].map(r=>r.id),e.unauthorizedDatasources=[...a[0],...a[1]].map(r=>({label:r.name,value:r.id}))},d=async i=>{if(e.loading)return;e.loading=!0;const a=await Promise.all([ot({userId:i}),lt({userId:i})]);e.loading=!1,e.authorizedUdfs=a[0].map(r=>r.id),e.unauthorizedUdfs=[...a[0],...a[1]].map(r=>({label:r.funcName,value:r.id}))},l=async i=>{if(e.loading)return;e.loading=!0;const a=await Promise.all([ut({userId:i}),ct({userId:i})]);e.loading=!1,Je.removeUselessChildren(a[0]);const r=[],v=[];a[0].forEach(c=>{c.type==="FILE"?v.push(c):r.push(c)});const b=[],g=[];a[1].forEach(c=>{c.type==="FILE"?g.push(c.id):b.push(c.id)}),e.fileResources=v,e.udfResources=r,e.authorizedFileResources=g,e.authorizedUdfResources=b},n=async i=>{if(e.loading)return;e.loading=!0;const a=await Promise.all([dt({userId:i}),ft({userId:i})]);e.loading=!1,e.authorizedNamespaces=a[0].map(r=>r.id),e.unauthorizedNamespaces=[...a[0],...a[1]].map(r=>({label:r.namespace,value:r.id}))},h=(i,a)=>{i==="authorize_project"&&s(a),i==="authorize_datasource"&&o(a),i==="authorize_udf"&&d(a),i==="authorize_resource"&&l(a),i==="authorize_namespace"&&n(a)},f=(i,a)=>{let r=[];if(i.length===0)return a&&r.unshift(i),r;const v=(b,g)=>{for(let c=0,m=b.length;c<m;c++){const z=b[c];if(z.id===g){r.unshift(z),v(i,z.pid);break}else z.children&&v(z.children,g)}return r};return r=v(i,a),r};return{state:e,onInit:h,onSave:async(i,a)=>{if(e.saving)return!1;if(e.saving=!0,i==="authorize_project"&&await ht({userId:a,projectIds:e.authorizedProjects.join(",")}),i==="authorize_datasource"&&await mt({userId:a,datasourceIds:e.authorizedDatasources.join(",")}),i==="authorize_udf"&&await gt({userId:a,udfIds:e.authorizedUdfs.join(",")}),i==="authorize_resource"){let r=[];const v=[];e.authorizedFileResources.forEach(m=>{e.fileResources.forEach(z=>{const T=[];T[0]=z,f(T,m).length>0&&(r=f(T,m).map(D=>D.id),v.push(r.join("-")))})});let b=[];const g=[];e.authorizedUdfResources.forEach(m=>{e.udfResources.forEach(z=>{const T=[];T[0]=z,f(T,m).length>0&&(b=f(T,m).map(D=>D.id),g.push(b.join("-")))})});const c=v.concat(g);await pt({userId:a,resourceIds:c.join(",")})}return i==="authorize_namespace"&&await vt({userId:a,namespaceIds:e.authorizedNamespaces.join(",")}),e.saving=!1,!0}}}const Et="_transfer_qblzb_17";var L={transfer:Et};function oe(e){return typeof e=="function"||Object.prototype.toString.call(e)==="[object Object]"&&!rt(e)}const At={show:{type:Boolean,default:!1},userId:{type:Number,default:0},type:{type:String,default:"auth_project"}},Fr=B({name:"authorize-project-modal",props:At,emits:["cancel"],setup(e,s){const{t:o}=Qe(),{state:d,onInit:l,onSave:n}=$t(),h=()=>{s.emit("cancel")},f=async()=>{await n(e.type,e.userId)&&h()};return et(()=>e.show,()=>{e.show&&l(e.type,e.userId)}),{t:o,...tt(d),onCancel:h,onConfirm:f}},render(e){let s,o;const{t:d}=this,{type:l}=e;return P(bt,{show:this.show,title:d(`security.user.${l}`),onCancel:this.onCancel,confirmLoading:this.loading,onConfirm:this.onConfirm,confirmClassName:"btn-submit",cancelClassName:"btn-cancel"},{default:()=>[l==="authorize_project"&&P(j,{virtualScroll:!0,options:this.unauthorizedProjects,filterable:!0,value:this.authorizedProjects,"onUpdate:value":n=>this.authorizedProjects=n,class:L.transfer},null),l==="authorize_datasource"&&P(j,{virtualScroll:!0,options:this.unauthorizedDatasources,filterable:!0,value:this.authorizedDatasources,"onUpdate:value":n=>this.authorizedDatasources=n,class:L.transfer},null),l==="authorize_udf"&&P(j,{virtualScroll:!0,options:this.unauthorizedUdfs,filterable:!0,value:this.authorizedUdfs,"onUpdate:value":n=>this.authorizedUdfs=n,class:L.transfer},null),l==="authorize_resource"&&P(Vt,{vertical:!0},{default:()=>[P(Bt,{value:this.resourceType,"onUpdate:value":n=>this.resourceType=n},{default:()=>[P(te,{key:"file",value:"file"},oe(s=d("security.user.file_resource"))?s:{default:()=>[s]}),P(te,{key:"udf",value:"udf"},oe(o=d("security.user.udf_resource"))?o:{default:()=>[o]})]}),J(P(re,{filterable:!0,multiple:!0,cascade:!0,checkable:!0,checkStrategy:"child","key-field":"id","label-field":"fullName",options:this.fileResources,value:this.authorizedFileResources,"onUpdate:value":n=>this.authorizedFileResources=n},null),[[Q,this.resourceType==="file"]]),J(P(re,{filterable:!0,multiple:!0,cascade:!0,checkable:!0,checkStrategy:"child","key-field":"id","label-field":"fullName",options:this.udfResources,value:this.authorizedUdfResources,"onUpdate:value":n=>this.authorizedUdfResources=n},null),[[Q,this.resourceType==="udf"]])]}),l==="authorize_namespace"&&P(j,{virtualScroll:!0,options:this.unauthorizedNamespaces,filterable:!0,value:this.authorizedNamespaces,"onUpdate:value":n=>this.authorizedNamespaces=n,class:L.transfer},null)]})}});export{Fr as AuthorizeModal,Fr as default};
