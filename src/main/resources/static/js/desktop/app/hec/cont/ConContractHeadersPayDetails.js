Ext.define('desktop.app.hec.cont.ConContractHeadersPayDetails',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.ConContractHeadersPayDetails'],
	
	
	moduleName:"cont",//请求模块名称    
	controllersName:"ConContractHeadersPayDetailes",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.cont.model.ConContractHeadersPayDetails';
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
			         	text:'付款日期',
			         	width:120,
			         	dataIndex:'p_transaction_date',
			         	sortable:true			         	
			         },{
			         	text:'付款金额',
			         	dataIndex:'transaction_amount',
			         	width:100,
			         	sortable:true
			         },{
			         	text:'收款人姓名',
			         	dataIndex:'partner_code_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'开户银行',
			         	dataIndex:'bank_account_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'银行账号',
			         	dataIndex:'bank_account_code',
			         	width:200,
			         	sortable:true
				     },{
			         	text:'反冲',
			         	dataIndex:'reversed',
			         	width:150,
			         	sortable:true
				     },{				    	
			         	text:'退款',
			         	dataIndex:'returned',
			         	width:150,
			         	sortable:true
				     },{				    	
			         	text:'经办人',
			         	dataIndex:'agent_name',
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
Ext.define('desktop.app.hec.cont.model.ConContractHeadersPayDetails',{
	extend: 'Ext.data.Model',
	fields:[            
        	{name:'transaction_header_id'},
        	{name:'payment_header_id'},
        	{name:'transaction_num'},
        	{name:'transaction_date'},
        	{name:'p_transaction_date'},
        	{name:'currency_code'},
        	{name:'transaction_amount'},
        	{name:'bank_account_code'},
        	{name:'bank_account_name'},
        	{name:'partner_category'},
        	{name:'p_partner_category'},
        	{name:'partner_id'},
        	{name:'partner_code_name'},
        	{name:'document_num'},
        	{name:'user_name'},
        	{name:'user_desc'},
        	{name:'payment_method_id'},
        	{name:'agent_name'},
        	{name:'posted_flag'},
        	{name:'reversed'},
        	{name:'returned'}
	       ]
});
