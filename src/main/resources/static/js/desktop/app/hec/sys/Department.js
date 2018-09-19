Ext.define('desktop.app.hec.sys.Department',{
	extend:'desktop.app.comm.QueryWindow',
	alias:['widget.Department'],
	
	
	moduleName:"sys",//请求模块名称    
	controllersName:"Departments",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.sys.model.Department';
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
			         	text:'部门代码',
			         	width:150,
			         	dataIndex:'code',
			         	sortable:true
			         	
			         },{
			         	text:'部门名名',
			         	dataIndex:'unit_name',
			         	width:320,
			         	sortable:true
			         }
			         ]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'id'
		    }	    
		    ]
		    
	},	
    getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                      
                '<p><b>部门名称:</b> {unit_name}</p><br>'           
                            
           );
		return tpl;
	},
    /**
     * 配置搜索字段
     * @return {}
     */
    getSearchFields: function(){
		return [{
				fieldLabel: '部门代码',
				name: 'code',
				anchor: '100%'
			},{
				fieldLabel: '部门名称',
				name: 'unit_name',
				anchor: '100%'		
			
		}]
		
	}
});

Ext.define('desktop.app.hec.sys.model.Department',{
	extend: 'Ext.data.Model',
	fields:[
            {name: 'id'},
            {name: 'code'},
            {name: 'unit_name'},
            {name: 'unit_name_id'},
            {name: 'company_short_name_id'},
            {name: 'company_id'},
            {name: 'parent_unit_id'},
            {name: 'enabled_flag'},
            {name: 'charge_position_id'},
            {name: 'responsibility_center_id'}           
	       ]
});
