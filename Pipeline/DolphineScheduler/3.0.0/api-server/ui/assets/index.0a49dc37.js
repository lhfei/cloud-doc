import{aj as l,u as m,Q as c,ak as p,w as o,o as k,P as v}from"./index.c5429249.js";function z(u,t){var i;let e=null;const r=l(),{locale:d}=m(),n=(i=c())==null?void 0:i.appContext.config.globalProperties;t.backgroundColor="";const s=()=>{e=n==null?void 0:n.echarts.init(u.value,r.darkTheme?"dark-bold":"macarons"),e&&e.setOption(t)},a=p(()=>{e&&e.resize()},20);return o(()=>r.darkTheme,()=>{e==null||e.dispose(),s()}),o(()=>d.value,()=>{e==null||e.dispose(),s()}),o(()=>t,()=>{e==null||e.dispose(),s()},{deep:!0}),k(()=>{s(),addEventListener("resize",a)}),v(()=>{removeEventListener("resize",a)}),e}export{z as i};