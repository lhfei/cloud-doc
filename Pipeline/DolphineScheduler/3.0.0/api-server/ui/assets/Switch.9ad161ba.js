import{aE as le,bo as se,av as de,q as M,x as t,a8 as P,p as T,v as l,y as A,d as ce,z as ue,A as L,a as D,B as he,j as _,D as be,h as i,a3 as fe,a4 as ve,M as v}from"./index.c5429249.js";import{u as ge}from"./Button.c43a24dc.js";import{u as me}from"./Scrollbar.12b40993.js";import{i as N,a as g,c as j}from"./resolve-slot.7c241306.js";import{p as W,d as s}from"./index.16077d24.js";const we=e=>{const{primaryColor:d,opacityDisabled:h,borderRadius:n,textColor3:r}=e,m="rgba(0, 0, 0, .14)";return Object.assign(Object.assign({},se),{iconColor:r,textColor:"white",loadingColor:d,opacityDisabled:h,railColor:m,railColorActive:d,buttonBoxShadow:"0 1px 4px 0 rgba(0, 0, 0, 0.3), inset 0 0 1px 0 rgba(0, 0, 0, 0.05)",buttonColor:"#FFF",railBorderRadiusSmall:n,railBorderRadiusMedium:n,railBorderRadiusLarge:n,buttonBorderRadiusSmall:n,buttonBorderRadiusMedium:n,buttonBorderRadiusLarge:n,boxShadowFocus:`0 0 0 2px ${de(d,{alpha:.2})}`})},pe={name:"Switch",common:le,self:we};var ye=pe,xe=M("switch",`
 height: var(--n-height);
 min-width: var(--n-width);
 vertical-align: middle;
 user-select: none;
 display: inline-flex;
 outline: none;
 justify-content: center;
 align-items: center;
`,[t("children-placeholder",`
 height: var(--n-rail-height);
 display: flex;
 flex-direction: column;
 overflow: hidden;
 pointer-events: none;
 visibility: hidden;
 `),t("rail-placeholder",`
 display: flex;
 flex-wrap: none;
 `),t("button-placeholder",`
 width: calc(1.75 * var(--n-rail-height));
 height: var(--n-rail-height);
 `),M("base-loading",`
 position: absolute;
 top: 50%;
 left: 50%;
 transform: translateX(-50%) translateY(-50%);
 font-size: calc(var(--n-button-width) - 4px);
 color: var(--n-loading-color);
 transition: color .3s var(--n-bezier);
 `,[P({left:"50%",top:"50%",originalTransform:"translateX(-50%) translateY(-50%)"})]),t("checked, unchecked",`
 transition: color .3s var(--n-bezier);
 color: var(--n-text-color);
 box-sizing: border-box;
 position: absolute;
 white-space: nowrap;
 top: 0;
 bottom: 0;
 display: flex;
 align-items: center;
 line-height: 1;
 `),t("checked",`
 right: 0;
 padding-right: calc(1.25 * var(--n-rail-height) - var(--n-offset));
 `),t("unchecked",`
 left: 0;
 justify-content: flex-end;
 padding-left: calc(1.25 * var(--n-rail-height) - var(--n-offset));
 `),T("&:focus",[t("rail",`
 box-shadow: var(--n-box-shadow-focus);
 `)]),l("round",[t("rail","border-radius: calc(var(--n-rail-height) / 2);",[t("button","border-radius: calc(var(--n-button-height) / 2);")])]),A("disabled",[A("icon",[l("rubber-band",[l("pressed",[t("rail",[t("button","max-width: var(--n-button-width-pressed);")])]),t("rail",[T("&:active",[t("button","max-width: var(--n-button-width-pressed);")])]),l("active",[l("pressed",[t("rail",[t("button","left: calc(100% - var(--n-offset) - var(--n-button-width-pressed));")])]),t("rail",[T("&:active",[t("button","left: calc(100% - var(--n-offset) - var(--n-button-width-pressed));")])])])])])]),l("active",[t("rail",[t("button","left: calc(100% - (var(--n-rail-height) + var(--n-button-width)) / 2)")])]),t("rail",`
 overflow: hidden;
 height: var(--n-rail-height);
 min-width: var(--n-rail-width);
 border-radius: var(--n-rail-border-radius);
 cursor: pointer;
 position: relative;
 transition:
 opacity .3s var(--n-bezier),
 background .3s var(--n-bezier),
 box-shadow .3s var(--n-bezier);
 background-color: var(--n-rail-color);
 `,[t("button-icon",`
 color: var(--n-icon-color);
 transition: color .3s var(--n-bezier);
 font-size: calc(var(--n-button-height) - 4px);
 position: absolute;
 left: 0;
 right: 0;
 top: 0;
 bottom: 0;
 display: flex;
 justify-content: center;
 align-items: center;
 line-height: 1;
 `,[P()]),t("button",`
 align-items: center; 
 top: var(--n-offset);
 left: var(--n-offset);
 height: var(--n-button-width);
 width: var(--n-button-width-pressed);
 max-width: var(--n-button-width);
 border-radius: var(--n-button-border-radius);
 background-color: var(--n-button-color);
 box-shadow: var(--n-button-box-shadow);
 box-sizing: border-box;
 cursor: inherit;
 content: "";
 position: absolute;
 transition:
 background-color .3s var(--n-bezier),
 left .3s var(--n-bezier),
 opacity .3s var(--n-bezier),
 max-width .3s var(--n-bezier),
 box-shadow .3s var(--n-bezier);
 `)]),l("active",[t("rail","background-color: var(--n-rail-color-active);")]),l("loading",[t("rail",`
 cursor: wait;
 `)]),l("disabled",[t("rail",`
 cursor: not-allowed;
 opacity: .5;
 `)])]);const ke=Object.assign(Object.assign({},L.props),{size:{type:String,default:"medium"},value:{type:[String,Number,Boolean],default:void 0},loading:Boolean,defaultValue:{type:[String,Number,Boolean],default:!1},disabled:{type:Boolean,default:void 0},round:{type:Boolean,default:!0},"onUpdate:value":[Function,Array],onUpdateValue:[Function,Array],checkedValue:{type:[String,Number,Boolean],default:!0},uncheckedValue:{type:[String,Number,Boolean],default:!1},railStyle:Function,rubberBand:{type:Boolean,default:!0},onChange:[Function,Array]});var _e=ce({name:"Switch",props:ke,setup(e){const{mergedClsPrefixRef:d,inlineThemeDisabled:h}=ue(e),n=L("Switch","-switch",xe,ye,e,d),r=ge(e),{mergedSizeRef:m,mergedDisabledRef:b}=r,y=D(e.defaultValue),C=he(e,"value"),f=me(C,y),x=_(()=>f.value===e.checkedValue),w=D(!1),o=D(!1),c=_(()=>{const{railStyle:a}=e;if(!!a)return a({focused:o.value,checked:x.value})});function u(a){const{"onUpdate:value":R,onChange:S,onUpdateValue:V}=e,{nTriggerFormInput:$,nTriggerFormChange:z}=r;R&&j(R,a),V&&j(V,a),S&&j(S,a),y.value=a,$(),z()}function O(){const{nTriggerFormFocus:a}=r;a()}function U(){const{nTriggerFormBlur:a}=r;a()}function H(){e.loading||b.value||(f.value!==e.checkedValue?u(e.checkedValue):u(e.uncheckedValue))}function E(){o.value=!0,O()}function I(){o.value=!1,U(),w.value=!1}function X(a){e.loading||b.value||a.key===" "&&(f.value!==e.checkedValue?u(e.checkedValue):u(e.uncheckedValue),w.value=!1)}function Y(a){e.loading||b.value||a.key===" "&&(a.preventDefault(),w.value=!0)}const K=_(()=>{const{value:a}=m,{self:{opacityDisabled:R,railColor:S,railColorActive:V,buttonBoxShadow:$,buttonColor:z,boxShadowFocus:q,loadingColor:G,textColor:J,iconColor:Q,[v("buttonHeight",a)]:k,[v("buttonWidth",a)]:Z,[v("buttonWidthPressed",a)]:ee,[v("railHeight",a)]:B,[v("railWidth",a)]:F,[v("railBorderRadius",a)]:te,[v("buttonBorderRadius",a)]:ae},common:{cubicBezierEaseInOut:oe}}=n.value,ie=W((s(B)-s(k))/2),ne=W(Math.max(s(B),s(k))),re=s(B)>s(k)?F:W(s(F)+s(k)-s(B));return{"--n-bezier":oe,"--n-button-border-radius":ae,"--n-button-box-shadow":$,"--n-button-color":z,"--n-button-width":Z,"--n-button-width-pressed":ee,"--n-button-height":k,"--n-height":ne,"--n-offset":ie,"--n-opacity-disabled":R,"--n-rail-border-radius":te,"--n-rail-color":S,"--n-rail-color-active":V,"--n-rail-height":B,"--n-rail-width":F,"--n-width":re,"--n-box-shadow-focus":q,"--n-loading-color":G,"--n-text-color":J,"--n-icon-color":Q}}),p=h?be("switch",_(()=>m.value[0]),K,e):void 0;return{handleClick:H,handleBlur:I,handleFocus:E,handleKeyup:X,handleKeydown:Y,mergedRailStyle:c,pressed:w,mergedClsPrefix:d,mergedValue:f,checked:x,mergedDisabled:b,cssVars:h?void 0:K,themeClass:p==null?void 0:p.themeClass,onRender:p==null?void 0:p.onRender}},render(){const{mergedClsPrefix:e,mergedDisabled:d,checked:h,mergedRailStyle:n,onRender:r,$slots:m}=this;r==null||r();const{checked:b,unchecked:y,icon:C,"checked-icon":f,"unchecked-icon":x}=m,w=!(N(C)&&N(f)&&N(x));return i("div",{role:"switch","aria-checked":h,class:[`${e}-switch`,this.themeClass,w&&`${e}-switch--icon`,h&&`${e}-switch--active`,d&&`${e}-switch--disabled`,this.round&&`${e}-switch--round`,this.loading&&`${e}-switch--loading`,this.pressed&&`${e}-switch--pressed`,this.rubberBand&&`${e}-switch--rubber-band`],tabindex:this.mergedDisabled?void 0:0,style:this.cssVars,onClick:this.handleClick,onFocus:this.handleFocus,onBlur:this.handleBlur,onKeyup:this.handleKeyup,onKeydown:this.handleKeydown},i("div",{class:`${e}-switch__rail`,"aria-hidden":"true",style:n},g(b,o=>g(y,c=>o||c?i("div",{"aria-hidden":!0,class:`${e}-switch__children-placeholder`},i("div",{class:`${e}-switch__rail-placeholder`},i("div",{class:`${e}-switch__button-placeholder`}),o),i("div",{class:`${e}-switch__rail-placeholder`},i("div",{class:`${e}-switch__button-placeholder`}),c)):null)),i("div",{class:`${e}-switch__button`},g(C,o=>g(f,c=>g(x,u=>i(fe,null,{default:()=>this.loading?i(ve,{key:"loading",clsPrefix:e,strokeWidth:20}):this.checked&&(c||o)?i("div",{class:`${e}-switch__button-icon`,key:c?"checked-icon":"icon"},c||o):!this.checked&&(u||o)?i("div",{class:`${e}-switch__button-icon`,key:u?"unchecked-icon":"icon"},u||o):null})))),g(b,o=>o&&i("div",{key:"checked",class:`${e}-switch__checked`},o)),g(y,o=>o&&i("div",{key:"unchecked",class:`${e}-switch__unchecked`},o)))))}});export{_e as N};
