Ext.define('desktop.app.hec.cont.ConContractHeadersExpenseReport',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.ConContractHeadersExpenseReport'],
	
	
	moduleName:"cont",//请求模块名称    
	controllersName:"ConContractHeadersExpenseReports",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.cont.model.ConContractHeadersExpenseReport';
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
    		title:'报销单查看',
    		height:600,
    		width:950,
    		constrainHeader:true
    	});
    	win.show();
    	win.maximize();
    },
    cellClick:function(grid,td,cellIndex,record,tr,rowIndex,e){
    	var header_id=record.get('exp_report_header_id');
    	var instance_id=record.get('instanceId')==undefined||record.get('instanceId')==null||record.get('instanceId')==''?-1:record.get('instanceId');
    	var documentNumber=record.get('exp_requisition_number');
    	var record_id=record.get('record_id')==undefined||record.get('record_id')==null||record.get('record_id')==''?-1:record.get('record_id');
    	var doc_type=documentNumber.substring(0,2);
    	var params={instance_id:instance_id,header_id:header_id,record_id:record_id,doc_type:doc_type};
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
			         	text:'单据编号',
			         	width:150,
			         	dataIndex:'exp_requisition_number',
			         	sortable:true,
			         	renderer:function(value,o,record){			         		
			         		var val=Ext.String.format('<a href="#">{0}</a>',value);
			         		return val;
			         	}
			         },{
			         	text:'单据类型',
			         	dataIndex:'type_description',
			         	width:100,
			         	sortable:true
			         },{
			         	text:'报销日期',
			         	dataIndex:'requisition_date',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'含税金额',
			         	dataIndex:'sum_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'收款方',
			         	dataIndex:'payee_category_name',
			         	width:150,
			         	sortable:true
				     },{				    	
			         	text:'收款方',
			         	dataIndex:'payee_name',
			         	width:150,
			         	sortable:true
				     },{				    	
			         	text:'报销人',
			         	dataIndex:'employee_name',
			         	width:150,
			         	sortable:true
				     },{				    	
			         	text:'状态',
			         	dataIndex:'requisition_status',
			         	width:150,
			         	sortable:true
				     }]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'payment_header_id'
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
Ext.define('desktop.app.hec.cont.model.ConContractHeadersExpenseReport',{
	extend: 'Ext.data.Model',
	fields:[
            {name:'exp_report_header_id'},
        	{name:'exp_requisition_number'},
        	{name:'employee_id'},
        	{name:'employee_code'},
        	{name:'employee_name'},
        	{name:'partner_category'},
        	{name:'payee_category_name'},
        	{name:'payee_id'},
        	{name:'payee_name'},
        	{name:'currency_code'},
        	{name:'exchange_rate_type'},
        	{name:'exchange_rate_quotation'},
        	{name:'quarter_num'},
        	{name:'vat_amount_num'},
        	{name:'quarter_num_fun'},
        	{name:'period_name'},
        	{name:'je_creation_status'},
        	{name:'gld_interface_flag'},
        	{name:'createdBy'},
        	{name:'creationDate'},
        	{name:'lastUpdatedBy'},
        	{name:'lastUpdateDate'},
        	{name:'requisition_date'},
        	{name:'exp_requisition_type_id'},
        	{name:'type_description'},
        	{name:'type_code'},
        	{name:'description'},
        	{name:'requisition_status_value'},
        	{name:'requisition_status'},
        	{name:'document_write_off_amount'},
        	{name:'sum_amount'}
	       ]
});
