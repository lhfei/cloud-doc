import{u as R,r as g,a as N,d as q,o as k,w as V,t as v,c as o,ae as j,_ as $}from"./index.c5429249.js";import{M}from"./index.20e11ec3.js";import{_ as x}from"./lodash.084a01e7.js";import{l as B,d as O,s as H,t as T}from"./index.8259a597.js";import{u as S}from"./index.075b615e.js";import{C as G}from"./CloudUploadOutlined.2cbd7c1d.js";import{N as D}from"./Form.13999875.js";import{N as u}from"./FormItem.51e71cc3.js";import{N as A}from"./RadioGroup.47f9a37a.js";import{N as J}from"./Radio.5a2a0c2a.js";import{N as f}from"./Input.97d5419b.js";import{N as C}from"./InputGroup.dbcafa91.js";import{N as L}from"./TreeSelect.b9641da1.js";import{N as b}from"./Button.c43a24dc.js";import{N as P}from"./Upload.6ed710a6.js";import{N as z}from"./Icon.8e3bf5ec.js";import"./index.3b9f9e63.js";import"./keysOf.963e6f6c.js";import"./Card.c707a1eb.js";import"./use-rtl.c78ffbd8.js";import"./resolve-slot.7c241306.js";import"./index.16077d24.js";import"./index.3e01cddc.js";import"./flatten.a7868693.js";import"./Scrollbar.12b40993.js";import"./fade-in.cssr.9da325c6.js";import"./VResizeObserver.14b04bb7.js";import"./fade-in-scale-up.cssr.05526022.js";import"./utils.3eee947a.js";import"./is-browser.d3e5def6.js";import"./Space.e50db48f.js";import"./get-slot.c85d6606.js";import"./service.0215c8a4.js";import"./format-length.e7c2072e.js";import"./use-locale.be539345.js";import"./Suffix.9ee1fead.js";import"./Checkbox.7506e5f5.js";import"./Selection.a106a9c5.js";import"./Popover.df2981b4.js";import"./use-compitable.b0459e69.js";import"./next-frame-once.da993024.js";import"./Add.e846b00c.js";import"./Image.f79a9674.js";import"./Tooltip.d759bd4b.js";const K=()=>{const{t:r}=R(),i=g({functionFormRef:N(),functionForm:{type:"HIVE",funcName:"",className:"",argTypes:"",database:"",description:"",resourceId:-1},saving:!1,rules:{type:{required:!0,trigger:["input","blur"],validator(){if(!i.functionForm.type)return new Error(r("resource.function.enter_name_tips"))}},funcName:{required:!0,trigger:["input","blur"],validator(){if(!i.functionForm.funcName)return new Error(r("resource.function.enter_name_tips"))}},className:{required:!0,trigger:["input","blur"],validator(){if(!i.functionForm.className)return new Error(r("resource.function.enter_name_tips"))}},resourceId:{required:!0,trigger:["input","blur"],validator(){if(i.functionForm.resourceId===-1)return new Error(r("resource.function.enter_name_tips"))}}}}),n=g({uploadFormRef:N(),uploadForm:{name:"",file:"",description:"",pid:-1,currentDir:"/"},uploadRules:{pid:{required:!0,trigger:["input","blur"],validator(){if(n.uploadForm.pid===-1)return new Error(r("resource.function.enter_name_tips"))}}}});return{state:i,uploadState:n}};function Q(r,i,n){const{t}=R(),s=async()=>{h(async()=>await H({...r.functionForm},r.functionForm.resourceId))},m=async a=>{h(async()=>{await T({...r.functionForm,id:a},r.functionForm.resourceId,a)})},h=async a=>{if(await r.functionFormRef.validate(),!r.saving){r.saving=!0;try{await a(),window.$message.success(t("resource.udf.success")),r.saving=!1,n.emit("updateList"),n.emit("update:show")}catch{r.saving=!1}}},c=g({uploadShow:N(!1),udfResourceList:[],udfResourceDirList:[]}),d=a=>{for(const e of a)e.children&&(/\.jar$/.test(e.name)||(e.disabled=!0),d(e.children));return a.filter(e=>/\.jar$/.test(e.name)&&e.children.length===0||!/\.jar$/.test(e.name)&&e.children.length>0)},F=a=>{for(const e of a)e.children&&(e.children=F(e.children));return a.filter(e=>!/\.jar$/.test(e.name))},p=a=>{a.forEach(e=>{e.children===""||e.children===void 0||e.children===null||e.children.length===0?delete e.children:p(e.children)})},_=()=>{const{state:a}=S(B({type:"UDF"}).then(e=>{let l=e,w=x.cloneDeep(e);d(l),l=d(l),p(l),p(F(w)),w=w.filter(I=>{if(I.dirctory)return I}),c.udfResourceList=l,c.udfResourceDirList=w}),{});return a},y=()=>{i.uploadForm.name="",i.uploadForm.file="",i.uploadForm.pid=-1,i.uploadForm.currentDir="/",i.uploadForm.description=""};return{variables:c,getUdfList:_,handleCreateFunc:s,handleRenameFunc:m,handleUploadFile:()=>{i.uploadFormRef.validate(async a=>{if(!a){const e=new FormData;e.append("file",i.uploadForm.file),e.append("type","UDF"),e.append("name",i.uploadForm.name),e.append("pid",i.uploadForm.pid),e.append("currentDir",i.uploadForm.currentDir),e.append("description",i.uploadForm.description);const l=await O(e);window.$message.success(t("resource.function.success")),c.uploadShow=!1,y(),_(),r.functionForm.resourceId=l.id}})}}}function E(r){return typeof r=="function"||Object.prototype.toString.call(r)==="[object Object]"&&!$(r)}const W={row:{type:Object,default:{}},show:{type:Boolean,default:!1}};var Te=q({name:"ResourceFileFolder",props:W,emits:["update:show","updateList"],setup(r,i){const n=N(),{state:t,uploadState:s}=K(),{variables:m,handleCreateFunc:h,handleRenameFunc:c,getUdfList:d,handleUploadFile:F}=Q(t,s,i),p=()=>{i.emit("update:show")},_=()=>{h()},y=()=>{c(r.row.id)},U=()=>{var e;s.uploadForm.currentDir=`/${(e=n.value.selectedOption)==null?void 0:e.fullName}`,F()},a=({file:e})=>{s.uploadForm.name=e.name,s.uploadForm.file=e.file};return k(()=>{d()}),V(()=>r.row,()=>{m.uploadShow=!1,t.functionForm.type=r.row.type||"HIVE",t.functionForm.funcName=r.row.funcName,t.functionForm.className=r.row.className,t.functionForm.resourceId=r.row.resourceId||-1,t.functionForm.description=r.row.description}),{treeRef:n,hideModal:p,handleCreate:_,handleRename:y,customRequest:a,handleUpload:U,...v(t),...v(s),...v(m)}},render(){let r,i;const{t:n}=R();return o(M,{show:this.$props.show,title:this.row.id?n("resource.function.edit_udf_function"):n("resource.function.create_udf_function"),onCancel:this.hideModal,onConfirm:this.row.id?this.handleRename:this.handleCreate,confirmClassName:"btn-submit",cancelClassName:"btn-cancel",confirmLoading:this.saving},{default:()=>[o(D,{rules:this.rules,ref:"functionFormRef"},{default:()=>[o(u,{label:n("resource.function.type"),path:"type"},{default:()=>[o(A,{value:this.functionForm.type,"onUpdate:value":t=>this.functionForm.type=t,name:"type",class:"radio-function-type"},{default:()=>[o(J,{value:"HIVE"},{default:()=>[j("HIVE UDF")]})]})]}),o(u,{label:n("resource.function.udf_function_name"),path:"funcName"},{default:()=>[o(f,{value:this.functionForm.funcName,"onUpdate:value":t=>this.functionForm.funcName=t,placeholder:n("resource.function.enter_udf_unction_name_tips"),class:"input-function-name"},null)]}),o(u,{label:n("resource.function.package_name"),path:"className"},{default:()=>[o(f,{value:this.functionForm.className,"onUpdate:value":t=>this.functionForm.className=t,placeholder:n("resource.function.enter_package_name_tips"),class:"input-class-name"},null)]}),o(u,{label:n("resource.function.udf_resources"),path:"resourceId"},{default:()=>[o(C,null,{default:()=>[o(L,{options:this.udfResourceList,"label-field":"fullName","key-field":"id",value:this.functionForm.resourceId,"onUpdate:value":t=>this.functionForm.resourceId=t,placeholder:n("resource.function.enter_select_udf_resources_tips"),defaultValue:this.functionForm.resourceId,disabled:this.uploadShow,showPath:!1,class:"btn-udf-resource-dropdown"},null),o(b,{type:"primary",ghost:!0,onClick:()=>this.uploadShow=!this.uploadShow},E(r=n("resource.function.upload_resources"))?r:{default:()=>[r]})]})]}),this.uploadShow&&o(D,{rules:this.uploadRules,ref:"uploadFormRef"},{default:()=>[o(u,{label:n("resource.function.udf_resources_directory"),path:"pid","show-feedback":!1,style:{marginBottom:"5px"}},{default:()=>[o(L,{ref:"treeRef",options:this.udfResourceDirList,"label-field":"fullName","key-field":"id",value:this.uploadForm.pid,"onUpdate:value":t=>this.uploadForm.pid=t,placeholder:n("resource.function.enter_select_udf_resources_directory_tips"),defaultValue:this.uploadForm.pid},null)]}),o(u,{label:" ","show-feedback":!1,style:{marginBottom:"5px"}},{default:()=>[o(C,null,{default:()=>[o(f,{value:this.uploadForm.name,"onUpdate:value":t=>this.uploadForm.name=t,placeholder:n("resource.function.enter_name_tips")},null),o(P,{value:this.uploadForm.file,"onUpdate:value":t=>this.uploadForm.file=t,customRequest:this.customRequest,showFileList:!1,style:{width:"auto"}},{default:()=>[o(b,null,{default:()=>[n("resource.function.upload"),o(z,null,{default:()=>[o(G,null,null)]})]})]})]})]}),o(u,{label:" ",path:"description","show-feedback":!1,style:{marginBottom:"5px"}},{default:()=>[o(f,{type:"textarea",value:this.uploadForm.description,"onUpdate:value":t=>this.uploadForm.description=t,placeholder:n("resource.function.enter_description_tips"),class:"input-description"},null)]}),o(u,{label:" "},{default:()=>[o(b,{onClick:this.handleUpload},E(i=n("resource.function.upload_udf_resources"))?i:{default:()=>[i]})]})]}),o(u,{label:n("resource.function.instructions"),path:"description"},{default:()=>[o(f,{type:"textarea",value:this.functionForm.description,"onUpdate:value":t=>this.functionForm.description=t,placeholder:n("resource.function.enter_instructions_tips"),class:"input-description"},null)]})]})]})}});export{Te as default};