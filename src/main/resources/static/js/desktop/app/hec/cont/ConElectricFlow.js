Ext.define('desktop.app.hec.cont.ConElectricFlow',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.ConElectricFlow'],
	
	
	moduleName:"cont",//请求模块名称    
	controllersName:"ConElectricFlows",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.cont.model.ConElectricFlow';
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
			         	dataIndex:'electric_flow_line_number',
			         	sortable:true			         	
			         },{
			         	text:'状态',
			         	dataIndex:'is_valid_flag_display',
			         	width:100,
			         	sortable:true
			         },{
			         	text:'电子签报编号',
			         	dataIndex:'electric_flow_code',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'电子签报金额',
			         	dataIndex:'electric_flow_amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'当前合同占用电子签报金额',
			         	dataIndex:'con_used_ef_amount',
			         	width:200,
			         	sortable:true
				     },{
			         	text:'说明',
			         	dataIndex:'description',
			         	width:150,
			         	sortable:true
				     },{				    	
			         	text:'已关联合同',
			         	dataIndex:'already_associated_contract',
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
Ext.define('desktop.app.hec.cont.model.ConElectricFlow',{
	extend: 'Ext.data.Model',
	fields:[
            {name:'contractHeaderId'},
        	{name:'electric_flow_line_id'},
        	{name:'electric_flow_line_number'},
        	{name:'electric_flow_code'},
        	{name:'electric_flow_amount'},
        	{name:'currency_code'},
        	{name:'description'},
        	{name:'is_valid_flag'},
        	{name:'is_valid_flag_display'},
        	{name:'already_associated_contract'},
        	{name:'con_used_ef_amount'}
	       ]
});
