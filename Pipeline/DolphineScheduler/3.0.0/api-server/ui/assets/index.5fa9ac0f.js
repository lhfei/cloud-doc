import{u as N}from"./use-table.1da87de1.js";import{d as k,o as R,w as d,u as b,t as z,c as a,a2 as w}from"./index.c5429249.js";import{C as L}from"./index.97f03277.js";import{L as v,q as I}from"./index.fc8088f4.js";import{u as S}from"./index.075b615e.js";import{s as y}from"./common.145f2eef.js";import{S as U}from"./SearchOutlined.5b629110.js";import{N as P}from"./Card.c707a1eb.js";import{N as T}from"./Space.e50db48f.js";import{N as p}from"./Input.97d5419b.js";import{a as _}from"./Select.e833ee40.js";import{N as M}from"./DatePicker.fbb7ccb7.js";import{N as j}from"./Button.c43a24dc.js";import{N as C}from"./Icon.8e3bf5ec.js";import{N as x,a as D}from"./DataTable.d85b2298.js";import"./service.0215c8a4.js";import"./lodash.084a01e7.js";import"./index.3b9f9e63.js";import"./column-width-config.63466f21.js";import"./CheckCircleOutlined.6daee0ce.js";import"./DownloadOutlined.8c21680b.js";import"./index.a2051d72.js";import"./Dropdown.749e9383.js";import"./Tooltip.d759bd4b.js";import"./Popover.df2981b4.js";import"./index.3e01cddc.js";import"./flatten.a7868693.js";import"./Scrollbar.12b40993.js";import"./fade-in.cssr.9da325c6.js";import"./VResizeObserver.14b04bb7.js";import"./format-length.e7c2072e.js";import"./utils.3eee947a.js";import"./resolve-slot.7c241306.js";import"./use-compitable.b0459e69.js";import"./next-frame-once.da993024.js";import"./ChevronRight.f70a9c2d.js";import"./Selection.a106a9c5.js";import"./index.16077d24.js";import"./use-locale.be539345.js";import"./use-rtl.c78ffbd8.js";import"./Suffix.9ee1fead.js";import"./fade-in-scale-up.cssr.05526022.js";import"./use-keyboard.22724d1e.js";import"./Spin.1e9405a1.js";import"./index.20e11ec3.js";import"./keysOf.963e6f6c.js";import"./is-browser.d3e5def6.js";import"./SyncOutlined.859a474f.js";import"./FullscreenOutlined.135d7d35.js";import"./throttle.754ed9e3.js";import"./debounce.b14aac0d.js";import"./toNumber.5d1af176.js";import"./SettingOutlined.716a0298.js";import"./PauseCircleOutlined.813adbbb.js";import"./CloseCircleOutlined.46c86330.js";import"./EditOutlined.af3970b8.js";import"./ClockCircleOutlined.6c97131a.js";import"./get-slot.c85d6606.js";import"./Forward.23552619.js";import"./ArrowDown.db19052e.js";import"./Checkbox.7506e5f5.js";import"./RadioGroup.47f9a37a.js";import"./Radio.5a2a0c2a.js";const q="_pagination_10rs2_20";var h={"table-card":"_table-card_10rs2_17",pagination:q};const He=k({name:"task-instance",setup(){const{t:o,variables:e,getTableData:m,createColumns:r}=N(),s=()=>{m({pageSize:e.pageSize,pageNo:e.page,searchVal:e.searchVal,processInstanceId:e.processInstanceId,host:e.host,stateType:e.stateType,datePickerRange:e.datePickerRange,executorName:e.executorName,processInstanceName:e.processInstanceName})},n=()=>{e.page=1,s()},c=()=>{e.page=1,s()},t=()=>{e.showModalRef=!1},u=l=>{const{state:f}=S(I({taskInstanceId:Number(l.id),limit:e.limit,skipLineNum:e.skipLineNum}).then(i=>{i!=null&&i.message?(e.logRef+=i.message,e.limit+=1e3,e.skipLineNum+=i.lineNum,u(l)):e.logLoadingRef=!1}),{});return f},g=l=>{e.logRef="",e.limit=1e3,e.skipLineNum=0,u(l)};return R(()=>{r(e),s()}),d(b().locale,()=>{r(e)}),d(()=>e.showModalRef,()=>{e.showModalRef?u(e.row):(e.row={},e.logRef="",e.logLoadingRef=!0,e.skipLineNum=0,e.limit=1e3)}),{t:o,...z(e),requestTableData:s,onUpdatePageSize:n,onSearch:c,onConfirmModal:t,refreshLogs:g}},render(){const{t:o,requestTableData:e,onUpdatePageSize:m,onSearch:r,onConfirmModal:s,loadingRef:n,refreshLogs:c}=this;return a(w,null,[a(P,null,{default:()=>[a(T,{justify:"end",wrap:!1},{default:()=>[a(p,{value:this.searchVal,"onUpdate:value":t=>this.searchVal=t,size:"small",placeholder:o("project.task.task_name"),clearable:!0},null),a(p,{value:this.processInstanceName,"onUpdate:value":t=>this.processInstanceName=t,size:"small",placeholder:o("project.task.workflow_instance"),clearable:!0},null),a(p,{value:this.executorName,"onUpdate:value":t=>this.executorName=t,size:"small",placeholder:o("project.task.executor"),clearable:!0},null),a(p,{value:this.host,"onUpdate:value":t=>this.host=t,size:"small",placeholder:o("project.task.host"),clearable:!0},null),a(_,{value:this.stateType,"onUpdate:value":t=>this.stateType=t,size:"small",options:y(o).slice(1),placeholder:o("project.task.state"),style:{width:"180px"},clearable:!0},null),a(M,{value:this.datePickerRange,"onUpdate:value":t=>this.datePickerRange=t,type:"datetimerange",size:"small","start-placeholder":o("project.task.start_time"),"end-placeholder":o("project.task.end_time"),clearable:!0},null),a(j,{size:"small",type:"primary",onClick:r},{icon:()=>a(C,null,{default:()=>[a(U,null,null)]})})]})]}),a(L,{class:h["table-card"]},{default:()=>[a(x,{loading:n,columns:this.columns,data:this.tableData,scrollX:this.tableWidth},null),a("div",{class:h.pagination},[a(D,{page:this.page,"onUpdate:page":t=>this.page=t,"page-size":this.pageSize,"onUpdate:page-size":t=>this.pageSize=t,"page-count":this.totalPage,"show-size-picker":!0,"page-sizes":[10,30,50],"show-quick-jumper":!0,onUpdatePage:e,onUpdatePageSize:m},null)])]}),a(v,{showModalRef:this.showModalRef,logRef:this.logRef,row:this.row,logLoadingRef:this.logLoadingRef,onConfirmModal:s,onRefreshLogs:c},null)])}});export{He as default};