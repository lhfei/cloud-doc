import{u as y,h as s,r as M,a as m,d as N,o as _,w as z,t as T,c as r,_ as C}from"./index.c5429249.js";import{u as R}from"./index.075b615e.js";import{d as S,q as w,T as v}from"./token-modal.4e889786.js";import{p as g}from"./common.145f2eef.js";import{E as D}from"./EditOutlined.af3970b8.js";import{D as P}from"./DeleteOutlined.e68b06d7.js";import{f as h}from"./index.a2051d72.js";import{N as b}from"./Tooltip.d759bd4b.js";import{N as f}from"./Button.c43a24dc.js";import{N as k}from"./Icon.8e3bf5ec.js";import{N as x}from"./Popconfirm.83d41c5f.js";import{N as V}from"./Space.e50db48f.js";import{C as U}from"./index.97f03277.js";import{S as H}from"./SearchOutlined.5b629110.js";import{N as q}from"./Card.c707a1eb.js";import{N as O}from"./Input.97d5419b.js";import{N as j,a as E}from"./DataTable.d85b2298.js";import"./index.20e11ec3.js";import"./index.3b9f9e63.js";import"./keysOf.963e6f6c.js";import"./resolve-slot.7c241306.js";import"./index.3e01cddc.js";import"./flatten.a7868693.js";import"./Scrollbar.12b40993.js";import"./fade-in.cssr.9da325c6.js";import"./VResizeObserver.14b04bb7.js";import"./fade-in-scale-up.cssr.05526022.js";import"./utils.3eee947a.js";import"./is-browser.d3e5def6.js";import"./index.f239614a.js";import"./service.0215c8a4.js";import"./lodash.084a01e7.js";import"./DatePicker.fbb7ccb7.js";import"./use-keyboard.22724d1e.js";import"./Selection.a106a9c5.js";import"./Popover.df2981b4.js";import"./format-length.e7c2072e.js";import"./use-compitable.b0459e69.js";import"./next-frame-once.da993024.js";import"./index.16077d24.js";import"./use-locale.be539345.js";import"./use-rtl.c78ffbd8.js";import"./Suffix.9ee1fead.js";import"./Forward.23552619.js";import"./ReloadOutlined.3fddf0fb.js";import"./Form.13999875.js";import"./FormItem.51e71cc3.js";import"./Select.e833ee40.js";import"./SettingOutlined.716a0298.js";import"./PauseCircleOutlined.813adbbb.js";import"./CloseCircleOutlined.46c86330.js";import"./CheckCircleOutlined.6daee0ce.js";import"./ClockCircleOutlined.6c97131a.js";import"./get-slot.c85d6606.js";import"./ArrowDown.db19052e.js";import"./Checkbox.7506e5f5.js";import"./RadioGroup.47f9a37a.js";import"./Radio.5a2a0c2a.js";import"./Dropdown.749e9383.js";import"./ChevronRight.f70a9c2d.js";function I(){const{t}=y(),a=i=>{e.showModalRef=!0,e.statusRef=1,e.row=i},u=i=>{i.columns=[{title:"#",key:"index",render:(n,p)=>p+1},{title:t("security.token.user"),key:"userName",className:"username"},{title:t("security.token.token"),key:"token",className:"token"},{title:t("security.token.expiration_time"),key:"expireTime"},{title:t("security.token.create_time"),key:"createTime"},{title:t("security.token.update_time"),key:"updateTime"},{title:t("security.token.operation"),key:"operation",render(n){return s(V,null,{default:()=>[s(b,{},{trigger:()=>s(f,{circle:!0,type:"info",size:"small",class:"edit",onClick:()=>{a(n)}},{icon:()=>s(k,null,{default:()=>s(D)})}),default:()=>t("security.token.edit")}),s(x,{onPositiveClick:()=>{l(n)}},{trigger:()=>s(b,{},{trigger:()=>s(f,{circle:!0,type:"error",size:"small",class:"delete"},{icon:()=>s(k,null,{default:()=>s(P)})}),default:()=>t("security.token.delete")}),default:()=>t("security.token.delete_confirm")})]})}}]},e=M({columns:[],tableData:[],page:m(1),pageSize:m(10),searchVal:m(null),totalPage:m(1),showModalRef:m(!1),statusRef:m(0),row:{},loadingRef:m(!1)}),l=i=>{e.tableData.length===1&&e.page>1&&--e.page,S(i.id).then(()=>{c({pageSize:e.pageSize,pageNo:e.page,searchVal:e.searchVal})})},c=i=>{if(e.loadingRef)return;e.loadingRef=!0;const{state:n}=R(w({...i}).then(p=>{e.tableData=p.totalList.map((o,F)=>(o.expireTime=h(g(o.expireTime),"yyyy-MM-dd HH:mm:ss"),o.createTime=h(g(o.createTime),"yyyy-MM-dd HH:mm:ss"),o.updateTime=h(g(o.updateTime),"yyyy-MM-dd HH:mm:ss"),{...o})),e.totalPage=p.totalPage,e.loadingRef=!1}),{});return n};return{variables:e,getTableData:c,createColumns:u}}const A="_box_18oib_22",L="_pagination_18oib_35";var d={"search-card":"_search-card_18oib_17",box:A,"table-card":"_table-card_18oib_32",pagination:L};function B(t){return typeof t=="function"||Object.prototype.toString.call(t)==="[object Object]"&&!C(t)}const Ye=N({name:"token-manage",setup(){const{t}=y(),{variables:a,getTableData:u,createColumns:e}=I(),l=()=>{u({pageSize:a.pageSize,pageNo:a.page,searchVal:a.searchVal})},c=()=>{a.page=1,l()},i=()=>{a.page=1,l()},n=()=>{a.showModalRef=!0,a.statusRef=0},p=()=>{a.showModalRef=!1},o=()=>{a.showModalRef=!1,l()};return _(()=>{e(a),l()}),z(y().locale,()=>{e(a)}),{t,...T(a),requestData:l,onCancelModal:p,onConfirmModal:o,onUpdatePageSize:c,handleModalChange:n,onSearch:i}},render(){let t;const{t:a,requestData:u,onUpdatePageSize:e,onCancelModal:l,onConfirmModal:c,handleModalChange:i,onSearch:n,loadingRef:p}=this;return r("div",null,[r(q,null,{default:()=>[r("div",{class:d["search-card"]},[r("div",null,[r(f,{class:"btn-create-token",size:"small",type:"primary",onClick:i},B(t=a("security.token.create_token"))?t:{default:()=>[t]})]),r("div",{class:d.box},[r(O,{size:"small",clearable:!0,value:this.searchVal,"onUpdate:value":o=>this.searchVal=o,placeholder:a("security.token.search_tips")},null),r(f,{size:"small",type:"primary",onClick:n},{icon:()=>r(k,null,{default:()=>[r(H,null,null)]})})])])]}),r(U,{class:d["table-card"]},{default:()=>[r(j,{loading:p,"row-class-name":"items",columns:this.columns,data:this.tableData},null),r("div",{class:d.pagination},[r(E,{page:this.page,"onUpdate:page":o=>this.page=o,"page-size":this.pageSize,"onUpdate:page-size":o=>this.pageSize=o,"page-count":this.totalPage,"show-size-picker":!0,"page-sizes":[10,30,50],"show-quick-jumper":!0,onUpdatePage:u,onUpdatePageSize:e},null)])]}),r(v,{showModalRef:this.showModalRef,statusRef:this.statusRef,row:this.row,onCancelModal:l,onConfirmModal:c},null)])}});export{Ye as default};