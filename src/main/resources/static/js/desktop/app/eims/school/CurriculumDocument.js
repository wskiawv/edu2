Ext.define('desktop.app.eims.school.CurriculumDocument',{
	extend:'desktop.app.comm.CRUDRowEditPanel',
	alias:'widget.CurriculumDocument',
	moduleName:"school",//请求模块名称
	controllersName:"CurriculumDocuments",//请求控制器名称
	editButtonDisplay:false,
	config:{
		curriculumId:null,
	},
	getStoreModel : function(){
		return 'desktop.app.eims.school.model.CurriculumDocument';
	},
	getSearchFieldHeight : function(){
		return 200;
	},
	getSearchFields : function(){
		return[		
		{
	        fieldLabel: '课程',
	        name: 'filter_LIKE_curriculumId',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '课件名称',
	        name: 'filter_LIKE_attName',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '课件',
	        name: 'filter_LIKE_url',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '创建用户',
	        name: 'filter_LIKE_create_by',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '创建时间',
	        name: 'filter_LIKE_create_date',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '更新用户',
	        name: 'filter_LIKE_update_by',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '更新时间',
	        name: 'filter_LIKE_update_date',	       
	        anchor:'100%'  
	    }
	    ]
	},	
	getGridColumns:function(){
		var me=this;
		var columns = [Ext.create('Ext.grid.RowNumberer'),				
			{
				text:'课程',
			    dataIndex:'curriculumId',
			    width:100,
			    editor: {
                    allowBlank: false
                },
				sortable:true	
			},		
			{
				text:'课件名称',
			    dataIndex:'attName',
			    width:100,
			    editor: {
                    allowBlank: false
                },
				sortable:true	
			},		
			{
				text:'课件',
			    dataIndex:'url',
			    width:100,
			    editor: {
                    allowBlank: false,
                	listeners:{
    		        	scope:this,
    		        	focus:function(textField){
    		        		me.createResourcesBrowseWindow(textField);
    		        	}
    		        }
                },
				sortable:true	
			},		
			{
				text:'创建用户',
			    dataIndex:'create_by',
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
				text:'更新用户',
			    dataIndex:'update_by',
			    width:100,			    
				sortable:true	
			},		
			{
				text:'更新时间',
			    dataIndex:'update_date',
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
		        fieldLabel: '课程',
		        name: 'curriculumId',
		        allowBlank:false,
		        emptyText:'课程',
		        msgTarget:'curriculumId',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'attName',
		        name: 'attName',
		        allowBlank:false,
		        emptyText:'attName',
		        msgTarget:'attName',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'url',
		        name: 'url',
		        allowBlank:false,
		        emptyText:'url',
		        msgTarget:'url',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'create_by',
		        name: 'create_by',
		        allowBlank:false,
		        emptyText:'create_by',
		        msgTarget:'create_by',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'create_date',
		        name: 'create_date',
		        allowBlank:false,
		        emptyText:'create_date',
		        msgTarget:'create_date',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'update_by',
		        name: 'update_by',
		        allowBlank:false,
		        emptyText:'update_by',
		        msgTarget:'update_by',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'update_date',
		        name: 'update_date',
		        allowBlank:false,
		        emptyText:'update_date',
		        msgTarget:'update_date',
		        anchor:'100%'  
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                      
                '<p><b>课程:</b> {curriculumId}</p><br>',              
                '<p><b>课件名称:</b> {attName}</p><br>',              
                '<p><b>课件:</b> {url}</p><br>',              
                '<p><b>创建用户:</b> {create_by}</p><br>',              
                '<p><b>创建时间:</b> {create_date}</p><br>',              
                '<p><b>更新用户:</b> {update_by}</p><br>',              
                '<p><b>更新时间:</b> {update_date}</p><br>'              
           );
		return tpl;
	},
	createResourcesBrowseWindow:function(textField){
		var win =Ext.create('desktop.app.eims.school.ResourcesBrowseWindow',{
			textField:textField
		});
		win.show();
		return win;
	},
});
Ext.define('desktop.app.eims.school.model.CurriculumDocument',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'string'},	   
	        {name:'curriculumId',type: 'string'},	   
	        {name:'attName',type: 'string'},	   
	        {name:'url',type: 'string'},	   
	        {name:'create_by',type: 'string'},	   
	        {name:'create_date',type: 'string'},	   
	        {name:'update_by',type: 'string'},	   
	        {name:'update_date',type: 'string'}	   
	       ]
});