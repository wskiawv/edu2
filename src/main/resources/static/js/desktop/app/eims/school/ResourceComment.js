Ext.define('desktop.app.eims.school.ResourceComment',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.ResourceComment',
	moduleName:"school",//请求模块名称
	controllersName:"ResourceComments",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.school.model.ResourceComment';
	},
	getSearchFieldHeight : function(){
		return 200;
	},
	getSearchFields : function(){
		return[		
		{
	        fieldLabel: 'res_id',
	        name: 'filter_LIKE_res_id',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: 'star',
	        name: 'filter_LIKE_star',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: 'datetime',
	        name: 'filter_LIKE_datetime',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: 'userId',
	        name: 'filter_LIKE_userId',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: 'content',
	        name: 'filter_LIKE_content',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: 'title',
	        name: 'filter_LIKE_title',	       
	        anchor:'100%'  
	    }
	    ]
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
				text:'res_id',
			    dataIndex:'res_id',
			    width:100,
				sortable:true	
			},		
			{
				text:'star',
			    dataIndex:'star',
			    width:100,
				sortable:true	
			},		
			{
				text:'datetime',
			    dataIndex:'datetime',
			    width:100,
				sortable:true	
			},		
			{
				text:'userId',
			    dataIndex:'userId',
			    width:100,
				sortable:true	
			},		
			{
				text:'content',
			    dataIndex:'content',
			    width:100,
				sortable:true	
			},		
			{
				text:'title',
			    dataIndex:'title',
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
		        fieldLabel: 'id',
		        name: 'id',
		        allowBlank:false,
		        emptyText:'id',
		        msgTarget:'id',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'res_id',
		        name: 'res_id',
		        allowBlank:false,
		        emptyText:'res_id',
		        msgTarget:'res_id',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'star',
		        name: 'star',
		        allowBlank:false,
		        emptyText:'star',
		        msgTarget:'star',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'datetime',
		        name: 'datetime',
		        allowBlank:false,
		        emptyText:'datetime',
		        msgTarget:'datetime',
		        anchor:'100%'  
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
		        fieldLabel: 'content',
		        name: 'content',
		        allowBlank:false,
		        emptyText:'content',
		        msgTarget:'content',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'title',
		        name: 'title',
		        allowBlank:false,
		        emptyText:'title',
		        msgTarget:'title',
		        anchor:'100%'  
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(
                '<p><b>id:</b> {id}</p><br>',              
                '<p><b>res_id:</b> {res_id}</p><br>',              
                '<p><b>star:</b> {star}</p><br>',              
                '<p><b>datetime:</b> {datetime}</p><br>',              
                '<p><b>userId:</b> {userId}</p><br>',              
                '<p><b>content:</b> {content}</p><br>',              
                '<p><b>title:</b> {title}</p><br>'             
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.school.model.ResourceComment',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'string'},	   
	        {name:'res_id',type: 'string'},	   
	        {name:'star',type: 'string'},	   
	        {name:'datetime',type: 'string'},	   
	        {name:'userId',type: 'string'},	   
	        {name:'content',type: 'string'},	   
	        {name:'title',type: 'string'}	   
	       ]
});