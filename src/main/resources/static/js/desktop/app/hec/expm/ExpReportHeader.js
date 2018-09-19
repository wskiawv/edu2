Ext.define('desktop.app.hec.expm.ExpReportHeader',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:['widget.ExpReportHeader'],
	
	
	moduleName:"expm",//请求模块名称    
	controllersName:"ExpReportHeaders",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.expm.model.ExpReportHeader';
	},

    /**
     * 搜索panel的高度
     * @return {Number}
     */
    getSearchFieldHeight : function(){
    	return 100;
    },    
    contractDetailWindow:function(params){
    	var win=Ext.create('desktop.app.hec.cont.ConContractHeaderDetailsWindow',{
    		params:params,
    		title:'合同查看',
    		height:600,
    		width:950,
    		constrainHeader:true
    	});
    	win.show();
    	win.maximize();
    },    
    detailNewWindow:function(params){
    	var win=Ext.create('desktop.app.hec.expm.ExpDocumentShow',{
    		params:params,
    		title:'报销单查看',
    		height:600,
    		width:950,
    		constrainHeader:true
    	});
    	win.show();
    	win.maximize();
    },
    cellClick:function(grid,td,cellIndex,record,tr,rowIndex,e){
    	var header_id=record.get('expReportHeaderId');
    	var instance_id=record.get('instanceId')==undefined||record.get('instanceId')==null||record.get('instanceId')==''?-1:record.get('instanceId');
    	var documentNumber=record.get('expReportNumber');
    	var record_id=record.get('record_id')==undefined||record.get('record_id')==null||record.get('record_id')==''?-1:record.get('record_id');
    	var doc_type=documentNumber.substring(0,2);
    	var contract_header_id=record.get('contract_header_id');
    	var params={instance_id:instance_id,header_id:header_id,record_id:record_id,doc_type:doc_type,contract_header_id:contract_header_id};
    	var me=this;
    	if(cellIndex==3){    		    		
        	me.detailNewWindow(params);
    	}else if(cellIndex==4 && contract_header_id!=null && contract_header_id!='' && contract_header_id!=undefined){
    		params=Ext.apply(params,{doc_type:'HT',header_id:contract_header_id});
    		me.contractDetailWindow(params);
    	}
    	
    },
    getGridColumns : function(){ 
    	var me=this;
    	
    	var columns=[Ext.create('Ext.grid.RowNumberer',{
			    		width:35,
						text:'序号'
    				}),{        	
			         	text:'单据编号',
			         	width:150,
			         	dataIndex:'expReportNumber',
			         	sortable:true,
			         	renderer:function(value,o,record){			         		
			         		var val=Ext.String.format('<a href="#">{0}</a>',value);
			         		return val;
			         	}
			         },{
			         	text:'合同编号',
			         	dataIndex:'contact_number',
			         	width:150,
			         	sortable:true,
			         	renderer:function(value,o,record){
			         		if(value!=null && value!='' && value !=undefined){
			         			var val=Ext.String.format('<a href="#">{0}</a>',value);
				         		return val;
			         		}else{
			         			return value;
			         		}
			         		
			         	}
			         },{
			         	text:'不含税金额',
			         	dataIndex:'report_functional_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'税金',
			         	dataIndex:'vat_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'单据类型',
			         	dataIndex:'type_description',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'报销日期',
			         	dataIndex:'requesition_date',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'审核日期',
			         	dataIndex:'audit_date',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'报销金额',
			         	dataIndex:'quarter_num',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'已付金额',
			         	dataIndex:'paymented_samount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'付款日期',
			         	dataIndex:'payment_date',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'申请部门',
			         	dataIndex:'unit_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'申请人',
			         	dataIndex:'employee_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'提单人',
			         	dataIndex:'submit_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'收款方',
			         	dataIndex:'payee_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'收款对象',
			         	dataIndex:'payee_category_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'供应商类型',
			         	dataIndex:'vender_type_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'审批状态',
			         	dataIndex:'requisition_status',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'反冲状态',
			         	dataIndex:'reversed_flag_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'描述',
			         	dataIndex:'description',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'补反冲单据',
			         	dataIndex:'reversed_number',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'后补发票',
			         	dataIndex:'add_invoice_flag',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'终止标志',
			         	dataIndex:'no_wfl_flag',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'含增值税',
			         	dataIndex:'vat_flag',
			         	width:150,
			         	sortable:true
				     }
			         ]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'expReportHeaderId'
		    }	    
		    ]
		    
	},	
    getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                      
                '<p><b>描述:</b> {description}</p><br>'           
                            
           );
		return tpl;
	},
    /**
     * 配置搜索字段
     * @return {}
     */
    getSearchFields: function(){
		return [{
				fieldLabel: '报销单编号',
				name: 'expReportNumber',
				anchor: '100%'
			},{
				fieldLabel: '描述',
				name: 'description',
				anchor: '100%'		
			
			},{
				fieldLabel:'申请人',
				name:'employee_name',
				fieldCls:'userWin',
				listeners:{
		        	scope:this,
		        	focus:function(textField){
		        		var win=Ext.create('desktop.app.hec.sys.Employee',{
		        			textField:textField,
		        			returnFieldName:'name',
		        			title:'员工查询',	        			
		        			width:800,
		        			height:600,
		        		});
		        		win.show();
		        	}
		        }
			}]
		
	}
});
Ext.define('desktop.app.hec.expm.model.ExpReportHeader',{
	extend: 'Ext.data.Model',
	fields:[	        
            
            {name: 'expReportHeaderId'},
            {name: 'companyId'},
            {name: 'operationUnitId'},
            {name: 'expReportNumber'},
            {name: 'expReportBarcode'},
            {name: 'employeeId'},
            {name: 'positionId'},
            {name: 'unitId'},
            {name: 'payeeCategory'},
            {name: 'payeeId'},
            {name: 'expReportTypeId'},
            {name: 'expenseUserGroupId'},
            {name: 'currencyCode'},
            {name: 'exchangeRateType'},
            {name: 'exchangeRateQuotation'},
            {name: 'exchangeRate'},
            {name: 'reportDate'},
            {name: 'periodName'},
            {name: 'reportStatus'},
            {name: 'jeCreationStatus'},
            {name: 'auditFlag'},
            {name: 'auditDate'},
            {name: 'gldInterfaceFlag'},
            {name: 'attachmentNum'},
            {name: 'description'},
            {name: 'writeOffStatus'},
            {name: 'writeOffCompletedDate'},
            {name: 'amortizationFlag'},
            {name: 'reversedFlag'},
            {name: 'sourceExpRepHeaderId'},
            {name: 'sourceType'},
            {name: 'paymentMethodId'},
            {name: 'createdBy'},
            {name: 'creationDate'},
            {name: 'lastUpdatedBy'},
            {name: 'lastUpdateDate'},
            {name: 'checkBy'},
            {name: 'reCheckBy'},
            {name: 'reversedBy'},
            {name: 'purOrganizationId'},
            {name: 'totalAmount'},
            {name: 'sourceDocId'},
            {name: 'payConfirmFlag'},
            {name: 'paidMoney'},
            {name: 'checkDate'},
            {name: 'recheckDate'},
            {name: 'unit_name'},
            {name: 'contract_header_id'},
            {name: 'contact_number'},
            {name: 'employee_code'},
            {name: 'employee_name'},
            {name: 'payee_category_name'},
            {name: 'payee_name'},
            {name: 'vender_type_id'},
            {name: 'vender_type_name'},
            {name: 'currency_name'},
            {name: 'quarter_num'},
            {name: 'quarter_num_fun'},
            {name: 'payment_date'},
            {name: 'requesition_date'},
            {name: 'exp_requisition_type_id'},
            {name: 'exp_report_type_cdoe'},
            {name: 'type_description'},
            {name: 'type_code'},
            {name: 'reversed_flag_name'},
            {name: 'reverse_number'},
            {name: 'requisition_status_value'},
            {name: 'requisition_status'},
            {name: 'paymented_samount'},
            {name: 'report_functional_amount'},
            {name: 'vat_amount'},
            {name: 'submit_name'},
            {name: 'reversed_number'}            
	       ]
});
