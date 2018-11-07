Ext.define('desktop.app.eims.school.ResourceLibrary',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.ResourceLibrary',
	moduleName:"school",//请求模块名称
	controllersName:"ResourceLibraries",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.school.model.ResourceLibrary';
	},
	getSearchFieldHeight : function(){
		return 200;
	},
	getSearchFields : function(){
		return[		
		{
	        fieldLabel: '资源标题',
	        name: 'filter_LIKE_res_name',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '资源存储路径',
	        name: 'filter_LIKE_url',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '封面',
	        name: 'filter_LIKE_res_cover',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '资源格式',
	        name: 'filter_LIKE_res_type',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '资源分类名称',
	        name: 'filter_LIKE_res_typeName',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '创建时间',
	        name: 'filter_LIKE_create_date',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '更新时间',
	        name: 'filter_LIKE_update_date',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '更新人',
	        name: 'filter_LIKE_update_by',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '创建人',
	        name: 'filter_LIKE_create_by',	       
	        anchor:'100%'  
	    }
	    ]
	},	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),					
			{
				text:'资源标题',
			    dataIndex:'res_name',
			    width:100,
				sortable:true	
			},		
			{
				text:'资源存储路径',
			    dataIndex:'url',
			    width:100,
				sortable:true	
			},		
			{
				text:'封面',
			    dataIndex:'res_cover',
			    width:100,
				sortable:true	
			},		
			{
				text:'资源格式',
			    dataIndex:'res_type',
			    width:100,
				sortable:true	
			},		
			{
				text:'资源分类名称',
			    dataIndex:'res_typeName',
			    width:100,
				sortable:true	
			},		
			{
				text:'创建时间',
			    dataIndex:'create_date',
			    width:100,
				sortable:true	
			},		
			{
				text:'更新时间',
			    dataIndex:'update_date',
			    width:100,
				sortable:true	
			},		
			{
				text:'更新人',
			    dataIndex:'update_by',
			    width:100,
				sortable:true	
			},		
			{
				text:'创建人',
			    dataIndex:'create_by',
			    width:100,
				sortable:true	
			}	
		];
		return columns;
	},
	getWindowFormItems:function(){
		var me=this;
		return[{
		    	xtype:'hidden',
		    	name:'id'
		    },		    
		    {
		        fieldLabel: '资源标题名称',
		        name: 'res_name',
		        allowBlank:false,
		        emptyText:'资源标题名称',
		        msgTarget:'资源标题名称',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '资源存储路径',
		        name: 'url',
		        allowBlank:false,
		        emptyText:'资源存储路径',
		        msgTarget:'资源存储路径',
		        anchor:'100%',
		        fieldCls:'folder',
		        listeners:{
		        	scope:this,
		        	focus:function(textField){
		        		me.createResourcesBrowseWindow(textField);
		        	}
		        }
		    },
		    {
		        fieldLabel: '封面',
		        name: 'res_cover',		        
		        emptyText:'封面',
		        msgTarget:'封面',
		        anchor:'100%',
		        fieldCls:'folder',
		        listeners:{
		        	scope:this,
		        	focus:function(textField){
		        		me.createResourcesBrowseWindow(textField);
		        	}
		        }
		    },
		    {
		        fieldLabel: '资源格式',
		        name: 'res_type',		       
		        emptyText:'资源格式',
		        msgTarget:'资源格式',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '资源分类名称',
		        name: 'res_typeName',		      
		        emptyText:'资源分类名称',
		        msgTarget:'资源分类名称',
		        anchor:'100%'  
		    },
		    {		       
		        name: 'create_date',		       
		        xtype:'hidden'	       
		    },
		    {
		    	xtype:'hidden',		       
		        name: 'update_date'       
		    },
		    {
		    	xtype:'hidden',
		        name: 'update_by'	       
		    },
		    {
		    	xtype:'hidden',
		        name: 'create_by'	       
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                       
                '<p><b>资源标题名称:</b> {res_name}</p><br>',              
                '<p><b>资源存储路径:</b> {url}</p><br>',              
                '<p><b>封面:</b> {res_cover}</p><br>',              
                '<p><b>资源格式:</b> {res_type}</p><br>',              
                '<p><b>资源分类名称:</b> {res_typeName}</p><br>',              
                '<p><b>创建时间:</b> {create_date}</p><br>',              
                '<p><b>更新时间:</b> {update_date}</p><br>',              
                '<p><b>更新人:</b> {update_by}</p><br>',              
                '<p><b>创建人:</b> {create_by}</p><br>'             
           );
		return tpl;
	},
	createResourcesBrowseWindow:function(textField){
		var win =Ext.create('desktop.app.eims.school.ResourcesBrowseWindow',{
			textField:textField
		});
		win.show();
		return win;
	}
});
Ext.define('desktop.app.eims.school.model.ResourceLibrary',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'string'},	   
	        {name:'res_name',type: 'string'},	   
	        {name:'url',type: 'string'},	   
	        {name:'res_cover',type: 'string'},	   
	        {name:'res_type',type: 'string'},	   
	        {name:'res_typeName',type: 'string'},	   
	        {name:'create_date',type: 'string'},	   
	        {name:'update_date',type: 'string'},	   
	        {name:'update_by',type: 'string'},	   
	        {name:'create_by',type: 'string'}  
	       ]
});