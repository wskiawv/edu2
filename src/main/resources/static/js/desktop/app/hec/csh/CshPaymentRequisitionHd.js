Ext.define('desktop.app.hec.csh.CshPaymentRequisitionHd',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:['widget.CshPaymentRequisitionHd'],
	
	
	moduleName:"csh",//请求模块名称    
	controllersName:"CshPaymentRequisitionHds",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.csh.model.CshPaymentRequisitionHd';
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
    		title:'借款单查看',
    		height:600,
    		width:950,
    		constrainHeader:true
    	});
    	win.show();
    	win.maximize();
    },
    cellClick:function(grid,td,cellIndex,record,tr,rowIndex,e){
    	var header_id=record.get('paymentRequisitionHeaderId');
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
			         		var val=Ext.String.format('<a href="#">{0}</a>',value);
			         		return val;
			         	}
			         },{
			         	text:'申请人',
			         	dataIndex:'requisitor',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'提单人',
			         	dataIndex:'submit_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'申请日期',
			         	dataIndex:'requisition_date_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'借款金额',
			         	dataIndex:'amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'已付金额',
			         	dataIndex:'paymented_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'已归还金额',
			         	dataIndex:'return_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'收款行',
			         	dataIndex:'bank_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'收款户名',
			         	dataIndex:'account_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'收款账号',
			         	dataIndex:'account_number',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'供应商类型',
			         	dataIndex:'vender_type_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'单笔金额',
			         	dataIndex:'amount_1',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'说明',
			         	dataIndex:'description',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'状态',
			         	dataIndex:'status_des',
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
		    	name:'paymentRequisitionHeaderId'
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
				fieldLabel: '借款单编号',
				name: 'requisitionNumber',
				anchor: '100%'
			},{
				fieldLabel: '说明',
				name: 'description',
				anchor: '100%'		
			
		}]
		
	}
});
Ext.define('desktop.app.hec.csh.model.CshPaymentRequisitionHd',{
	extend: 'Ext.data.Model',
	fields:[           
            {name: 'paymentRequisitionHeaderId'},
            {name: 'companyId'},
            {name: 'operationUnitId'},
            {name: 'employeeId'},
            {name: 'requisitionNumber'},
            {name: 'requisitionDate'},
            {name: 'paymentReqTypeId'},
            {name: 'transactionCategory'},
            {name: 'distributionSetId'},
            {name: 'paymentMethodId'},
            {name: 'partnerCategory'},
            {name: 'partnerId'},
            {name: 'amount'},
            {name: 'currencyCode'},
            {name: 'requisitionPaymentDate'},
            {name: 'description'},
            {name: 'status'},
            {name: 'approvalDate'},
            {name: 'approvedBy'},
            {name: 'closedDate'},
            {name: 'sourceType'},
            {name: 'creationDate'},
            {name: 'createdBy'},
            {name: 'lastUpdateDate'},
            {name: 'lastUpdatedBy'},
            {name: 'unitId'},
            {name: 'positionId'},
            {name: 'auditFlag'},
            {name: 'auditDate'},
            {name: 'reversedFlag'},
            {name: 'sourcePmtReqHeaderId'},
            {name: 'jeCreationStatus'},
            {name: 'expenseRequisitionHeaderId'},
            {name: 'attachmentNum'},
            {name: 'legalFlag'},
            {name: 'vatFlag'},
            {name: 'addInvoiceFlag'},
            {name: 'return_amount'},
            {name: 'requisitor'},
            {name: 'requisition_date_display'},
            {name: 'p_partner_category'},
            {name: 'payee_name'},
            {name: 'paymented_amount'},
            {name: 'transaction_line_id'},
            {name: 'csh_refund_amount'},
            {name: 'exp_return_csh_amount'},
            {name: 'status_des'},
            {name: 'partner_category_ln'},
            {name: 'partner_id_ln'},
            {name: 'bank_name'},
            {name: 'account_name'},
            {name: 'account_number'},
            {name: 'amount_1'},
            {name: 'currency_name'},
            {name: 'submit_name'},
            {name: 'vender_type_id'},
            {name: 'vender_type_name'}
	       ]
});
