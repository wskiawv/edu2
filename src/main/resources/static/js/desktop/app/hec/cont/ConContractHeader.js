Ext.define('desktop.app.hec.cont.ConContractHeader',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:['widget.ConContractHeader'],
	
	
	moduleName:"cont",//请求模块名称    
	controllersName:"ConContractHeaders",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.cont.model.ConContractHeader';
	},

    /**
     * 搜索panel的高度
     * @return {Number}
     */
    getSearchFieldHeight : function(){
    	return 150;
    },
    detailNewWindow:function(params){
    	var win=Ext.create('desktop.app.hec.cont.ConContractHeaderDetailsWindow',{
    		params:params,
    		title:'合同查看',
    		height:600,
    		width:950,
    		constrainHeader:true
    	});
    	win.show();
    	win.maximize();
    },
    cellClick:function(grid,td,cellIndex,record,tr,rowIndex,e){
    	var contract_header_id=record.get('contractHeaderId');    	
    	var header_id=contract_header_id;
    	var documentNumber=record.get('contractNumber');    	
    	var doc_type=documentNumber.substring(0,2);
    	var params={contract_header_id:contract_header_id,doc_type:doc_type,header_id:header_id};
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
			         	text:'合同编号',
			         	width:150,
			         	dataIndex:'contractNumber',
			         	sortable:true,
			         	renderer:function(value,o,record){
			         		var header_id=record.get('contractHeaderId');
			         		var val=Ext.String.format('<a href="#">{0}</a>',value);
			         		return val;
			         	}
			         },{
			         	text:'合同类型',
			         	dataIndex:'contract_type_id_display',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'合同名称',
			         	dataIndex:'documentDesc',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'创建人',
			         	dataIndex:'created_by_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'创建日期',
			         	dataIndex:'creation_date_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'合同日期',
			         	dataIndex:'document_date_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'机构',
			         	dataIndex:'company_id_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'部门',
			         	dataIndex:'unit_id_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'合同金额',
			         	dataIndex:'amount',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'合同方类型',
			         	dataIndex:'partner_category_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'合同方',
			         	dataIndex:'partner_code',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'状态',
			         	dataIndex:'status_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'责任人',
			         	dataIndex:'employee_id_display',
			         	width:150,
			         	sortable:true
				     },{
			         	text:'备注',
			         	dataIndex:'note',
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
                '<p><b>合同描述:</b> {note}</p><br>'           
                            
           );
		return tpl;
	},
    /**
     * 配置搜索字段
     * @return {}
     */
    getSearchFields: function(){
		return [{
				fieldLabel: '合同编号',
				name: 'contractNumber',
				anchor: '100%'
			},{
				fieldLabel: '合同名称',
				name: 'documentDesc',
				anchor: '100%'		
			
		},{
			fieldLabel:'合同类型',
			name:'contract_type_id_display',
			fieldCls:'textFieldButton',
			listeners:{
	        	scope:this,
	        	focus:function(textField){
	        		var win=Ext.create('desktop.app.hec.cont.ConContractType',{
	        			textField:textField,
	        			returnFieldName:'type_description',
	        			title:'合同类型查询',	        			
	        			width:800,
	        			height:600,
	        		});
	        		win.show();
	        	}
	        }
		},{
			fieldLabel:'合同创建人',
			name:'created_by_display',
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
		},{
			fieldLabel:'机构',
			name:'company_id_display',
			fieldCls:'textFieldButton',
			listeners:{
	        	scope:this,
	        	focus:function(textField){
	        		var win=Ext.create('desktop.app.hec.sys.Company',{
	        			textField:textField,
	        			returnFieldName:'name',
	        			title:'公司查询',	        			
	        			width:800,
	        			height:600,
	        		});
	        		win.show();
	        	}
	        }
		},{
			fieldLabel:'部门',
			name:'unit_id_display',
			fieldCls:'textFieldButton',
			listeners:{
	        	scope:this,
	        	focus:function(textField){
	        		var win=Ext.create('desktop.app.hec.sys.Department',{
	        			textField:textField,
	        			returnFieldName:'unit_name',
	        			title:'部门',	        			
	        			width:800,
	        			height:600,
	        		});
	        		win.show();
	        	}
	        }
		},{
			xtype: 'datefield',
	        anchor: '100%',
	        fieldLabel: '创建日期从',
	        name: 'date_from',	        
	        format: 'Y-m-d',
		},{
			xtype: 'datefield',
	        anchor: '100%',
	        fieldLabel: '创建日期到',
	        name: 'date_to',	        
	        format: 'Y-m-d',
		}]
		
	}
});
Ext.define('desktop.app.hec.cont.model.ConContractHeader',{
	extend: 'Ext.data.Model',
	fields:[	        
            {name: 'contractHeaderId'},
            {name: 'companyId'},
            {name: 'contractTypeId'},
            {name: 'contractNumber'},
            {name: 'status'},
            {name: 'documentNumber'},
            {name: 'documentDesc'},
            {name: 'documentDate'},
            {name: 'startDate'},
            {name: 'endDate'},
            {name: 'currencyCode'},
            {name: 'amount'},
            {name: 'unitId'},
            {name: 'employeeId'},
            {name: 'paymentMethod'},
            {name: 'paymentTermId'},
            {name: 'partnerCategory'},
            {name: 'partnerId'},
            {name: 'versionNumber'},
            {name: 'versionDesc'},
            {name: 'note'},
            {name: 'projectId'},
            {name: 'createdBy'},
            {name: 'creationDate'},
            {name: 'lastUpdatedBy'},
            {name: 'lastUpdateDate'},
            {name: 'approvalUserId'},
            {name: 'uCompanyId'},
            {name: 'uUnitId'},
            {name: 'uPositionId'},
            {name: 'uEmployeeId'},
            {name: 'startAmount'},
            {name: 'refPurOrderHeaderId'},
            {name: 'identificationCode'},
            {name: 'company_id_display'},
            {name: 'created_by_display'},
            {name: 'contract_type_id_display'},
            {name: 'creation_date_display'},
            {name: 'document_date_display'},
            {name: 'unit_id_display'},
            {name: 'employee_id_display'},
            {name: 'partner_category_display'},
            {name: 'partner_code'},
            {name: 'status_display'}
	       ]
});
