import{u as D,ah as b,r as g,a as q,o as I,d as R,w as S,t as U,c as r,_ as A}from"./index.c5429249.js";import{l as C}from"./lodash.084a01e7.js";import{a as M}from"./index.d81654bf.js";import{q as $}from"./index.1064dc71.js";import{v as E,u as P,c as z}from"./index.f239614a.js";import{M as Z}from"./index.20e11ec3.js";import{N as V}from"./Form.13999875.js";import{N as l}from"./FormItem.51e71cc3.js";import{N as d}from"./Input.97d5419b.js";import{a as _}from"./Select.e833ee40.js";import{N as j}from"./RadioGroup.47f9a37a.js";import{N as L}from"./Space.e50db48f.js";import{N}from"./Radio.5a2a0c2a.js";import"./service.0215c8a4.js";import"./index.3b9f9e63.js";import"./Button.c43a24dc.js";import"./is-browser.d3e5def6.js";import"./use-rtl.c78ffbd8.js";import"./resolve-slot.7c241306.js";import"./keysOf.963e6f6c.js";import"./Card.c707a1eb.js";import"./index.16077d24.js";import"./index.3e01cddc.js";import"./flatten.a7868693.js";import"./Scrollbar.12b40993.js";import"./fade-in.cssr.9da325c6.js";import"./VResizeObserver.14b04bb7.js";import"./fade-in-scale-up.cssr.05526022.js";import"./utils.3eee947a.js";import"./format-length.e7c2072e.js";import"./use-locale.be539345.js";import"./Suffix.9ee1fead.js";import"./use-compitable.b0459e69.js";import"./Selection.a106a9c5.js";import"./Popover.df2981b4.js";import"./next-frame-once.da993024.js";import"./get-slot.c85d6606.js";function O(){const{t:s}=D(),t=b().getUserInfo.userType==="ADMIN_USER",u={userName:"",userPassword:"",tenantId:null,email:"",queue:"",phone:"",state:1};let n;const e=g({formRef:q(),formData:{...u},saving:!1,loading:!1,queues:[],tenants:[]}),h={userName:{trigger:["input","blur"],required:!0,validator(o,a){if(!a.trim())return new Error(s("security.user.username_tips"))}},userPassword:{trigger:["input","blur"],required:!0,validator(o,a){if(!a||!/^(?![0-9]+$)(?![a-z]+$)(?![A-Z]+$)(?![`~!@#$%^&*()_\-+=<>?:"{}|,./;'\\[\]·~！@#￥%……&*（）——\-+={}|《》？：“”【】、；‘’，。、]+$)[`~!@#$%^&*()_\-+=<>?:"{}|,./;'\\[\]·~！@#￥%……&*（）——\-+={}|《》？：“”【】、；‘’，。、0-9A-Za-z]{6,22}$/.test(a))return new Error(s("security.user.user_password_tips"))}},tenantId:{trigger:["input","blur"],required:!0,validator(o,a){if(t&&!a)return new Error(s("security.user.tenant_id_tips"))}},email:{trigger:["input","blur"],required:!0,validator(o,a){if(!a)return new Error(s("security.user.email_empty_tips"));if(!/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,}$/.test(a))return new Error(s("security.user.emial_correct_tips"))}},phone:{trigger:["input","blur"],validator(o,a){if(a&&!/^1(3|4|5|6|7|8)\d{9}$/.test(a))return new Error(s("security.user.phone_correct_tips"))}}},v=async()=>{const o=await $();e.queues=o.map(a=>({label:a.queueName,value:a.queueName})),e.queues.length&&(u.queue=e.queues[0].value,e.formData.queue=e.queues[0].value)},p=async()=>{const o=await M();e.tenants=o.map(a=>({label:a.tenantCode,value:a.id})),e.tenants.length&&(u.tenantId=e.tenants[0].value,e.formData.tenantId=e.tenants[0].value)},y=()=>{e.formData={...u}},c=async o=>{try{return await e.formRef.validate(),e.saving?!1:(e.saving=!0,n!==e.formData.userName&&await E({userName:e.formData.userName}),o?await P({id:o,...e.formData}):await z(e.formData),e.saving=!1,!0)}catch{return e.saving=!1,!1}},f=o=>{e.formData={...C.exports.pick(o,["userName","tenantId","email","queue","phone","state"]),userPassword:""},n=e.formData.userName};return I(async()=>{t&&(v(),p())}),{state:e,formRules:h,IS_ADMIN:t,onReset:y,onSave:c,onSetValues:f}}function w(s){return typeof s=="function"||Object.prototype.toString.call(s)==="[object Object]"&&!A(s)}const T={show:{type:Boolean,default:!1},currentRecord:{type:Object,default:{}}},Ie=R({name:"user-modal",props:T,emits:["cancel","update"],setup(s,i){const{t:m}=D(),{state:t,IS_ADMIN:u,formRules:n,onReset:e,onSave:h,onSetValues:v}=O(),p=()=>{e(),i.emit("cancel")},y=async()=>{var f;!await h((f=s.currentRecord)==null?void 0:f.id)||(p(),i.emit("update"))};return S(()=>s.show,()=>{var c;s.show&&((c=s.currentRecord)==null?void 0:c.id)&&v(s.currentRecord)}),{t:m,...U(t),IS_ADMIN:u,formRules:n,onCancel:p,onConfirm:y}},render(s){let i,m;const{t}=this,{currentRecord:u}=s;return r(Z,{show:this.show,title:`${t(u!=null&&u.id?"security.user.edit_user":"security.user.create_user")}`,onCancel:this.onCancel,confirmLoading:this.loading,onConfirm:this.onConfirm,confirmClassName:"btn-submit",cancelClassName:"btn-cancel"},{default:()=>[r(V,{ref:"formRef",model:this.formData,rules:this.formRules,labelPlacement:"left",labelAlign:"left",labelWidth:80},{default:()=>{var n;return[r(l,{label:t("security.user.username"),path:"userName"},{default:()=>[r(d,{class:"input-username",value:this.formData.userName,"onUpdate:value":e=>this.formData.userName=e,minlength:3,maxlength:39,placeholder:t("security.user.username_tips")},null)]}),!((n=this.currentRecord)!=null&&n.id)&&r(l,{label:t("security.user.user_password"),path:"userPassword"},{default:()=>[r(d,{class:"input-password",type:"password",value:this.formData.userPassword,"onUpdate:value":e=>this.formData.userPassword=e,placeholder:t("security.user.user_password_tips")},null)]}),this.IS_ADMIN&&r(l,{label:t("security.user.tenant_code"),path:"tenantId"},{default:()=>[r(_,{class:"select-tenant",options:this.tenants,value:this.formData.tenantId,"onUpdate:value":e=>this.formData.tenantId=e},null)]}),this.IS_ADMIN&&r(l,{label:t("security.user.queue"),path:"queue"},{default:()=>[r(_,{class:"select-queue",options:this.queues,value:this.formData.queue,"onUpdate:value":e=>this.formData.queue=e,placeholder:t("security.user.queue_tips")},null)]}),r(l,{label:t("security.user.email"),path:"email"},{default:()=>[r(d,{class:"input-email",value:this.formData.email,"onUpdate:value":e=>this.formData.email=e,placeholder:t("security.user.email_empty_tips")},null)]}),r(l,{label:t("security.user.phone"),path:"phone"},{default:()=>[r(d,{class:"input-phone",value:this.formData.phone,"onUpdate:value":e=>this.formData.phone=e,placeholder:t("security.user.phone_empty_tips")},null)]}),r(l,{label:t("security.user.state"),path:"state"},{default:()=>[r(j,{value:this.formData.state,"onUpdate:value":e=>this.formData.state=e},{default:()=>[r(L,null,{default:()=>[r(N,{value:1,class:"radio-state-enable"},w(i=this.t("security.user.enable"))?i:{default:()=>[i]}),r(N,{value:0,class:"radio-state-disable"},w(m=this.t("security.user.disable"))?m:{default:()=>[m]})]})]})]})]}})]})}});export{Ie as UserModal,Ie as default};