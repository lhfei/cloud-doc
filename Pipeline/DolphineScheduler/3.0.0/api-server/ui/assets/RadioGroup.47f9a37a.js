import{k as Z,z as E,a as k,n as ee,B as V,R as T,L as oe,q as F,x as m,v as C,p as I,y as _,d as te,A,C as re,j as U,D as ne,h as P,bi as ae,M as D}from"./index.c5429249.js";import{u as $}from"./Button.c43a24dc.js";import{u as G}from"./Scrollbar.12b40993.js";import{c as w}from"./resolve-slot.7c241306.js";import{u as ie}from"./use-rtl.c78ffbd8.js";import{f as de}from"./flatten.a7868693.js";import{g as se}from"./get-slot.c85d6606.js";const ue={name:String,value:{type:[String,Number],default:"on"},checked:{type:Boolean,default:void 0},defaultChecked:Boolean,disabled:{type:Boolean,default:void 0},label:String,size:String,onUpdateChecked:[Function,Array],"onUpdate:checked":[Function,Array],checkedValue:{type:Boolean,validator:()=>(oe("radio","`checked-value` is deprecated, please use `checked` instead."),!0),default:void 0}},j=Z("n-radio-group");function le(e){const d=$(e,{mergedSize(t){const{size:a}=e;if(a!==void 0)return a;if(o){const{mergedSizeRef:{value:u}}=o;if(u!==void 0)return u}return t?t.mergedSize.value:"medium"},mergedDisabled(t){return!!(e.disabled||o!=null&&o.disabledRef.value||t!=null&&t.disabled.value)}}),{mergedSizeRef:r,mergedDisabledRef:l}=d,n=k(null),h=k(null),o=ee(j,null),s=k(e.defaultChecked),b=V(e,"checked"),v=G(b,s),g=T(()=>o?o.valueRef.value===e.value:v.value),R=T(()=>{const{name:t}=e;if(t!==void 0)return t;if(o)return o.nameRef.value}),f=k(!1);function x(){if(o){const{doUpdateValue:t}=o,{value:a}=e;w(t,a)}else{const{onUpdateChecked:t,"onUpdate:checked":a}=e,{nTriggerFormInput:u,nTriggerFormChange:i}=d;t&&w(t,!0),a&&w(a,!0),u(),i(),s.value=!0}}function p(){l.value||g.value||x()}function y(){p()}function z(){f.value=!1}function S(){f.value=!0}return{mergedClsPrefix:o?o.mergedClsPrefixRef:E(e).mergedClsPrefixRef,inputRef:n,labelRef:h,mergedName:R,mergedDisabled:l,uncontrolledChecked:s,renderSafeChecked:g,focus:f,mergedSize:r,handleRadioInputChange:y,handleRadioInputBlur:z,handleRadioInputFocus:S}}le.props=ue;var ce=F("radio-group",`
 display: inline-block;
 font-size: var(--n-font-size);
`,[m("splitor",`
 display: inline-block;
 vertical-align: bottom;
 width: 1px;
 transition:
 background-color .3s var(--n-bezier),
 opacity .3s var(--n-bezier);
 background: var(--n-button-border-color);
 `,[C("checked",{backgroundColor:"var(--n-button-border-color-active)"}),C("disabled",{opacity:"var(--n-opacity-disabled)"})]),C("button-group",`
 white-space: nowrap;
 height: var(--n-height);
 line-height: var(--n-height);
 `,[F("radio-button",{height:"var(--n-height)",lineHeight:"var(--n-height)"}),m("splitor",{height:"var(--n-height)"})]),F("radio-button",`
 vertical-align: bottom;
 outline: none;
 position: relative;
 user-select: none;
 display: inline-block;
 box-sizing: border-box;
 padding-left: 14px;
 padding-right: 14px;
 white-space: nowrap;
 transition:
 background-color .3s var(--n-bezier),
 opacity .3s var(--n-bezier),
 border-color .3s var(--n-bezier),
 color .3s var(--n-bezier);
 color: var(--n-button-text-color);
 border-top: 1px solid var(--n-button-border-color);
 border-bottom: 1px solid var(--n-button-border-color);
 `,[F("radio-input",`
 position: absolute;
 border: 0;
 border-radius: inherit;
 left: 0;
 right: 0;
 top: 0;
 bottom: 0;
 opacity: 0;
 z-index: 1;
 `),m("state-border",`
 z-index: 1;
 pointer-events: none;
 position: absolute;
 box-shadow: var(--n-button-box-shadow);
 transition: box-shadow .3s var(--n-bezier);
 left: -1px;
 bottom: -1px;
 right: -1px;
 top: -1px;
 `),I("&:first-child",`
 border-top-left-radius: var(--n-button-border-radius);
 border-bottom-left-radius: var(--n-button-border-radius);
 border-left: 1px solid var(--n-button-border-color);
 `,[m("state-border",`
 border-top-left-radius: var(--n-button-border-radius);
 border-bottom-left-radius: var(--n-button-border-radius);
 `)]),I("&:last-child",`
 border-top-right-radius: var(--n-button-border-radius);
 border-bottom-right-radius: var(--n-button-border-radius);
 border-right: 1px solid var(--n-button-border-color);
 `,[m("state-border",`
 border-top-right-radius: var(--n-button-border-radius);
 border-bottom-right-radius: var(--n-button-border-radius);
 `)]),_("disabled",`
 cursor: pointer;
 `,[I("&:hover",[m("state-border",`
 transition: box-shadow .3s var(--n-bezier);
 box-shadow: var(--n-button-box-shadow-hover);
 `),_("checked",{color:"var(--n-button-text-color-hover)"})]),C("focus",[I("&:not(:active)",[m("state-border",{boxShadow:"var(--n-button-box-shadow-focus)"})])])]),C("checked",`
 background: var(--n-button-color-active);
 color: var(--n-button-text-color-active);
 border-color: var(--n-button-border-color-active);
 `),C("disabled",`
 cursor: not-allowed;
 opacity: var(--n-opacity-disabled);
 `)])]);function be(e,d,r){var l;const n=[];let h=!1;for(let o=0;o<e.length;++o){const s=e[o],b=(l=s.type)===null||l===void 0?void 0:l.name;b==="RadioButton"&&(h=!0);const v=s.props;if(b!=="RadioButton"){n.push(s);continue}if(o===0)n.push(s);else{const g=n[n.length-1].props,R=d===g.value,f=g.disabled,x=d===v.value,p=v.disabled,y=(R?2:0)+(f?0:1),z=(x?2:0)+(p?0:1),S={[`${r}-radio-group__splitor--disabled`]:f,[`${r}-radio-group__splitor--checked`]:R},t={[`${r}-radio-group__splitor--disabled`]:p,[`${r}-radio-group__splitor--checked`]:x},a=y<z?t:S;n.push(P("div",{class:[`${r}-radio-group__splitor`,a]}),s)}}return{children:n,isButtonGroup:h}}const fe=Object.assign(Object.assign({},A.props),{name:String,value:[String,Number],defaultValue:{type:[String,Number],default:null},size:String,disabled:{type:Boolean,default:void 0},"onUpdate:value":[Function,Array],onUpdateValue:[Function,Array]});var Ce=te({name:"RadioGroup",props:fe,setup(e){const d=k(null),{mergedSizeRef:r,mergedDisabledRef:l,nTriggerFormChange:n,nTriggerFormInput:h,nTriggerFormBlur:o,nTriggerFormFocus:s}=$(e),{mergedClsPrefixRef:b,inlineThemeDisabled:v,mergedRtlRef:g}=E(e),R=A("Radio","-radio-group",ce,ae,e,b),f=k(e.defaultValue),x=V(e,"value"),p=G(x,f);function y(i){const{onUpdateValue:c,"onUpdate:value":B}=e;c&&w(c,i),B&&w(B,i),f.value=i,n(),h()}function z(i){const{value:c}=d;!c||c.contains(i.relatedTarget)||s()}function S(i){const{value:c}=d;!c||c.contains(i.relatedTarget)||o()}re(j,{mergedClsPrefixRef:b,nameRef:V(e,"name"),valueRef:p,disabledRef:l,mergedSizeRef:r,doUpdateValue:y});const t=ie("Radio",g,b),a=U(()=>{const{value:i}=r,{common:{cubicBezierEaseInOut:c},self:{buttonBorderColor:B,buttonBorderColorActive:N,buttonBorderRadius:H,buttonBoxShadow:M,buttonBoxShadowFocus:K,buttonBoxShadowHover:O,buttonColorActive:L,buttonTextColor:q,buttonTextColorActive:J,buttonTextColorHover:Q,opacityDisabled:W,[D("buttonHeight",i)]:X,[D("fontSize",i)]:Y}}=R.value;return{"--n-font-size":Y,"--n-bezier":c,"--n-button-border-color":B,"--n-button-border-color-active":N,"--n-button-border-radius":H,"--n-button-box-shadow":M,"--n-button-box-shadow-focus":K,"--n-button-box-shadow-hover":O,"--n-button-color-active":L,"--n-button-text-color":q,"--n-button-text-color-hover":Q,"--n-button-text-color-active":J,"--n-height":X,"--n-opacity-disabled":W}}),u=v?ne("radio-group",U(()=>r.value[0]),a,e):void 0;return{selfElRef:d,rtlEnabled:t,mergedClsPrefix:b,mergedValue:p,handleFocusout:S,handleFocusin:z,cssVars:v?void 0:a,themeClass:u==null?void 0:u.themeClass,onRender:u==null?void 0:u.onRender}},render(){var e;const{mergedValue:d,mergedClsPrefix:r,handleFocusin:l,handleFocusout:n}=this,{children:h,isButtonGroup:o}=be(de(se(this)),d,r);return(e=this.onRender)===null||e===void 0||e.call(this),P("div",{onFocusin:l,onFocusout:n,ref:"selfElRef",class:[`${r}-radio-group`,this.rtlEnabled&&`${r}-radio-group--rtl`,this.themeClass,o&&`${r}-radio-group--button-group`],style:this.cssVars},h)}});export{Ce as N,le as s};