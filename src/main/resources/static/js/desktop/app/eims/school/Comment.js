Ext.define('desktop.app.eims.school.Comment',{
	extend:'desktop.app.comm.CRUDRowEditPanel',
	alias:'widget.Comment',
	moduleName:"school",//请求模块名称
	controllersName:"Comments",//请求控制器名称
	searchMethod:'find',
	
	getStoreModel : function(){
		return 'desktop.app.eims.school.model.Comment';
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
	        fieldLabel: '星标',
	        name: 'filter_LIKE_star',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '评论时间',
	        name: 'filter_LIKE_datetime',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '用户',
	        name: 'filter_LIKE_userName',
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学生ID',
	        name: 'filter_LIKE_studentid',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '评论内容',
	        name: 'filter_LIKE_content',	       
	        anchor:'100%'  
	    },
	    ]
	},	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),				
			{
				text:'课程ID',
			    dataIndex:'curriculumId',
			    width:100,
			    editor: {
                    allowBlank: false
                },
				sortable:true	
			},		
			{
				text:'星标',
			    dataIndex:'star',
			    width:100,
			    editor: {
                    allowBlank: false
                },
				sortable:true	
			},		
			{
				text:'评论时间',
			    dataIndex:'datetime',
			    width:100,
			    editor: {
                    //allowBlank: false,
                    format: 'Y-m-d H:i:s ',
        	        xtype:'datetimefield'
                },
				sortable:true	
			},		
			{
				text:'用户',
			    dataIndex:'userId',
			    width:100,
			    editor: {
                    allowBlank: false
                },
				sortable:true	
			},		
			/*{
				text:'学生ID',
			    dataIndex:'studentid',
			    width:100,
			    editor: {
                    allowBlank: false
                },
				sortable:true	
			},	*/	
			{
				text:'评论内容',
			    dataIndex:'content',
			    width:100,
			    editor: {
                    allowBlank: false
                },
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
		        fieldLabel: '课程ID',
		        name: 'curriculumId',
		        allowBlank:false,
		        emptyText:'课程ID',
		        msgTarget:'课程ID',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '星标',
		        name: 'star',
		        allowBlank:false,
		        emptyText:'星标',
		        msgTarget:'星标',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '评论时间',
		        name: 'datetime',
		        //allowBlank:false,
		        emptyText:'评论时间',
		        msgTarget:'评论时间',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '用户',
		        name: 'userName',
		        allowBlank:false,
		        emptyText:'用户',
		        msgTarget:'用户',
		        anchor:'100%'  
		    },		   
		    {
		        fieldLabel: '评论内容',
		        name: 'content',
		        allowBlank:false,
		        emptyText:'评论内容',
		        msgTarget:'评论内容',
		        anchor:'100%'  
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                   
                '<p><b>课程ID:</b> {curriculumId}</p><br>',              
                '<p><b>星标:</b> {star}</p><br>',              
                '<p><b>评论时间:</b> {datetime}</p><br>',              
                '<p><b>用户ID:</b> {userName}</p><br>',                        
                '<p><b>评论内容:</b> {content}</p><br>'          
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.school.model.Comment',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'int'},	   
	        {name:'curriculumId',type: 'int'},	   
	        {name:'star',type: 'int'},	   
	        {name:'datetime',type: 'string'},	   
	        {name:'userid',type: 'int'},
	        {name:'userName',type: 'string'},	       
	        {name:'content',type: 'string'}	   
	       ]
});