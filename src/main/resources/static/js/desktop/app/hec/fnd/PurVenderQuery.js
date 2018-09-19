Ext.define('desktop.app.hec.fnd.PurVenderQuery',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:['widget.PurVenderQuery'],
	
	
	moduleName:"fnd",//请求模块名称    
	controllersName:"PurVenderQuery",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.fnd.model.PurVenderQuery';
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
			         	     text:'供应商代码',
			         	     width:150,
			         	     dataIndex:'req_number',
			         	     sortable:true,
			         	     renderer:function(value,o,record){
			         		            var header_id=record.get('pur_vender_req_header_id');
			         		            var val='<a href="javascript:detailNewWindow(' + header_id + ');">' + value + '</a>';
			         		            return val;
			         	              }
			             },{
			                 text:'供应商名称',
			                 dataIndex:'description_id_cn',
			                 width:150,
			                 sortable:true
			             },{
			                 text:'申请状态',
			         	     dataIndex:'req_status_cn',
			         	     width:150,
			         	     sortable:true
				         },{
			         	     text:'申请类型',
			         	     dataIndex:'vender_req_type',
			         	     width:150,
			         	     sortable:true
				         },{
			         	     text:'机构',
			         	     dataIndex:'company_id_cn',
			         	     width:150,
			         	     sortable:true
				         },{
			         	     text:'申请员工',
				         	 dataIndex:'employee_id_cn',
				         	 width:150,
				         	 sortable:true
					     },{
				         	 text:'岗位',
				         	 dataIndex:'position_name',
				         	 width:150,
				         	 sortable:true
					     },{
				         	 text:'部门',
				         	 dataIndex:'unit_name',
				         	 width:150,
				         	 sortable:true
					     },{
				         	 text:'附件号',
				         	 dataIndex:'attachment_num',
				         	 width:150,
				         	 sortable:true
					     },{
				         	 text:'描述',
				         	 dataIndex:'description',
				         	 width:150,
				         	 sortable:true
					     },{
				         	 text:'单据日期',
				         	 dataIndex:'req_date',
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
                '<p><b>供应商信息查询:</b> {note}</p><br>'           
                            
           );
		return tpl;
	},
    /**
     * 配置搜索字段
     * @return {}
     */
    getSearchFields: function(){
		return [{
			      fieldLabel: '单据类型',
				  name: 'vender_req_type',
				  anchor: '100%'
			    },
			    {
				  fieldLabel: '供应商代码',
				  name: 'req_number',
				  anchor: '100%'		
			    },
			    {
			      fieldLabel: '供应商代码',
				  name: 'description_id_cn',
				  anchor: '100%'	
			    }
	    ]
	}
});
Ext.define('desktop.app.hec.fnd.model.PurVenderQuery',{
	extend: 'Ext.data.Model',
	fields:[	        
            {name: 'pur_vender_req_header_id'},
        	{name: 'req_date'},
        	{name: 'req_status'},
        	{name: 'req_status_cn'},
        	{name: 'req_number'},
        	{name: 'description_id_cn'},
        	{name: 'vender_req_type_id'},
        	{name: 'vender_req_type'},
        	{name: 'company_id'},
        	{name: 'company_id_cn'},
        	{name: 'operation_unit_id'},
        	{name: 'employee_id'},
        	{name: 'employee_id_cn'},
        	{name: 'position_id'},
        	{name: 'position_name'},
        	{name: 'unit_id'},
        	{name: 'unit_name'},
        	{name: 'attachment_num'},
        	{name: 'description'}
	       ]
});
