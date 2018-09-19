Ext.define('desktop.app.hec.cont.ConContractType',{
	extend:'desktop.app.comm.QueryWindow',
	alias:['widget.ConContractType'],
	
	
	moduleName:"cont",//请求模块名称    
	controllersName:"ConContractTypes",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.cont.model.ConContractType';
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
			         	text:'合同类型代码',
			         	width:150,
			         	dataIndex:'contract_type_code',
			         	sortable:true
			         	
			         },{
			         	text:'合同类型描述',
			         	dataIndex:'type_description',
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
                '<p><b>合同类型描述:</b> {type_description}</p><br>'           
                            
           );
		return tpl;
	},
    /**
     * 配置搜索字段
     * @return {}
     */
    getSearchFields: function(){
		return [{
				fieldLabel: '合同类型代码',
				name: 'contract_type_code',
				anchor: '100%'
			},{
				fieldLabel: '合同类型描述',
				name: 'type_description',
				anchor: '100%'		
			
		}]
		
	}
});

Ext.define('desktop.app.hec.cont.model.ConContractType',{
	extend: 'Ext.data.Model',
	fields:[             
            {name: 'contract_type_id'},
        	{name: 'company_id'},
        	{name: 'contract_type_dist_id'},
        	{name: 'self_approval'},
        	{name: 'enabled_flag'},
        	{name: 'contract_type_code'},
        	{name: 'type_description'},
        	{name: 'code_and_description'},
        	{name: 'contract_type'}
	       ]
});
