import{u as m,X as c,r as d,a as f,d as h,w as F,t as v,c as i}from"./index.c5429249.js";import{M as g}from"./index.20e11ec3.js";import{u as w}from"./index.8259a597.js";import{N as R}from"./Form.13999875.js";import{N as l}from"./FormItem.51e71cc3.js";import{N as u}from"./Input.97d5419b.js";import"./index.3b9f9e63.js";import"./Button.c43a24dc.js";import"./is-browser.d3e5def6.js";import"./use-rtl.c78ffbd8.js";import"./resolve-slot.7c241306.js";import"./keysOf.963e6f6c.js";import"./Card.c707a1eb.js";import"./index.16077d24.js";import"./index.3e01cddc.js";import"./flatten.a7868693.js";import"./Scrollbar.12b40993.js";import"./fade-in.cssr.9da325c6.js";import"./VResizeObserver.14b04bb7.js";import"./fade-in-scale-up.cssr.05526022.js";import"./utils.3eee947a.js";import"./Space.e50db48f.js";import"./get-slot.c85d6606.js";import"./service.0215c8a4.js";import"./lodash.084a01e7.js";import"./format-length.e7c2072e.js";import"./use-locale.be539345.js";import"./Suffix.9ee1fead.js";const p=(e="",r="")=>({id:-1,name:e,type:"FILE",description:r});function N(e,r){const{t}=m(),o=()=>{a.renameForm=Object.assign(c(a.renameForm),p())},a=d({renameFormRef:f(),renameForm:p(e,r),saving:!1,rules:{name:{required:!0,trigger:["input","blur"],validator(){if(a.renameForm.name==="")return new Error(t("resource.file.enter_name_tips"))}}}});return{state:a,resetForm:o}}function b(e){const{t:r}=m();return{handleRenameFile:async(o,a,n)=>{if(await e.renameFormRef.validate(),!e.saving){e.saving=!0;try{await w({...e.renameForm},e.renameForm.id),window.$message.success(r("resource.file.success")),e.saving=!1,o("updateList"),a(),n()}catch{e.saving=!1}}}}}const y={show:{type:Boolean,default:!1},id:{type:Number,default:-1},name:{type:String,default:""},description:{type:String,default:""}};var Y=h({name:"ResourceFileRename",props:y,emits:["updateList","update:show"],setup(e,r){const{state:t,resetForm:o}=N(e.name,e.description),{handleRenameFile:a}=b(t),n=()=>{r.emit("update:show",!1)},s=()=>{a(r.emit,n,o)};return F(()=>e.show,()=>{t.renameForm.id=e.id,t.renameForm.name=e.name,t.renameForm.description=e.description}),{hideModal:n,handleFile:s,...v(t)}},render(){const{t:e}=m();return i(g,{show:this.$props.show,title:e("resource.file.rename"),onCancel:this.hideModal,onConfirm:this.handleFile,confirmClassName:"btn-submit",cancelClassName:"btn-cancel",confirmLoading:this.saving},{default:()=>[i(R,{rules:this.rules,ref:"renameFormRef"},{default:()=>[i(l,{label:e("resource.file.name"),path:"name"},{default:()=>[i(u,{value:this.renameForm.name,"onUpdate:value":r=>this.renameForm.name=r,placeholder:e("resource.file.enter_name_tips"),class:"input-name"},null)]}),i(l,{label:e("resource.file.description"),path:"description"},{default:()=>[i(u,{type:"textarea",value:this.renameForm.description,"onUpdate:value":r=>this.renameForm.description=r,placeholder:e("resource.file.enter_description_tips"),class:"input-description"},null)]})]})]})}});export{Y as default};