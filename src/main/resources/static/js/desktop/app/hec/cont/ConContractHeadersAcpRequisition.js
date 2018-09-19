Ext.define('desktop.app.hec.cont.ConContractHeadersAcpRequisition',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.ConContractHeadersAcpRequisition'],
	
	
	moduleName:"cont",//请求模块名称    
	controllersName:"ConContractHeadersAcpRequisitions",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.cont.model.ConContractHeadersAcpRequisition';
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
    	var header_id=record.get('acp_requisition_header_id');
    	var instance_id=record.get('instanceId')==undefined||record.get('instanceId')==null||record.get('instanceId')==''?-1:record.get('instanceId');
    	var documentNumber=record.get('requisition_number');
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
			         	dataIndex:'requisition_number',
			         	sortable:true,
			         	renderer:function(value,o,record){			         		
			         		var val=Ext.String.format('<a href="#">{0}</a>',value);
			         		return val;
			         	}
			         },{
			         	text:'单据类型',
			         	dataIndex:'exp_report_type_name',
			         	width:100,
			         	sortable:true
			         },{
			         	text:'币种',
			         	dataIndex:'currency',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'申请日期',
			         	dataIndex:'requisition_date',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'申请金额',
			         	dataIndex:'amount',
			         	width:150,
			         	sortable:true
				     },{				    	
			         	text:'付款申请人',
			         	dataIndex:'req_name',
			         	width:150,
			         	sortable:true
				     },{				    	
			         	text:'机构',
			         	dataIndex:'organization_name',
			         	width:150,
			         	sortable:true
				     },{				    	
			         	text:'部门',
			         	dataIndex:'dept_name',
			         	width:150,
			         	sortable:true
				     },{				    	
			         	text:'状态',
			         	dataIndex:'status',
			         	width:150,
			         	sortable:true
				     },{				    	
			         	text:'描述',
			         	dataIndex:'description',
			         	width:150,
			         	sortable:true
				     }]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'acp_requisition_header_id'
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
Ext.define('desktop.app.hec.cont.model.ConContractHeadersAcpRequisition',{
	extend: 'Ext.data.Model',
	fields:[
        	{name:'acp_requisition_header_id'},
        	{name:'company_id'},
        	{name:'operation_unit_id'},
        	{name:'employee_id'},
        	{name:'requisition_number'},
        	{name:'exp_report_type_name'},
        	{name:'position_display'},
        	{name:'sys_date'},
        	{name:'req_name'},
        	{name:'requisition_date'},
        	{name:'acp_req_type_id'},
        	{name:'transaction_category'},
        	{name:'payment_method_id'},
        	{name:'partner_category'},
        	{name:'partner_id'},
        	{name:'amount'},
        	{name:'currency_code'},
        	{name:'currency'},
        	{name:'description'},
        	{name:'status'},
        	{name:'approval_date'},
        	{name:'approved_by'},
        	{name:'closed_date'},
        	{name:'unit_id'},
        	{name:'position_id'},
        	{name:'source_type'},
        	{name:'payment_com_id'},
        	{name:'acp_ref_rpt_number'},
        	{name:'organization_name'},
        	{name:'dept_name'}
	       ]
});
