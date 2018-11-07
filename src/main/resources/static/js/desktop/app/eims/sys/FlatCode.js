Ext.define('desktop.app.eims.sys.FlatCode',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.FlatCode',
	moduleName:"sys",//请求模块名称
	controllersName:"FlatCodes",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.sys.model.FlatCode';
	},
	getSearchFieldHeight : function(){
		return 120;
	},
	getSearchFields : function(){
		return[		
		{
	        fieldLabel: '名称',
	        name: 'filter_LIKE_name',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '代码',
	        name: 'filter_LIKE_code',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '分类',
	        name: 'filter_LIKE_category',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '分类名称',
	        name: 'filter_LIKE_categoryName',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '描述',
	        name: 'filter_LIKE_description',	       
	        anchor:'100%'  
	    },
	    ]
	},
	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),			
			{
				text:'名称',
			    dataIndex:'name',
			    width:150,
				sortable:true	
			},		
			{
				text:'代码',
			    dataIndex:'code',
			    width:100,
				sortable:true	
			},		
			{
				text:'分类',
			    dataIndex:'category',
			    width:100,
				sortable:true	
			},		
			{
				text:'分类名称',
			    dataIndex:'categoryName',
			    width:200,
				sortable:true	
			},		
			{
				text:'描述',
			    dataIndex:'description',
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
		        fieldLabel: '名称',
		        name: 'name',
		        allowBlank:false,
		        emptyText:'name',
		        msgTarget:'name',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '代码',
		        name: 'code',
		        allowBlank:false,
		        emptyText:'code',
		        msgTarget:'code',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '分类',
		        name: 'category',
		        allowBlank:false,
		        emptyText:'category',
		        msgTarget:'category',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '分类名称',
		        name: 'categoryName',
		        allowBlank:false,
		        emptyText:'categoryName',
		        msgTarget:'categoryName',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '描述',
		        name: 'description',
		        allowBlank:false,
		        emptyText:'description',
		        msgTarget:'description',
		        anchor:'100%'  
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                              
                '<p><b>名称:</b> {name}</p><br>',              
                '<p><b>代码:</b> {code}</p><br>',              
                '<p><b>分类:</b> {category}</p><br>',              
                '<p><b>分类名称:</b> {categoryName}</p><br>',              
                '<p><b>描述:</b> {description}</p><br>'             
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.sys.model.FlatCode',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'int'},	   
	        {name:'name',type: 'string'},	   
	        {name:'code',type: 'string'},	   
	        {name:'category',type: 'string'},	   
	        {name:'categoryName',type: 'string'},	   
	        {name:'description',type: 'string'}	   
	       ]
});