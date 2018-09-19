Ext.define('desktop.app.hec.sys.Employee',{
	extend:'desktop.app.comm.QueryWindow',
	alias:['widget.Employee'],
	
	
	moduleName:"sys",//请求模块名称    
	controllersName:"Employees",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.sys.model.Employee';
	},

    /**
     * 搜索panel的高度
     * @return {Number}
     */
    getSearchFieldHeight : function(){
    	return 100;
    },
    detailNewWindow:function(header_id){
    	
    },
    getGridColumns : function(){    	
    	var columns=[Ext.create('Ext.grid.RowNumberer',{
			    		width:35,
						text:'序号'
    				}),{        	
			         	text:'员工代码',
			         	width:150,
			         	dataIndex:'employee_code',
			         	sortable:true
			         	
			         },{
			         	text:'员工姓名',
			         	dataIndex:'name',
			         	width:150,
			         	sortable:true
			         }
			         ]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'user_id'
		    }	    
		    ]
		    
	},	
    getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                      
                '<p><b>员工代码:</b> {employee_code}</p><br>'           
                            
           );
		return tpl;
	},
    /**
     * 配置搜索字段
     * @return {}
     */
    getSearchFields: function(){
		return [{
				fieldLabel: '员工代码',
				name: 'employee_code',
				anchor: '100%'
			},{
				fieldLabel: '员工姓名',
				name: 'name',
				anchor: '100%'		
			
		}]
		
	}
});

Ext.define('desktop.app.hec.sys.model.Employee',{
	extend: 'Ext.data.Model',
	fields:[
            {name: 'user_id'},
            {name: 'name_code'},
            {name: 'name'},
            {name: 'employee_code'},
            {name: 'employee_id'}                        
	       ]
});
