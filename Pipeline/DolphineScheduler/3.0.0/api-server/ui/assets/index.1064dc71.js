import{s as u}from"./service.0215c8a4.js";function s(e){return u({url:"/queues",method:"get",params:e})}function n(e){return u({url:"/queues",method:"post",data:e})}function o(){return u({url:"/queues/list",method:"get"})}function i(e){return u({url:"/queues/verify",method:"post",data:e})}function a(e,t){return u({url:`/queues/${t.id}`,method:"put",data:e})}export{s as a,n as c,o as q,a as u,i as v};