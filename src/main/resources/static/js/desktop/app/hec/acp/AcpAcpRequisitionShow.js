Ext.define('desktop.app.hec.acp.AcpAcpRequisitionShow',{
	extend:'desktop.app.comm.ShowPanel',
	alias:['widget.AcpAcpRequisitionShow'],
	moduleName:"acp",//请求模块名称
	controllersName:"AcpAcpRequisitionShows",//请求控制器名称	
	saveButton:null,
	printButton:null,
	assignButton:null,
	seeHisButton:null,
	seeAttButton:null,
	getStoreModel : function(){
		return 'desktop.app.hec.acp.model.AcpAcpRequisitionShow';
	},
	getSaveButton : function(config){
    	if(Ext.isEmpty(this.saveButton)){
			this.saveButton = Ext.create('desktop.app.comm.SaveButton',{               
                scope : this,
                text:'保存财务修改',
                handler: this.saveButtonClick
          	});
		}
		return this.saveButton;
    },
    getPrintButton:function(){
    	if(Ext.isEmpty(this.printButton)){
			this.printButton = Ext.create('desktop.app.comm.PrintButton',{               
                scope : this,
                handler: this.printButtonClick
          	});
		}
		return this.printButton;
    },
    getAssignButton:function(){
    	if(Ext.isEmpty(this.assignButton)){
			this.assignButton = Ext.create('desktop.app.comm.CommButton',{               
                scope : this,
                text:'分滩',
                iconCls:'assButton',
                handler: this.assignButtonClick
          	});
		}
		return this.assignButton;
    },
    getSeeHisButton:function(){
    	if(Ext.isEmpty(this.seeHisButton)){
			this.seeHisButton = Ext.create('desktop.app.comm.CommButton',{               
                scope : this,
                text:'跟踪单据',
                iconCls:'hisButton',
                handler: this.seeHisButtonClick
          	});
		}
		return this.seeHisButton;
    },
    getSeeAttButton:function(){
    	if(Ext.isEmpty(this.seeAttButton)){
			this.seeAttButton = Ext.create('desktop.app.comm.CommButton',{               
                scope : this,
                text:'查看附件',
                iconCls:'attButton',
                handler: this.seeAttButtonClick
          	});
		}
		return this.seeAttButton;
    },
    saveButtonClick:function(btn){
    	
    },
    printButtonClick:function(btn){
    	
    },
    assignButtonClick:function(btn){
    	
    },
    seeHisButtonClick:function(btn){
    	var me=this;
    	var params=me.params;
    	var win=Ext.create("Ext.window.Window",{
    		title:'单据历史',
    		width:800,
        	height:600,
    		modal:true,
        	maximizable:true,
        	buttonAlign:'center',
        	layout:'anchor',
        	autoScroll:true,
        	buttons:[{
        		text:"关闭",
        		tooltip:'关闭',
        		iconCls:'cancel',
        		scope:this,
        		handler:function(){
        			win.close();
        		}
        	}],
        	items:[{
        		xtype:'AcpAcpRequistionHistory',
        		anchor:'100% 100%',
        		params:params
        	}]
    	});
    	win.show();
    },
    seeAttButtonClick:function(btn){
    	var me=this;
    	var params=me.params;
    	var win=Ext.create('desktop.app.hec.fnd.AttachmentShowWindow',{
    		params:params,
    		title:'附件查看',
    		height:450,
    		width:800,
    		constrainHeader:true
    	});
    	win.show(); 
    },
	getButtons:function(){
		var me=this;
		var buttons=[me.getSeeHisButton(),me.getPrintButton(),me.getSeeAttButton()];
		return buttons;
		
	},
	getItems:function(){
		return [{
			xtype: 'fieldset',
	        title: '基本信息',
	        collapsible: true,
	        layout:{
	            type: 'table',
	            columns: 4,
	            defaults: {width: 230},
	        },
	        labelWidth: 120,
			labelAlign: 'right',
			defaultType: 'textfield',
			fieldDefaults: {
		        labelWidth: 120,
		        labelAlign:'right',
		        readOnly:true
		    },
	        items:[{
				fieldLabel: '单据编号',
				name: 'requisitionNumber'
				
			},{
				fieldLabel: '单据类型',
				name: 'exp_type_name'		
			},{
				fieldLabel: '币种',
				name: 'currency'		
			},{
				fieldLabel: '申请日期',
				name: 'requisitionDate'		
			},{
				fieldLabel: '申请人',
				name: 'req_name'		
			},{
				fieldLabel: '机构',
				name: 'organization_name'		
			},{
				fieldLabel: '部门',
				name: 'dept_name'		
			}]
		},{ 
			xtype: 'fieldset',
	        title: '描述',
	        collapsible: true,
	        defaults: {
	            labelWidth: 89,
	            anchor: '100%',
	            layout: {
	                type: 'hbox',
	                defaultMargins: {top: 0, right: 5, bottom: 0, left: 0}
	            },
	            
	        },items:[{
    			fieldLabel: '描述',
    			name: 'description',
    			xtype:'textarea'
    		}]
		}]
	}
	
});
Ext.define('desktop.app.hec.acp.model.AcpAcpRequisitionShow',{
	extend: 'Ext.data.Model',
	fields:[ 
            {name:'acpRequisitionHeaderId'},
        	{name:'exp_type_name'},
        	{name:'position_display'},
        	{name:'sys_date'},
        	{name:'req_name'},
        	{name:'companyId'},
        	{name:'employeeId'},
        	{name:'operationUnitId'},
        	{name:'requisitionNumber'},
        	{name:'requisitionDate'},
        	{name:'acpReqTypeId'},
        	{name:'transactionCategory'},
        	{name:'paymentMethodId'},
        	{name:'partnerCategory'},
            {name:'partnerId'},
            {name:'amount'},
            {name:'currencyCode'},
            {name:'description'},
            {name:'currency'},
            {name:'status'},
            {name:'approvalDate'},
            {name:'approvedBy'},
            {name:'closedDate'},
            {name:'unitId'},
            {name:'positionId'},
            {name:'sourceType'},
            {name:'paymentComId'},
            {name:'acpRefRptNumber'},
            {name:'organization_name'},
            {name:'dept_name'}
	       ]
});