import{u as g,r as _,a as i,d as f,o as h,w as N,t as T,c as r,a2 as b}from"./index.c5429249.js";import{u as P}from"./index.075b615e.js";import{s as v}from"./service.0215c8a4.js";import{p as u}from"./common.145f2eef.js";import{f as m}from"./index.a2051d72.js";import{C as k}from"./index.97f03277.js";import{S as z}from"./SearchOutlined.5b629110.js";import{N as R}from"./Card.c707a1eb.js";import{N as S}from"./Space.e50db48f.js";import{N as D}from"./Input.97d5419b.js";import{a as d}from"./Select.e833ee40.js";import{N as U}from"./DatePicker.fbb7ccb7.js";import{N as E}from"./Button.c43a24dc.js";import{N as C}from"./Icon.8e3bf5ec.js";import{N as w,a as L}from"./DataTable.d85b2298.js";import"./lodash.084a01e7.js";import"./SettingOutlined.716a0298.js";import"./PauseCircleOutlined.813adbbb.js";import"./CloseCircleOutlined.46c86330.js";import"./CheckCircleOutlined.6daee0ce.js";import"./EditOutlined.af3970b8.js";import"./ClockCircleOutlined.6c97131a.js";import"./use-rtl.c78ffbd8.js";import"./resolve-slot.7c241306.js";import"./index.16077d24.js";import"./keysOf.963e6f6c.js";import"./is-browser.d3e5def6.js";import"./flatten.a7868693.js";import"./get-slot.c85d6606.js";import"./use-locale.be539345.js";import"./Scrollbar.12b40993.js";import"./fade-in.cssr.9da325c6.js";import"./VResizeObserver.14b04bb7.js";import"./Suffix.9ee1fead.js";import"./fade-in-scale-up.cssr.05526022.js";import"./use-compitable.b0459e69.js";import"./Selection.a106a9c5.js";import"./Popover.df2981b4.js";import"./index.3e01cddc.js";import"./format-length.e7c2072e.js";import"./utils.3eee947a.js";import"./next-frame-once.da993024.js";import"./use-keyboard.22724d1e.js";import"./Forward.23552619.js";import"./ArrowDown.db19052e.js";import"./Checkbox.7506e5f5.js";import"./RadioGroup.47f9a37a.js";import"./Radio.5a2a0c2a.js";import"./Dropdown.749e9383.js";import"./Tooltip.d759bd4b.js";import"./ChevronRight.f70a9c2d.js";function M(e){return v({url:"/projects/audit/audit-log-list",method:"get",params:e})}function A(){const{t:e}=g(),t=_({columns:[],tableData:[],page:i(1),pageSize:i(10),resourceType:i(null),operationType:i(null),userName:i(null),datePickerRange:i(null),totalPage:i(1),loadingRef:i(!1)});return{t:e,variables:t,getTableData:a=>{if(t.loadingRef)return;t.loadingRef=!0;const o={pageSize:a.pageSize,pageNo:a.pageNo,resourceType:a.resourceType,operationType:a.operationType,userName:a.userName,startDate:a.datePickerRange?m(u(a.datePickerRange[0]),"yyyy-MM-dd HH:mm:ss"):"",endDate:a.datePickerRange?m(u(a.datePickerRange[1]),"yyyy-MM-dd HH:mm:ss"):""},{state:n}=P(M(o).then(s=>{t.totalPage=s.totalPage,t.tableData=s.totalList.map((y,q)=>({...y})),t.loadingRef=!1}),{});return n},createColumns:a=>{a.columns=[{title:"#",key:"index",render:(o,n)=>n+1},{title:e("monitor.audit_log.user_name"),key:"userName"},{title:e("monitor.audit_log.resource_type"),key:"resource"},{title:e("monitor.audit_log.project_name"),key:"resourceName"},{title:e("monitor.audit_log.operation_type"),key:"operation"},{title:e("monitor.audit_log.create_time"),key:"time"}]}}}const j="_pagination_10rs2_20";var c={"table-card":"_table-card_10rs2_17",pagination:j};const Ae=f({name:"audit-log",setup(){const{t:e,variables:t,getTableData:p,createColumns:l}=A(),a=()=>{p({pageSize:t.pageSize,pageNo:t.page,resourceType:t.resourceType,operationType:t.operationType,userName:t.userName,datePickerRange:t.datePickerRange})},o=()=>{t.page=1,a()},n=()=>{t.page=1,a()};return h(()=>{l(t),a()}),N(g().locale,()=>{l(t)}),{t:e,...T(t),requestTableData:a,onUpdatePageSize:o,onSearch:n}},render(){const{t:e,requestTableData:t,onUpdatePageSize:p,onSearch:l,loadingRef:a}=this;return r(b,null,[r(R,null,{default:()=>[r(S,{justify:"end"},{default:()=>[r(D,{value:this.userName,"onUpdate:value":o=>this.userName=o,size:"small",placeholder:e("monitor.audit_log.user_name"),clearable:!0},null),r(d,{value:this.operationType,"onUpdate:value":o=>this.operationType=o,size:"small",options:[{value:"CREATE",label:e("monitor.audit_log.create")},{value:"UPDATE",label:e("monitor.audit_log.update")},{value:"DELETE",label:e("monitor.audit_log.delete")},{value:"READ",label:e("monitor.audit_log.read")}],placeholder:e("monitor.audit_log.operation_type"),style:{width:"180px"},clearable:!0},null),r(d,{value:this.resourceType,"onUpdate:value":o=>this.resourceType=o,size:"small",options:[{value:"USER_MODULE",label:e("monitor.audit_log.user_audit")},{value:"PROJECT_MODULE",label:e("monitor.audit_log.project_audit")}],placeholder:e("monitor.audit_log.resource_type"),style:{width:"180px"},clearable:!0},null),r(U,{value:this.datePickerRange,"onUpdate:value":o=>this.datePickerRange=o,type:"datetimerange",size:"small","start-placeholder":e("monitor.audit_log.start_time"),"end-placeholder":e("monitor.audit_log.end_time"),clearable:!0},null),r(E,{size:"small",type:"primary",onClick:l},{icon:()=>r(C,null,{default:()=>[r(z,null,null)]})})]})]}),r(k,{class:c["table-card"]},{default:()=>[r(w,{loading:a,columns:this.columns,data:this.tableData},null),r("div",{class:c.pagination},[r(L,{page:this.page,"onUpdate:page":o=>this.page=o,"page-size":this.pageSize,"onUpdate:page-size":o=>this.pageSize=o,"page-count":this.totalPage,"show-size-picker":!0,"page-sizes":[10,30,50],"show-quick-jumper":!0,onUpdatePage:t,onUpdatePageSize:p},null)])]})])}});export{Ae as default};