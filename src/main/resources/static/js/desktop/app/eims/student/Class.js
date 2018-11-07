Ext.define('desktop.app.eims.student.Classes',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.Classes',
	moduleName:"student",//请求模块名称
	controllersName:"Classes",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.student.model.Classes';
	},
	getSearchFieldHeight : function(){
		return 200;
	},
	getSearchFields : function(){
		return[
		{
            fieldLabel:'院系',
            xtype:'CommComboBox',
            hiddenName : 'filter_EQ_yxsmc',
            name:'filter_EQ_collegeDepartmentId',
            url:appPath+'/school/CollegeDepartments/getCollegeDepartmentList'
        },
		{
	        fieldLabel: '班号',
	        name: 'filter_LIKE_bh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '班级名称',
	        name: 'filter_LIKE_bjmc',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '专业号',
	        name: 'filter_LIKE_zyh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '建班年月',
	        name: 'filter_LIKE_jbny',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学制',
	        name: 'filter_LIKE_xz',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '班主任职工号',
	        name: 'filter_LIKE_bzrzgh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '班长学号',
	        name: 'filter_LIKE_bzxh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学校',
	        xtype:'CommComboBox',
	        name: 'filter_LIKE_schoolId',
	        hiddenName : 'filter_LIKE_xxmc',
            url:appPath+'/school/Schools/getSchoolList'
	    },
	    {
            fieldLabel: '院系',
            xtype:'CommComboBox',
            name: 'filter_LIKE_collegeDepartmentId',
            hiddenName : 'filter_LIKE_yxsmc',
            url:appPath+'/school/CollegeDepartments/getCollegeDepartmentList'
        },
        {
            fieldLabel: '专业',
            xtype:'CommComboBox',
            name: 'filter_LIKE_majorId',
            hiddenName : 'filter_LIKE_zymc',
            url:appPath+'/school/Majors/getMajorList'
        }
	    ]
	},	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),
			{
                text:'院系',
                dataIndex:'collegeDepartmentId',
                width:100,
                sortable:true
            },
			{
				text:'班号',
			    dataIndex:'bh',
			    width:100,
				sortable:true	
			},		
			{
				text:'班级名称',
			    dataIndex:'bjmc',
			    width:100,
				sortable:true	
			},		
			{
				text:'专业号',
			    dataIndex:'zyh',
			    width:100,
				sortable:true	
			},		
			{
				text:'建班年月',
			    dataIndex:'jbny',
			    width:100,
				sortable:true	
			},		
			{
				text:'学制',
			    dataIndex:'xz',
			    width:100,
				sortable:true	
			},		
			{
				text:'班主任职工号',
			    dataIndex:'bzrzgh',
			    width:100,
				sortable:true	
			},		
			{
				text:'班长学号',
			    dataIndex:'bzxh',
			    width:100,
				sortable:true	
			},		
			{
				text:'学校',
			    dataIndex:'schoolId',
			    width:100,
				sortable:true	
			},
		    {
                text:'院系',
                dataIndex:'collegeDepartmentId',
                width:100,
                sortable:true
            },
            {
                text:'专业',
                dataIndex:'majorId',
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
                fieldLabel:'院系',
                xtype:'CommComboBox',
                hiddenName : 'filter_EQ_yxsmc',
                name:'collegeDepartmentId',
                url:appPath+'/school/CollegeDepartments/getCollegeDepartmentList'
            },
		    {
		        fieldLabel: '班号',
		        name: 'bh',
		        allowBlank:false,
		        emptyText:'bh',
		        msgTarget:'bh',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '班级名称',
		        name: 'bjmc',
		        allowBlank:false,
		        emptyText:'bjmc',
		        msgTarget:'bjmc',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '专业号',
		        name: 'zyh',
		        allowBlank:false,
		        emptyText:'zyh',
		        msgTarget:'zyh',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '建班年月',
		        name: 'jbny',
		        allowBlank:false,
		        emptyText:'jbny',
		        msgTarget:'jbny',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学制',
		        name: 'xz',
		        allowBlank:false,
		        emptyText:'xz',
		        msgTarget:'xz',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '班主任职工号',
		        name: 'bzrzgh',
		        allowBlank:false,
		        emptyText:'bzrzgh',
		        msgTarget:'bzrzgh',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '班长学号',
		        name: 'bzxh',
		        allowBlank:false,
		        emptyText:'bzxh',
		        msgTarget:'bzxh',
		        anchor:'100%'  
		    },
		    {
                fieldLabel: '学校',
                xtype:'CommComboBox',
                name: 'schoolId',
                hiddenName : 'filter_LIKE_xxmc',
                url:appPath+'/school/Schools/getSchoolList'
            },
		    {
                fieldLabel: '专业',
                xtype:'CommComboBox',
                name: 'majorId',
                hiddenName : 'filter_LIKE_zymc',
                url:appPath+'/school/Majors/getMajorList'
            }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                           
                '<p><b>班号:</b> {bh}</p><br>',              
                '<p><b>班级名称:</b> {bjmc}</p><br>',              
                '<p><b>专业号:</b> {zyh}</p><br>',              
                '<p><b>建班年月:</b> {jbny}</p><br>',              
                '<p><b>学制:</b> {xz}</p><br>',              
                '<p><b>班主任职工号:</b> {bzrzgh}</p><br>',              
                '<p><b>班长学号:</b> {bzxh}</p><br>',              
                '<p><b>学校ID:</b> {schoolId}</p><br>'            
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.student.model.Classes',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'int'},	   
	        {name:'bh',type: 'string'},	   
	        {name:'bjmc',type: 'string'},	   
	        {name:'zyh',type: 'string'},	   
	        {name:'jbny',type: 'string'},	   
	        {name:'xz',type: 'string'},	   
	        {name:'bzrzgh',type: 'string'},	   
	        {name:'bzxh',type: 'string'},	   
	        {name:'schoolId',type: 'int'},
	        {name:'collegeDepartmentId',type: 'int'},
	        {name:'majorId',type: 'int'}

	       ]
});