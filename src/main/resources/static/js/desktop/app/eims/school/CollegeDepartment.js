Ext.define('desktop.app.eims.school.CollegeDepartment',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.CollegeDepartment',
	moduleName:"school",//请求模块名称
	controllersName:"CollegeDepartments",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.school.model.CollegeDepartment';
	},
	getSearchFieldHeight : function(){
		return 120;
	},
	getSearchFields : function(){
		return[
		{
            xtype:'CommComboBox',
            fieldLabel : '学校',
            hiddenName : 'filter_EQ_name',
            name:'filter_LIKE_schoolId',
            url:appPath+'/school/Schools/getSchoolList'
        },
		{
	        fieldLabel: '院系所部中心号',
	        name: 'filter_LIKE_yxsh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '院系所部中心名称',
	        name: 'filter_LIKE_yxsmc',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '院系所部中心英文名称',
	        name: 'filter_LIKE_yxsywmc',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '院系所部中心简称',
	        name: 'filter_LIKE_yxsjc',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '办别码',
	        name: 'filter_LIKE_yxsbbm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '类别码',
	        name: 'filter_LIKE_yxslbm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '建立年月',
	        name: 'filter_LIKE_jlny',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '行政负责人',
	        name: 'filter_LIKE_xzfzr',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '党务负责人',
	        name: 'filter_LIKE_dwfzr',	       
	        anchor:'100%'  
	    },
	    ]
	},	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),
			{
                text:'学校',
                dataIndex:'schoolId',
                width:100,
                sortable:true
            },
			{
				text:'院系所部中心号',
			    dataIndex:'yxsh',
			    width:100,
				sortable:true	
			},		
			{
				text:'院系所部中心名称',
			    dataIndex:'yxsmc',
			    width:100,
				sortable:true	
			},		
			{
				text:'院系所部中心英文名称',
			    dataIndex:'yxsywmc',
			    width:100,
				sortable:true	
			},		
			{
				text:'院系所部中心简称',
			    dataIndex:'yxsjc',
			    width:100,
				sortable:true	
			},		
			{
				text:'办别码',
			    dataIndex:'yxsbbm',
			    width:100,
				sortable:true	
			},		
			{
				text:'类别码',
			    dataIndex:'yxslbm',
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
				text:'行政负责人',
			    dataIndex:'xzfzr',
			    width:100,
				sortable:true	
			},		
			{
				text:'党务负责人',
			    dataIndex:'dwfzr',
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
                xtype:'CommComboBox',
                fieldLabel : '学校',
                hiddenName : 'filter_EQ_name',
                name:'schoolId',
                url:appPath+'/school/Schools/getSchoolList'
            },
		    {
		        fieldLabel: '院系所部中心号',
		        name: 'yxsh',
		        allowBlank:false,
		        emptyText:'院系所部中心号',
		        msgTarget:'院系所部中心号',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '院系所部中心名称',
		        name: 'yxsmc',
		        allowBlank:false,
		        emptyText:'院系所部中心名称',
		        msgTarget:'院系所部中心名称',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '院系所部中心英文名称',
		        name: 'yxsywmc',
		        allowBlank:false,
		        emptyText:'院系所部中心英文名称',
		        msgTarget:'院系所部中心英文名称',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '院系所部中心简称',
		        name: 'yxsjc',
		        allowBlank:false,
		        emptyText:'院系所部中心简称',
		        msgTarget:'院系所部中心简称',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '办别码',
		        name: 'yxsbbm',
		        allowBlank:false,
		        emptyText:'办别码',
		        msgTarget:'办别码',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '类别码',
		        name: 'yxslbm',
		        allowBlank:false,
		        emptyText:'类别码',
		        msgTarget:'类别码',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '建立年月',
		        name: 'jlny',
		        allowBlank:false,
		        emptyText:'建立年月',
		        msgTarget:'建立年月',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '行政负责人',
		        name: 'xzfzr',
		        allowBlank:false,
		        emptyText:'行政负责人',
		        msgTarget:'行政负责人',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '党务负责人',
		        name: 'dwfzr',
		        allowBlank:false,
		        emptyText:'党务负责人',
		        msgTarget:'党务负责人',
		        anchor:'100%'  
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                     
                '<p><b>院系所部中心号:</b> {yxsh}</p><br>',              
                '<p><b>院系所部中心名称:</b> {yxsmc}</p><br>',              
                '<p><b>院系所部中心英文名称:</b> {yxsywmc}</p><br>',              
                '<p><b>院系所部中心简称:</b> {yxsjc}</p><br>',              
                '<p><b>办别码:</b> {yxsbbm}</p><br>',              
                '<p><b>类别码:</b> {yxslbm}</p><br>',              
                '<p><b>建立年月:</b> {jlny}</p><br>',              
                '<p><b>行政负责人:</b> {xzfzr}</p><br>',              
                '<p><b>党务负责人:</b> {dwfzr}</p><br>'              
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.school.model.CollegeDepartment',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'string'},	   
	        {name:'yxsh',type: 'string'},	   
	        {name:'yxsmc',type: 'string'},	   
	        {name:'yxsywmc',type: 'string'},	   
	        {name:'yxsjc',type: 'string'},	   
	        {name:'yxsbbm',type: 'string'},	   
	        {name:'yxslbm',type: 'string'},	   
	        {name:'jlny',type: 'string'},	   
	        {name:'xzfzr',type: 'string'},	   
	        {name:'dwfzr',type: 'string'},
	        {name:'schoolId',type: 'int'}
	       ]
});