Ext.define('desktop.app.hec.expm.ContractWriteoffHistory',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.ContractWriteoffHistory'],
	
	
	moduleName:"expm",//请求模块名称    
	controllersName:"ContractWriteoffHistories",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.expm.model.ContractWriteoffHistory';
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
			         	text:'归还日期',
			         	width:100,
			         	dataIndex:'write_off_date',
			         	sortable:true			         	
			         },{
			         	text:'期间名称',
			         	dataIndex:'period_name',
			         	width:100,
			         	sortable:true
			         },{
			         	text:'归还类别',
			         	dataIndex:'write_off_type',
			         	width:150,
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
			         	sortable:true
				     },{
			         	text:'合同编号',
			         	dataIndex:'contract_number',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'借款金额',
			         	dataIndex:'csh_write_off_amount',
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
		    	name:'exp_report_header_id'
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
Ext.define('desktop.app.hec.expm.model.ContractWriteoffHistory',{
	extend: 'Ext.data.Model',
	fields:[ 
            {name:'exp_report_header_id'},
        	{name:'document_id'},
        	{name:'write_off_id'},
        	{name:'write_off_date'},
        	{name:'period_name'},
        	{name:'write_off_type'},
        	{name:'csh_write_off_amount'},
        	{name:'transaction_num'},
        	{name:'prepayment'},
        	{name:'payment_requisition_number'},
        	{name:'payment_requisition_header_id'},
        	{name:'report_status'},
        	{name:'create_by_desc'},
        	{name:'exp_report_number'},
        	{name:'contract_header_id'},
        	{name:'contract_number'}
	       ]
});
