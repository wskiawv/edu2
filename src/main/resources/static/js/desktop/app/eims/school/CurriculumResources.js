Ext.define('desktop.app.eims.school.CurriculumResources',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.CurriculumResources',
	moduleName:"school",//请求模块名称
	controllersName:"CurriculumResourceses",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.school.model.CurriculumResources';
	},
	getSearchFieldHeight : function(){
		return 120;
	},
	getSearchFields : function(){
		return[		
		{
	        fieldLabel: '课程ID',
	        name: 'filter_LIKE_curriculumId',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '资源类型',
	        name: 'filter_LIKE_resourcesType',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '资源URL',
	        name: 'filter_LIKE_url',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '章节标题',
	        name: 'filter_LIKE_resourcesName',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '章节名称',
	        name: 'filter_LIKE_chapterName',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: 'pid',
	        name: 'filter_LIKE_pid',	       
	        anchor:'100%'  
	    }
	    
	    ]
	},
	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),				
			{
				text:'课程ID',
			    dataIndex:'curriculumId',
			    width:100,
				sortable:true	
			},		
			{
				text:'资源类型',
			    dataIndex:'resourcesType',
			    width:100,
				sortable:true	
			},		
			{
				text:'资源url',
			    dataIndex:'url',
			    width:100,
				sortable:true	
			},		
			{
				text:'章节标题',
			    dataIndex:'resourcesName',
			    width:100,
				sortable:true	
			}	
			,		
			{
				text:'章节名称',
			    dataIndex:'chapterName',
			    width:100,
				sortable:true	
			}
			,		
			{
				text:'父节点',
			    dataIndex:'pid',
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
		        fieldLabel: '课程ID',
		        name: 'curriculumId',
		        allowBlank:false,
		        emptyText:'curriculumId',
		        msgTarget:'curriculumId',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '资源类型',
		        name: 'resourcesType',		       
		        emptyText:'resourcesType',
		        msgTarget:'resourcesType',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '资源url',
		        name: 'url',		      
		        emptyText:'url',
		        msgTarget:'url',
		        anchor:'100%',
		        listeners:{
		        	scope:this,
		        	focus:function(textField){
		        		me.createResourcesBrowseWindow(textField);
		        	}
		        }
		    },
		    {
		        fieldLabel: '章节标题',
		        name: 'resourcesName',		        
		        emptyText:'章节标题',
		        msgTarget:'章节标题',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '章节名称',
		        name: 'chapterName',
		        allowBlank:false,
		        emptyText:'章节名称',
		        msgTarget:'章节名称',
		        anchor:'100%'  
		    }
		    ,
		    {
		        fieldLabel: '父节点',
		        name: 'pid',
		        allowBlank:false,
		        emptyText:'父节点',
		        msgTarget:'父节点',
		        anchor:'100%'  
		    }
		    ];
		    
	},	
	createResourcesBrowseWindow:function(textField){
		var win =Ext.create('desktop.app.eims.school.ResourcesBrowseWindow',{
			textField:textField
		});
		win.show();
		return win;
	},
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                        
                '<p><b>curriculumId:</b> {curriculumId}</p><br>',              
                '<p><b>resourcesType:</b> {resourcesType}</p><br>',              
                '<p><b>url:</b> {url}</p><br>',              
                '<p><b>resourcesName:</b> {resourcesName}</p><br>'              
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.school.model.CurriculumResources',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'string'},	   
	        {name:'curriculumId',type: 'string'},	   
	        {name:'resourcesType',type: 'string'},	   
	        {name:'url',type: 'string'},	   
	        {name:'resourcesName',type: 'string'},
	        {name:'chapterName',type: 'string'},
	        {name:'pid',type: 'int'}
	       ]
});