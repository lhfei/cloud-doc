import{u as f}from"./use-rtl.c78ffbd8.js";import{b as p}from"./Button.c43a24dc.js";import{q as a,y as d,p as o,v as e,x as s,d as b,z as g,ar as m,C as h,h as $}from"./index.c5429249.js";const t="0!important",u="-1px!important";function i(r){return e(r+"-type",[o("& +",[a("button",{},[e(r+"-type",[s("border",{borderLeftWidth:t}),s("state-border",{left:u})])])])])}function n(r){return e(r+"-type",[o("& +",[a("button",[e(r+"-type",[s("border",{borderTopWidth:t}),s("state-border",{top:u})])])])])}var y=a("button-group",`
 flex-wrap: nowrap;
 display: inline-flex;
 position: relative;
`,[d("vertical",{flexDirection:"row"},[d("rtl",[a("button",[o("&:first-child:not(:last-child)",`
 margin-right: ${t};
 border-top-right-radius: ${t};
 border-bottom-right-radius: ${t};
 `),o("&:last-child:not(:first-child)",`
 margin-left: ${t};
 border-top-left-radius: ${t};
 border-bottom-left-radius: ${t};
 `),o("&:not(:first-child):not(:last-child)",`
 margin-left: ${t};
 margin-right: ${t};
 border-radius: ${t};
 `),i("default"),e("ghost",[i("primary"),i("info"),i("success"),i("warning"),i("error")])])])]),e("vertical",{flexDirection:"column"},[a("button",[o("&:first-child:not(:last-child)",`
 margin-bottom: ${t};
 margin-left: ${t};
 margin-right: ${t};
 border-bottom-left-radius: ${t};
 border-bottom-right-radius: ${t};
 `),o("&:last-child:not(:first-child)",`
 margin-top: ${t};
 margin-left: ${t};
 margin-right: ${t};
 border-top-left-radius: ${t};
 border-top-right-radius: ${t};
 `),o("&:not(:first-child):not(:last-child)",`
 margin: ${t};
 border-radius: ${t};
 `),n("default"),e("ghost",[n("primary"),n("info"),n("success"),n("warning"),n("error")])])])]);const v={size:{type:String,default:void 0},vertical:Boolean};var w=b({name:"ButtonGroup",props:v,setup(r){const{mergedClsPrefixRef:l,mergedRtlRef:c}=g(r);return m("-button-group",y,l),h(p,r),{rtlEnabled:f("ButtonGroup",c,l),mergedClsPrefix:l}},render(){const{mergedClsPrefix:r}=this;return $("div",{class:[`${r}-button-group`,this.rtlEnabled&&`${r}-button-group--rtl`,this.vertical&&`${r}-button-group--vertical`],role:"group"},this.$slots)}});export{w as N};
