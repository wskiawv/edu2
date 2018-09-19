Ext.define('desktop.app.hec.sys.Company',{
	extend:'desktop.app.comm.QueryWindow',
	alias:['widget.Company'],
	
	
	moduleName:"sys",//请求模块名称    
	controllersName:"Companys",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.sys.model.Company';
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
			         	text:'公司代码',
			         	width:150,
			         	dataIndex:'code',
			         	sortable:true
			         	
			         },{
			         	text:'公司名',
			         	dataIndex:'name',
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
                '<p><b>公司代码:</b> {code}</p><br>'           
                            
           );
		return tpl;
	},
    /**
     * 配置搜索字段
     * @return {}
     */
    getSearchFields: function(){
		return [{
				fieldLabel: '公司代码',
				name: 'code',
				anchor: '100%'
			},{
				fieldLabel: '公司名',
				name: 'name',
				anchor: '100%'		
			
		}]
		
	}
});

Ext.define('desktop.app.hec.sys.model.Company',{
	extend: 'Ext.data.Model',
	fields:[
            {name: 'id'},
            {name: 'code'},
            {name: 'name'},
            {name: 'company_code_name'},
            {name: 'company_short_name_id'}                        
	       ]
});
