import{p as B}from"./index.16077d24.js";import{k as q}from"./keysOf.963e6f6c.js";import{O,j as y,a as C,P as D,k as z,d as V,n as F,h as k,Q as U,z as X,R as G,o as Y,C as H,B as J,S as A,U as W}from"./index.c5429249.js";import{i as Z}from"./utils.3eee947a.js";import{i as K}from"./is-browser.d3e5def6.js";import{V as ee}from"./VResizeObserver.14b04bb7.js";import{f as te}from"./flatten.a7868693.js";import{g as se}from"./get-slot.c85d6606.js";import{b as re}from"./next-frame-once.da993024.js";function ne(e){if(typeof e=="number")return{"":e.toString()};const t={};return e.split(/ +/).forEach(i=>{if(i==="")return;const[n,r]=i.split(":");r===void 0?t[""]=n:t[n]=r}),t}function x(e,t){var i;if(e==null)return;const n=ne(e);if(t===void 0)return n[""];if(typeof t=="string")return(i=n[t])!==null&&i!==void 0?i:n[""];if(Array.isArray(t)){for(let r=t.length-1;r>=0;--r){const s=t[r];if(s in n)return n[s]}return n[""]}else{let r,s=-1;return Object.keys(n).forEach(l=>{const o=Number(l);!Number.isNaN(o)&&t>=o&&o>=s&&(s=o,r=n[l])}),r}}function oe(e){var t;const i=(t=e.dirs)===null||t===void 0?void 0:t.find(({dir:n})=>n===O);return!!(i&&i.value===!1)}const ie={xs:0,s:640,m:1024,l:1280,xl:1536,"2xl":1920};function ae(e){return`(min-width: ${e}px)`}const N={};function le(e=ie){if(!Z)return y(()=>[]);if(typeof window.matchMedia!="function")return y(()=>[]);const t=C({}),i=Object.keys(e),n=(r,s)=>{r.matches?t.value[s]=!0:t.value[s]=!1};return i.forEach(r=>{const s=e[r];let l,o;N[s]===void 0?(l=window.matchMedia(ae(s)),l.addEventListener?l.addEventListener("change",p=>{o.forEach(u=>{u(p,r)})}):l.addListener&&l.addListener(p=>{o.forEach(u=>{u(p,r)})}),o=new Set,N[s]={mql:l,cbs:o}):(l=N[s].mql,o=N[s].cbs),o.add(n),l.matches&&o.forEach(p=>{p(l,r)})}),D(()=>{i.forEach(r=>{const{cbs:s}=N[e[r]];s.has(n)&&s.delete(n)})}),y(()=>{const{value:r}=t;return i.filter(s=>r[s])})}const j=1,P=z("n-grid"),Q=1,T={span:{type:[Number,String],default:Q},offset:{type:[Number,String],default:0},suffix:Boolean,privateOffset:Number,privateSpan:Number,privateColStart:Number,privateShow:{type:Boolean,default:!0}},we=q(T);var ye=V({__GRID_ITEM__:!0,name:"GridItem",alias:["Gi"],props:T,setup(){const{isSsrRef:e,xGapRef:t,itemStyleRef:i,overflowRef:n}=F(P),r=U();return{overflow:n,itemStyle:i,deriveStyle:()=>{e.value;const{privateSpan:s=Q,privateShow:l=!0,privateColStart:o=void 0,privateOffset:p=0}=r.vnode.props,{value:u}=t,S=B(u||0);return{display:l?"":"none",gridColumn:`${o!=null?o:`span ${s}`} / span ${s}`,marginLeft:p?`calc((100% - (${s} - 1) * ${S}) / ${s} * ${p} + ${S} * ${p})`:""}}}},render(){var e,t;return k("div",{style:[this.itemStyle,this.deriveStyle()]},(t=(e=this.$slots).default)===null||t===void 0?void 0:t.call(e,{overflow:this.overflow}))}});const fe={xs:0,s:640,m:1024,l:1280,xl:1536,xxl:1920},L=24,$="__ssr__",ue={responsive:{type:[String,Boolean],default:"self"},cols:{type:[Number,String],default:L},itemResponsive:Boolean,collapsed:Boolean,collapsedRows:{type:Number,default:1},itemStyle:[Object,String],xGap:{type:[Number,String],default:0},yGap:{type:[Number,String],default:0}};var be=V({name:"Grid",inheritAttrs:!1,props:ue,setup(e){const{mergedClsPrefixRef:t,mergedBreakpointsRef:i}=X(e),n=/^\d+$/,r=C(void 0),s=le((i==null?void 0:i.value)||fe),l=G(()=>!!(e.itemResponsive||!n.test(e.cols.toString())||!n.test(e.xGap.toString())||!n.test(e.yGap.toString()))),o=y(()=>{if(!!l.value)return e.responsive==="self"?r.value:s.value}),p=G(()=>{var f;return(f=Number(x(e.cols.toString(),o.value)))!==null&&f!==void 0?f:L}),u=G(()=>x(e.xGap.toString(),o.value)),S=G(()=>x(e.yGap.toString(),o.value)),E=f=>{r.value=f.contentRect.width},c=f=>{re(E,f)},b=C(!1),R=y(()=>{if(e.responsive==="self")return c}),d=C(!1),m=C();return Y(()=>{const{value:f}=m;f&&f.hasAttribute($)&&(f.removeAttribute($),d.value=!0)}),H(P,{isSsrRef:d,itemStyleRef:J(e,"itemStyle"),xGapRef:u,overflowRef:b}),{isSsr:!K,contentEl:m,mergedClsPrefix:t,style:y(()=>({width:"100%",display:"grid",gridTemplateColumns:`repeat(${p.value}, minmax(0, 1fr))`,columnGap:B(u.value),rowGap:B(S.value)})),isResponsive:l,responsiveQuery:o,responsiveCols:p,handleResize:R,overflow:b}},render(){const e=()=>{var t,i,n,r,s,l,o;this.overflow=!1;const p=te(se(this)),u=[],{collapsed:S,collapsedRows:E,responsiveCols:c,responsiveQuery:b}=this;p.forEach(a=>{var _,h,v,g;if(((_=a==null?void 0:a.type)===null||_===void 0?void 0:_.__GRID_ITEM__)!==!0)return;if(oe(a)){const w=A(a);w.props?w.props.privateShow=!1:w.props={privateShow:!1},u.push({child:w,rawChildSpan:0});return}a.dirs=((h=a.dirs)===null||h===void 0?void 0:h.filter(({dir:w})=>w!==O))||null;const I=A(a),M=Number((g=x((v=I.props)===null||v===void 0?void 0:v.span,b))!==null&&g!==void 0?g:j);M!==0&&u.push({child:I,rawChildSpan:M})});let R=0;const d=(t=u[u.length-1])===null||t===void 0?void 0:t.child;if(d!=null&&d.props){const a=(i=d.props)===null||i===void 0?void 0:i.suffix;a!==void 0&&a!==!1&&(R=(r=(n=d.props)===null||n===void 0?void 0:n.span)!==null&&r!==void 0?r:j,d.props.privateSpan=R,d.props.privateColStart=c+1-R,d.props.privateShow=(s=d.props.privateShow)!==null&&s!==void 0?s:!0)}let m=0,f=!1;for(const{child:a,rawChildSpan:_}of u){if(f&&(this.overflow=!0),!f){const h=Number((o=x((l=a.props)===null||l===void 0?void 0:l.offset,b))!==null&&o!==void 0?o:0),v=Math.min(_+h,c);if(a.props?(a.props.privateSpan=v,a.props.privateOffset=h):a.props={privateSpan:v,privateOffset:h},S){const g=m%c;v+g>c&&(m+=c-g),v+m+R>E*c?f=!0:m+=v}}f&&(a.props?a.props.privateShow!==!0&&(a.props.privateShow=!1):a.props={privateShow:!1})}return k("div",W({ref:"contentEl",class:`${this.mergedClsPrefix}-grid`,style:this.style,[$]:this.isSsr||void 0},this.$attrs),u.map(({child:a})=>a))};return this.isResponsive&&this.responsive==="self"?k(ee,{onResize:this.handleResize},{default:e}):e()}});export{be as N,ye as a,T as b,we as g};