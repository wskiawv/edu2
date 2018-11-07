Ext.define('desktop.app.eims.school.CurriculumChapterSetting',{
	extend:'Ext.panel.Panel',
	alias:'widget.CurriculumChapterSetting',
	requires:[  		   
   		'Ext.panel.Panel',
   		'Ext.tree.Panel',   		
        'Ext.form.Panel',
        'desktop.app.comm.AddButton',
        'desktop.app.comm.EditButton',
        'desktop.app.comm.DeleteButton',
        'desktop.app.comm.SearchButton',
        'desktop.app.comm.SaveButton',
        'desktop.app.comm.CancelButton',
        'desktop.app.eims.school.ResourcesBrowseWindow'
	],
	moduleName:"school",//请求模块名称
	controllersName:"CurriculumResourceses",//请求控制器名称
	getUrl : function(){
		return this.moduleName+"/"+this.controllersName;
	},	
	
	getStoreModel : function(){
		return 'desktop.app.eims.school.model.CurriculumChapterSetting';
	},
	
	getRootStore:function(){
		var me=this;
		var url=appPath+"/school/CurriculumResourceses/getCurrculumChapter";
		var store=Ext.create('Ext.data.TreeStore',{
			model:me.getStoreModel(),
			autoLoad:false,
			root:{
				text:'章节目录',
				id:'0',
				defaultRootId:'id',
				expanded:false
			},		
			nodeParam:'id',
			proxy: {
                type: 'ajax',
                url: url,
                reader:{
					type:'json',
					root:'object'
				}
            },
            listeners:{
            	'beforeload':function(s){
            		//获取课程ID
            		var formpanel=me.getParentPanel();
            		var child=formpanel.child("hidden");            	
            		var curriculumId=child.getValue();
            		var params={curriculumId:curriculumId};
            		Ext.apply(s.proxy.extraParams,params);            		
            	},
            	'beforeexpand':function(node){
            		var pid=node.data["pid"];
            		var curriculumId=node.data["curriculumId"];
            		
            		/*Ext.Ajax.request({
            		    url: url,
            		    method:'GET',
            		    params: {
            		    	pid:pid,
            		    	curriculumId:curriculumId
            		    },
            		    success: function(response){
            		        var msg = Ext.decode(response.responseText);
            		        Ext.Msg.alert("温馨提示",msg.msg);
            		        node.appendChild(msg.object);
            		        // process server response here
            		    }
            		});*/
            		//store.load(node);
            		//this.proxy.extraParams.pid=node.raw.pid;
            	}
            }
            
            
		})
		return store;
	},
	
	getLayoutConfin:function(){
		layout=[{type:'anchor'}];
		return layout;
	},
	getParentPanel:function(){
		var me=this;
		var panel=me.ownerCt.down("form");
		return panel;
	},
	getFormPanel:function(){
		var me=this;
		var formPanel=me.down("form");
		return formPanel;
	},
	getTreePanel:function(){
		var me=this;
		var treepanel=me.down("treepanel");
		return treepanel;
	},
	addNode:function(n){
		var me=this;
		var formPanel=me.getFormPanel();
		formPanel.getForm().reset();
		var formParentPanel=me.getParentPanel();
		var child=formParentPanel.child("hidden");            	
		var curriculumId=child.getValue();
		formPanel.getForm().findField("curriculumId").setValue(curriculumId);
		
		if(n){
			var treepanel=me.getTreePanel();
			var records=treepanel.getSelectionModel().getSelection();
			if(records.length==1){
				var pid=records[0].get("id");				
				formPanel.getForm().findField("pid").setValue(pid);
				formPanel.getForm().findField("leaf").setValue(n);
			}else{
				Ext.Msg.alert("温馨提示","请选择其中一章节，不可多选！");
			}
		}else{
			formPanel.getForm().findField("pid").setValue(0);
			formPanel.getForm().findField("leaf").setValue(n);
		}
	},
	deleteNode:function(){
		var me=this;
		var treepanel=me.getTreePanel();
		var records=treepanel.getSelectionModel().getSelection();
		if(records.length<1){
			Ext.Msg.alert('温馨提醒', '请选择章节！');
			return;
		}else{
			var ids = [];
			for(var i=0,len=records.length; i<len; i++){
				ids.push(records[i].get("id"));
			}
			Ext.Msg.confirm("温馨提醒","确定删除所选择的数据？",function(btn, text){
				if(btn == 'yes'){
					Ext.Ajax.request({
						url : me.getUrl()+"/delete",
						params : {"id": ids},
						success : function(response){
							 var text = response.responseText;
							  var result=Ext.decode(text);
							  Ext.example.msg('温馨提醒',result.msg);	
							  var treepanel=me.getTreePanel(),store =treepanel.getStore();						
								store.load();		
							
						},
						failure:function(response){
							
							  Ext.example.msg('温馨提醒',"请求失败！");
						}
					});
				}
			});
		}
	},
	saveNode:function(){
		var me=this;
		//获取课程ID
		var panel=me.getParentPanel();
		var child=panel.child("hidden");
		var value=child.getValue();
		if(Ext.isEmpty(value)){
			Ext.Msg.alert('温馨提醒', '请先保存课程再设置章节！');
			return;
		}
		var formpanel=me.getFormPanel();
		//设置课程ID
		var curriculumField=formpanel.getForm().findField("curriculumId");
		var chapterName=formpanel.getForm().findField("chapterName").getValue();		
		formpanel.getForm().findField("text").setValue(chapterName);
		formpanel.getForm().findField("qtip").setValue(chapterName);
		curriculumField.setValue(value);
		//获取选中的节点ID
		var treepanel=me.getTreePanel();
		var rootNode=treepanel.getRootNode();
		var selectNode=treepanel.getChecked();
		var id=formpanel.child("hidden").getValue();
		var action="save";
		if(id==""||id==''||id==null){
			action="save";
		}else{
			action='update';
		}		
		
		var url=appPath+"/school/CurriculumResourceses/"+action;	
		if(formpanel.getForm().isValid()){
			formpanel.submit({
				clientValidation:true,				
				url:url,
				waitTitle:'温馨提醒',
				waitMsg:'数据提交中...',				
			    scope:me,
				success:function(form,action){
					var treepanel=me.getTreePanel(),store =treepanel.getStore();						
						store.load();				
					Ext.example.msg('温馨提醒', action.result.msg);					
				},
				failure:function(form,action){
					switch (action.failureType) {
			            case Ext.form.action.Action.CLIENT_INVALID:
			            	Ext.Msg.alert('温馨提醒', '数据验证没通过！');
			                break;
			            case Ext.form.action.Action.CONNECT_FAILURE:
			                Ext.Msg.alert('温馨提醒', '请求失败！');
			                break;
			            case Ext.form.action.Action.SERVER_INVALID:
			            	Ext.Msg.alert('温馨提醒', action.result.msg);			               
			       }
				}
			});
		}
		
	},
	resetNode:function(){
		var me=this;
		var formPanel=me.getFormPanel();
		formPanel.getForm().reset();
	},
	refreshTree:function(){
		var me=this;
		var store=me.getTreePanel().getStore();
		store.load();
	},
	getItems:function(){
		var me=this;
		var item=[{
				region : 'west',				
				xtype:'treepanel',	
				title:'章节设置',
				//margins: '5 0 0 5',
		        width: 400,
		        collapsible: true,
				rootVisible: true,
				border : true,
				store:me.getRootStore(),
				tbar:[{
					xtype:'AddButton',
					text:'新增章节',
					handler:function(){
						me.addNode(false);
					}
				},{
					xtype:'AddButton',
					text:'新增小节',
					handler:function(){
						me.addNode(true);
					}
				},{
					xtype:'DeleteButton',
					text:'删除节点',
					handler:function(){
						me.deleteNode();
					}
				},{
					xtype:'SearchButton',
					text:'刷新',
					handler:function(){
						me.refreshTree();
					}
				}],
				listeners:{
					itemclick:function(view,record,item,index,e){
						var formPanel=me.getFormPanel();
						formPanel.loadRecord(record);
						var treepanel=me.getTreePanel();
						var store=treepanel.getStore();
						var node=store.getNodeById(record.get("id"));
						var checked=node.data["checked"];
						if(node.hasChildNodes()){
							node.expand();
							node.eachChild(function(n){
								if(checked==true){
									n.data["checked"]=false;
								}else if(checked ==false || checked ==''||checked==null||checked =="false"){
									n.data["checked"]=true;
								}	
								n.updateInfo();
							});
							
						}
						if(checked==true){
							node.data["checked"]=false;
						}else if(checked ==false || checked ==''||checked==null||checked =="false"){
							node.data["checked"]=true;
						}			
						node.updateInfo();
						/*var treepanel=me.getTreePanel();
						var store=treepanel.getStore();
						var node=store.getNodeById(record.get("id"))
						//var n=treepanel.getChecked();
						//var node=n[0];
						var pid=node.data["pid"];
	            		var curriculumId=node.data["curriculumId"];
	            		var url=appPath+"/school/CurriculumResourceses/getCurrculumChapter";
						Ext.Ajax.request({
	            		    url: url,
	            		    method:'GET',
	            		    params: {
	            		    	pid:pid,
	            		    	curriculumId:curriculumId
	            		    },
	            		    success: function(response){
	            		        var msg = Ext.decode(response.responseText);
	            		        Ext.Msg.alert("温馨提示",msg.msg);
	            		        node.appendChild(msg.object);
	            		        node.expand();
	            		        // process server response here
	            		    }
	            		});*/
						//store.load(node);
					}
				}
			},{
			    region:'center',
			    title:'章节编辑',
			    xtype:'form',
			    margins: '0 5 0 0',
			    tbar:[{
			    	xtype:'SaveButton',
			    	handler:function(){
			    		me.saveNode();
			    	}
			    },{
			    	xtype:'ResetButton',
			    	handler:function(){
			    		me.resetNode();
			    	}
			    }],
			    layout:{
		            type: 'table',
		            columns: 2,
		            defaults: {width: 150},
		        },
			    defaultType: 'textfield',
			    fieldDefaults: {
			        labelWidth: 120,
			        labelAlign:'right'
			    },				    
			    items:me.getWindowFormItems()
			}];
		return item;
	},
	
	initComponent:function(config){
		var me=this;		
        /*Ext.apply(me,{        
        	layout: 'border',
        	items:me.getItems()
        });*/
        me.items=me.getItems();
        me.on('afterrender',function(panel){
        	//获取课程ID
    		var formpanel=me.getParentPanel();
    		var child=formpanel.child("hidden");
    		var fp=panel.down("form");
    		var value=child.getValue();
    		var treepanel=me.getTreePanel();
			var store=treepanel.getStore();
			var node=store.getRootNode();
			var curriculumId=value;
    		if(!Ext.isEmpty(value)){
    			var treepanel=panel.down('treepanel');
            	var store=treepanel.getStore();
            	var params={curriculumId:curriculumId};
            	Ext.apply(store.proxy.extraParams,params);
            	store.load();
    		}       	
            
        });
        me.callParent();
	},
	getWindowFormItems:function(){
		var me=this;
		var item=[{
		    	xtype:'hidden',
		    	name:'id'
		    },		    
		    {		        
		        name: 'curriculumId',		        
		        xtype:'hidden',		        
		    },
		    {
		        fieldLabel: '资源类型',
		        name: 'resourcesType',
		        allowBlank:false,
		        emptyText:'resourcesType',
		        msgTarget:'resourcesType',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '资源url',
		        name: 'url',
		        //allowBlank:false,		     
		        msgTarget:'url',
		        anchor:'100%',
		       // cls:'selectText',
		        fieldCls:'folder',
		        listeners:{
		        	scope:this,
		        	focus:function(textField){
		        		me.createResourcesBrowseWindow(textField);
		        	}
		        }
		    },
		    {
		        fieldLabel: '章节标题',
		        name: 'resourcesName',
		        allowBlank:false,
		        emptyText:'resourcesName',
		        msgTarget:'resourcesName',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '章节名称',
		        name: 'chapterName',
		        allowBlank:false,
		        emptyText:'章节名称',
		        msgTarget:'章节名称',
		        anchor:'100%'  
		    }
		    ,
		    {		       
		        name: 'pid',
		        xtype:'hidden',		
		    },{
		    	name: 'text',
		        xtype:'hidden',
		    },{
		    	name: 'leaf',
		        xtype:'hidden',
		    },{
		    	name: 'qtip',
		        xtype:'hidden',
		    },{
		    	name: 'iconCls',
		        xtype:'hidden',
		    }
		    ];
		return item;		    
	},
	createResourcesBrowseWindow:function(textField){
		var win =Ext.create('desktop.app.eims.school.ResourcesBrowseWindow',{
			textField:textField
		});
		win.show();
		return win;
	}
	
});
Ext.define('desktop.app.eims.school.model.CurriculumChapterSetting',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'int'},	   
	        {name:'curriculumId',type: 'int'},	   
	        {name:'resourcesType',type: 'string'},	   
	        {name:'url',type: 'string'},	   
	        {name:'resourcesName',type: 'string'},
	        {name:'chapterName',type: 'string'},
	        {name:'pid',type: 'int'},
	        {name:'text',type:'string'},
	        {name:'leaf',type:'string'},
	        {name:'qtip',type:'string'},
	        {name:'checked',type:'string'},	     
	        {name:'iconCls',type:'string'}
	       ]
});