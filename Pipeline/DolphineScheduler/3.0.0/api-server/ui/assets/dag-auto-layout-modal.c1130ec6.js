import{M as R}from"./index.20e11ec3.js";import{a as L,d as A,u as C,c as b,_ as W}from"./index.c5429249.js";import{i as B,a as T,b as S,g as U,l as H,t as V,n as X}from"./gForce.96ee147a.js";import{_ as $}from"./lodash.084a01e7.js";import{X as J,a as q}from"./dag-config.11d87af9.js";/* empty css                 */import{N as K}from"./Form.13999875.js";import{N as _}from"./FormItem.51e71cc3.js";import{N as Q}from"./RadioGroup.47f9a37a.js";import{N as D}from"./RadioButton.2ddd4a35.js";import{N as j}from"./InputNumber.d8a1dfa4.js";class F{constructor(){this.nodes=[],this.edges=[],this.combos=[],this.positions=[],this.destroyed=!1,this.onLayoutEnd=()=>{}}layout(e){return this.init(e),this.execute(!0)}init(e){this.nodes=e.nodes||[],this.edges=e.edges||[],this.combos=e.combos||[]}execute(e){}executeWithWorker(){}getDefaultCfg(){return{}}updateCfg(e){e&&Object.assign(this,e)}getType(){return"base"}destroy(){this.nodes=null,this.edges=null,this.combos=null,this.positions=null,this.destroyed=!0}}const Y=h=>typeof h=="string",I=Array.isArray,N=(h,e)=>{const t=h[e];return B(t)?t.cell:t},Z=(h,e,t)=>{const o=[];for(let a=0;a<h;a++)o[a]=0;return t&&t.forEach(a=>{const c=N(a,"source"),l=N(a,"target");c&&(o[e[c]]+=1),l&&(o[e[l]]+=1)}),o};class ee extends F{constructor(e){super(),this.begin=[0,0],this.preventOverlap=!0,this.preventOverlapPadding=10,this.condense=!1,this.sortBy="degree",this.nodeSize=30,this.nodes=[],this.edges=[],this.width=300,this.height=300,this.row=0,this.col=0,this.cellWidth=0,this.cellHeight=0,this.cellUsed={},this.id2manPos={},this.onLayoutEnd=()=>{},this.updateCfg(e)}getDefaultCfg(){return{begin:[0,0],preventOverlap:!0,preventOverlapPadding:10,condense:!1,rows:void 0,cols:void 0,position:void 0,sortBy:"degree",nodeSize:30}}execute(){const e=this,t=e.nodes,o=e.edges,a=t.length,c=e.begin;if(a===0)return e.onLayoutEnd&&e.onLayoutEnd(),{nodes:t,edges:o};if(a===1)return t[0].x=c[0],t[0].y=c[1],e.onLayoutEnd&&e.onLayoutEnd(),{nodes:t,edges:o};const l=[];t.forEach(n=>{l.push(n)});const p={};if(l.forEach((n,i)=>{p[n.id]=i}),(e.sortBy==="degree"||!Y(e.sortBy)||l[0][e.sortBy]===void 0)&&(e.sortBy="degree",T(t[0].degree))){const n=Z(l.length,p,o);l.forEach((i,d)=>{i.degree=n[d]})}l.sort((n,i)=>i[e.sortBy]-n[e.sortBy]),!e.width&&typeof window!="undefined"&&(e.width=window.innerWidth),!e.height&&typeof window!="undefined"&&(e.height=window.innerHeight);const r=e.rows,y=e.cols!=null?e.cols:e.columns;if(e.cells=a,r!=null&&y!=null?(e.rows=r,e.cols=y):r!=null&&y==null?(e.rows=r,e.cols=Math.ceil(e.cells/e.rows)):r==null&&y!=null?(e.cols=y,e.rows=Math.ceil(e.cells/e.cols)):(e.splits=Math.sqrt(e.cells*e.height/e.width),e.rows=Math.round(e.splits),e.cols=Math.round(e.width/e.height*e.splits)),e.cols*e.rows>e.cells){const n=e.small(),i=e.large();(n-1)*i>=e.cells?e.small(n-1):(i-1)*n>=e.cells&&e.large(i-1)}else for(;e.cols*e.rows<e.cells;){const n=e.small(),i=e.large();(i+1)*n>=e.cells?e.large(i+1):e.small(n+1)}e.cellWidth=e.width/e.cols,e.cellHeight=e.height/e.rows,e.condense&&(e.cellWidth=0,e.cellHeight=0),e.preventOverlap&&l.forEach(n=>{(!n.x||!n.y)&&(n.x=0,n.y=0);let i,d;I(n.size)?(i=n.size[0],d=n.size[1]):S(n.size)?(i=n.size,d=n.size):B(n.size)&&(i=n.size.width,d=n.size.height),(i===void 0||d===void 0)&&(I(e.nodeSize)?(i=e.nodeSize[0],d=e.nodeSize[1]):S(e.nodeSize)?(i=e.nodeSize,d=e.nodeSize):(i=30,d=30));const f=e.preventOverlapPadding,v=i+f,s=d+f;e.cellWidth=Math.max(e.cellWidth,v),e.cellHeight=Math.max(e.cellHeight,s)}),e.cellUsed={},e.row=0,e.col=0,e.id2manPos={};for(let n=0;n<l.length;n++){const i=l[n];let d;if(e.position&&(d=e.position(i)),d&&(d.row!==void 0||d.col!==void 0)){const f={row:d.row,col:d.col};if(f.col===void 0)for(f.col=0;e.used(f.row,f.col);)f.col++;else if(f.row===void 0)for(f.row=0;e.used(f.row,f.col);)f.row++;e.id2manPos[i.id]=f,e.use(f.row,f.col)}e.getPos(i)}return e.onLayoutEnd&&e.onLayoutEnd(),{edges:o,nodes:l}}small(e){const t=this;let o;const a=t.rows||5,c=t.cols||5;return e==null?o=Math.min(a,c):Math.min(a,c)===t.rows?t.rows=e:t.cols=e,o}large(e){const t=this;let o;const a=t.rows||5,c=t.cols||5;return e==null?o=Math.max(a,c):Math.max(a,c)===t.rows?t.rows=e:t.cols=e,o}used(e,t){return this.cellUsed[`c-${e}-${t}`]||!1}use(e,t){const o=this;o.cellUsed[`c-${e}-${t}`]=!0}moveToNextCell(){const e=this,t=e.cols||5;e.col++,e.col>=t&&(e.col=0,e.row++)}getPos(e){const t=this,o=t.begin,a=t.cellWidth,c=t.cellHeight;let l,p;const r=t.id2manPos[e.id];if(r)l=r.col*a+a/2+o[0],p=r.row*c+c/2+o[1];else{for(;t.used(t.row,t.col);)t.moveToNextCell();l=t.col*a+a/2+o[0],p=t.row*c+c/2+o[1],t.use(t.row,t.col),t.moveToNextCell()}e.x=l,e.y=p}getType(){return"grid"}}var M={graphlib:U,layout:H,util:{time:V,notime:X}};class te extends F{constructor(e){super(),this.rankdir="TB",this.nodesep=50,this.ranksep=50,this.controlPoints=!1,this.sortByCombo=!1,this.edgeLabelSpace=!0,this.nodes=[],this.edges=[],this.onLayoutEnd=()=>{},this.layoutNode=t=>{const o=this,{nodes:a}=o,c=a.find(l=>l.id===t);return c?c.layout!==!1:!0},this.updateCfg(e)}getDefaultCfg(){return{rankdir:"TB",align:void 0,nodeSize:void 0,nodesepFunc:void 0,ranksepFunc:void 0,nodesep:50,ranksep:50,controlPoints:!1}}execute(){const e=this,{nodes:t,nodeSize:o,rankdir:a,combos:c,begin:l}=e;if(!t)return;const p=e.edges||[],r=new M.graphlib.Graph({multigraph:!0,compound:!0});let y;o?I(o)?y=()=>o:y=()=>[o,o]:y=s=>s.size?I(s.size)?s.size:B(s.size)?[s.size.width||40,s.size.height||40]:[s.size,s.size]:[40,40];let n=O(e.nodesepFunc,e.nodesep,50),i=O(e.ranksepFunc,e.ranksep,50);(a==="LR"||a==="RL")&&(n=O(e.ranksepFunc,e.ranksep,50),i=O(e.nodesepFunc,e.nodesep,50)),r.setDefaultEdgeLabel(()=>({})),r.setGraph(e);const d={};t.filter(s=>s.layout!==!1).forEach(s=>{const g=y(s),u=i(s),m=n(s),w=g[0]+2*m,x=g[1]+2*u,E=s.layer;S(E)?r.setNode(s.id,{width:w,height:x,layer:E}):r.setNode(s.id,{width:w,height:x}),this.sortByCombo&&s.comboId&&(d[s.comboId]||(d[s.comboId]=!0,r.setNode(s.comboId,{})),r.setParent(s.id,s.comboId))}),this.sortByCombo&&c&&c.forEach(s=>{!s.parentId||(d[s.parentId]||(d[s.parentId]=!0,r.setNode(s.parentId,{})),r.setParent(s.id,s.parentId))}),p.forEach(s=>{const g=N(s,"source"),u=N(s,"target");this.layoutNode(g)&&this.layoutNode(u)&&r.setEdge(g,u,{weight:s.weight||1})});let f;e.preset&&(f=new M.graphlib.Graph({multigraph:!0,compound:!0}),e.preset.nodes.forEach(s=>{f==null||f.setNode(s.id,s)})),M.layout(r,{prevGraph:f,edgeLabelSpace:e.edgeLabelSpace,keepNodeOrder:Boolean(!!e.nodeOrder),nodeOrder:e.nodeOrder});const v=[0,0];if(l){let s=1/0,g=1/0;r.nodes().forEach(u=>{const m=r.node(u);s>m.x&&(s=m.x),g>m.y&&(g=m.y)}),r.edges().forEach(u=>{r.edge(u).points.forEach(w=>{s>w.x&&(s=w.x),g>w.y&&(g=w.y)})}),v[0]=l[0]-s,v[1]=l[1]-g}return r.nodes().forEach(s=>{const g=r.node(s),u=t.findIndex(m=>m.id===s);!t[u]||(t[u].x=g.x+v[0],t[u].y=g.y+v[1],t[u]._order=g._order)}),r.edges().forEach(s=>{const g=r.edge(s),u=p.findIndex(m=>{const w=N(m,"source"),x=N(m,"target");return w===s.v&&x===s.w});e.edgeLabelSpace&&e.controlPoints&&p[u].type!=="loop"&&(p[u].controlPoints=g.points.slice(1,g.points.length-1),p[u].controlPoints.forEach(m=>{m.x+=v[0],m.y+=v[1]}))}),e.onLayoutEnd&&e.onLayoutEnd(),{nodes:t,edges:p}}getType(){return"dagre"}}function O(h,e,t){let o;return h?o=h:S(e)?o=()=>e:o=()=>t,o}var z=(h=>(h.GRID="grid",h.DAGRE="dagre",h))(z||{});function ge(h){const e={cols:0,nodesep:50,padding:50,ranksep:50,rows:0,type:"dagre"},{graph:t}=h,o=L(),a=L({...e}),c=L(!1),l=n=>{typeof n=="boolean"?c.value=n:c.value=!c.value};function p(n){n||(n=e);const i=t==null?void 0:t.value;if(!i)return;i.cleanSelection();let d=null;n.type==="dagre"?d=new te({type:"dagre",rankdir:"LR",align:"UL",ranksepFunc:u=>{const m=i.getOutgoingEdges(u.id);let w=0;return m&&m.length>0&&m.forEach(x=>{const E=i.findViewByCell(x),P=E==null?void 0:E.findAttr("width",$.get(E,["labelSelectors","0","body"],null)),G=P?+P:0;w=Math.max(w,G)}),n.ranksep+w},nodesep:n.nodesep,controlPoints:!0}):n.type==="grid"&&(d=new ee({type:"grid",preventOverlap:!0,preventOverlapPadding:n.padding,sortBy:"_index",rows:n.rows||void 0,cols:n.cols||void 0,nodeSize:220}));const f=i.toJSON(),v=f.cells.filter(u=>u.shape===J).map(u=>({...u,_index:-u.id})),s=f.cells.filter(u=>u.shape===q),g=d==null?void 0:d.layout({nodes:v,edges:s});i.fromJSON(g)}function r(){o.value&&o.value.validate(n=>{n||(p(a.value),l(!1))})}function y(){l(!1)}return{format:p,toggle:l,visible:c,formRef:o,formValue:a,cancel:y,submit:r}}function k(h){return typeof h=="function"||Object.prototype.toString.call(h)==="[object Object]"&&!W(h)}const se={visible:{type:Boolean,default:!1},formValue:{type:Object,default:L()},formRef:{type:Object,default:L()},submit:{type:Function,default:()=>{}},cancel:{type:Function,default:()=>{}}};var oe=A({name:"dag-format-modal",props:se,setup(h,e){const{t}=C(),{formValue:o,formRef:a,submit:c,cancel:l}=h;return()=>{let p,r;return b(R,{show:h.visible,title:t("project.dag.format"),onConfirm:c,onCancel:l,autoFocus:!1},{default:()=>[b(K,{model:o.value,rules:{},size:"medium",ref:a},{default:()=>[b(_,{label:t("project.dag.layout_type"),path:"type"},{default:()=>[b(Q,{value:o.value.type,"onUpdate:value":y=>o.value.type=y,name:"radiogroup"},{default:()=>[b(D,{value:z.GRID},k(p=t("project.dag.grid_layout"))?p:{default:()=>[p]}),b(D,{value:z.DAGRE},k(r=t("project.dag.dagre_layout"))?r:{default:()=>[r]})]})]}),o.value.type===z.GRID?b(_,{label:t("project.dag.rows"),path:"rows"},{default:()=>[b(j,{value:o.value.rows,"onUpdate:value":y=>o.value.rows=y,min:0},null)]}):null,o.value.type===z.GRID?b(_,{label:t("project.dag.cols"),path:"cols"},{default:()=>[b(j,{value:o.value.cols,"onUpdate:value":y=>o.value.cols=y,min:0},null)]}):null]})]})}}}),me=Object.freeze(Object.defineProperty({__proto__:null,default:oe},Symbol.toStringTag,{value:"Module"}));export{oe as D,me as d,ge as u};