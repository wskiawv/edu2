Ext.define('desktop.app.hec.fnd.AttachmentPreview',{
	extend:'Ext.window.Window',
	alias:'widget.AttachmentPreview',
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
			params=Ext.apply(params,{table_name:'EXP_REPORT_HEADERS'});
			items=[{
				xtype:'AttachmentShow',
				title:'附件',
				params:params,				
				collapsible : true,
				autoScroll:true,
				anchor:'100% 100%'
			}];
		}else if (doc_type=='JK'){
			params=Ext.apply(params,{table_name:'CSH_PAYMENT_REQUISITION_HDS'});
			items=[{
				xtype:'AttachmentShow',
				title:'附件',
				params:params,				
				collapsible : true,
				autoScroll:true,
				anchor:'100% 100%'
			}];
		}else if(doc_type='FK'){
			params=Ext.apply(params,{table_name:'ACP_ACP_REQUISITION_HDS'});
			items=[{
				xtype:'AttachmentShow',
				title:'附件',
				params:params,				
				collapsible : true,
				autoScroll:true,
				anchor:'100% 100%'
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