import{u as R,r as U,a as T,br as O,d as L,w as D,t as C,c as t,F as b,_ as I,O as v}from"./index.c5429249.js";import{M as V}from"./index.20e11ec3.js";import{g as K,q as k,c as q,v as A,u as x,a as B}from"./index.3b5bce66.js";import{N as M}from"./Spin.1e9405a1.js";import{N as Q}from"./InputNumber.d8a1dfa4.js";import{N as j}from"./RadioGroup.47f9a37a.js";import{N}from"./Radio.5a2a0c2a.js";import{N as H}from"./Form.13999875.js";import{N as i}from"./FormItem.51e71cc3.js";import{a as $}from"./Select.e833ee40.js";import{N as u}from"./Input.97d5419b.js";import{N as G}from"./Space.e50db48f.js";import{N as Y}from"./Button.c43a24dc.js";import"./index.3b9f9e63.js";import"./keysOf.963e6f6c.js";import"./Card.c707a1eb.js";import"./use-rtl.c78ffbd8.js";import"./resolve-slot.7c241306.js";import"./index.16077d24.js";import"./index.3e01cddc.js";import"./flatten.a7868693.js";import"./Scrollbar.12b40993.js";import"./fade-in.cssr.9da325c6.js";import"./VResizeObserver.14b04bb7.js";import"./fade-in-scale-up.cssr.05526022.js";import"./utils.3eee947a.js";import"./is-browser.d3e5def6.js";import"./service.0215c8a4.js";import"./lodash.084a01e7.js";import"./use-compitable.b0459e69.js";import"./use-locale.be539345.js";import"./Add.e846b00c.js";import"./get-slot.c85d6606.js";import"./format-length.e7c2072e.js";import"./Selection.a106a9c5.js";import"./Popover.df2981b4.js";import"./next-frame-once.da993024.js";import"./Suffix.9ee1fead.js";function J(s){const{t:n}=R(),a={type:"MYSQL",name:"",note:"",host:"",port:w.MYSQL.defaultPort,principal:"",javaSecurityKrb5Conf:"",loginUserKeytabUsername:"",loginUserKeytabPath:"",userName:"",password:"",database:"",connectType:"",other:""},e=U({detailFormRef:T(),detailForm:{...a},requiredDataBase:!0,showConnectType:!1,showPrincipal:!1,rules:{name:{trigger:["input"],validator(){if(!e.detailForm.name)return new Error(n("datasource.datasource_name_tips"))}},host:{trigger:["input"],validator(){if(!e.detailForm.host)return new Error(n("datasource.ip_tips"))}},port:{trigger:["input"],validator(){if(!e.detailForm.port)return new Error(n("datasource.port_tips"))}},principal:{trigger:["input"],validator(){if(!e.detailForm.principal&&e.showPrincipal)return new Error(n("datasource.principal_tips"))}},userName:{trigger:["input"],validator(){if(!e.detailForm.userName)return new Error(n("datasource.user_name_tips"))}},database:{trigger:["input"],validator(){if(!e.detailForm.database&&e.requiredDataBase)return new Error(n("datasource.database_name_tips"))}},connectType:{trigger:["update"],validator(){if(!e.detailForm.connectType&&e.showConnectType)return new Error(n("datasource.oracle_connect_type_tips"))}},other:{trigger:["input","blur"],validator(){if(e.detailForm.other&&!O.isJson(e.detailForm.other))return new Error(n("datasource.jdbc_format_tips"))}}}});return{state:e,changeType:async(o,m)=>{e.detailForm.port=m.previousPort||m.defaultPort,e.detailForm.type=o,o==="ORACLE"&&!s&&(e.detailForm.connectType="ORACLE_SERVICE_NAME"),e.requiredDataBase=o!=="POSTGRESQL",e.showConnectType=o==="ORACLE",o==="HIVE"||o==="SPARK"?e.showPrincipal=await K():e.showPrincipal=!1},changePort:async()=>{if(!e.detailForm.type)return;const o=w[e.detailForm.type];o.previousPort=e.detailForm.port},resetFieldsValue:()=>{e.detailForm={...a}},setFieldsValue:o=>{e.detailForm={...e.detailForm,...o,other:o.other?JSON.stringify(o.other):o.other}},getFieldsValue:()=>e.detailForm}}const w={MYSQL:{value:"MYSQL",label:"MYSQL",defaultPort:3306},POSTGRESQL:{value:"POSTGRESQL",label:"POSTGRESQL",defaultPort:5432},HIVE:{value:"HIVE",label:"HIVE/IMPALA",defaultPort:1e4},SPARK:{value:"SPARK",label:"SPARK",defaultPort:10015},CLICKHOUSE:{value:"CLICKHOUSE",label:"CLICKHOUSE",defaultPort:8123},ORACLE:{value:"ORACLE",label:"ORACLE",defaultPort:1521},SQLSERVER:{value:"SQLSERVER",label:"SQLSERVER",defaultPort:1433},DB2:{value:"DB2",label:"DB2",defaultPort:5e4},PRESTO:{value:"PRESTO",label:"PRESTO",defaultPort:8080},REDSHIFT:{value:"REDSHIFT",label:"REDSHIFT",defaultPort:5439}},z=Object.values(w).map(s=>(s.class="options-datasource-type",s));function W(s){const{t:n}=R(),a=U({saving:!1,testing:!1,loading:!1});let e;const c=()=>{const l=s();return{...l,other:l.other?JSON.parse(l.other):null}};return{status:a,queryById:async l=>{if(a.loading)return{};a.loading=!0;const o=await k(l);return a.loading=!1,e=o.name,o},testConnect:async()=>{if(!a.testing){a.testing=!0;try{const l=await q(c());window.$message.success(l?l.msg:`${n("datasource.test_connect")} ${n("datasource.success")}`),a.testing=!1}catch{a.testing=!1}}},createOrUpdate:async l=>{const o=s();if(a.saving||!o.name)return!1;a.saving=!0;try{return e!==o.name&&await A({name:o.name}),l?await x(c(),l):await B(c()),a.saving=!1,!0}catch{return a.saving=!1,!1}}}}function P(s){return typeof s=="function"||Object.prototype.toString.call(s)==="[object Object]"&&!I(s)}const X={show:{type:Boolean,default:!1},id:{type:Number}},ke=L({name:"DetailModal",props:X,emits:["cancel","update"],setup(s,n){const{t:a}=R(),{state:e,changeType:c,changePort:f,resetFieldsValue:h,setFieldsValue:p,getFieldsValue:l}=J(s.id),{status:o,queryById:m,testConnect:_,createOrUpdate:S}=W(l),g=()=>{h(),n.emit("cancel")},E=async()=>{await e.detailFormRef.validate(),await S(s.id)&&(g(),n.emit("update"))},F=async()=>{await e.detailFormRef.validate(),_()},d=c,y=f;return D(()=>s.show,async()=>{s.show&&s.id&&p(await m(s.id)),s.show&&e.detailForm.type&&c(e.detailForm.type,w[e.detailForm.type])}),{t:a,...C(e),...C(o),onChangeType:d,onChangePort:y,onSubmit:E,onTest:F,onCancel:g}},render(){const{show:s,id:n,t:a,detailForm:e,rules:c,requiredDataBase:f,showConnectType:h,showPrincipal:p,loading:l,saving:o,testing:m,onChangeType:_,onChangePort:S,onCancel:g,onTest:E,onSubmit:F}=this;return t(V,{class:"dialog-create-data-source",show:s,title:`${a(n?"datasource.edit":"datasource.create")}${a("datasource.datasource")}`,onConfirm:F,confirmLoading:o||l,onCancel:g,confirmClassName:"btn-submit",cancelClassName:"btn-cancel"},{default:()=>{let d,y;return t(M,{show:l},{default:()=>[t(H,{rules:c,ref:"detailFormRef","require-mark-placement":"left","label-align":"left"},{default:()=>[t(i,{label:a("datasource.datasource"),path:"type","show-require-mark":!0},{default:()=>[t($,{class:"btn-data-source-type-drop-down",value:e.type,"onUpdate:value":r=>e.type=r,options:z,disabled:!!n,"on-update:value":_},null)]}),t(i,{label:a("datasource.datasource_name"),path:"name","show-require-mark":!0},{default:()=>[t(u,{class:"input-data-source-name",value:e.name,"onUpdate:value":r=>e.name=r,maxlength:60,placeholder:a("datasource.datasource_name_tips")},null)]}),t(i,{label:a("datasource.description"),path:"note"},{default:()=>[t(u,{class:"input-data-source-description",value:e.note,"onUpdate:value":r=>e.note=r,type:"textarea",placeholder:a("datasource.description_tips")},null)]}),t(i,{label:a("datasource.ip"),path:"host","show-require-mark":!0},{default:()=>[t(u,{class:"input-ip",value:e.host,"onUpdate:value":r=>e.host=r,type:"text",maxlength:255,placeholder:a("datasource.ip_tips")},null)]}),t(i,{label:a("datasource.port"),path:"port","show-require-mark":!0},{default:()=>[t(Q,{class:"input-port",value:e.port,"onUpdate:value":r=>e.port=r,"show-button":!1,placeholder:a("datasource.port_tips"),"on-blur":S,style:{width:"100%"}},null)]}),b(t(i,{label:"Principal",path:"principal","show-require-mark":!0},{default:()=>[t(u,{value:e.principal,"onUpdate:value":r=>e.principal=r,type:"text",placeholder:a("datasource.principal_tips")},null)]}),[[v,p]]),b(t(i,{label:"krb5.conf",path:"javaSecurityKrb5Conf"},{default:()=>[t(u,{value:e.javaSecurityKrb5Conf,"onUpdate:value":r=>e.javaSecurityKrb5Conf=r,type:"text",placeholder:a("datasource.krb5_conf_tips")},null)]}),[[v,p]]),b(t(i,{label:"keytab.username",path:"loginUserKeytabUsername"},{default:()=>[t(u,{value:e.loginUserKeytabUsername,"onUpdate:value":r=>e.loginUserKeytabUsername=r,type:"text",placeholder:a("datasource.keytab_username_tips")},null)]}),[[v,p]]),b(t(i,{label:"keytab.path",path:"loginUserKeytabPath"},{default:()=>[t(u,{value:e.loginUserKeytabPath,"onUpdate:value":r=>e.loginUserKeytabPath=r,type:"text",placeholder:a("datasource.keytab_path_tips")},null)]}),[[v,p]]),t(i,{label:a("datasource.user_name"),path:"userName","show-require-mark":!0},{default:()=>[t(u,{class:"input-username",value:e.userName,"onUpdate:value":r=>e.userName=r,type:"text",maxlength:60,placeholder:a("datasource.user_name_tips")},null)]}),t(i,{label:a("datasource.user_password"),path:"password"},{default:()=>[t(u,{class:"input-password",value:e.password,"onUpdate:value":r=>e.password=r,type:"password",placeholder:a("datasource.user_password_tips")},null)]}),t(i,{label:a("datasource.database_name"),path:"database","show-require-mark":f},{default:()=>[t(u,{class:"input-data-base",value:e.database,"onUpdate:value":r=>e.database=r,type:"text",maxlength:60,placeholder:a("datasource.database_name_tips")},null)]}),b(t(i,{label:a("datasource.oracle_connect_type"),path:"connectType","show-require-mark":!0},{default:()=>[t(j,{value:e.connectType,"onUpdate:value":r=>e.connectType=r},{default:()=>[t(G,null,{default:()=>[t(N,{value:"ORACLE_SERVICE_NAME"},P(d=a("datasource.oracle_service_name"))?d:{default:()=>[d]}),t(N,{value:"ORACLE_SID"},P(y=a("datasource.oracle_sid"))?y:{default:()=>[y]})]})]})]}),[[v,h]]),t(i,{label:a("datasource.jdbc_connect_parameters"),path:"other"},{default:()=>[t(u,{class:"input-jdbc-params",value:e.other,"onUpdate:value":r=>e.other=r,type:"textarea",autosize:{minRows:2},placeholder:`${a("datasource.format_tips")} {"key1":"value1","key2":"value2"...} ${a("datasource.connection_parameter")}`},null)]})]})]})},"btn-middle":()=>{let d;return t(Y,{class:"btn-test-connection",type:"primary",size:"small",onClick:E,loading:m||l},P(d=a("datasource.test_connect"))?d:{default:()=>[d]})}})}});export{ke as default};