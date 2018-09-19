Ext.define('desktop.app.hec.acp.AcpAcpRequisitionHd',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:['widget.AcpAcpRequisitionHd'],
	
	
	moduleName:"acp",//请求模块名称    
	controllersName:"AcpAcpRequisitionHds",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.acp.model.AcpAcpRequisitionHd';
	},

    /**
     * 搜索panel的高度
     * @return {Number}
     */
    getSearchFieldHeight : function(){
    	return 100;
    },
    detailNewWindow:function(params){
    	var win=Ext.create('desktop.app.hec.expm.ExpDocumentShow',{
    		params:params,
    		title:'付款单查看',
    		height:600,
    		width:950,
    		constrainHeader:true
    	});
    	win.show();
    	win.maximize();
    },
    cellClick:function(grid,td,cellIndex,record,tr,rowIndex,e){
    	var header_id=record.get('acpRequisitionHeaderId');
    	var instance_id=record.get('instanceId')==undefined||record.get('instanceId')==null||record.get('instanceId')==''?-1:record.get('instanceId');
    	var documentNumber=record.get('requisitionNumber');
    	var record_id=record.get('record_id')==undefined||record.get('record_id')==null||record.get('record_id')==''?-1:record.get('record_id');
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
			         	dataIndex:'requisitionNumber',
			         	sortable:true,
			         	renderer:function(value,o,record){
			         		var header_id=record.get('acpRequisitionHeaderId');
			         		var val=Ext.String.format('<a href="#">{0}</a>',value);
			         		return val;
			         	}
			         },{
			         	text:'单据类型',
			         	dataIndex:'req_type',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'关联报销单编号',
			         	dataIndex:'document_number',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'关联现金事务编号',
			         	dataIndex:'csh_document_number',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'申请日期',
			         	dataIndex:'requisition_date_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'申请金额',
			         	dataIndex:'amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'已付金额',
			         	dataIndex:'already_paying',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'付款申请人',
			         	dataIndex:'employee',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'提单人',
			         	dataIndex:'submit_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'收款对象',
			         	dataIndex:'partner_category_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'收款方',
			         	dataIndex:'partner_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'供应商类型',
			         	dataIndex:'vender_type_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'状态',
			         	dataIndex:'status',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'描述',
			         	dataIndex:'line_description',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'关闭日期',
			         	dataIndex:'closed_date',
			         	width:150,
			         	sortable:true
				     }]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'acpRequisitionHeaderId'
		    }	    
		    ]
		    
	},	
    getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                      
                '<p><b>说明:</b> {description}</p><br>'           
                            
           );
		return tpl;
	},
    /**
     * 配置搜索字段
     * @return {}
     */
    getSearchFields: function(){
		return [{
				fieldLabel: '付款单编号',
				name: 'requisitionNumber',
				anchor: '100%'
			},{
				fieldLabel: '说明',
				name: 'description',
				anchor: '100%'		
			
		}]
		
	}
});
Ext.define('desktop.app.hec.acp.model.AcpAcpRequisitionHd',{
	extend: 'Ext.data.Model',
	fields:[            
            {name: 'acpRequisitionHeaderId'},
            {name: 'companyId'},
            {name: 'operationUnitId'},
            {name: 'employeeId'},
            {name: 'requisitionNumber'},
            {name: 'requisitionDate'},
            {name: 'acpReqTypeId'},
            {name: 'transactionCategory'},
            {name: 'paymentMethodId'},
            {name: 'partnerCategory'},
            {name: 'partnerId'},
            {name: 'amount'},
            {name: 'currencyCode'},
            {name: 'description'},
            {name: 'status'},
            {name: 'approvalDate'},
            {name: 'approvedBy'},
            {name: 'closedDate'},
            {name: 'creationDate'},
            {name: 'createdBy'},
            {name: 'lastUpdateDate'},
            {name: 'lastUpdatedBy'},
            {name: 'unitId'},
            {name: 'positionId'},
            {name: 'sourceType'},
            {name: 'paymentComId'},
            {name: 'acpRefRptNumber'},
            {name: 'employee'},
            {name: 'partner_category_display'},
            {name: 'requisition_date_display'},
            {name: 'already_paying'},
            {name: 'partner_name'},
            {name: 'payment_status'},
            {name: 'payment_status1'},
            {name: 'close_date'},
            {name: 'line_description'},
            {name: 'ref_document_line_id'},
            {name: 'document_number'},
            {name: 'exp_report_header_id'},
            {name: 'status1'},
            {name: 'acp_req_type_id'},
            {name: 'req_type'},
            {name: 'currency_name'},
            {name: 'submit_name'},
            {name: 'vender_type_id'},
            {name: 'vender_type_name'},
            {name: 'csh_document_number'}
	       ]
});
