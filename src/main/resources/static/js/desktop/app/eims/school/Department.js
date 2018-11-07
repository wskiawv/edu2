Ext.define('desktop.app.eims.school.Department',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.Department',
	moduleName:"school",//请求模块名称
	controllersName:"Departments",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.school.model.Department';
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
	        fieldLabel: '科室号',
	        name: 'filter_LIKE_ksh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '科室名称',
	        name: 'filter_LIKE_ksmc',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '科室简称',
	        name: 'filter_LIKE_ksjc',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '科室负责人职工号',
	        name: 'filter_LIKE_ksfzrzgh',	       
	        anchor:'100%'  
	    }
	    ]
	},	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),				
			{
				text:'科室号',
			    dataIndex:'ksh',
			    width:100,
				sortable:true	
			},		
			{
				text:'科室名称',
			    dataIndex:'ksmc',
			    width:100,
				sortable:true	
			},		
			{
				text:'科室简称',
			    dataIndex:'ksjc',
			    width:100,
				sortable:true	
			},		
			{
				text:'科室负责人职工号',
			    dataIndex:'ksfzrzgh',
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
		        fieldLabel: '科室号',
		        name: 'ksh',
		        allowBlank:false,
		        emptyText:'科室号',
		        msgTarget:'科室号',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '科室名称',
		        name: 'ksmc',
		        allowBlank:false,
		        emptyText:'科室名称',
		        msgTarget:'科室名称',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '科室简称',
		        name: 'ksjc',
		        allowBlank:false,
		        emptyText:'科室简称',
		        msgTarget:'科室简称',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '科室负责人职工号',
		        name: 'ksfzrzgh',
		        allowBlank:false,
		        emptyText:'科室负责人职工号',
		        msgTarget:'科室负责人职工号',
		        anchor:'100%'  
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                     
                '<p><b>科室号:</b> {ksh}</p><br>',              
                '<p><b>科室名称:</b> {ksmc}</p><br>',              
                '<p><b>科室简称:</b> {ksjc}</p><br>',              
                '<p><b>科室负责人职工号:</b> {ksfzrzgh}</p><br>'             
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.school.model.Department',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'string'},	   
	        {name:'ksh',type: 'string'},	   
	        {name:'ksmc',type: 'string'},	   
	        {name:'ksjc',type: 'string'},	   
	        {name:'ksfzrzgh',type: 'string'},
	        {name:'collegeDepartmentId',type:'int'}
	       ]
});