/**
 * 增删改查组件
 */

Ext.define('desktop.app.comm.CRUDRowEditPanel',{
	extend:'Ext.panel.Panel',
	alias:['widget.CRUDRowEditPanel'],
	
	requires: [    	
		'Ext.data.Model',        
		'Ext.util.Format', 
		'Ext.selection.CheckboxModel',          
		'Ext.data.Store',
		'Ext.data.*',    
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
		'desktop.app.comm.RowExpanders',
		'Ext.grid.plugin.*',
		'Ext.grid.*',
		'Ext.panel.Panel',
		'Ext.tab.Panel',
		'Ext.grid.Panel',
		'Ext.form.Panel'
       ],
   	/**
   	 * 用于组装请求URL
   	 * @type 
   	 */
   	moduleName:"",//请求模块名称
   	controllersName:"",//请求控制器名称
    //请求后台控制器方法名
	searchMethod:'search',
	saveMethod:'save',
	deleteMethod:'delete',
	updateMethod:'update',
	showMethod:'show',
	exportMethod:'export',
	downloadTemplateMethod:'downloadTemplate',
	genTemplateMehod:'downloadTemplate',
	importMethod:'import',
   	//modelName:'usermodel',//模型名称
   	formWindow:null,//新增、编辑窗口
   	gridSm : null,
   	CURecord : null, //新增或编辑的record, 与grid , form相关
   	newOrEdit:true,
   	pagesize:20,
   	WestPanel:null,
   	searchPanel:null,
   	tabpanel:null,
   	grid:null,
   	searchPanelTitle:"搜索",
   	gridPanelTitle:"数据",
   	editWindowId:null,
   	editWindowTitle:'新增',
   	/**
   	 * 子类需要覆盖此方法
   	 * @type 
   	 */
   	getSearchFields:Ext.emptyFn,//搜索Panel的搜索字段构造
   	getSearchFieldHeight:Ext.emptyFn,//搜索Panel高度设置
   	
   	
   	//exportButtonClick : Ext.emptyFn,//导出按钮单击事件	
   	
   	getStoreModel : Ext.emptyFn,//需要子类覆盖此方法返回Store模型model
   	
   	getWindowFormItems:Ext.emptyFn,
    getFields:Ext.emptyFn,//此方法用于返回model中的filds配置字段
    /**
   	 * grid列模型子类需要覆盖此方法
   	 */
   	getGridColumns :Ext.emptyFn,
   	/**
   	 * 按钮及单击事件处理函数
   	 * @type 
   	 */
   	addButton : null, //新增按钮
	editButton : null, //编辑按钮
	deleteButton : null, //删除按钮
	searchButton : null, //搜索按钮
	saveButton : null , //保存按钮
    cancelButton : null, //取消按钮
    importButton :null,//导入按钮
    exportButton : null, //导出按钮	
    resetButton : null,//新增，编辑窗口重置按钮
    searchResetButton :null,//搜索panel重置按钮
    downloadTemplateButton:null,//下载excel导入模板   
    //按钮显示隐藏配置
    addButtonDisplay:true,
    editButtonDisplay:false,
    deleteButtonDisplay:true,
    importButtonDisplay:true,
    exportButtonDisplay:true,
    downloadTemplateButtonDisplay:true,
   	getUrl : function(){
   		return this.moduleName+"/"+this.controllersName;
   	},	
   	getItems:function(config){
   		var me=this;
   		var items=[{
   				title:me.getSearchTitle(),
   				xtype:'SearchPanel',				
   				layout:'hbox',
   				height : me.getSearchFieldHeight(),
   				collapsible : me.getSearchCollapsible(),
   				items:me.getSearchFields(),
   				buttonAlign:'center',
   				buttons:[me.getSearchButton(),me.getSearchResetButton()],
   				fieldDefaults: {
   			        labelWidth: 70,
   			        labelAlign:'right'
   			    },		    
   			    defaultType: 'textfield'
   			},{
   				xtype:'CenterGrid',				
   				tbar : me.getToolbar(),
   				//region:'center',
   				store : me.getGridStore(),
   				columns : me.getGridColumns(),
   				selModel : me.getGridSm(),				
   				plugins: [me.getRowExpander(),me.getRowEditPlugin()],
   				flex:1
   			}				
   		];
   			
   		return items;
   	},
   	initComponent : function(config){
       var me=this;
       Ext.apply(me,{
       	
       });        
       me.items =  me.getItems();
       
       me.addEvents(
           /**
            * fire before gird record is deleted,
            * if return false,will not delete the record
            * @event
            * @param grid that record of it
            * @param grid of store
            * @param records Array that will be deleted
            */
           'beforeDeleteRecord',
           /**
            * fire gird record is deleted,
            * if  delete the record success will return true, or return false
            * @event
            * @param grid that record of it
            * @param grid of store
            * @param records Array that will be deleted
            */
           'deleteRecord',
           /**
            * fire when edit button click,
            * if neet to add the head photo ,can do something 
            * @event
            * @param window
            * @param record
            */
           'addPhotoHead'
           
        )     
        
        me.on({
       	 
        	/*deleteRecord : this.deleteRecord,          
        	beforedestroy : function(comp){
        		//A.log("CommonOutUpdateGrid beforedestroy!");
        		if(!Ext.isEmpty(comp.formWindow)){
        			//A.log("CommonOutUpdateGrid formwindow close!");
        			if(comp.formWindow.close)
        				comp.formWindow.close();
        			if(comp.formWindow.getGrid && comp.formWindow.getGrid()){
        				comp.formWindow.getGrid().destroy();
        			}
        			comp.formWindow.destroy(); 
        		}
        		
        	},
        	afterrender:function(panel){
        		//panel.down("CenterGrid").getStore().load();
        		//me.getGrid().getStore().load();
        	},*/
        	scope : me
        })
        
        me.getCancelButton().setHandler(me.cancelButtonClick, me);
        me.callParent();
   	},
   	getCreateWindowWidth:function(){
		return 740;
	},
	getCreateWindowHeight:function(){
		return 480;
	},
	getCreateWidnowLayout:function(){
		return 'border';
	},
   	/**
   	 * 获取桌面对象desktop
   	 */
   	getWindowDesktop:function(){	
   		var desktop=app.getDesktop();
   		return desktop;
   	},
   	/**
   	 * 获取依赖窗口window
   	 */
   	getMainWindow:function(){
   		var win=this.ownerCt.ownerCt;
   		return win;
   	},
   	/**
   	 * 扩展显示插件
   	 */
   	getRowExpander:function(){
   		var me=this;
   		var rowexpander=Ext.create('Ext.grid.plugin.RowExpander',{   			   
		    rowBodyTpl : me.getRowBodyTpl()			    
   		});
   		return rowexpander;
   	},
   	/**
   	 * 行编辑组件
   	 */
   	getRowEditPlugin:function(){
   		var me=this;
   		var rowEditPlugin=Ext.create('Ext.grid.plugin.RowEditing',{
   			clicksToMoveEditor: 1,
   			clicksToEdit:2,
   			saveBtnText: '保存', 
   			cancelBtnText: "取消",
	        autoCancel: true
   		});
   		//注册事件
   		rowEditPlugin.addEvents(
   			'addRecord'
   		);
   		//监听事件
   		rowEditPlugin.on({
   			beforeedit:function(editor,context,e){
   				var edit=editor;   				
   				var record=context.record;
   				
   			},
   			edit:function(editor,context){
   				var edit=editor;   				
   				var record=context.record;   				 
   				var action="/save";
   				if(record.data["id"]==""||record.data["id"]==null){
   					action="/save";
   					record.data["id"]="";
   				}else{
   					action="/update";
   				}
   				var data=record.data;
   				var store=context.store;  
   				var grid =context.grid;
   				Ext.Ajax.request({
   					url : me.getUrl()+action,
   					params : data,
   					success : function(response){
   						var text = response.responseText;
     					var result=Ext.decode(text);     				
     					Ext.example.msg('温馨提醒',result.msg);	   						
   						grid.getSelectionModel().deselectAll();
   						store.load();   						
   					},
   					failure:function(response){   					 
   					  Ext.example.msg('温馨提醒',"请求失败");   					  
   					}
   				});
   			},
   			canceledit:function(editor,context,e){
   				var edit=editor;   				
   				var record=context.record;
   				var store=context.store;
   				store.load();
   				
   			},
   			addRecord:function(editor,store){
   				
   			}
   		});
   		me.rowEditPlugin=rowEditPlugin;
   		return rowEditPlugin;
   	},
   	/**
   	 * 获取tabPanel
   	 */
   	getTabPanel:function(){
   		return this.ownerCt;
   	},
   	getPanelTitle:function(){
   		var me=this;
   		var panelTitle=me.title;
   		return panelTitle;
   	},
   	/**
   	 * 创建新增，编辑窗口
   	 */
   	createWindow : function() {
   		var me = this, desktop = me.getWindowDesktop(), win = desktop.getWindow(me.editWindowId);
   		if (!win) {
   			win = desktop.createWindow({
   				id : me.editWindowId,
   				title : me.getPanelTitle()+me.editWindowTitle,			
   				maximizable:true, 
   				minimizable:true,				 
   				width : 740,
   				height : 480,
   				closeAction:'hide',
   				iconCls : 'video',
   				animCollapse : false,
   				constrainHeader : true,
   				frame:false,
   				border : false,
   				layout : 'form',
   				items :me.getWindowItems(),
   				buttons:[me.getSaveButton(),me.getResetButton(),me.getCancelButton()]
   			})
   		}
   		if (me.tip) {
   			me.tip.setTarget(win.taskButton.el);
   		}
   		win.show();
   		win.doLayout();
   		return win;
   	},
   	/**
   	 * 新增、编辑窗口form表单对象
   	 */
   	getWindowItems:function(){		
   		//var form=Ext.getCmp(this.editWindowId+'form');
//       	if(!form)
//       	{
   	    var form=Ext.create('Ext.form.Panel',{
   			border: false,			
   			//id:this.editWindowId+'form',
   		    fieldDefaults: {
   		        labelWidth: 70,
   		        labelAlign:'right'
   		    },		    
   		    defaultType: 'textfield',		   
   		    items: this.getWindowFormItems()
		});
       	//}
       	return form;		
   	},
   	//搜索Panel相关函数		
       
   /**
    * 获取按钮方法
    * @param {} config
    * @return {}
    */
   getAddButton : function(config){	
	   	if(Ext.isEmpty(this.addButton)){
			this.addButton =Ext.create('desktop.app.comm.AddButton',{       
	            handler: this.addButtonClick,
	            scope : this        	
			});
	   	}
		return this.addButton;
   },
   getEditButton : function(config){
	   	if(Ext.isEmpty(this.editButton)){
			this.editButton = Ext.create('desktop.app.comm.EditButton',{               
	               scope: this,
	               handler: this.editButtonClick
	           });
		}
		return this.editButton;
   },
   getDeleteButton : function(config){
	   	if(Ext.isEmpty(this.deleteButton)){
			this.deleteButton = Ext.create('desktop.app.comm.DeleteButton',{               
	               scope: this,
	               handler: this.deleteButtonClick
	           });
		}
		return this.deleteButton;
   },
   getSearchButton : function(config){
	   	if(Ext.isEmpty(this.searchButton)){
			this.searchButton = Ext.create('desktop.app.comm.SearchButton',{             
	               scope : this,
	               handler: this.searchButtonClick
			});
		}
		return this.searchButton;
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
   getCancelButton : function(config){
	   	if(Ext.isEmpty(this.cancelButton)){
	           this.cancelButton = Ext.create('desktop.app.comm.CancelButton',{
	                 scope : this,
	                 handler: this.cancelButtonClick
	           }); 
	       }
	       return this.cancelButton;
   },
   getImportButton : function(config){
       if(Ext.isEmpty(this.importButton)){
           		this.importButton = Ext.create('desktop.app.comm.ImportButton',{
           			scope : this,
           			handler: this.importButtonClick
           		});
           	}
           	return this.importButton;
   },
   getExportButton : function(config){
	   	if(Ext.isEmpty(this.exportButton)){
	   		this.exportButton = Ext.create('desktop.app.comm.ExportButton',{    			
	   			scope : this,
	   			handler: this.exportButtonClick
	   		});
	   	}
	   	return this.exportButton;
   },
   getResetButton : function(config){
	   	if(Ext.isEmpty(this.resetButton)){
	   		this.resetButton=Ext.create('desktop.app.comm.ResetButton',{
	   			scope:this,
	   			handler:this.resetButtonClick
	   		});    		
	   	}
	   	return this.resetButton;
   },
   getSearchResetButton : function(){
	   	if(Ext.isEmpty(this.searchResetButton)){
	   		this.searchResetButton=Ext.create('desktop.app.comm.ResetButton',{
	   			scope:this,
	   			handler:this.searchResetButtonClick
	   		});    		
	   	}
	   	return this.searchResetButton;
   },
   getDownloadTemplateButton : function(){
   	if(Ext.isEmpty(this.downloadTemplateButton)){
   		this.downloadTemplateButton=Ext.create('desktop.app.comm.DownloadTemplateButton',{
   			scope:this,
   			handler:this.downloadTemplateButtonClick
   		});
   	}
   	return this.downloadTemplateButton;
   },
   /**
    * 按钮单击事件处理函数
    */
   addButtonClick : function(btn){
   	var me=this;    	
   	var record=Ext.create(me.getStoreModel());
   	var grid=me.getGrid();
   	var store=grid.getStore();
   	var rowediting=me.rowEditPlugin;
   	rowediting.cancelEdit();
   	store.insert(0,record);
   	//rowediting.fireEvent("canceledit",rowediting,rowediting.context);
   	rowediting.startEdit(0,0);
   /*	var w=me.createWindow();  
   	w.taskButton.setText(me.getPanelTitle()+"新增");
   	w.setTitle(me.getPanelTitle()+"新增");
	w.down("form").getForm().reset();	
	me.newOrEdit=true;		
	me.formWindow=w;*/
	/*var record = Ext.data.Record.create(this.getFields());
	this.setCURecord(new record());*/
   },
   
   /**
    * 编辑按钮单击事件处理函数
    */
   editButtonClick : function(){
		var me=this;
		var grid = me.getGrid();
		var select = grid.getSelectionModel();
		var records = select.getSelection();
		if(Ext.isEmpty(records) || records.length>1){
			Ext.example.msg('温馨提醒', "编辑时只能选择一条记录!");			
			return;
		}  		
		var w = me.createWindow();
		w.taskButton.setText(me.getPanelTitle()+"编辑");
		w.setTitle(me.getPanelTitle()+"编辑");
		me.newOrEdit=false;
		me.formWindow=w;
		var formPanel = w.down("form");		 
		this.setCURecord(records[0]);		
		formPanel.loadRecord(records[0]);
   	},
   	/**
   	 * 保存按钮单击事件
   	 */
   	saveButtonClick  : function(btn){
   		var me=this;
   		var url=me.getUrl();
   		if(me.newOrEdit){
   			url+="/save";
   		}else{
   			url+="/update";
   		}
   		var form=me.formWindow.down("form");
   		if(form.getForm().isValid()){
   			form.submit({
   				clientValidation:true,
   				//scope:this,
   				url:url,
   				waitTitle:'温馨提醒',
   				waitMsg:'数据提交中...',				
   			    scope:me,
   				success:function(form,action){
   					var grid=me.getGrid(),store =grid.getStore();
   						//grid.getSelectionModel().deselectAll();	
   						store.load();
   					me.createWindow().close();
   					//this.getStore().load();
   					Ext.example.msg('温馨提醒', action.result.msg);
   					//Ext.Msg.alert('温馨提醒',action.result.msg);	
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
   			})
   		}
   	},
   	/**
   	 * 删除按钮单击事件处理函数
   	 */
   	deleteButtonClick :function(){
   		var me=this;
   		var grid = me.getGrid();
   		var select = grid.getSelectionModel();
   		var store = grid.getStore();
   		var records = select.getSelection();
   		if(Ext.isEmpty(records) || Ext.isEmpty(store)){
   			Ext.example.msg('温馨提醒', "请选择需要数据!");		
   			return ;
   		}
   		
   		Ext.Msg.confirm("温馨提醒","确定删除所选择的数据？",function(btn, text){
   			//A.log("delete message:{0}", a);
   			if(btn == 'yes'){
   				me.deleteRecord(grid, store, records);
   				/*//删除前处理
                   if(this.fireEvent('beforeDeleteRecord', this.getGrid(), store, records) !== false){
                     	//删除成功返回true后才删除store的record
                     	this.fireEvent('deleteRecord', this.getGrid(), store, records);
                   }*/
   			}			
   		});
   	},
   	/**
   	 * 新增、编辑窗口重置按钮单击事件
   	 */
   	resetButtonClick : function(btn){
   		var me=this;
   		var form=me.getWindowItems();
   		form.getForm().reset();
       },
       /**
        * 搜索panel重置按钮单击事件
        */
       searchResetButtonClick : function(){
       	var me=this;
       	var from=me.getSearchPanel().getForm();
       	from.reset();    	
       },
   	/**
   	 * gird的默认删除实现
   	 */
   	deleteRecord : function(grid, store, records){
   		var me=this;
   		var ids = [];
   		for(var i=0,len=records.length; i<len; i++){
   			ids.push(records[i].get("id"));
   		}
   		Ext.Ajax.request({
   			url : me.getUrl()+"/delete",
   			params : {"id": ids},
   			success : function(){
   				Ext.example.msg('温馨提醒', "数据删除成功!");		
   				/*for(var i=0,len=records.length; i<len; i++){
   					store.remove(records[i]);
   				}*/
   				//grid.getSelectionModel().deselectAll();
   				store.load();
   				//grid.getSelectionModel().clearSelections();
   			}
   		})
   	},
   	
   	/**
   	 * 搜索按钮单击事件处理函数
   	 */
   	searchButtonClick : function(){
   		var me=this;
   		var formPanel = me.getSearchFormPanel(),
   			grid = me.getGrid(),
   			store = grid.getStore(),
   			params = formPanel.getForm().getValues() || {},
   			bsParams = {start: 0, limit: store.pageSize},
   			_params = {};
   		for(var p in params){
   			if(!Ext.isEmpty(params[p])){//将没有值的属性排除
   				_params[p] = params[p];
   				//A.log("param p:{0},val:{1}", p, _params[p]);
   			}			
   		}
   		store.removeAll();
   		store.load({params:Ext.apply(_params, bsParams)});	
   		
   	},
   	/**
   	 * 获取搜索form表单
   	 */
   	getSearchFormPanel:function(){
   		var me=this;
   		return me.down("SearchPanel");
   	},
   	/**
   	 * 取消或重置按钮单击事件处理函数
   	 */
   	cancelButtonClick : function(){
   		this.createWindow().hide();
   	},
   	/**
	 * 导入按钮单击事件
	 */
	importButtonClick:function(){
		var me=this;
		var importStore=Ext.create("Ext.data.JsonStore",{
			model : me.getStoreModel(),
			proxy : {
				type : 'ajax',
				url : me.getUrl()+"/"+me.importMethod,
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
		var uploadFormPanel=Ext.create("Ext.form.Panel",{
			region:'north',
			title:'上传',
			heigth:300,
			buttonAlign:'center',
			frame:false,
			autoScroll:true,
			collapsible : me.getSearchCollapsible(),
        	fieldDefaults : {
				labelAlign : 'left',
				labelWidth : 90,
				anchor : '100%',
				width : 340
			},
			items:[{
				xtype : 'hidden',
				name : 'path'
			},{
				xtype : 'filefield',
				name : 'fileup',
				// filedLabel:'请选择上传文件',
				msgTarget : 'side',
				allowBlank : false,
				buttonText : "请选择文件"
			},{
				xtype:'textfield',
				name:'uploadFileName',
				fieldLabel:'上传文件',
				disable:true
			}],
			buttons:[{
				xtype:'UploadButton',
				handler:function(){
					var form = this.up('form').getForm();
					var hidden=this.up('form').down('hidden');
					var textfield=this.up('form').down('textfield');
					hidden.setValue(userId);
					//var grid2=me.createGridPanel();
					//var store=grid2.getStore();
					if (form.isValid()) {
						form.submit({										
							url : 'sys/SkyDrivePublics/upload',
							waitMsg : '正在上传中...',
							success : function(fp, o) {			
								try {														
									Ext.example.msg('温馨提醒',o.result.msg);
									hidden.setValue(o.result.result);
									textfield.setValue(o.result.result);
									//Ext.data.StoreManager.lookup('SkyDrivePublicStore').load();
									//win.close();
								} catch (e) {
									if (o.status !== "500") {													
										Ext.example.msg('温馨提醒',o.result.msg);
									}																									
								}											
							}

						})
					}
				}
			},{
				xtype:'CancelButton',
				handler:function(){
					me.importWin.close();
				}
			}]
		});
		var importGrid=Ext.create("Ext.grid.Panel",{
			region:'center',
			store:importStore,
			tbar:[{
				xtype:'ImportButton',
				handler:function(){
					var formPanel=uploadFormPanel;
					var hidden=formPanel.down('hidden');
					var value=hidden.getValue();
					Ext.example.msg('温馨提醒',value);
					me.ImportButtonClick();
					
				}
			},'-',{
				xtype:'CheckButton',
				handler:function(){
					me.CheckButtonClick(importGrid);
				}
			},'-',{
				xtype:'SubmitButton',
				handler:function(){
					me.SubmitButtonClick(importGrid);
				}
			}],
			selType: 'checkboxmodel',
			columns : me.getGridColumns()
		});
		if( !Ext.isEmpty(me.importWin)){
            me.importWin.show();
            return me.importWin;
        }
		var importWin=Ext.create("Ext.window.Window",{
			 title: me.title+'导入数据',
             closeAction:'hide',
             height: 500,
             width: 650,
             layout: 'border',
             maximizable:true,
             minimizable:true,
             items: [uploadFormPanel,importGrid]
		});
		me.importWin=importWin;
		importWin.show();
		return importWin;
	},
	/**
	 * 导入按钮单击事件
	 */
	ImportButtonClick:function(){
		var me=this;
	},
	/**
	 * 校验导入数据按钮单击事件
	 */
	CheckButtonClick:function(grid){
		var me=this;
		var store=grid.getStore();
	},
	/**
	 * 提交按钮单击事件
	 */
	SubmitButtonClick:function(grid){
		var me=this;
		var store=grid.getStore();
		
	},
	/**
	 * 导出按钮单击事件
	 */
	exportButtonClick: function(){
	    var me=this;
	    var grid=me.getGrid();
	    var columns=grid.columns;
	    var exportColumns={};
	    var data=[];

	    for(var i=0;i<columns.length;i++){
	        var column=columns[i];
	        var text=column.text;
	        var dataIndex=column.dataIndex;
	        if(null!=text && null!=dataIndex && text !="" && dataIndex !=""){
	            exportColumns[dataIndex]=text;
	            var name=text;
	            var code=dataIndex;
	            var record={"name":name,"code":code};
	            data.push(record);
	        }
	    }
	    var exprotStore=Ext.create("Ext.data.Store",{
            fields:[{name : 'code'}, {name : 'name'}],
            data:data
        });
	    var exportGrid=Ext.create('Ext.grid.Panel', {
            store: exprotStore,
            tbar:[{
                xtype:'SaveButton',
                text:'确定',
                handler:function(){

                      var records=exportGrid.getSelectionModel().getSelection();
                      var exportColumns={};
                      for(var i=0;i<records.length;i++){
                         var record=records[i];
                         var key=record.get("code");
                         var val=record.get("name");
                         exportColumns[key]=val;
                      }
                      if(exportColumns !=null && exportColumns !=""){
                         Ext.example.msg('温馨提醒',"导出中，请稍等！");
                         me.exportAjax(exportColumns);
                      }else{
                        Ext.example.msg('温馨提醒',"请选择要导出的列名！");
                        return;
                      }

                }
            },'-',{
                xtype:'CancelButton',
                handler:function(){
                    me.exportWin.close();
                }
            }],
            selType: 'checkboxmodel',
            columns: [
                { text: '列名',  dataIndex: 'name' }
            ]
        });
        if( !Ext.isEmpty(me.exportWin)){
            me.exportWin.show();
            return me.exportWin;
        }
        var exportWin=Ext.create("Ext.window.Window",{
            title: me.title+'导出列设置',
            closeAction:'hide',
            height: 500,
            width: 300,
            layout: 'fit',
            items: [exportGrid]
        });
        exportWin.show();
        exportGrid.getSelectionModel().selectAll();
        me.exportWin=exportWin;
        return exportWin;
	},
	exportAjax:function(exportColumns){
	    var me=this;
	    var url=me.getUrl()+"/export";
	    var params=Ext.encode(exportColumns);
	    //window.open(me.getUrl()+"/export?"+params);
	   // var wait= Ext.Msg.wait("正在生成Excel文件中，请稍等！","温馨提示",{text:"处理中。。。"});
	    Ext.Ajax.request({
            url: url,
            params:exportColumns,
            success: function(response){
                var text = response.responseText;
                var result=Ext.decode(text);
               	Ext.example.msg('温馨提醒',result.msg);
               	window.open(appPath+"/sys/SkyDrivePublics/download?fileName="+result.result);
               	//wait.close();
            },
            failure:function(){
               Ext.example.msg('温馨提醒',"导出失败!");
              // wait.close();
            }
        });
	},
   	/**
	 * 下载excel导入数据模板
	 */
	downloadTemplateButtonClick:function(){
		var me=this;
	    var url=me.getUrl()+"/"+me.genTemplateMehod;
	    var grid=me.getGrid();
	    var columns=grid.columns;	   
	    var data={};

	    for(var i=0;i<columns.length;i++){
	        var column=columns[i];
	        var text=column.text;
	        var dataIndex=column.dataIndex;
	        if(null!=text && null!=dataIndex && text !="" && dataIndex !=""){
	        	data[dataIndex]=text;	            
	        }
	    }	   
	    Ext.Ajax.request({
            url: url,
            params:data,
            success: function(response){
                var text = response.responseText;
                var result=Ext.decode(text);
               	Ext.example.msg('温馨提醒',result.msg);
                window.open(appPath+"/sys/SkyDrivePublics/download?fileName="+result.result);
               //	wait.close();
            },
            failure:function(){
               Ext.example.msg('温馨提醒',"下载失败!");
              // wait.close();
            }
         });
	},
   	
   	
   	
   	
   	/*constructor:function(config){
   		var me=this;
   		config=Ext.apply({
   			layout : 'border',
   			border : false,
   			items:this.getItems(config)
   		},config);
   		me.callParent([config]);
   		//CRUDPanel.superclass.constructor.call(this,config);
   	},*/
   	getRowBodyTpl:Ext.emptyFn,
   	
   	
   	
   	/**
   	 * 返回搜索Panel
   	 * @return {}
   	 */
   	getSearchPanel : function(){
   		var me=this;		
   		var p = me.ownerCt.getActiveTab().down("SearchPanel");
   		return (!Ext.isEmpty(p) && p.getXType() === 'SearchPanel') ? p : null;
   	},
   	getGrid : function(){		
   		var p = this.ownerCt.getActiveTab().down("CenterGrid");
   		return (!Ext.isEmpty(p)) ? p : null;
   	},
   	
   	
   	/**
   	 * 是否可收缩Panel
   	 * @return {Boolean}
   	 */
   	getSearchCollapsible:function (){
   	
   		return true;
   	},
   	/**
   	 * 搜索Panel标题
   	 * @return {}
   	 */
   	getSearchTitle : function(){
   		return this.searchPanelTitle;
   	},
   	getGridTitle : function(){
   		return this.gridPanelTitle;
   	},
   	//Grid相关处理函数
   	/**
   	 * 增删改工具条
   	 */
   	getToolbar : function(){
   		var me=this;
        var tbar = [];
        if(me.addButtonDisplay){
            tbar.push(this.getAddButton());
        }
        if(me.editButtonDisplay){
            tbar.push(this.getEditButton());
        }
        if(me.deleteButtonDisplay){
            tbar.push(this.getDeleteButton());
        }
        if(me.importButtonDisplay){
            tbar.push(this.getImportButton());
        }
        if(me.exportButtonDisplay){
            tbar.push(this.getExportButton());
        }
        if(me.downloadTemplateButtonDisplay){
            tbar.push(this.getDownloadTemplateButton());
        }
   		//添加分隔符
   		var _tbar = [];
   		for(var i=0, len=tbar.length; i<len; i++){
   			_tbar.push(tbar[i]);
   			if(i<tbar.length-1)
   				_tbar.push('-');
   		}
   		 
   		return _tbar.length==0 ? null : _tbar;
   	},
   	
   	/**
   	 * store数据
   	 */
   	getGridStore : function(){
   		var me=this;
   		var GridStore=Ext.create('Ext.data.Store',{
   				//storeId:me.storeid,
   				pageSize:me.pagesize,
   				model : me.getStoreModel(),	
   				//fields:me.getFields(),
   				//autoLoad:true,
   				remoteSort: true,
   				proxy : {
	   				type : 'ajax',
	   				url : me.getUrl()+"/search",
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
   		GridStore.on({
   			load:function(store,records,successful,eOpts){
   				var grid=me.getGrid();
   				/*var rowExpander=me.getRowExpander();
   				//var rowEditing=grid.getPlugin("rowexpander");
   				rowExpander.rowCollapsedCls="x-grid-row-collapsed"
   				//rowEditing.disable();
   				
*/   			grid.getSelectionModel().deselectAll();
				//grid.collapse();
   			}
   		});
   		return GridStore;
   	},
   	
   	getGridSm : function(){
   		
   		if(Ext.isEmpty(this.gridSm)){
   			this.gridSm = Ext.create('Ext.selection.CheckboxModel');
   		}
   		return this.gridSm;				
   	},
   	
   	getCURecord : function(){
   		return this.CURecord;
   	},
   	
   	setCURecord : function(record){
   		this.CURecord = record;
   	}
			
});
/**
 * 修复保存按钮不可以问题
 */
Ext.override(Ext.grid.RowEditor, {  
    addFieldsForColumn: function(column, initial) {  
        var me = this,  
        i, length, field;  
        if (Ext.isArray(column)) {  
            for (i = 0, length = column.length; i < length; i++) {  
                me.addFieldsForColumn(column[i], initial);  
            }  
            return;  
        }  
        if (column.getEditor) {  
            field = column.getEditor(null, {  
                xtype: 'displayfield',  
                getModelData: function() {  
                    return null;  
                }  
            });  
            if (column.align === 'right') {  
                field.fieldStyle = 'text-align:right';  
            }  
            if (column.xtype === 'actioncolumn') {  
                field.fieldCls += ' ' + Ext.baseCSSPrefix + 'form-action-col-field';  
            }  
            if (me.isVisible() && me.context) {  
                if (field.is('displayfield')) {  
                    me.renderColumnData(field, me.context.record, column);  
                } else {  
                    field.suspendEvents();  
                    field.setValue(me.context.record.get(column.dataIndex));  
                    field.resumeEvents();  
                }  
            }  
            if (column.hidden) {  
                me.onColumnHide(column);  
            } else if (column.rendered && !initial) {  
                me.onColumnShow(column);  
            }  
  
            // -- start edit  
            me.mon(field, 'change', me.onFieldChange, me);  
            // -- end edit  
        }  
    }  
});  