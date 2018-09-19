Ext.define('desktop.app.hec.expm.ExpReportPmtSchedule',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.ExpReportPmtSchedule'],
	
	
	moduleName:"expm",//请求模块名称    
	controllersName:"ExpReportPmtSchedules",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.expm.model.ExpReportPmtSchedule';
	},

    /**
     * 搜索panel的高度
     * @return {Number}
     */
    getSearchFieldHeight : function(){
    	return 100;
    },    
    
    detailNewWindow:function(params){
    	var win=Ext.create('desktop.app.hec.expm.CshPayDetailsWindow',{
    		params:params,
    		title:'报销单归还借款信息',
    		height:600,
    		width:950,
    		constrainHeader:true
    	});
    	win.show();
    	
    },
    cellClick:function(grid,td,cellIndex,record,tr,rowIndex,e){
    	var header_id=record.get('expReportHeaderId');
    	var payment_schedule_line_id=record.get('payment_schedule_line_id');
    	var params={payment_schedule_line_id:payment_schedule_line_id,header_id:header_id};
    	var me=this;
    	if(cellIndex==2){    		    		
        	me.detailNewWindow(params);
    	}
    	
    },
    getGridColumns : function(){ 
    	var me=this;
    	
    	var columns=[Ext.create('Ext.grid.RowNumberer',{
			    		width:35,
						text:'序号'
    				}),{        	
			         	text:'归还借款',
			         	width:150,
			         	dataIndex:'verification_loan',
			         	sortable:true,
			         	renderer:function(value,o,record){		
			         		if (record.get('un_write_off_flag') == 'N') {
			         			var val=Ext.String.format('<a style="color:red" href="#">{0}</a>',"归还借款");
			         			return val;
			         		}else{
			         			var val=Ext.String.format('<a style="color:green" href="#">{0}</a>',"归还借款");
			         			return val;
			         		}
			         		return value;
			         	}			         	
			         },{
			         	text:'金额',
			         	dataIndex:'due_amount',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'收款对象',
			         	dataIndex:'code_value_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'收款方',
			         	dataIndex:'description_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'开户银行',
			         	dataIndex:'bank_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'银行账号',
			         	dataIndex:'account_number',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'银行户名',
			         	dataIndex:'account_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'付款方式',
			         	dataIndex:'payment_method',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'合同资金计划行',
			         	dataIndex:'usedes_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'行号',
			         	dataIndex:'line_number',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'冻结',
			         	dataIndex:'frozen_flag',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'摘要',
			         	dataIndex:'description',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'借款单号',
			         	dataIndex:'requisition_number',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'还款金额',
			         	dataIndex:'payed_amount_list',
			         	width:150,
			         	sortable:true
				     }]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'payment_schedule_line_id'
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
Ext.define('desktop.app.hec.expm.model.ExpReportPmtSchedule',{
	extend: 'Ext.data.Model',
	fields:[ 
			{name:'payment_schedule_line_id'},
			{name:'expReportHeaderId'},
			{name:'code_value_name'},
			{name:'payee_type'},
			{name:'frozen_flag'},
			{name:'paid_money'},
			{name:'placeId'},
			{name:'companyId'},
			{name:'company_name'},
			{name:'code_value'},
			{name:'payee_type_value'},
			{name:'description'},
			{name:'currency_name'},
			{name:'due_amount'},
			{name:'schedule_start_date'},
			{name:'schedule_due_date'},
			{name:'currency'},
			{name:'bank_code'},
			{name:'bank_name'},
			{name:'bank_location_code'},
			{name:'bank_location_name'},
			{name:'province_code'},
			{name:'province_name'},
			{name:'city_code'},
			{name:'city_name'},
			{name:'schedule_line_number'},
			{name:'usedes'},
			{name:'usedes_name'},
			{name:'description_name'},	
			{name:'company_short_name'},
			{name:'payed_amount'},
			{name:'need_payment_amount'},
			{name:'contract_number'},
			{name:'contract_header_id'},
			{name:'line_number'},
			{name:'payment_sch_line_id'},
			{name:'account_number'},
			{name:'account_name'},
			{name:'payment_method'},
			{name:'payment_type_id'},
			{name:'write_off_amount'},
			{name:'un_write_off_flag'},
			{name:'can_req_amount'},
			{name:'unpayment_amount'},
			{name:'requisition_number'},
			{name:'payed_amount_list'}
	       ]
});
