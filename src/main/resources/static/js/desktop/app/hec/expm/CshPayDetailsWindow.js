Ext.define('desktop.app.hec.expm.CshPayDetailsWindow',{
	extend:'Ext.window.Window',
	alias:'widget.CshPayDetailsWindow',
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
		var items=[{
				xtype:'ExpPrepaymentPayInfo',
				title:'报销单归还借款',
				params:params,				
				collapsible : true,
				autoScroll:true,
				anchor:'100%'
			},{
				xtype:'tabpanel',
				title:'归还信息',
				collapsible : true,
				autoScroll:true,
				activeTab: 0,		        
				anchor:'100% 100%',
				items:[{
					xtype:'CshPayWriteoffDetail',
					params:params,
					title:'归还明细'
				},{					
					title:'归还历史',
					layout:'anchor',
					autoScroll:true,
					items:[{
						title:'本报销单归还历史',
						xtype:'DocumentWriteoffHistory',
						collapsible : true,
						params:params,
						height:300,
						anchor:'100%'
					},{
						title:'关联合同归还历史',
						xtype:'ContractWriteoffHistory',
						collapsible : true,
						params:params,
						height:300,
						anchor:'100%'
					},{
						title:'本人归还历史',
						xtype:'EmployeeWriteoffHistory',
						collapsible : true,
						params:params,		
						height:300,
						anchor:'100%'
					}]
				},{
					xtype:'CshPayFinanceInfo',
					params:params,
					title:'财务信息'
				}]
			}];
		
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