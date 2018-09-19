Ext.define('desktop.app.hec.wfl.WflApprovePanel',{
	extend:'Ext.form.Panel',
	alias:['widget.WflApprovePanel'],
	requires: [    	
    	'Ext.form.Panel'           
    ],
    moduleName:"wfl",//请求模块名称
	controllersName:"WflNodeActionTypes",//请求控制器名称	
	searchMethod:'search',
	pagesize:25,    
    getToolbar:Ext.emptyFn,
    getItems:Ext.emptyFn,
    backNodeButton:null,//返到指定节点按钮
    uploadAttButton:null,//上传附件按钮
    transactonButton:null,//转交按钮
    addApproveButton:null,//添加审批人按钮
    notificationButton:null,//通知按钮
    cancelButton:null,//取消关闭窗口按钮,
    endWflButton:null,//结束工作流按钮
    getBackNodeButton:function(){
    	if(Ext.isEmpty(this.backNodeButton)){
			this.backNodeButton = Ext.create('desktop.app.comm.CommButton',{               
                scope : this,
                text:'返回指定节点',
                iconCls:'next',
                handler: this.backNodeButtonClick
          	});
		}
		return this.backNodeButton;
    },
    backNodeButtonClick:function(btn){
    	
    },
    getUploadAttButton:function(){
    	if(Ext.isEmpty(this.uploadAttButton)){
			this.uploadAttButton = Ext.create('desktop.app.comm.CommButton',{               
                scope : this,
                text:'上传附件',
                iconCls:'attButton',
                handler: this.uploadAttButtonClick
          	});
		}
		return this.uploadAttButton;
    },
    uploadAttButtonClick:function(btn){
    	var me=this;
    	var params=me.params;
    	var win=Ext.create('desktop.app.hec.fnd.AttachmentUploadWindow',{
    		params:params,
    		width:800,
    		height:600,
    		constrainHeader:true
    	});
    	win.show();
    },
    getTransactonButton:function(){
    	if(Ext.isEmpty(this.transactonButton)){
			this.transactonButton = Ext.create('desktop.app.comm.CommButton',{               
                scope : this,
                text:'转交处理',
                iconCls:'transactonButton',
                handler: this.transactonButtonClick
          	});
		}
		return this.transactonButton;
    },
    transactonButtonClick:function(btn){
    	
    },
    getAddApproveButton:function(){
    	if(Ext.isEmpty(this.addApproveButton)){
			this.addApproveButton = Ext.create('desktop.app.comm.CommButton',{               
                scope : this,
                text:'添加审批人',
                iconCls:'user',
                handler: this.addApproveButtonClick
          	});
		}
		return this.addApproveButton;
    },
    addApproveButtonClick:function(btn){
    	
    },
    getNotificationButton:function(){
    	if(Ext.isEmpty(this.notificationButton)){
			this.notificationButton = Ext.create('desktop.app.comm.CommButton',{               
                scope : this,
                text:'通知',
                iconCls:'notificationButton',
                handler: this.notificationButtonClick
          	});
		}
		return this.notificationButton;
    },
    notificationButtonClick:function(btn){
    	
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
    getEndWflButton:function(){
    	if(Ext.isEmpty(this.endWflButton)){
			this.endWflButton = Ext.create('desktop.app.comm.CommButton',{               
                scope : this,
                text:'结束工作流',
                iconCls:'endWflButton',
                handler: this.endWflButtonClick
          	});
		}
		return this.endWflButton;
    },
    endWflButtonClick:function(btn){
    	
    },
    getButtons:function(){
    	var me=this;    	
    	var buttons=[];
    	buttons.push(me.getBackNodeButton());
    	buttons.push(me.getUploadAttButton());
    	buttons.push(me.getTransactonButton());
    	buttons.push(me.getAddApproveButton());
    	buttons.push(me.getNotificationButton());
    	buttons.push(me.getCancelButton());
    	//buttons.push(me.getEndWflButton());
    	return buttons;
    },
    getStoreModel : function(){
		return 'desktop.app.hec.wfl.model.WflNodeActionType';
	},
    store:null,
    initComponent:function(config){
        var me=this;
        var height=me.height;
        var params=me.params;
        //me.buttons=me.getButtons();
        var items=me.getItems();
        var toolbar=me.getToolbar();        
        var title=me.title;
		me=Ext.apply(me,{
			title:title,
			layout:{
				anchor: '100%',	            
				labelWidth: 120
	        },
			height: height,
			border: false,
			minSize: 40,
			split:true,
			labelWidth: 120,
			labelAlign: 'right',
			defaultType: 'textfield',
			fieldDefaults: {
		        labelWidth: 120,
		        labelAlign:'right'		        
		    },
			frame: false,
			autoScroll : true,
			buttonAlign:'center',
			tbar : toolbar,
			items:[{
				fieldLabel: '处理意见',
    			name: 'comments',
				xtype:'textarea',
				allowBlank: false,
				anchor: '100%'				
			}]
			
		});		
		me.on({
			afterrender:function(panel){
				me.store=me.getStore(params).load();
			},
			scope:me
		})
		me.callParent();
	},
	getUrl : function(){
		return this.moduleName+"/"+this.controllersName;
	},	
	/**
	 * store数据
	 */
	getStore : function(params){
		var me=this;
		var store=Ext.create('Ext.data.JsonStore',{			
				pageSize:me.pagesize,
				model : me.getStoreModel(),				
				proxy : {
					type : 'ajax',
					url : me.getUrl()+"/"+me.searchMethod,
					reader : {
						type : 'json',
						totalProperty : 'totalCount',
						root : 'result'
					},
					simpleSortMode : true
				},
				sorters : [{
					property : 'id',
					direction : 'DESC'
				}]
		});
		store.on({
   			load:me.load,
   			beforeload:function(store,operation,e){	  				 					
   				Ext.apply(store.proxy.extraParams,params);	   				
   			},
   			beforeprefetch:function(store,operation,e){
   				if(operation.groupers && operation.groupers.length){
   					var page=operation.page;
   					store.loadPage(page);
   				}
   			},
   			scope:me
   		});
		return store;
	},
	load:function(store,records,successful,e){
		var me=this;
		var buttons=[];
		var items=store.data.items;
		var len=items.length;
		for(var i=0;i<len;i++){
			var record=items[i];
			var type=record.get('action_type');
			if(type==1){
				var btn=Ext.create('desktop.app.comm.CommButton',{
					text:record.get('action_title'),
					action_id:record.get('action_id'),
					action_type:record.get('action_type'),
					record:record,
					iconCls:'save',
					handler:me.buttonClick
				});
				buttons.push(btn);	
			}else if(type==999){
				var btn=Ext.create('desktop.app.comm.CommButton',{
					text:record.get('action_title'),
					action_id:record.get('action_id'),
					action_type:record.get('action_type'),
					record:record,
					iconCls:'endWflButton',
					handler:me.buttonClick
				});
				buttons.push(btn);
			}else{
				var btn=Ext.create('desktop.app.comm.CommButton',{
					text:record.get('action_title'),
					action_id:record.get('action_id'),
					action_type:record.get('action_type'),
					record:record,
					iconCls:'reset',
					handler:me.buttonClick
				});
				buttons.push(btn);
			}
			
					
		}
		var buttonsArray= me.getButtons();
		for(var i=0;i<buttonsArray.length;i++){
			buttons.push(buttonsArray[i]);
		}
		
		var config={
				xtype: 'fieldset',
		        title: '操作',
		        collapsible: true,
		        layout: {
                    type: 'hbox',
                    padding:'5',
                    pack:'center',
                    align:'middle'
                },
                defaults:{margin:'0 5 0 0'},
                items:buttons
		};
		//me.buttons=Ext.apply(me,buttons);
		me.add(config);
	},
	buttonClick:function(btn){
		var me=this.ownerCt.ownerCt;
		var action_type=btn.action_type;
		var action_id=btn.action_id;
		var record=btn.record;
		//同意
		if(action_type==1){
			me.submitFunction(action_id);
		}else if(action_type==999){//结束工作流
			me.submitFunction(action_id);
		}else if(action_type==-1){//拒绝至提单人
			Ext.Msg.confirm("温馨提示","拒绝后该单据将退回至申请人,是否继续?",function(btn, text){
				if(btn == 'yes'){
					me.submitFunction(action_id);
				}
			});
		}
		
	},
	submitFunction:function(action_id){
		var me=this;
		var url=appPath+"/wfl/WflWorkflowWaitApproves/approve";
		var form=me;
		var values=form.getForm().getValues();
		var p=me.params;
		debugger;
		var record_id=p.record_id;
		var comments=values.comments;
		if(!form.getForm().isValid()){
			Ext.Msg.alert("温馨提示","请填写处理意见！");
			return;
		}
		
		var params={action_id:action_id,comments:comments,record_id:record_id};
		Ext.Ajax.request({
            url: url,
            params:params,
            success: function(response){
                var text = response.responseText;
                var result=Ext.decode(text);
                if(result.success){               		
                	Ext.example.msg("温馨提示","操作成功!");
                	//Ext.Msg.alert("温馨提示","操作成功！");
                	var panels=Ext.ComponentQuery.query('WflWorkflowWaitApprove');
                	var panel=null;
                	if(panels.length>0){
                		panel=panels[0];
                		panel.getGrid().getStore().loadPage(1);
                	}
                	var w=me.ownerCt;
                	w.hide();
                }else{
                	Ext.example.msg("温馨提示","操作失败!");
                	Ext.Msg.alert("温馨提示","操作失败！");
                }
              
            },
            failure:function(){
               Ext.example.msg('温馨提醒',"操作失败!");
               Ext.Msg.alert("温馨提示","操作失败！");
            }
        });
	}
	
	
	
});
Ext.define('desktop.app.hec.wfl.model.WflNodeActionType',{
	extend: 'Ext.data.Model',
	fields:[	                            
            {name:'action_id'},
        	{name:'action_type'},
        	{name:'action_title'}        	
	       ]
});