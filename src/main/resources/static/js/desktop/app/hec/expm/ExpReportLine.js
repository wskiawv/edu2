Ext.define('desktop.app.hec.expm.ExpReportLine',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.ExpReportLine'],
	
	
	moduleName:"expm",//请求模块名称    
	controllersName:"ExpReportLines",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.expm.model.ExpReportLine';
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
    cellClick:function(grid,td,cellIndex,record,tr,rowIndex,e){
    	var header_id=record.get('expReportHeaderId');
    	var me=this;
    	if(cellIndex==3){    		    		
        	me.detailNewWindow(header_id);
    	}
    	
    },
    getGridColumns : function(){ 
    	var me=this;
    	
    	var columns=[Ext.create('Ext.grid.RowNumberer',{
			    		width:35,
						text:'序号'
    				}),{        	
			         	text:'机构',
			         	width:150,
			         	dataIndex:'company_name',
			         	sortable:true			         	
			         },{
			         	text:'部门',
			         	dataIndex:'unit_name',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'日期',
			         	dataIndex:'dateFromDisplay',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'费用项目',
			         	dataIndex:'expense_type_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'单据类型',
			         	dataIndex:'exp_req_item_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'发票类型',
			         	dataIndex:'e_invoice_flag_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'含税金额',
			         	dataIndex:'line_report_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'税率(%)',
			         	dataIndex:'vat_rate',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'不含税金额',
			         	dataIndex:'reportFunctionalAmount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'税金',
			         	dataIndex:'vat_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'发票号码',
			         	dataIndex:'vat_no',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'发票代码',
			         	dataIndex:'vat_sn',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'开票日期',
			         	dataIndex:'vat_date_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'出发地',
			         	dataIndex:'cityFrom',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'目的地',
			         	dataIndex:'cityTo',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'日期从',
			         	dataIndex:'dateFromDisplay',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'日期到',
			         	dataIndex:'dateToDisplay',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'产品',
			         	dataIndex:'d4',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'备注',
			         	dataIndex:'description',
			         	width:150,
			         	sortable:true
				     }]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'expReportLineId'
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
Ext.define('desktop.app.hec.expm.model.ExpReportLine',{
	extend: 'Ext.data.Model',
	fields:[ 
            {name: 'expReportLineId'},
            {name: 'expReportHeaderId'},
            {name: 'lineNumber'},
            {name: 'cityFrom'},
            {name: 'placeTypeId'},
            {name: 'placeId'},
            {name: 'description'},
            {name: 'dateFrom'},
            {name: 'dateTo'},          
            {name: 'periodName'},
            {name: 'currencyCode'},
            {name: 'exchangeRateType'},
            {name: 'exchangeRateQuotation'},
            {name: 'exchangeRate'},
            {name: 'expenseTypeId'},
            {name: 'expenseItemId'},
            {name: 'budgetItemId'},
            {name: 'price'},
            {name: 'primaryQuantity'},
            {name: 'primaryUom'},
            {name: 'secondaryQuantity'},
            {name: 'secondaryUom'},
            {name: 'reportAmount'},
            {name: 'reportFunctionalAmount'},
            {name: 'distributionSetId'},
            {name: 'companyId'},
            {name: 'operationUnitId'},
            {name: 'unitId'},
            {name: 'positionId'},
            {name: 'responsibilityCenterId'},
            {name: 'employeeId'},
            {name: 'payeeCategory'},
            {name: 'payeeId'},
            {name: 'partnerId'},
            {name: 'paymentFlag'},
            {name: 'reportStatus'},
            {name: 'auditFlag'},
            {name: 'auditDate'},
            {name: 'writeOffStatus'},
            {name: 'writeOffComletedDate'},
            {name: 'attachmentNum'},
            {name: 'd1'},
            {name: 'd2'},
            {name: 'd3'},
            {name: 'd4'},
            {name: 'd5'},
            {name: 'd6'},
            {name: 'd7'},
            {name: 'd8'},
            {name: 'd9'},
            {name: 'd10'},
            {name: 'e1'},
            {name: 'e2'},
            {name: 'e3'},
            {name: 'e4'},
            {name: 'e5'},
            {name: 'e6'},
            {name: 'e7'},
            {name: 'e8'},
            {name: 'e9'},
            {name: 'e10'},
            {name: 'createdBy'},
            {name: 'creationDate'},
            {name: 'lastUpdatedBy'},
            {name: 'lastUpdateDate'},
            {name: 'accountName'},
            {name: 'accountNumber'},
            {name: 'paymentTypeId'},
            {name: 'paymentType'},
            {name: 'invoiceAmount'},
            {name: 'eventDesc'},
            {name: 'expReportLineType'},
            {name: 'refDocumentId'},
            {name: 'purBusinessType'},
            {name: 'notes'},
            {name: 'itemId'},
            {name: 'itemName'},
            {name: 'specifications'},
            {name: 'reqItemId'},
            {name: 'refDocLineId'},
            {name: 'expReportTaxAdjType'},
            {name: 'cityTo'},            
            {name: 'e_invoice_flag'},
            {name: 'e_invoice_flag_display'},
            {name: 'share_flag'},
            {name: 'line_report_amount'},
            {name: 'place'},
            {name: 'company_name'},
            {name: 'unit_name'},
            {name: 'expense_type_name'},
            {name: 'exp_req_item_name'},
            {name: 'responsibility_center_name'},
            {name: 'employee_name'},
            {name: 'exchange_rate_type_name'},
            {name: 'exchange_rate_quotation_name'},
            {name: 'payee_category_name'},
            {name: 'payee_name'},
            {name: 'exp_req_item_id'},
            {name: 'vat_sn'},
            {name: 'vat_no'},
            {name: 'vat_date'},
            {name: 'vat_date_display'},
            {name: 'vat_amount'},
            {name: 'vat_rate_display'},
            {name: 'vat_rate'},
            {name: 'dateFromDisplay'},
            {name: 'dateToDisplay'}
	       ]
});
