Ext.define('desktop.app.hec.expm.ExpReportLineAssignHeaderInfo',{
	extend:'desktop.app.comm.ShowPanel',
	alias:['widget.ExpReportLineAssignHeaderInfo'],
	moduleName:"expm",//请求模块名称
	controllersName:"ExpReportLineAssignHeaderInfos",//请求控制器名称	
	saveButton:null,
	printButton:null,
	assignButton:null,
	seeHisButton:null,
	seeAttButton:null,
	importButton:null,
	cancelButton:null,
	getStoreModel : function(){
		return 'desktop.app.hec.expm.model.ExpReportLineAssignHeaderInfo';
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
    getImportButton:function(){
    	if(Ext.isEmpty(this.importButton)){
			this.importButton = Ext.create('desktop.app.comm.ImportButton',{               
                scope : this,                
                handler: this.importButtonClick
          	});
		}
		return this.importButton;
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
    importButtonClick:function(btn){
    	
    },
	getButtons:function(){
		var me=this;
		//var buttons=[me.getSeeHisButton(),me.getPrintButton(),me.getAssignButton(),me.getSaveButton(),me.getSeeAttButton()];
		var buttons=[me.getImportButton(),me.getCancelButton()];
		return buttons;
		
	},
	getItems:function(){
		return [{
			xtype: 'fieldset',
	        title: '分滩信息',
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
				fieldLabel: '报销类型',
				name: 'expense_type_code'
				
			},{
				fieldLabel: '费用项目',
				name: 'expense_item_code'		
			},{
				fieldLabel: '报销金额',
				name: 'line_amount'		
			},{
				fieldLabel: '税金',
				name: 'vat_amount'		
			},{
				fieldLabel: '当前合计金额',
				name: 't_amount'		
			}]
		}]
	}
	
});
Ext.define('desktop.app.hec.expm.model.ExpReportLineAssignHeaderInfo',{
	extend: 'Ext.data.Model',
	fields:[ 
            {name:'expReportLineId'},
        	{name:'currencyCode'},
        	{name:'precision'},
        	{name:'exchangeRateType'},
        	{name:'report_date'},
        	{name:'exchangeRate'},
        	{name:'period_name'},
        	{name:'unitId'},
        	{name:'payeeCategory'},
        	{name:'payeeCategoryDisplay'},
        	{name:'payeeId'},
        	{name:'expenseTypeId'},
        	{name:'expenseItemId'},
        	{name:'city_from'},
        	{name:'city_to'},
        	{name:'expense_type_code'},
        	{name:'expense_type_name'},
        	{name:'expense_item_code'},
        	{name:'req_item_name'},
        	{name:'payee_code'},
        	{name:'employeeId'},
        	{name:'line_amount'},
          	{name:'vat_amount'},
          	{name:'t_amount'},
          	{name:'positionId'},
          	{name:'price'},
          	{name:'dimension1_id'},
            {name:'dimension2_id'},
            {name:'dimension3_id'},
            {name:'dimension4_id'},
            {name:'dimension5_id'},
            {name:'dimension6_id'},
            {name:'dimension7_id'},    
            {name:'dimension8_id'},
            {name:'dimension9_id'},
            {name:'dimension10_id'}
	       ]
});