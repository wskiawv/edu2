Ext.define('desktop.app.eims.sys.Menu',{
	extend:'Ext.tree.Panel',
	alias:'widget.Menu',
	 requires: [
	            'Ext.data.*',
	            'Ext.grid.*',
	            'Ext.tree.*',
	            'Ext.ux.CheckColumn'	            
	],   
	moduleName:"sys",//请求模块名称
	controllersName:"Menus",//请求控制器名称
	editWindowId:'eimsMenuEdit',
	
	
	initComponent :function (){
		var me=this;
        var url=appPath+"/sys/Roles/getRolePermissions?id="+0;
        var rootData=null;
        var i=0;
        var store=Ext.create("Ext.data.TreeStore",{
            model:desktop.app.eims.sys.MenuModel,
            autoLoad : false,
            autoSync : false,
            defaultRootText:'功能列表',
            
            defaultRootId:"root",
            proxy: {
                type: 'ajax',
                url:url,
                reader : {
                           type : 'json'                     
                           //root : 'result'
                       }
            },           
           listeners:{
        	   beforeload:function(store, operation){
        		   if(i==0){
         			   i++;
         			   return true;
         		   }
         		   return false;
        	   }
           }
       });
      Ext.apply(me,{
    	  store:store,
         // region:'center',
         // heigth:100%,
          rootVisible:false,
          multiSelect: true,
          useArrows: true,
          singleExpand: true,
          //selType: 'checkboxmodel',
          columns:[{
             xtype: 'treecolumn', //this is so we know which column will show the tree
             text: '功能列表',
             flex: 2,
             sortable: true,
             dataIndex: 'text'
          },{
             text:'模块名称',
             flex: 1,
             dataIndex: 'modulesName',
             sortable: true
          },{
              text:'方法名称',
              flex: 1,
              dataIndex: 'methodName',
              sortable: true
           },{
               text:'url',
               flex: 1,
               dataIndex: 'url',
               sortable: true
           }],
           listeners:{
               beforerender:function(win){
                   store.load();

               },
               afterrender:function(){
                   //store.load();
                   //treeGridPanel.expandAll();
               }
           }
      });
      me.callParent();
	}
	
	
});
Ext.define('desktop.app.eims.sys.MenuModel',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type:'int'},
            {name: 'text',type: 'string'},
            {name: 'leaf',type: 'boolean'},
            {name: 'iconCls',type: 'string'},
            {name: 'roleId',type: 'int'},
            {name: 'checked',type: 'boolean'},
            {name: 'expanded',type: 'boolean'},
            {name: 'qtip',type: 'string'},
            {name: 'xtype',type: 'string'},
            {name: 'url',type: 'string'},
            {name: 'modules',type: 'string'},
            {name: 'modulesName',type: 'string'},
            {name: 'method',type: 'string'},
            {name: 'methodName',type: 'string'}
	       ]
});