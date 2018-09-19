Ext.define('desktop.app.hec.wfl.WflNodePreview',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.WflNodePreview'],
	
	
	moduleName:"wfl",//请求模块名称    
	controllersName:"WflNodePreviews",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.wfl.model.WflNodePreview';
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
    	var header_id=record.get('check_file');
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
			         	text:'审批节点',
			         	width:150,
			         	dataIndex:'node_name',
			         	sortable:true			         	
			         },{
			         	text:'审批人',
			         	dataIndex:'employee_name',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'审批意见',
			         	dataIndex:'action_title',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'审批状态',
			         	dataIndex:'status',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'审批时间',
			         	dataIndex:'approve_time',
			         	width:150,
			         	sortable:true
				     }]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'instanceId'
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
Ext.define('desktop.app.hec.wfl.model.WflNodePreview',{
	extend: 'Ext.data.Model',
	fields:[ 
		{name:'instanceId'},
		{name:'employee_name'},
		{name:'current_employee_name'},
		{name:'action_title'},	
		{name:'node_name'},
		{name:'action_type'},
		{name:'approve_time'},
		{name:'status'},
		{name:'status_code'}	
	]
});
