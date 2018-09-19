Ext.define('desktop.app.hec.acp.AcpAcpRequisitionLns',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.AcpAcpRequisitionLns'],
	
	
	moduleName:"acp",//请求模块名称    
	controllersName:"AcpAcpRequisitionLnies",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.acp.model.AcpAcpRequisitionLns';
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
			         	text:'关联单据类型',
			         	dataIndex:'line_type',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'单据编号',
			         	dataIndex:'ref_document_num',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'单据行',
			         	dataIndex:'ref_doc_line_num',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'付款方式',
			         	dataIndex:'payment_method',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'收款对象',
			         	dataIndex:'payee_type',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'收款方',
			         	dataIndex:'payee_partner_name',
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
			         	text:'行金额',
			         	dataIndex:'due_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'未支付金额',
			         	dataIndex:'unpayment_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'可申请金额',
			         	dataIndex:'can_req_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'本次申请金额',
			         	dataIndex:'req_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'合同编号',
			         	dataIndex:'contract_number',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'合同资金计划行',
			         	dataIndex:'line_number',
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
		    	name:'AcpAcpRequisitionLnsId'
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
Ext.define('desktop.app.hec.acp.model.AcpAcpRequisitionLns',{
	extend: 'Ext.data.Model',
	fields:[
            {name:'acpRequisitionHeaderId'},
        	{name:'line_type_code'},
        	{name:'ref_document_id'},
        	{name:'ref_document_num'},
        	{name:'payment_schedule_line_id'},
        	{name:'ref_document_line_id'},
        	{name:'ref_doc_line_num'},
        	{name:'USEDES_ID'},
        	{name:'usedes_name'},
        	{name:'payee_type'},
        	{name:'payee_type_value'},
        	{name:'payee_id'},
        	{name:'payee_partner_name'},
        	{name:'due_amount'},
        	{name:'paymentMethodId'},
        	{name:'payment_type_id'},
        	{name:'payment_method'},
        	{name:'plan_pay_date'},
        	{name:'req_amount'},
            {name:'account_name'},
            {name:'bank_code'},
            {name:'bank_name'},
            {name:'bank_location_name'},
            {name:'bank_location_code'},
            {name:'province_code'},
            {name:'province_name'},
            {name:'city_code'},
            {name:'city_name'},
            {name:'account_number'},
            {name:'contract_number'},
            {name:'line_number'},
            {name:'acp_requisition_line_id'},
            {name:'companyId'},
            {name:'payment_status'},
            {name:'contract_header_id'},
            {name:'payment_sch_line_id'},
            {name:'unpayment_amount'},
            {name:'can_req_amount'}
	       ]
});
