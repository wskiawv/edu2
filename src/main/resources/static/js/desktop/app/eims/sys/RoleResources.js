Ext.define('desktop.app.eims.sys.RoleResources',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.RoleResources',
	moduleName:"sys",//请求模块名称
	controllersName:"RoleResourceses",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.sys.model.RoleResources';
	},
	getSearchFieldHeight : function(){
		return 120;
	},
	getSearchFields : function(){
		return[		
		{
	        fieldLabel: 'roleId',
	        name: 'filter_LIKE_roleId',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: 'resourcesId',
	        name: 'filter_LIKE_resourcesId',	       
	        anchor:'100%'  
	    },
	    ]
	},	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),					
			{
				text:'roleId',
			    dataIndex:'roleId',
			    width:100,
				sortable:true	
			},		
			{
				text:'resourcesId',
			    dataIndex:'resourcesId',
			    width:100,
				sortable:true	
			},		
		];
		return columns;
	},
	getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'id'
		    },		   
		    {
		        fieldLabel: 'roleId',
		        name: 'roleId',
		        allowBlank:false,
		        emptyText:'roleId',
		        msgTarget:'roleId',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'resourcesId',
		        name: 'resourcesId',
		        allowBlank:false,
		        emptyText:'resourcesId',
		        msgTarget:'resourcesId',
		        anchor:'100%'  
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                         
                '<p><b>roleId:</b> {roleId}</p><br>',              
                '<p><b>resourcesId:</b> {resourcesId}</p><br>'             
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.sys.model.RoleResources',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'int'},	   
	        {name:'roleId',type: 'string'},	   
	        {name:'resourcesId',type: 'string'}	   
	       ]
});