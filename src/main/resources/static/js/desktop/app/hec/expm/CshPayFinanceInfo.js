Ext.define('desktop.app.hec.expm.CshPayFinanceInfo',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.CshPayFinanceInfo'],
	
	
	moduleName:"expm",//请求模块名称    
	controllersName:"CshPayFinanceInfos",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.expm.model.CshPayFinanceInfo';
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
			         	text:'摘要',
			         	width:150,
			         	dataIndex:'description',
			         	sortable:true			         	
			         },{
			         	text:'责任中心',
			         	dataIndex:'responsibility_center_name',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'科目代码',
			         	dataIndex:'account_code',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'科目名称',
			         	dataIndex:'account_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'借方金额',
			         	dataIndex:'entered_amount_dr',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'贷方金额',
			         	dataIndex:'entered_amount_cr',
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
Ext.define('desktop.app.hec.expm.model.CshPayFinanceInfo',{
	extend: 'Ext.data.Model',
	fields:[
			{name:'write_off_id'},
			{name:'description'},
			{name:'responsibility_center_name'},
			{name:'account_code'},
			{name:'account_name'},
			{name:'entered_amount_dr'},
			{name:'entered_amount_cr'},
			{name:'functional_amount_dr'},
			{name:'functional_amount_cr'},
			{name:'creation_date'}
	       ]
});
