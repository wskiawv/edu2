Ext.define('desktop.app.hec.expm.CshPayWriteoffDetail',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.CshPayWriteoffDetail'],
	
	
	moduleName:"expm",//请求模块名称    
	controllersName:"CshPayWriteoffDetails",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.expm.model.CshPayWriteoffDetail';
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
			         	text:'归还类别',
			         	width:150,
			         	dataIndex:'write_off_type',
			         	sortable:true			         	
			         },{
			         	text:'现金事务编号',
			         	dataIndex:'transaction_num',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'借款单编号',
			         	dataIndex:'payment_requisition_number',
			         	width:150,
			         	sortable:true,
			         	renderer:function(value,o,record){		
			         		if (record.get("exp_report_number")==null||record.get("exp_report_number")==""||record.get("exp_report_number")==undefined) {
			         			var val=Ext.String.format('<a style="color:red" href="#">{0}</a>',value);
			         			return val;
			         		}else{
			         			var val=Ext.String.format('<a style="color:green" href="#">{0}</a>',value);
			         			return val;
			         		}
			         		return value;
			         	}
				     },{
			         	text:'合同编号',
			         	dataIndex:'contract_number',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'事项',
			         	dataIndex:'event_desc',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'交易日期',
			         	dataIndex:'transaction_date',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'借款金额',
			         	dataIndex:'transaction_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'借款余额',
			         	dataIndex:'unwrite_off_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'本次归还金额',
			         	dataIndex:'now_write_off_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'单据编号',
			         	dataIndex:'exp_report_number',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'创建人',
			         	dataIndex:'create_by_desc',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'审批状态',
			         	dataIndex:'requisition_status',
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
Ext.define('desktop.app.hec.expm.model.CshPayWriteoffDetail',{
	extend: 'Ext.data.Model',
	fields:[
			{name:'payment_schedule_line_id'},
			{name:'transaction_header_id'},
			{name:'exp_report_number'},
			{name:'payment_requisition_number'},
			{name:'transaction_num'},
			{name:'write_off_type'},
			{name:'transaction_date'},
			{name:'transaction_amount'},
			{name:'unwrite_off_amount'},
			{name:'now_write_off_amount'},
			{name:'event_code'},
			{name:'event_desc'},
			{name:'payment_requisition_header_id'},
			{name:'requisition_status'},
			{name:'create_by_desc'},
			{name:'contract_header_id'},
			{name:'contract_number'}
	       ]
});
