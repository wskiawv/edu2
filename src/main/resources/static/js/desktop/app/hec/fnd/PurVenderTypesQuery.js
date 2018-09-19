Ext.define('desktop.app.hec.fnd.PurVenderTypesQuery',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:['widget.PurVenderTypesQuery'],
	
	
	moduleName:"fnd",//请求模块名称    
	controllersName:"PurVenderTypesQuery",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.fnd.model.PurVenderTypesQuery';
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
							text:'序号'}
    	                 ),{        	
			         	     text:'供应商类型代码',
			         	     width:150,
			         	     dataIndex:'vender_type_code',
			         	     sortable:true
			             },{
			                 text:'供应商类型名称',
			                 dataIndex:'description',
			                 width:150,
			                 sortable:true
			             },{
			                 text:'启用',
			         	     dataIndex:'enabled_flag',
			         	     width:150,
			         	     sortable:true
				         }
			         ]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'instanceId'
		    }	    
		    ]
		    
	},	
    getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                      
                '<p><b>供应商类型定义说明:</b> {note}</p><br>'           
                            
           );
		return tpl;
	},
    /**
     * 配置搜索字段
     * @return {}
     */
    getSearchFields: function(){
		return [{
			      fieldLabel: '供应商类型代码',
				  name: 'vender_type_code',
				  anchor: '100%'
			    },
			    {
				  fieldLabel: '供应商类型名称',
				  name: 'description',
				  anchor: '100%'		
			    }
	    ]
	}
});
Ext.define('desktop.app.hec.fnd.model.PurVenderTypesQuery',{
	extend: 'Ext.data.Model',
	fields:[	        
            {name: 'vender_type_id'},
        	{name: 'vender_type_code'},
        	{name: 'description_id'},
        	{name: 'coding_rule_code'},
        	{name: 'one_off_flag'},
        	{name: 'enabled_flag'},
        	{name: 'description'},
        	{name: 'code_name'}
	       ]
});
