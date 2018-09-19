Ext.define('desktop.app.hec.cont.ConContractPrivileges',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.ConContractPrivileges'],
	
	
	moduleName:"cont",//请求模块名称    
	controllersName:"ConContractPrivilegess",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.cont.model.ConContractPrivileges';
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
			         	text:'姓名',
			         	width:150,
			         	dataIndex:'employee_name',
			         	sortable:true			         	
			         },{
			         	text:'合同权限',
			         	dataIndex:'contract_privilege',
			         	width:100,
			         	sortable:true,
			         	renderer:function(value,o,record){
			         		var val=null;
			         		if(value=='MODIFY'){
			         			val='修改';
			         			return val;
			         		}else{
			         			val='查询';
			         			return val;
			         		}
			         		return val;
			         	}
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
Ext.define('desktop.app.hec.cont.model.ConContractPrivileges',{
	extend: 'Ext.data.Model',
	fields:[
            {name:'contractHeaderId'},
        	{name:'contract_privileges_id'},
        	{name:'position_id'},
        	{name:'employee_id'},
        	{name:'contract_privilege'},
        	{name:'position_code'},
        	{name:'position_name'},
        	{name:'employee_code'},
        	{name:'name'},
        	{name:'employee_name'}
	       ]
});
