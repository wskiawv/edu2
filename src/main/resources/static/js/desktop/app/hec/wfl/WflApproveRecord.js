Ext.define('desktop.app.hec.wfl.WflApproveRecord',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.WflApproveRecord'],
	
	
	moduleName:"wfl",//请求模块名称    
	controllersName:"WflApproveRecords",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.wfl.model.WflApproveRecord';
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
			         	text:'日期',
			         	width:150,
			         	dataIndex:'creation_date',
			         	sortable:true			         	
			         },{
			         	text:'审批节点',
			         	dataIndex:'node_name',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'处理人',
			         	dataIndex:'user_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'动作',
			         	dataIndex:'action_title',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'处理意见',
			         	dataIndex:'comment_text',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'附件数',
			         	dataIndex:'check_file',
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
Ext.define('desktop.app.hec.wfl.model.WflApproveRecord',{
	extend: 'Ext.data.Model',
	fields:[ 
		{name:'instanceId'},
		{name:'user_name'},
		{name:'rcpt_record_id'},
		{name:'action_title'},
		{name:'record_id'},
		{name:'creation_date'},
		{name:'node_name'},
		{name:'action_type'},
		{name:'sequence_num'},
		{name:'comment_text_d'},
		{name:'comment_text'},
		{name:'attachment_id'},
		{name:'icon_name'},
		{name:'table_name'},
		{name:'att_num'}
	       ]
});
