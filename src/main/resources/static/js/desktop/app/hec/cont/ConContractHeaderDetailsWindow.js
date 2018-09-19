Ext.define('desktop.app.hec.cont.ConContractHeaderDetailsWindow',{
	extend:'Ext.window.Window',
	alias:'widget.ConContractHeaderDetailsWindow',
	requires: [    		          
	           'desktop.app.comm.AddButton',
	           'desktop.app.comm.EditButton',
	           'desktop.app.comm.DeleteButton',
	           'desktop.app.comm.SearchButton',
	           'desktop.app.comm.SaveButton',
	           'desktop.app.comm.CancelButton',
	           'desktop.app.comm.ExportButton',
	           'desktop.app.comm.SearchPanel',
	           'desktop.app.comm.CommWindow',   
	           'desktop.app.comm.CenterGrid', 
	       
	       ],
	
	initComponent:function(config){
		var me=this;
        var title=me.title; 
        var width=me.width;
        var height=me.height;
        var params=me.params;
        me.items =  me.getItems(params);
        me.buttons=me.getButtons();
        Ext.apply(me,{
        	layout:'anchor',
           // defaults: {frame:true, width:1200, height: 300},
        	width:width,
        	height:height,
        	title:title,
        	modal:true,
        	maximizable:true,
        	//minimizable:true,
        	buttonAlign:'center',
        	autoScroll:true
        });
        me.callParent();
	},
	getItems:function(params){
		var doc_type=params.doc_type;
		var items=[];
		if(doc_type=='HT'){
			items=[{
				xtype:'ConContractHeaderShow',
				title:'合同基本信息',
				params:params,
				//heigth:230,
				collapsible : true,
				autoScroll:true,
				anchor:'100%'
			},{
				xtype:'tabpanel',
				title:'合同关联其他信息',
				collapsible : true,
				autoScroll:true,
				activeTab: 0,		        
				anchor:'100% 100%',
				items:[{
					xtype:'ConPaymentSchedules',
					params:params,
					title:'合同资金计划行'
				},{
					xtype:'ConElectricFlow',
					params:params,
					title:'电子签报'
				},{
					xtype:'ConContractPrivileges',
					params:params,
					title:'合同权限'
				},{
					xtype:'ConContractRequisition',
					params:params,
					title:'关联费用申请单'
				},{
					xtype:'ConContractHeadersPayDetails',
					params:params,
					title:'支付明细'
				},{
					xtype:'ConContractHeadersReceiptDetails',
					params:params,
					title:'收款明细'
				},{
					xtype:'ConContractHeadersCshPay',
					params:params,
					title:'借款付款'
				},{
					xtype:'ConContractHeadersExpenseReport',
					params:params,
					title:'费用报销'
				},{
					xtype:'ConContractHisories',
					params:params,
					title:'合同历史'
				},{
					xtype:'ConContractHeadersAcpRequisition',
					params:params,
					title:'付款单'
				}]
			}];
		}
		return items;
	},
	getButtons:function(){
		var me=this;
		var buttons=[me.getCancelButton()];
		return buttons;
	},
	getCancelButton : function(config){
    	if(Ext.isEmpty(this.cancelButton)){
            this.cancelButton = Ext.create('desktop.app.comm.CancelButton',{
                  scope : this,
                  text:'关闭',
                  handler: this.cancelButtonClick
            }); 
        }
        return this.cancelButton;
    },
    cancelButtonClick : function(){
		this.close();
	}
});