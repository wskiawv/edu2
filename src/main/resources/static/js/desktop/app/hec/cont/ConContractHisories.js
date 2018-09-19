Ext.define('desktop.app.hec.cont.ConContractHisories',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.ConContractHisories'],
	
	
	moduleName:"cont",//请求模块名称    
	controllersName:"ConContractHisoriess",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.cont.model.ConContractHisories';
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
			         	text:'处理时间',
			         	width:120,
			         	dataIndex:'operation_time',
			         	sortable:true			         	
			         },{
			         	text:'处理人',
			         	dataIndex:'operater',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'操作',
			         	dataIndex:'operation',
			         	width:100,
			         	sortable:true
				     },{
			         	text:'处理意见',
			         	dataIndex:'description',
			         	width:200,
			         	sortable:true
				     }]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'contract_header_id'
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
Ext.define('desktop.app.hec.cont.model.ConContractHisories',{
	extend: 'Ext.data.Model',
	fields:[
            {name:'contract_header_id'},
        	{name:'description'},
        	{name:'operation_code'},
        	{name:'operation_time'},
        	{name:'user_id'},
        	{name:'operation'},
        	{name:'employee_id'},
        	{name:'operater'}
	       ]
});
