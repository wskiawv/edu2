Ext.define('desktop.app.hec.expm.ExpDocumentShow',{
	extend:'Ext.window.Window',
	alias:'widget.ExpDocumentShow',
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
		if(doc_type=='BX'){
			items=[{
				xtype:'ExpReportHeaderShow',				
				title:'报销单头',
				params:params,
				url:appPath+'/expm/ExpReportHeaderShows/getHearder',
				height:300,
				collapsible : true,
				autoScroll:true,
				anchor:'100%'
			},{
				xtype:'ExpReportLine',				
				title:'报销单行',
				params:params,
				height:300,
				collapsible : true,
				autoScroll:true,
				anchor:'100%'
			},{
				xtype:'ExpReportPmtSchedule',
				title:'资金计划行',
				params:params,
				height:300,
				collapsible : true,
				anchor:'100%'					
				//region:'center'				
			},{
				title:'跟踪单据',
				xtype:'ExpReportHistory',
				collapsible : true,
				params:params,
				height:300,
				anchor:'100%'
				//region: 'north'
			}];		
		}else if (doc_type=='JK'){
			items=[{
				xtype:'CshPaymentRequisitionShow',				
				title:'借款单头',
				params:params,
				url:appPath+'/csh/CshPaymentRequisitionShows/getHearder',
				height:300,
				collapsible : true,
				autoScroll:true,
				anchor:'100%'
			},{
				xtype:'CshPaymentRequisitionLine',				
				title:'借款单行',
				params:params,
				height:300,
				collapsible : true,
				autoScroll:true,
				anchor:'100%'
			},{
				title:'跟踪单据',
				xtype:'CshPaymentRequistionHistory',
				collapsible : true,
				params:params,
				height:300,
				anchor:'100%'
				//region: 'north'
			}];
		}else if(doc_type='FK'){
			items=[{
				xtype:'AcpAcpRequisitionShow',				
				title:'付款单头',
				params:params,
				url:appPath+'/acp/AcpAcpRequisitionShows/getHearder',
				height:300,
				collapsible : true,
				autoScroll:true,
				anchor:'100%'
			},{
				xtype:'AcpAcpRequisitionLns',				
				title:'付款单行',
				params:params,
				height:300,
				collapsible : true,
				autoScroll:true,
				anchor:'100%'
			},{
				title:'跟踪单据',
				xtype:'AcpAcpRequistionHistory',
				collapsible : true,
				params:params,
				height:300,
				anchor:'100%'
				//region: 'north'
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