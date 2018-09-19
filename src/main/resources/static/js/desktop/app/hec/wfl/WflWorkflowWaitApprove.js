Ext.define('desktop.app.hec.wfl.WflWorkflowWaitApprove',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:['widget.WflWorkflowWaitApprove'],
	
	
	moduleName:"wfl",//请求模块名称    
	controllersName:"WflWorkflowWaitApproves",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.wfl.model.WflWorkflowWaitApprove';
	},

    /**
     * 搜索panel的高度
     * @return {Number}
     */
    getSearchFieldHeight : function(){
    	return 100;
    },
    detailNewWindow:function(params){
    	var win=Ext.create('desktop.app.hec.wfl.WflApproveWindow',{
    		params:params,
    		title:'报销单审批',
    		height:600,
    		width:950,
    		constrainHeader:true
    	});
    	win.show();
    	win.maximize();
    },
    cellClick:function(grid,td,cellIndex,record,tr,rowIndex,e){
    	var header_id=record.get('instanceParam');
    	var instance_id=record.get('instanceId');
    	var documentNumber=record.get('documentNumber');
    	var record_id=record.get('record_id');
    	var doc_type=documentNumber.substring(0,2);
    	var params={instance_id:instance_id,header_id:header_id,record_id:record_id,doc_type:doc_type};
    	var me=this;
    	if(cellIndex==3){    		    		
        	me.detailNewWindow(params);
    	}
    	
    },
    getGridColumns : function(){    	
    	var columns=[Ext.create('Ext.grid.RowNumberer',{
    				width:35,
    				text:'序号'
    				}),{        	
			         	text:'单据编号',
			         	width:150,
			         	dataIndex:'documentNumber',
			         	sortable:true,
			         	renderer:function(value,o,record){
			         		var header_id=record.get('instanceParam');
			         		var val=Ext.String.format('<a href="#">{0}</a>',value);
			         		return val;
			         	}
			         },{
			         	text:'机构名称',
			         	dataIndex:'company_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'机构名称',
			         	dataIndex:'unit_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'申请人',
			         	dataIndex:'employee_desc',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'单据金额',
			         	dataIndex:'instance_amount',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'单据描述',
			         	dataIndex:'order_type_detail_desc',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'单据类型',
			         	dataIndex:'order_type',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'单据名称',
			         	dataIndex:'order_type_detail',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'提交审批日期',
			         	dataIndex:'creation_date_view',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'到达审批日期',
			         	dataIndex:'apply_date_view',
			         	width:150,
			         	sortable:true
				     }]
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
                '<p><b>当前审批人:</b> {curr_approve_name}</p><br>'           
                            
           );
		return tpl;
	},
    /**
     * 配置搜索字段
     * @return {}
     */
    getSearchFields: function(){
		return [{
				fieldLabel: '单据编号',
				name: 'documentNumber',
				anchor: '100%'
			}]
		
	}
});
Ext.define('desktop.app.hec.wfl.model.WflWorkflowWaitApprove',{
	extend: 'Ext.data.Model',
	fields:[	        
            {name:'instanceId'},
        	{name:'workflowId'},
        	{name:'documentNumber'},
        	{name:'is_late'},
        	{name:'employee_name'},
            {name:'order_type'},
            {name:'node_name'},
            {name:'creation_date_view'},
            {name:'apply_date_view'},
            {name:'date_limit_view'},    
            {name:'status'},
            {name:'currentNode'},
            {name:'instanceParam'},
            {name:'dateFrom'},
            {name:'dateTo'},
            {name:'objectVersionNumber'},
            {name:'reason'},
            {name:'currentHandler'},
            {name:'statusDesc'},
            {name:'approveCount'},
            {name:'instanceDesc'},
            {name:'nodeResult'},
            {name:'attachmentId'},
            {name:'record_id'},
            {name:'date_limit'},
            {name:'apply_date'},
            {name:'node_id'},
            {name:'workflow_name'},
            {name:'workflow_category'},
            {name:'doc_page_url'},
            {name:'employee_desc'},
            {name:'order_type_detail'},
            {name:'order_type_detail_desc'},
            {name:'company_name'},
            {name:'unit_name'},
            {name:'instance_amount'}
	       ]
});
