Ext.define('desktop.app.hec.wfl.WflWorkflowInstance',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:['widget.WflWorkflowInstance'],
	
	
	moduleName:"wfl",//请求模块名称    
	controllersName:"WflWorkflowInstances",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.wfl.model.WflWorkflowInstance';
	},

    /**
     * 搜索panel的高度
     * @return {Number}
     */
    getSearchFieldHeight : function(){
    	return 100;
    },
    detailNewWindow:function(params){
    	var win=Ext.create('desktop.app.hec.wfl.WflDocumentShow',{
    		params:params,
    		title:'工作流监控单据查看',
    		height:600,
    		width:950,
    		constrainHeader:true
    	});
    	win.show();
    	win.maximize();
    },
    cellClick:function(grid,td,cellIndex,record,tr,rowIndex,e){
    	var header_id=record.get('instanceParam');
    	var instance_id=record.get('instanceId');
    	var documentNumber=record.get('order_no');
    	var record_id=record.get('record_id')==undefined||record.get('record_id')==null||record.get('record_id')==''?-1:record.get('record_id');
    	var doc_type=documentNumber.substring(0,2);
    	var params={instance_id:instance_id,header_id:header_id,record_id:record_id,doc_type:doc_type};
    	var me=this;
    	if(cellIndex==3){    		    		
        	me.detailNewWindow(params);
    	}
    	
    },
    getGridColumns : function(){    	
    	var columns=[Ext.create('Ext.grid.RowNumberer',{
			    		width:35,
						text:'序号'
    				}),{        	
			         	text:'单据编号',
			         	width:150,
			         	dataIndex:'order_no',
			         	sortable:true,
			         	renderer:function(value,o,record){
			         		var header_id=record.get('instanceParam');
			         		var val=Ext.String.format('<a href="#">{0}</a>',value);
			         		return val;
			         	}
			         },{
			         	text:'单据类型',
			         	dataIndex:'order_type',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'状态',
			         	dataIndex:'status_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'工作流名称',
			         	dataIndex:'workflow_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'创建时间',
			         	dataIndex:'creation_date_desc',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'更新时间',
			         	dataIndex:'last_update_date_desc',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'当前审批人',
			         	dataIndex:'curr_approve_name',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'创建人',
			         	dataIndex:'create_by_desc',
			         	width:150,
			         	sortable:true
				     }
			         ]
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
                '<p><b>当前审批人:</b> {curr_approve_name}</p><br>'           
                            
           );
		return tpl;
	},
    /**
     * 配置搜索字段
     * @return {}
     */
    getSearchFields: function(){
		return [{
				fieldLabel: '单据编号',
				name: 'order_no',
				anchor: '100%'
			},{
				fieldLabel: '工作流名称',
				name: 'workflow_name',
				anchor: '100%'		
			
		}]
		
	}
});
Ext.define('desktop.app.hec.wfl.model.WflWorkflowInstance',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'instanceId'},
            {name:'workflowId'},
            {name:'status'},
            {name:'currentNode'},
            {name:'instanceParam'},
            {name:'statusDesc'},
            {name:'status_name'},
            {name:'curr_approve_name'},
            {name:'create_by_name'},
            {name:'create_by_desc'},
            {name:'last_approve_name'},
            {name:'last_approve_desc'},
            {name:'order_type'},
            {name:'order_no'},
            {name:'date_limit'},
            {name:'is_admin'},
            {name:'approveCount'},
            {name:'instanceDesc'},
            {name:'nodeResult'},
            {name:'attachmentId'},
            {name:'createdBy'},
            {name:'creationDate'},
            {name:'creation_date_desc'},        
            {name:'workflow_name'},
            {name:'workflow_category'},
            {name:'lastUpdatedBy'},
            {name:'lastUpdateDate'},
            {name:'last_update_date_desc'},
            {name:'documentNumber'},
            {name:'currentHandler'}
	       ]
});
