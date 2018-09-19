Ext.define('desktop.app.hec.fnd.AttachmentUpload',{
	extend:'desktop.app.comm.ShowPanel',
	alias:['widget.AttachmentUpload'],
	moduleName:"fnd",//请求模块名称
	controllersName:"AttachmentShows",//请求控制器名称	
	saveButton:null,
	printButton:null,
	assignButton:null,
	seeHisButton:null,
	seeAttButton:null,
	uploadButton:null,
	getStoreModel : function(){
		return 'desktop.app.hec.fnd.model.AttachmentUpload';
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
    getUploadButton:function(){
    	
    	if(Ext.isEmpty(this.uploadButton)){
			this.uploadButton = Ext.create('desktop.app.comm.UploadButton',{               
                scope : this,
                text:'开始上传',
                iconCls:'attButton',
                handler: this.uploadButtonClick
          	});
		}
		return this.uploadButton;
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
    uploadButtonClick:function(btn){
    	
    },
	getButtons:function(){
		var me=this;
		var buttons=[me.getUploadButton()];
		//var buttons=[me.getSeeHisButton(),me.getPrintButton(),me.getAssignButton(),me.getSaveButton(),me.getSeeAttButton()];
		return buttons;
		
	},
	getItems:function(){
		return [{
	        	xtype : 'filefield',
				name : 'fileup',
				labelWidth: 150,
				// filedLabel:'请选择上传文件',
				anchor:'80%',
				msgTarget : 'side',
				allowBlank : false,
				buttonText : "请选择文件"
	        }]
		
	}
	
});
Ext.define('desktop.app.hec.fnd.model.AttachmentUpload',{
	extend: 'Ext.data.Model',
	fields:[	                            
            {name:'expReportHeaderId'},
        	{name:'organization_name'},
        	{name:'dept_name'},
        	{name:'sum_amount'},
        	{name:'exp_report_type_name'},
        	{name:'report_name'},
        	{name:'exp_report_type_id'},
        	{name:'exp_report_data'},
        	{name:'exp_report_employee_name'},
        	{name:'exp_report_position'},
        	{name:'exp_report_position_id'},
        	{name:'exp_report_currency_code'},
        	{name:'exp_report_currency_name'},
        	{name:'exp_report_payee_category_name'},
            {name:'exp_report_payee_category'},
            {name:'functional_currency_code'},
            {name:'employee_id'},
            {name:'company_id'},
            {name:'company_name'},
            {name:'employee_name'},
            {name:'position_id'},
            {name:'position_name'},
            {name:'unit_id'},
            {name:'unit_name'},
            {name:'responsibility_center_id'},
            {name:'responsibility_center_name'},
            {name:'payment_flag'},
            {name:'req_required_flag'},
            {name:'usedes'},
            {name:'usedes_name'},
            {name:'adjustment_flag'},
            {name:'exp_report_create_by'},
            {name:'exp_report_status'},
            {name:'report_status'},
            {name:'period_name'},
            {name:'exp_report_number'},
            {name:'payment_method_id'},
            {name:'exp_report_payment_method'},
            {name:'exp_report_description'},
            {name:'exp_report_attach_id'},
            {name:'exp_report_payee_id'},
            {name:'exp_report_payee_name'},
            {name:'budget_control_enabled'},
            {name:'exp_report_rate_type'},
            {name:'exp_report_rate_quotation'},
            {name:'exp_report_rate'},
            {name:'exp_report_rate_type_name'},
            {name:'exp_report_rate_quotation_name'},
            {name:'line_number'},
            {name:'contract_header_id'},    
            {name:'contract_header_code'},
            {name:'bgt_num'},
            {name:'eam_asset_id'},
            {name:'eam_asset_name'},
            {name:'add_invoice_flag'},
            {name:'invoice_flag'},
            {name:'vat_flag'},
            {name:'plain_flag'},
            {name:'secret'},
            {name:'secret_flag'}
	       ]
});