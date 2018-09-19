Ext.define('desktop.app.hec.expm.ExpReportDists',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.ExpReportDists'],
	
	
	moduleName:"expm",//请求模块名称    
	controllersName:"ExpReportDistes",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.expm.model.ExpReportDists';
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
    	var header_id=record.get('exp_requisition_dists_id');
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
			         	text:'责任中心',
			         	dataIndex:'responsibility_center_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'报销金额',
			         	dataIndex:'requisition_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'税率(%)',
			         	dataIndex:'vat_rate',
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
			         	dataIndex:'vat_date',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'备注',
			         	dataIndex:'description',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'产品',
			         	dataIndex:'d1',
			         	width:150,
			         	sortable:true
				     }]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'exp_requisition_dists_id'
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
Ext.define('desktop.app.hec.expm.model.ExpReportDists',{
	extend: 'Ext.data.Model',
	fields:[            
            {name:'expReportLineId'},
        	{name:'exp_requisition_dists_id'},
        	{name:'description'},
        	{name:'period_num'},
        	{name:'period_year'},
        	{name:'currencyCode'},
        	{name:'exchangeRateType'},
        	{name:'exchangeRateQuotation'},
        	{name:'exchangeRate'},
        	{name:'expenseTypeId'},
        	{name:'expenseItemId'},
        	{name:'budgetItemId'},
        	{name:'price'},
        	{name:'primaryQuantity'},
        	{name:'primaryUom'},
            {name:'secondaryQuantity'},
            {name:'secondaryUom'},
            {name:'companyId'},
            {name:'company_name'},
            {name:'operationUnitId'},
            {name:'unitId'},
            {name:'unit_name'},
            {name:'positionId'},
            {name:'position_id_display'},
            {name:'responsibilityCenterId'},
            {name:'responsibility_center_name'},
            {name:'employeeId'},
            {name:'employeeName'},
            {name:'payeeCategory'},
            {name:'payee_name'},
            {name:'payeeId'},
            {name:'payee_code'},
            {name:'partnerId'},
            {name:'paymentFlag'},
            {name:'reportStatus'},
            {name:'auditFlag'},
            {name:'attachmentNum'},
            {name:'e1'},
            {name:'e2'},
            {name:'e3'},
            {name:'e4'},
            {name:'e5'},
            {name:'e6'},
            {name:'e7'},
            {name:'e8'},
            {name:'e9'},
            {name:'e10'},  
            {name:'d1'},
            {name:'d2'},
            {name:'d3'},
            {name:'d4'},
            {name:'d5'},
            {name:'d6'},
            {name:'d7'},
            {name:'d8'},
            {name:'d9'},
            {name:'d10'},
            {name:'requisition_amount'},
            {name:'requisition_functional_amount'},
            {name:'exceed_budget_strategy'},
            {name:'close_flag'},
            {name:'close_date'},
            {name:'createdBy'},
            {name:'creationDate'},
            {name:'lastUpdatedBy'},
            {name:'lastUpdateDate'},
            {name:'vat_sn'},
            {name:'vat_no'},
            {name:'vat_date'}, 
            {name:'vat_amount'},
            {name:'vat_rate'}
	       ]
});
