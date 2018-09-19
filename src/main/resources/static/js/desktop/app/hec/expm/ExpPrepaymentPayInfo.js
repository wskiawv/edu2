Ext.define('desktop.app.hec.expm.ExpPrepaymentPayInfo',{
	extend:'desktop.app.comm.ShowPanel',
	alias:['widget.ExpPrepaymentPayInfo'],
	moduleName:"expm",//请求模块名称
	controllersName:"ExpPrepaymentPayInfos",//请求控制器名称	
	saveButton:null,	
	cancelButton:null,
	getStoreModel : function(){
		return 'desktop.app.hec.expm.model.ExpPrepaymentPayInfo';
	},
	getSaveButton : function(config){
    	if(Ext.isEmpty(this.saveButton)){
			this.saveButton = Ext.create('desktop.app.comm.SaveButton',{               
                scope : this,
                text:'确定',
                handler: this.saveButtonClick
          	});
		}
		return this.saveButton;
    },   
    getCancelButton : function(config){
    	if(Ext.isEmpty(this.cancelButton)){
            this.cancelButton = Ext.create('desktop.app.comm.CancelButton',{
                  scope : this,
                  text:'返回',
                  handler: this.cancelButtonClick
            }); 
        }
        return this.cancelButton;
    },
    cancelButtonClick : function(btn){
    	var me=this;
    	var w=me.ownerCt;
    	w.close();
	},
    saveButtonClick:function(btn){
    	
    },
    
    
	getButtons:function(){
		var me=this;		
		var buttons=[me.getSaveButton(),me.getCancelButton()];
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
				name: 'exp_report_number'
				
			},{
				fieldLabel: '归还日期',
				name: 'report_date'		
			},{
				fieldLabel: '收款对象',
				name: 'payee_category'		
			},{
				fieldLabel: '收款方',
				name: 'payee_code'		
			},{
				fieldLabel: '报销金额',
				name: 'due_amount'		
			},{
				fieldLabel: '可核销金额',
				name: 'can_writeoff_amount'		
			},{
				fieldLabel: '待归还借款总金额',
				name: 'return_amount'		
			},{
				fieldLabel: '合同编号',
				name: 'contract_number'		
			},{
				fieldLabel: '合同资金计划行',
				name: 'line_number'		
			}]
		}]
	}
	
});
Ext.define('desktop.app.hec.expm.model.ExpPrepaymentPayInfo',{
	extend: 'Ext.data.Model',
	fields:[
            {name:'payment_schedule_line_id'},
        	{name:'expReportHeaderId'},
        	{name:'exp_report_number'},
        	{name:'report_date'},
        	{name:'period_name'},
        	{name:'currency_code'},
        	{name:'exchange_rate'},
        	{name:'exchange_rate_type'},
        	{name:'exchange_rate_quotation'},
        	{name:'due_amount'},
        	{name:'payee_code'},
        	{name:'payee_category'},
        	{name:'contract_number'},
        	{name:'line_number'},
        	{name:'can_writeoff_amount'},
        	{name:'functional_currency_code'}
	       ]
});