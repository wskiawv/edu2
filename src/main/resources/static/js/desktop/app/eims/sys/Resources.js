Ext.define('desktop.app.eims.sys.Resources',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.Resources',
	moduleName:"sys",//请求模块名称
	controllersName:"Resourceses",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.sys.model.Resources';
	},
	getSearchFieldHeight : function(){
		return 120;
	},
	getSearchFields : function(){
		return[		
		{
	        fieldLabel: '资源名称',
	        name: 'filter_LIKE_resourcesName',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '资源代码',
	        name: 'filter_LIKE_resourcesCode',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: 'url',
	        name: 'filter_LIKE_url',	       
	        anchor:'100%'  
	    }
	    ]
	},	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),					
			{
				text:'资源名称',
			    dataIndex:'resourcesName',
			    width:100,
				sortable:true	
			},		
			{
				text:'资源代码',
			    dataIndex:'resourcesCode',
			    width:100,
				sortable:true	
			},		
			{
				text:'url',
			    dataIndex:'url',
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
		        fieldLabel: '资源名称',
		        name: 'resourcesName',
		        allowBlank:false,
		        emptyText:'resourcesName',
		        msgTarget:'resourcesName',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '资源代码',
		        name: 'resourcesCode',
		        allowBlank:false,
		        emptyText:'resourcesCode',
		        msgTarget:'resourcesCode',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'url',
		        name: 'url',
		        allowBlank:false,
		        emptyText:'url',
		        msgTarget:'url',
		        anchor:'100%'  
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                           
                '<p><b>资源名称:</b> {resourcesName}</p><br>',              
                '<p><b>资源代码:</b> {resourcesCode}</p><br>',              
                '<p><b>url:</b> {url}</p><br>'            
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.sys.model.Resources',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'string'},	   
	        {name:'resourcesName',type: 'string'},	   
	        {name:'resourcesCode',type: 'string'},	   
	        {name:'url',type: 'string'}	   
	       ]
});