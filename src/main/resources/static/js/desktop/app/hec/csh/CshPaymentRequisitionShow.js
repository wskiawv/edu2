Ext.define('desktop.app.hec.csh.CshPaymentRequisitionShow',{
	extend:'desktop.app.comm.ShowPanel',
	alias:['widget.CshPaymentRequisitionShow'],
	moduleName:"csh",//请求模块名称
	controllersName:"CshPaymentRequisitionShows",//请求控制器名称	
	saveButton:null,
	printButton:null,
	assignButton:null,
	seeHisButton:null,
	seeAttButton:null,
	getStoreModel : function(){
		return 'desktop.app.hec.csh.model.CshPaymentRequisitionShow';
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
        		xtype:'CshPaymentRequistionHistory',
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
				name: 'csh_type_id_display'		
			},{
				fieldLabel: '报销日期',
				name: 'requisitionDateDisplay'		
			},{
				fieldLabel: '借款金额',
				name: 'amount'		
			},{
				fieldLabel: '申请人',
				name: 'employee_id_display'		
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
Ext.define('desktop.app.hec.csh.model.CshPaymentRequisitionShow',{
	extend: 'Ext.data.Model',
	fields:[  
            {name:'paymentRequisitionHeaderId'},
        	{name:'employee_id'},
        	{name:'employee_id_display'},
        	{name:'payment_requisition_create_by'},
        	{name:'requisitionNumber'},
        	{name:'requisitionDate'},
        	{name:'requisitionDateDisplay'},
        	{name:'currencyCode'},
        	{name:'currency_name'},
        	{name:'currency_code_display'},
        	{name:'partnerCategory'},
        	{name:'partner_category_display'},
        	{name:'partnerId'},
        	{name:'amount'},
            {name:'paymentMethodId'},
            {name:'payment_method_id_display'},
            {name:'description'},
            {name:'operation_unit_id'},
            {name:'positionId'},
            {name:'position_id_display'},
            {name:'pos_desc'},
            {name:'parent_pos_desc'},
            {name:'p_status'},
            {name:'paymentReqTypeId'},
            {name:'csh_type_id_display'},
            {name:'sourceType'},
            {name:'payment_requisition_attach_id'},
            {name:'created_by_desc'},
            {name:'company_id'},
            {name:'organization_name'},
            {name:'dept_name'},
            {name:'vatFlag'},
            {name:'addInvoiceFlag'},
            {name:'p_partner_name'},
            {name:'status_name'},
            {name:'cont_flag'},
            {name:'event_code'},
            {name:'event_id'},
            {name:'event_desc'}
	       ]
});