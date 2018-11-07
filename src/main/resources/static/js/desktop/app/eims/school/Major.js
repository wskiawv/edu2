Ext.define('desktop.app.eims.school.Major',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.Major',
	moduleName:"school",//请求模块名称
	controllersName:"Majors",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.school.model.Major';
	},
	getSearchFieldHeight : function(){
		return 120;
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
	        fieldLabel: '专业名称',
	        name: 'filter_LIKE_zymc',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '专业简称',
	        name: 'filter_LIKE_zyjc',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '专业英文名称',
	        name: 'filter_LIKE_zyywmc',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '建立年月',
	        name: 'filter_LIKE_jlny',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '专业号',
	        name: 'filter_LIKE_zyh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '本专科专业码',
	        name: 'filter_LIKE_bzkzym',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '研究生专业码',
	        name: 'filter_LIKE_yjszym',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '入学年月',
	        name: 'filter_LIKE_rxny',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '总学分',
	        name: 'filter_LIKE_zxf',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '必修学分',
	        name: 'filter_LIKE_bxxf',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '选修学分',
	        name: 'filter_LIKE_xxxf',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学校ID',
	        name: 'filter_LIKE_schoolId',	       
	        anchor:'100%'  
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
				text:'专业名称',
			    dataIndex:'zymc',
			    width:100,
				sortable:true	
			},		
			{
				text:'专业简称',
			    dataIndex:'zyjc',
			    width:100,
				sortable:true	
			},		
			{
				text:'专业英文名称',
			    dataIndex:'zyywmc',
			    width:100,
				sortable:true	
			},		
			{
				text:'建立年月',
			    dataIndex:'jlny',
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
				text:'本专科专业码',
			    dataIndex:'bzkzym',
			    width:100,
				sortable:true	
			},		
			{
				text:'研究生专业码',
			    dataIndex:'yjszym',
			    width:100,
				sortable:true	
			},		
			{
				text:'入学年月',
			    dataIndex:'rxny',
			    width:100,
				sortable:true	
			},		
			{
				text:'总学分',
			    dataIndex:'zxf',
			    width:100,
				sortable:true	
			},		
			{
				text:'必修学分',
			    dataIndex:'bxxf',
			    width:100,
				sortable:true	
			},		
			{
				text:'选修学分',
			    dataIndex:'xxxf',
			    width:100,
				sortable:true	
			},		
			{
				text:'学校ID',
			    dataIndex:'schoolId',
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
		        fieldLabel: '专业名称',
		        name: 'zymc',
		        allowBlank:false,
		        emptyText:'zymc',
		        msgTarget:'zymc',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '专业简称',
		        name: 'zyjc',
		        allowBlank:false,
		        emptyText:'zyjc',
		        msgTarget:'zyjc',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '专业英文名称',
		        name: 'zyywmc',
		        allowBlank:false,
		        emptyText:'zyywmc',
		        msgTarget:'zyywmc',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '建立年月',
		        name: 'jlny',
		        allowBlank:false,
		        emptyText:'jlny',
		        msgTarget:'jlny',
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
		        fieldLabel: '本专科专业码',
		        name: 'bzkzym',
		        allowBlank:false,
		        emptyText:'bzkzym',
		        msgTarget:'bzkzym',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '研究生专业码',
		        name: 'yjszym',
		        allowBlank:false,
		        emptyText:'yjszym',
		        msgTarget:'yjszym',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '入学年月',
		        name: 'rxny',
		        allowBlank:false,
		        emptyText:'rxny',
		        msgTarget:'rxny',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '总学分',
		        name: 'zxf',
		        allowBlank:false,
		        emptyText:'zxf',
		        msgTarget:'zxf',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '必修学分',
		        name: 'bxxf',
		        allowBlank:false,
		        emptyText:'bxxf',
		        msgTarget:'bxxf',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '选修学分',
		        name: 'xxxf',
		        allowBlank:false,
		        emptyText:'xxxf',
		        msgTarget:'xxxf',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学校ID',
		        name: 'schoolId',
		        allowBlank:false,
		        emptyText:'schoolId',
		        msgTarget:'schoolId',
		        anchor:'100%'  
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                      
                '<p><b>zymc:</b> {zymc}</p><br>',              
                '<p><b>zyjc:</b> {zyjc}</p><br>',              
                '<p><b>zyywmc:</b> {zyywmc}</p><br>',              
                '<p><b>jlny:</b> {jlny}</p><br>',              
                '<p><b>zyh:</b> {zyh}</p><br>',              
                '<p><b>bzkzym:</b> {bzkzym}</p><br>',              
                '<p><b>yjszym:</b> {yjszym}</p><br>',              
                '<p><b>rxny:</b> {rxny}</p><br>',              
                '<p><b>zxf:</b> {zxf}</p><br>',              
                '<p><b>bxxf:</b> {bxxf}</p><br>',              
                '<p><b>xxxf:</b> {xxxf}</p><br>',              
                '<p><b>schoolId:</b> {schoolId}</p><br>'              
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.school.model.Major',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'int'},	   
	        {name:'zymc',type: 'string'},	   
	        {name:'zyjc',type: 'string'},	   
	        {name:'zyywmc',type: 'string'},	   
	        {name:'jlny',type: 'string'},	   
	        {name:'zyh',type: 'string'},	   
	        {name:'bzkzym',type: 'string'},	   
	        {name:'yjszym',type: 'string'},	   
	        {name:'rxny',type: 'string'},	   
	        {name:'zxf',type: 'string'},	   
	        {name:'bxxf',type: 'string'},	   
	        {name:'xxxf',type: 'string'},	   
	        {name:'schoolId',type: 'string'},
	        {name:'collegeDepartmentId',type:'int'}
	       ]
});