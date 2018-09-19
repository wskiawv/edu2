Ext.define('desktop.app.hec.cont.ConContractRequisition',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.ConContractRequisition'],
	
	
	moduleName:"cont",//请求模块名称    
	controllersName:"ConContractRequisitions",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.cont.model.ConContractRequisition';
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
			         	dataIndex:'line_number',
			         	width:40,
			         	sortable:true			         	
			         },{        	
			         	text:'单据编号',
			         	width:150,
			         	dataIndex:'requisition_number',
			         	sortable:true			         	
			         },{
			         	text:'期间',
			         	dataIndex:'period_name',
			         	width:100,
			         	sortable:true			         	
			         },{
			         	text:'报销类型',
			         	dataIndex:'expense_type_description',
			         	width:100,
			         	sortable:true			         	
				     },{
			         	text:'申请项目',
			         	dataIndex:'exp_req_item_description',
			         	width:100,
			         	sortable:true			         	
				     },{
			         	text:'单价',
			         	dataIndex:'price',
			         	width:100,
			         	sortable:true			         	
				     },{
			         	text:'数量',
			         	dataIndex:'primary_quantity',
			         	width:100,
			         	sortable:true			         	
				     },{
			         	text:'申请金额',
			         	dataIndex:'requisition_amount',
			         	width:100,
			         	sortable:true			         	
				     }]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'contractHeaderId'
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
Ext.define('desktop.app.hec.cont.model.ConContractRequisition',{
	extend: 'Ext.data.Model',
	fields:[
        	{name:'contractHeaderId'},
        	{name:'exp_requisition_header_id'},
        	{name:'exp_requisition_line_id'},
        	{name:'period_name'},
        	{name:'expense_type_id'},
        	{name:'expense_type_description'},
        	{name:'exp_req_item_id'},
        	{name:'exp_req_item_description'},
        	{name:'price'},
        	{name:'primary_quantity'},
        	{name:'requisition_amount'},
        	{name:'requisition_number'}, 
        	{name:'line_number'}
	       ]
});
