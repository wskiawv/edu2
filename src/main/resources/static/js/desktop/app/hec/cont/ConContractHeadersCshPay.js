Ext.define('desktop.app.hec.cont.ConContractHeadersCshPay',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.ConContractHeadersCshPay'],
	
	
	moduleName:"cont",//请求模块名称    
	controllersName:"ConContractHeadersCshPays",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.cont.model.ConContractHeadersCshPay';
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
    		title:'借款单查看',
    		height:600,
    		width:950,
    		constrainHeader:true
    	});
    	win.show();
    	win.maximize();
    },
    cellClick:function(grid,td,cellIndex,record,tr,rowIndex,e){
    	var header_id=record.get('payment_requisition_header_id');
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
			         	text:'借款类型',
			         	dataIndex:'type_description',
			         	width:100,
			         	sortable:true
			         },{
			         	text:'借款人',
			         	dataIndex:'requisitor',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'借款金额',
			         	dataIndex:'amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'计划行金额',
			         	dataIndex:'cprl_amount',
			         	width:200,
			         	sortable:true
				     },{
			         	text:'收款对象',
			         	dataIndex:'p_partner_category',
			         	width:150,
			         	sortable:true
				     },{				    	
			         	text:'收款方',
			         	dataIndex:'payee_name',
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
Ext.define('desktop.app.hec.cont.model.ConContractHeadersCshPay',{
	extend: 'Ext.data.Model',
	fields:[
        	{name:'payment_requisition_header_id'},
        	{name:'requisition_number'},
        	{name:'employee_id'},
        	{name:'requisitor'},
        	{name:'requisition_date'},
        	{name:'currency_code'},
        	{name:'amount'},
        	{name:'fun_amount'},
        	{name:'partner_category'},
        	{name:'p_partner_category'},
        	{name:'partner_id'},
        	{name:'payee_name'},
        	{name:'description'},
        	{name:'sum_amount'},
            {name:'payment_method'},
            {name:'exp_requisition_type_id'},
            {name:'type_code'},
            {name:'type_description'},
            {name:'requisition_status_value'},
            {name:'requisition_status'},
            {name:'cprl_amount'}
	       ]
});
