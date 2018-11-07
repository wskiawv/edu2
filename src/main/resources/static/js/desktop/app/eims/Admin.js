Ext.define('desktop.app.eims.Admin',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.Admin',
	moduleName:"sys",//请求模块名称
	controllersName:"Admins",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.model.Admin';
	},
	getSearchFieldHeight : function(){
		return 120;
	},
	getSearchFields : function(){
		return[
		{
	        fieldLabel: '角色名称',
	        name: 'filter_LIKE_id',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '角色名称',
	        name: 'filter_LIKE_name',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '角色名称',
	        name: 'filter_LIKE_password',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '角色名称',
	        name: 'filter_LIKE_create_datetime',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '角色名称',
	        name: 'filter_LIKE_email',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '角色名称',
	        name: 'filter_LIKE_phone',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '角色名称',
	        name: 'filter_LIKE_qq',	       
	        anchor:'100%'  
	    },
	    ]
	},
	getFields:function(){
		return [
				{name:'id'},
				{name:'name'},
				{name:'password'},
				{name:'create_datetime'},
				{name:'email'},
				{name:'phone'},
				{name:'qq'},
	       ];	
	},
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),
			{
				text:'id',
			    dataIndex:'id',
			    width:100,
				sortable:true	
			},		
			{
				text:'name',
			    dataIndex:'name',
			    width:100,
				sortable:true	
			},		
			{
				text:'password',
			    dataIndex:'password',
			    width:100,
				sortable:true	
			},		
			{
				text:'create_datetime',
			    dataIndex:'create_datetime',
			    width:100,
				sortable:true	
			},		
			{
				text:'email',
			    dataIndex:'email',
			    width:100,
				sortable:true	
			},		
			{
				text:'phone',
			    dataIndex:'phone',
			    width:100,
				sortable:true	
			},		
			{
				text:'qq',
			    dataIndex:'qq',
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
		        fieldLabel: 'id',
		        name: 'id',
		        allowBlank:false,
		        emptyText:'id',
		        msgTarget:'id',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'name',
		        name: 'name',
		        allowBlank:false,
		        emptyText:'name',
		        msgTarget:'name',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'password',
		        name: 'password',
		        allowBlank:false,
		        emptyText:'password',
		        msgTarget:'password',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'create_datetime',
		        name: 'create_datetime',
		        allowBlank:false,
		        emptyText:'create_datetime',
		        msgTarget:'create_datetime',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'email',
		        name: 'email',
		        allowBlank:false,
		        emptyText:'email',
		        msgTarget:'email',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'phone',
		        name: 'phone',
		        allowBlank:false,
		        emptyText:'phone',
		        msgTarget:'phone',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'qq',
		        name: 'qq',
		        allowBlank:false,
		        emptyText:'qq',
		        msgTarget:'qq',
		        anchor:'100%'  
		    },
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(
                '<p><b>id:</b> {id}</p><br>',              
                '<p><b>name:</b> {name}</p><br>',              
                '<p><b>password:</b> {password}</p><br>',              
                '<p><b>create_datetime:</b> {create_datetime}</p><br>',              
                '<p><b>email:</b> {email}</p><br>',              
                '<p><b>phone:</b> {phone}</p><br>',              
                '<p><b>qq:</b> {qq}</p>'             
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.model.Admin',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'string'},	   
	        {name:'name',type: 'string'},	   
	        {name:'password',type: 'string'},	   
	        {name:'create_datetime',type: 'string'},	   
	        {name:'email',type: 'string'},	   
	        {name:'phone',type: 'string'},	   
	        {name:'qq',type: 'string'}	   
	       ]
});