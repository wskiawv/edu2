Ext.define('desktop.app.hec.cont.ConContractHeaderShow',{
	extend:'desktop.app.comm.ShowPanel',
	alias:['widget.ConContractHeaderShow'],
	moduleName:"cont",//请求模块名称
	controllersName:"ConContractHeaderShows",//请求控制器名称	
	saveButton:null,
	printButton:null,
	assignButton:null,
	seeHisButton:null,
	seeAttButton:null,
	seeImageButton:null,
	cancelButton:null,//取消关闭窗口按钮,
	getStoreModel : function(){
		return 'desktop.app.hec.cont.model.ConContractHeaderShow';
	},
	getSaveButton : function(config){
    	if(Ext.isEmpty(this.saveButton)){
			this.saveButton = Ext.create('desktop.app.comm.SaveButton',{               
                scope : this,                
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
    getSeeImageButton:function(){
    	if(Ext.isEmpty(this.seeImageButton)){
			this.seeImageButton = Ext.create('desktop.app.comm.CommButton',{               
                scope : this,
                text:'查看影像',
                iconCls:'attButton',
                handler: this.seeImageButtonClick
          	});
		}
		return this.seeImageButton;
    },
    getCancelButton:function(){
    	if(Ext.isEmpty(this.cancelButton)){
			this.cancelButton = Ext.create('desktop.app.comm.CancelButton',{               
                scope : this,
                text:'返回',
                iconCls:'backButton',
                handler: this.cancelButtonClick
          	});
		}
		return this.cancelButton;
    },
    cancelButtonClick:function(btn){
    	var me=this;
    	var w=me.ownerCt;
    	w.close();
    },
    saveButtonClick:function(btn){
    	
    },
    printButtonClick:function(btn){
    	
    },
    assignButtonClick:function(btn){
    	var me=this;
    	var p=me.ownerCt;
    	var grid=p.down('ExpReportLine');
    	var select = grid.getSelectionModel();
    	var records = select.getSelection();
    	if(Ext.isEmpty(records)){
			Ext.example.msg('温馨提醒', "请选择一条报销行做分滩!");	
			Ext.Msg.alert('温馨提醒', "请选择一条报销行做分滩!");	
			return ;
		}
    	if(records.length!=1){
    		Ext.example.msg('温馨提醒', "请选择一条报销行做分滩!");		
    		Ext.Msg.alert('温馨提醒', "请选择一条报销行做分滩!");	
			return ;
    	}
    	var record=records[0];
    	var exp_report_line_id=record.get('expReportLineId');    	
    	var params=Ext.apply(me.params,{exp_report_line_id:exp_report_line_id});
    	var win=Ext.create("Ext.window.Window",{
    		title:'分滩信息',
    		width:900,
        	height:550,
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
        		title:'分滩行信息',
        		xtype:'ExpReportLineAssignHeaderInfo',
        		height:200,
        		anchor:'100%',
        		collapsible : true,
        		params:params
        	},{
        		title:'分滩明细',
        		xtype:'ExpReportDists',
        		collapsible : true,
        		anchor:'100% 100%',
        		params:params
        	}]
    	});
    	win.show();
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
        		xtype:'ExpReportHistory',
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
    seeImageButtonClick:function(btn){
    	
    },
	getButtons:function(){
		var me=this;
		var buttons=[me.getCancelButton(),me.getSeeAttButton(),me.getSeeImageButton()];
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
				fieldLabel: '合同编号',
				name: 'contractNumber'
				
			},{
				fieldLabel: '合同大类',
				name: 'contract_class_desc'		
			},{
				fieldLabel: '合同类型',
				name: 'contract_type'		
			},{
				fieldLabel: '合同名称',
				name: 'documentDesc'		
			},{
				fieldLabel: '创建人',
				name: 'employee'		
			},{
				fieldLabel: '机构',
				name: 'organization_name'		
			},{
				fieldLabel: '部门',
				name: 'dept_name'		
			},{
				fieldLabel: '合同状态',
				name: 'contract_status'		
			},{
				fieldLabel: '开始日期',
				xtype: 'datefield',
				format: 'Y-m-d',
				name: 'startDate'		
			},{
				fieldLabel: '结束日期',
				xtype: 'datefield',
				format: 'Y-m-d',
				name: 'endDate'	
			},{
				fieldLabel: '合同方类型',
				name: 'payment_object'		
			},{
				fieldLabel: '合同方名称',
				name: 'partner_code'		
			},{
				fieldLabel: '受益机构',
				name: 'company_code_display'		
			},{
				fieldLabel: '受益部门',
				name: 'unit_name'		
			},{
				fieldLabel: '责任人',
				name: 'employee'		
			},{
				fieldLabel: '合计金额',
				name: 'amount'		
			},{
				fieldLabel: '关联采购订单号',
				name: 'pur_order_number'		
			},{
				fieldLabel: '关联签报总金额',
				name: 'identification_code_sum'		
			},{
				fieldLabel: '冻结金额',
				name: 'frozen_amount'		
			},{
				fieldLabel: '可支付金额',
				name: 'can_pay'		
			},{
				fieldLabel: '可报销金额',
				name: 'can_exp'		
			}]
		},{ 
			xtype: 'fieldset',
	        title: '其他信息',
	        collapsible: true,
	        defaults: {
	            labelWidth: 89,
	            anchor: '100%',
	            layout: {
	                type: 'hbox',
	                defaultMargins: {top: 0, right: 5, bottom: 0, left: 0}
	            },
	            
	        },items:[{
    			fieldLabel: '供应商银行账户信息',
    			name: 'partner_info',
    			xtype:'textarea'
    		},{
    			fieldLabel: '描述',
    			name: 'note',
    			xtype:'textarea'
    		},{
    			fieldLabel: '处理意见',
    			name: 'descripition',
    			xtype:'textarea'
    		}]
		}]
	}
	
});
Ext.define('desktop.app.hec.cont.model.ConContractHeaderShow',{
	extend: 'Ext.data.Model',
	fields:[
            {name:'contractHeaderId'},
            {name:'companyId'},
            {name:'contractTypeId'},
            {name:'contractNumber'},
            {name:'status'},
            {name:'documentNumber'},
            {name:'documentDesc'},
            {name:'documentDate',type:'date',format:'Y-m-d'},
            {name:'startDate',type:'date',format:'Y-m-d'},
            {name:'endDate',type:'date',format:'Y-m-d'},
            {name:'currencyCode'},
            {name:'amount'},
            {name:'unitId'},
            {name:'employeeId'},
            {name:'paymentMethod'},
            {name:'paymentTermId'},
            {name:'partnerCategory'},
            {name:'partnerId'},
            {name:'versionNumber'},
            {name:'versionDesc'},
            {name:'note'},
            {name:'projectId'},
            {name:'createdBy'},
            {name:'creationDate',type:'date',format:'Y-m-d'},
            {name:'lastUpdatedBy'},
            {name:'lastUpdateDate',type:'date',format:'Y-m-d'},
            {name:'partner_code'},
            {name:'vender_code'},
            {name:'partner_desc'},
            {name:'project_code'},
            {name:'project_desc'},
            {name:'employee'},
            {name:'unit_name'},
            {name:'contract_class_desc'},
            {name:'contract_type'},
            {name:'company_code_display'},
            {name:'organization_name'},
            {name:'dept_name'},
            {name:'startAmount'},
            {name:'pur_order_header_id'},
            {name:'pur_order_number'},
            {name:'identification_code_sum'},
            {name:'approve_ok_record'},
            {name:'partner_info'},
            {name:'frozen_amount'},
            {name:'can_exp'},
            {name:'can_pay'}
	       ]
});