Ext.define('desktop.app.hec.csh.CshPaymentRequisitionLine',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.CshPaymentRequisitionLine'],
	
	
	moduleName:"csh",//请求模块名称    
	controllersName:"CshPaymentRequisitionLines",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.csh.model.CshPaymentRequisitionLine';
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
			         	text:'行号',
			         	width:80,
			         	dataIndex:'line_number',
			         	sortable:true			         	
			         },{
			         	text:'借款类型',
			         	dataIndex:'csh_transaction_class_code',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'收款对象',
			         	dataIndex:'partner_category_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'收款方',
			         	dataIndex:'p_partner_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'合同编号',
			         	dataIndex:'contract_number',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'合同资金计划行',
			         	dataIndex:'payment_schedule_line_number',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'申请金额',
			         	dataIndex:'amount',
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
			         	text:'税金',
			         	dataIndex:'vat_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'开票日期',
			         	dataIndex:'vat_date',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'税率(%)',
			         	dataIndex:'vat_rate',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'银行名称',
			         	dataIndex:'bank_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'银行户名',
			         	dataIndex:'account_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'银行账号',
			         	dataIndex:'account_number',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'付款方式',
			         	dataIndex:'payment_method_id_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'预计还款日',
			         	dataIndex:'plan_payment_date',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'修改后预计还款日',
			         	dataIndex:'new_plan_payment_date',
			         	width:150,
			         	sortable:true
				     }]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'CshPaymentRequisitionLineId'
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
Ext.define('desktop.app.hec.csh.model.CshPaymentRequisitionLine',{
	extend: 'Ext.data.Model',
	fields:[
            {name:'paymentRequisitionHeaderId'},
        	{name:'payment_requisition_line_id'},
        	{name:'payment_requisition_line_type'},
        	{name:'p_payment_req_line_type'},
        	{name:'payment_method_id_display'},
        	{name:'payment_method_id'},
        	{name:'amount'},
        	{name:'description'},
        	{name:'ref_document_id'},
        	{name:'account_number'},
        	{name:'account_name'},
        	{name:'ref_document_id_display'},
        	{name:'ref_line_number'},
        	{name:'need_payment_amount'},
        	{name:'requisited_amount'},
        	{name:'requisited_payment_amount'},
            {name:'contract_header_id'},
            {name:'contract_l_id'},
            {name:'p_partner_name'},
            {name:'company_id'},
            {name:'partner_category'},
            {name:'partner_category_name'},
            {name:'partner_id'},
            {name:'csh_transaction_class_code'},
            {name:'line_number'},
            {name:'cls_des'},
            {name:'ref_exp_requisition_flag'},
            {name:'requisition_payment_date'},
            {name:'account_type'},    
            {name:'plan_payment_date'},
            {name:'new_plan_payment_date'},
            {name:'instalment_id_display'},
            {name:'need_pay_amount'},
            {name:'vat_no'},
            {name:'vat_sn'},
            {name:'vat_date'},
            {name:'vat_amount'},
            {name:'vat_rate'},
            {name:'bank_name'},
            {name:'bank_code'},
            {name:'payment_header_id'},
            {name:'requisited_unpayment_amount'},
            {name:'contract_number'},
            {name:'payment_schedule_line_id'},
            {name:'payment_schedule_line_number'}
	       ]
});
