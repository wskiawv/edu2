Ext.define('desktop.app.hec.cont.ConPaymentSchedules',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.ConPaymentSchedules'],
	
	
	moduleName:"cont",//请求模块名称    
	controllersName:"ConPaymentScheduless",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.cont.model.ConPaymentSchedules';
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
    	var contractHeaderId=record.get('contractHeaderId');
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
			         	width:40,
			         	dataIndex:'payment_schedule_line_number',
			         	sortable:true			         	
			         },{
			         	text:'计划交付日期',
			         	dataIndex:'due_date',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'金额',
			         	dataIndex:'amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'支付金额',
			         	dataIndex:'payment_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'收款金额',
			         	dataIndex:'receipt_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'说明',
			         	dataIndex:'memo',
			         	width:150,
			         	sortable:true
				     },{
				    	xtype: 'checkcolumn',
				    	stopSelection: false,
			         	text:'冻结',
			         	dataIndex:'frozen_flag',
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
Ext.define('desktop.app.hec.cont.model.ConPaymentSchedules',{
	extend: 'Ext.data.Model',
	fields:[ 
            {name:'contractHeaderId'},
        	{name:'payment_schedule_line_id'},
        	{name:'payment_schedule_line_number'},
        	{name:'frozen_flag'},
        	{name:'expense_type_id'},
        	{name:'req_item_id'},
        	{name:'amount'},
        	{name:'payment_method'},
        	{name:'partnerCategory'},
        	{name:'partnerId'},
        	{name:'due_date'},
        	{name:'actual_date'},
        	{name:'memo'},
        	{name:'currencyCode'},
        	{name:'start_date'},
            {name:'company_id'},
            {name:'partner_code'},
            {name:'billing_amount'},
            {name:'receipt_amount'},
            {name:'payment_amount'},
            {name:'modify_flag'},
            {name:'status'},
            {name:'p_count'},
            {name:'c_count'},
            {name:'r_count'}
	       ]
});
