Ext.define('desktop.app.eims.sys.UserRole',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.UserRole',
	moduleName:"sys",//请求模块名称
	controllersName:"UserRoles",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.sys.model.UserRole';
	},
	getSearchFieldHeight : function(){
		return 120;
	},
	getSearchFields : function(){
		return[		
		{
	        fieldLabel: 'userId',
	        name: 'filter_LIKE_userId',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: 'roleId',
	        name: 'filter_LIKE_roleId',	       
	        anchor:'100%'  
	    }]
	},	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),					
			{
				text:'userId',
			    dataIndex:'userId',
			    width:100,
				sortable:true	
			},		
			{
				text:'roleId',
			    dataIndex:'roleId',
			    width:100,
				sortable:true	
			}	
		];
		return columns;
	},
	getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'id'
		    },		    
		    {
		        fieldLabel: 'userId',
		        name: 'userId',
		        allowBlank:false,
		        emptyText:'userId',
		        msgTarget:'userId',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'roleId',
		        name: 'roleId',
		        allowBlank:false,
		        emptyText:'roleId',
		        msgTarget:'roleId',
		        anchor:'100%'  
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                         
                '<p><b>userId:</b> {userId}</p><br>',              
                '<p><b>roleId:</b> {roleId}</p><br>'              
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.sys.model.UserRole',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'int'},	   
	        {name:'userId',type: 'string'},	   
	        {name:'roleId',type: 'string'}	   
	       ]
});