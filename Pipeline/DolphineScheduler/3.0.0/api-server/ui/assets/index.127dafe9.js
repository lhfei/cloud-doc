import{C as M}from"./index.97f03277.js";import{u as _,bl as k,h as r,r as R,a as c,d as w,o as z,w as S,t as D,c as o,_ as P}from"./index.c5429249.js";import T from"./project-modal.9ce0f0eb.js";import{u as V}from"./index.075b615e.js";import{B as v}from"./index.3b9f9e63.js";import{q as O,d as W}from"./index.bbb6cfa3.js";import{p as j}from"./common.145f2eef.js";import{C as n,c as x,D as U}from"./column-width-config.63466f21.js";import{E as q}from"./EditOutlined.af3970b8.js";import{D as E}from"./DeleteOutlined.e68b06d7.js";import{f as y}from"./index.a2051d72.js";import{a as H}from"./Dropdown.749e9383.js";import{N}from"./Tooltip.d759bd4b.js";import{N as h}from"./Button.c43a24dc.js";import{N as b}from"./Icon.8e3bf5ec.js";import{N as I}from"./Popconfirm.83d41c5f.js";import{N as C}from"./Space.e50db48f.js";import{S as L}from"./SearchOutlined.5b629110.js";import{N as B}from"./Card.c707a1eb.js";import{N as A}from"./Input.97d5419b.js";import{N as F,a as G}from"./DataTable.d85b2298.js";import"./index.20e11ec3.js";import"./keysOf.963e6f6c.js";import"./resolve-slot.7c241306.js";import"./index.3e01cddc.js";import"./flatten.a7868693.js";import"./Scrollbar.12b40993.js";import"./fade-in.cssr.9da325c6.js";import"./VResizeObserver.14b04bb7.js";import"./fade-in-scale-up.cssr.05526022.js";import"./utils.3eee947a.js";import"./is-browser.d3e5def6.js";import"./Form.13999875.js";import"./FormItem.51e71cc3.js";import"./format-length.e7c2072e.js";import"./service.0215c8a4.js";import"./lodash.084a01e7.js";import"./SettingOutlined.716a0298.js";import"./PauseCircleOutlined.813adbbb.js";import"./CloseCircleOutlined.46c86330.js";import"./CheckCircleOutlined.6daee0ce.js";import"./ClockCircleOutlined.6c97131a.js";import"./Popover.df2981b4.js";import"./use-compitable.b0459e69.js";import"./next-frame-once.da993024.js";import"./ChevronRight.f70a9c2d.js";import"./Selection.a106a9c5.js";import"./index.16077d24.js";import"./use-locale.be539345.js";import"./use-rtl.c78ffbd8.js";import"./Suffix.9ee1fead.js";import"./use-keyboard.22724d1e.js";import"./get-slot.c85d6606.js";import"./ArrowDown.db19052e.js";import"./Checkbox.7506e5f5.js";import"./RadioGroup.47f9a37a.js";import"./Radio.5a2a0c2a.js";import"./Select.e833ee40.js";import"./Forward.23552619.js";const X="_box_18oib_22",$="_pagination_18oib_35";var g={"search-card":"_search-card_18oib_17",box:X,"table-card":"_table-card_18oib_32",pagination:$};function J(){const{t}=_(),e=k(),d=i=>{a.showModalRef=!0,a.statusRef=1,a.row=i},l=i=>{W(i.code).then(()=>{f({pageSize:a.pageSize,pageNo:a.tableData.length===1&&a.page>1?a.page-1:a.page,searchVal:a.searchVal})})},p=i=>{i.columns=[{title:"#",key:"index",render:(s,m)=>m+1,...n.index},{title:t("project.list.project_name"),key:"name",className:"project-name",...n.linkName,render:s=>r(v,{onClick:()=>{e.push({path:`/projects/${s.code}`})}},{default:()=>r(H,n.linkEllipsis,()=>s.name)})},{title:t("project.list.owned_users"),key:"userName",...n.userName},{title:t("project.list.workflow_define_count"),key:"defCount",width:120,ellipsis:{tooltip:!0}},{title:t("project.list.process_instance_running_count"),key:"instRunningCount",width:120,ellipsis:{tooltip:!0}},{title:t("project.list.description"),key:"description",...n.note},{title:t("project.list.create_time"),key:"createTime",...n.time},{title:t("project.list.update_time"),key:"updateTime",...n.time},{title:t("project.list.operation"),key:"actions",...n.operation(2),render(s){return r(C,null,{default:()=>[r(N,{},{trigger:()=>r(h,{circle:!0,type:"info",size:"small",class:"edit",onClick:()=>{d(s)}},{icon:()=>r(b,null,{default:()=>r(q)})}),default:()=>t("project.list.edit")}),r(I,{onPositiveClick:()=>{l(s)}},{trigger:()=>r(N,{},{trigger:()=>r(h,{circle:!0,type:"error",size:"small",class:"delete"},{icon:()=>r(b,null,{default:()=>r(E)})}),default:()=>t("project.list.delete")}),default:()=>t("project.list.delete_confirm")})]})}}],i.tableWidth&&(i.tableWidth=x(i.columns))},a=R({columns:[],tableWidth:U,tableData:[],page:c(1),pageSize:c(10),searchVal:c(null),totalPage:c(1),showModalRef:c(!1),statusRef:c(0),row:{},loadingRef:c(!1)}),f=i=>{if(a.loadingRef)return;a.loadingRef=!0;const{state:s}=V(O(i).then(m=>{a.totalPage=m.totalPage,a.tableData=m.totalList.map((u,Q)=>(u.createTime=y(j(u.createTime),"yyyy-MM-dd HH:mm:ss"),u.updateTime=y(j(u.updateTime),"yyyy-MM-dd HH:mm:ss"),{...u})),a.loadingRef=!1}),{});return s};return{variables:a,getTableData:f,createColumns:p}}function K(t){return typeof t=="function"||Object.prototype.toString.call(t)==="[object Object]"&&!P(t)}const oe=w({name:"list",setup(){const{t}=_(),{variables:e,getTableData:d,createColumns:l}=J(),p=()=>{d({pageSize:e.pageSize,pageNo:e.page,searchVal:e.searchVal})},a=()=>{e.showModalRef=!0,e.statusRef=0},f=()=>{e.page=1,p()},i=()=>{e.showModalRef=!1},s=()=>{e.showModalRef=!1,p()},m=()=>{e.page=1,p()};return z(()=>{l(e),p()}),S(_().locale,()=>{l(e)}),{t,...D(e),requestData:p,handleModalChange:a,handleSearch:f,onCancelModal:i,onConfirmModal:s,handleChangePageSize:m}},render(){let t;const{t:e,loadingRef:d}=this;return o("div",null,[o(B,null,{default:()=>[o("div",{class:g["search-card"]},[o(h,{size:"small",onClick:this.handleModalChange,type:"primary",class:"btn-create-project"},K(t=e("project.list.create_project"))?t:{default:()=>[t]}),o(C,null,{default:()=>[o(A,{size:"small",value:this.searchVal,"onUpdate:value":l=>this.searchVal=l,placeholder:e("project.list.project_tips"),clearable:!0},null),o(h,{size:"small",type:"primary",onClick:this.handleSearch},{default:()=>[o(b,null,{default:()=>[o(L,null,null)]})]})]})])]}),o(M,{title:e("project.list.project_list"),class:g["table-card"]},{default:()=>[o(F,{loading:d,columns:this.columns,data:this.tableData,scrollX:this.tableWidth,"row-class-name":"items"},null),o("div",{class:g.pagination},[o(G,{page:this.page,"onUpdate:page":l=>this.page=l,"page-size":this.pageSize,"onUpdate:page-size":l=>this.pageSize=l,"page-count":this.totalPage,"show-size-picker":!0,"page-sizes":[10,30,50],"show-quick-jumper":!0,onUpdatePage:this.requestData,onUpdatePageSize:this.handleChangePageSize},null)])]}),o(T,{showModalRef:this.showModalRef,statusRef:this.statusRef,row:this.row,onCancelModal:this.onCancelModal,onConfirmModal:this.onConfirmModal},null)])}});export{oe as default};