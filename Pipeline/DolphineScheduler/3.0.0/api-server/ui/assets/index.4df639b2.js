import{r as p,d as u,u as c,o as l,w as f,t as d,c as n,bH as k}from"./index.c5429249.js";import{C as h}from"./index.97f03277.js";import w from"./gantt-chart.624aa05b.js";import{u as D}from"./index.075b615e.js";import{f as G}from"./index.31c70196.js";import"./Card.c707a1eb.js";import"./use-rtl.c78ffbd8.js";import"./resolve-slot.7c241306.js";import"./index.16077d24.js";import"./keysOf.963e6f6c.js";import"./lodash.084a01e7.js";import"./index.0a49dc37.js";import"./common.145f2eef.js";import"./SettingOutlined.716a0298.js";import"./PauseCircleOutlined.813adbbb.js";import"./CloseCircleOutlined.46c86330.js";import"./CheckCircleOutlined.6daee0ce.js";import"./EditOutlined.af3970b8.js";import"./ClockCircleOutlined.6c97131a.js";import"./index.a2051d72.js";import"./service.0215c8a4.js";function L(){const t=p({seriesData:[],taskList:[]}),o=s=>{t.seriesData=[],t.taskList=[],t.seriesData=s.tasks.map(a=>(t.taskList.push(a.taskName),{name:a.taskName,...a}))};return{variables:t,getGantt:(s,a)=>{const{state:e}=D(G(s,a).then(r=>{o(r)}),{});return e}}}const F=u({name:"workflow-relation",setup(){const{t,locale:o}=c(),i=k(),{variables:s,getGantt:a}=L(),e=Number(i.params.id),r=Number(i.params.projectCode),m=()=>{s.seriesData=[],s.taskList=[],a(e,r)};return l(()=>{a(e,r)}),f(()=>[o.value],()=>{m()}),{t,...d(s)}},render(){const{t}=this;return n(h,{title:t("project.workflow.gantt")},{default:()=>this.seriesData.length>0&&n(w,{seriesData:this.seriesData,taskList:this.taskList},null)})}});export{F as default};