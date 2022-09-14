import{p as m,q as l,v as u,d as b,z,A as f,bC as C,j as d,M as S,D as x,h as o,a4 as k,T as $}from"./index.c5429249.js";import{f as T}from"./fade-in.cssr.9da325c6.js";import{p as w}from"./index.16077d24.js";import{u as R}from"./use-compitable.b0459e69.js";var B=m([m("@keyframes spin-rotate",`
 from {
 transform: rotate(0);
 }
 to {
 transform: rotate(360deg);
 }
 `),l("spin-container",{position:"relative"},[l("spin-body",`
 position: absolute;
 top: 50%;
 left: 50%;
 transform: translateX(-50%) translateY(-50%);
 `,[T()])]),l("spin-body",`
 display: inline-flex;
 align-items: center;
 justify-content: center;
 flex-direction: column;
 `),l("spin",`
 display: inline-flex;
 height: var(--n-size);
 width: var(--n-size);
 font-size: var(--n-size);
 color: var(--n-color);
 `,[u("rotate",`
 animation: spin-rotate 2s linear infinite;
 `)]),l("spin-description",`
 display: inline-block;
 font-size: var(--n-font-size);
 color: var(--n-text-color);
 transition: color .3s var(--n-bezier);
 margin-top: 8px;
 `),l("spin-content",`
 opacity: 1;
 transition: opacity .3s var(--n-bezier);
 pointer-events: all;
 `,[u("spinning",`
 user-select: none;
 pointer-events: none;
 opacity: var(--n-opacity-spinning);
 `)])]);const N={small:20,medium:18,large:16},P=Object.assign(Object.assign({},f.props),{description:String,stroke:String,size:{type:[String,Number],default:"medium"},show:{type:Boolean,default:!0},strokeWidth:Number,rotate:{type:Boolean,default:!0},spinning:{type:Boolean,validator:()=>!0,default:void 0}});var D=b({name:"Spin",props:P,setup(i){const{mergedClsPrefixRef:a,inlineThemeDisabled:e}=z(i),s=f("Spin","-spin",B,C,i,a),c=d(()=>{const{size:n}=i,{common:{cubicBezierEaseInOut:r},self:p}=s.value,{opacitySpinning:h,color:v,textColor:y}=p,g=typeof n=="number"?w(n):p[S("size",n)];return{"--n-bezier":r,"--n-opacity-spinning":h,"--n-size":g,"--n-color":v,"--n-text-color":y}}),t=e?x("spin",d(()=>{const{size:n}=i;return typeof n=="number"?String(n):n[0]}),c,i):void 0;return{mergedClsPrefix:a,compitableShow:R(i,["spinning","show"]),mergedStrokeWidth:d(()=>{const{strokeWidth:n}=i;if(n!==void 0)return n;const{size:r}=i;return N[typeof r=="number"?"medium":r]}),cssVars:e?void 0:c,themeClass:t==null?void 0:t.themeClass,onRender:t==null?void 0:t.onRender}},render(){var i,a;const{$slots:e,mergedClsPrefix:s,description:c}=this,t=e.icon&&this.rotate,n=(c||e.description)&&o("div",{class:`${s}-spin-description`},c||((i=e.description)===null||i===void 0?void 0:i.call(e))),r=e.icon?o("div",{class:[`${s}-spin-body`,this.themeClass]},o("div",{class:[`${s}-spin`,t&&`${s}-spin--rotate`],style:e.default?"":this.cssVars},e.icon()),n):o("div",{class:[`${s}-spin-body`,this.themeClass]},o(k,{clsPrefix:s,style:e.default?"":this.cssVars,stroke:this.stroke,"stroke-width":this.mergedStrokeWidth,class:`${s}-spin`}),n);return(a=this.onRender)===null||a===void 0||a.call(this),e.default?o("div",{class:[`${s}-spin-container`,this.themeClass],style:this.cssVars},o("div",{class:[`${s}-spin-content`,this.compitableShow&&`${s}-spin-content--spinning`]},e),o($,{name:"fade-in-transition"},{default:()=>this.compitableShow?r:null})):r}});export{D as N};
