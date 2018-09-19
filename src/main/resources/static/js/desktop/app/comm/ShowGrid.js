Ext.define('desktop.app.comm.ShowGrid',{
	extend:'Ext.grid.Panel',
	alias:['widget.ShowGrid'],
	requires:[
		'Ext.data.Model',        
		'Ext.util.Format', 
		'Ext.selection.CheckboxModel',          
		'Ext.data.JsonStore',
		'Ext.data.*',    
		'Ext.grid.plugin.*',
		'Ext.grid.*',
		'desktop.app.comm.Paging',
		'desktop.app.comm.AddButton',
        'desktop.app.comm.EditButton',
        'desktop.app.comm.DeleteButton',
        'desktop.app.comm.SearchButton',
        'desktop.app.comm.SaveButton',
        'desktop.app.comm.CancelButton',
        'desktop.app.comm.ExportButton',             
        'desktop.app.comm.CommComboBox',
        'Ext.form.Panel'
	],
	viewConfig: {
        stripeRows: true,
        enableTextSelection: true
    },
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
    addButtonDisplay:false,
    editButtonDisplay:false,
    deleteButtonDisplay:false,
    importButtonDisplay:false,
    exportButtonDisplay:true,
    downloadTemplateButtonDisplay:false,
    //子类需要覆盖的方法    
    getGridColumns:Ext.emptyFn,
    getStoreModel:Ext.emptyFn,
    cellClick:Ext.emptyFn,
    getWindowFormItems:Ext.emptyFn,
    moduleName:"",//请求模块名称
	controllersName:"",//请求控制器名称	
	
	searchMethod:"search",//查询请求方法名
	saveMethod:'save',//保存请求方法名
	deleteMethod:'delete',//删除请求方法名
	updateMethod:'update',//更新请求方法名
	showMethod:'show',//查看请求方法名
	exportMethod:'export',//导出请求方法名
	downloadTemplateMethod:'downloadTemplate',//下载模板请求方法名
	genTemplateMehod:'downloadTemplate',//生成模板请求方法名
	importMethod:'import',//导入请求方法名
	pageSize:25,//默认分页大小
	searchPanelTitle:"搜索",
	gridPanelTitle:"数据",
	//editWindowId:null,
	editWindowTitle:'新增',
    getUrl : function(){
		return this.moduleName+"/"+this.controllersName;
	},
	initComponent : function(config){
		var me=this;
		var params=me.params;
		var GridStore=Ext.create('Ext.data.JsonStore',{				
			pageSize:me.pageSize,
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
		me.bbar=Ext.create('desktop.app.comm.Paging', {
		        store: GridStore,  
		        dock : 'bottom',
		        displayInfo : true,
		        displayMsg: '当前显示 {0} - {1} 共 {2}',
		        emptyMsg: "没有记录",
		        refreshText:'刷新',
		        prevText:'上一页',
		        nextText:'下一页',
		        firstText:'第一页',
		        afterPageText:'页共{0}页',
		        beforePageText:'第',
		        lastText:'最后页'          
		});		
		Ext.apply(me,{
			tbar : me.getToolbar(),
        	autoScroll:true,
        	store : GridStore,
        	collapsible : true,
			columns : me.getGridColumns(),
			selType: 'checkboxmodel'
			
        });
		me.on({afterrender:function(grid){
			var store=grid.getStore();
				Ext.apply(store.proxy.extraParams,params);
	            store.load();	            
	    },
	    cellclick:me.cellClick,
	    scope : me
		});
		me.callParent([me]);
	},
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
    	var w=me.createWindow();  
    	//w.taskButton.setText(me.getPanelTitle()+"新增");
    	w.setTitle(me.getPanelTitle()+"新增");
		w.down("form").getForm().reset();			
		me.newOrEdit=true;			
		w.show();
		//var record=Ext.create(me.getStoreModel());
		//this.setCURecord(record);
    },
    
    /**
     * 编辑按钮单击事件处理函数
     */
	editButtonClick : function(){
		var me=this;
		var grid = me;
		var records = grid.getSelectionModel().getSelection();
		//var records = select.getSelection();
		if(Ext.isEmpty(records) || records.length>1){
			Ext.example.msg('温馨提醒', "编辑时只能选择一条记录!");			
			return;
		}  		
		var w = me.createWindow();
		//w.taskButton.setText(me.getPanelTitle()+"编辑");
		w.setTitle(me.getPanelTitle()+"编辑");
		me.newOrEdit=false;
		var formPanel = w.down("form");		 
		this.setCURecord(records[0]);		
		formPanel.loadRecord(records[0]);
		w.show();
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
					if (form.isValid()) {
						form.submit({										
							url : 'sys/SkyDrivePublics/upload',
							waitMsg : '正在上传中...',
							success : function(fp, o) {			
								try {														
									Ext.example.msg('温馨提醒',o.result.msg);
									hidden.setValue(o.result.result);
									textfield.setValue(o.result.result);									
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
	    
	    Ext.Ajax.request({
            url: url,
            params:exportColumns,
            success: function(response){
                var text = response.responseText;
                var result=Ext.decode(text);
               	Ext.example.msg(result.title,result.content);
               	window.open(appPath+"/sys/Files/download?fileName="+result.result);               
            },
            failure:function(){
               Ext.example.msg('温馨提醒',"导出失败!");              
            }
        });
	},
	getCreateWindowFormObject:function(){
		var me=this;
		var form=me.createWindow().down("form");
		return form;
	},
	/**
	 * 保存按钮单击事件
	 */
	saveButtonClick  : function(btn){
		var me=this;
		var url=me.getUrl();
		if(me.newOrEdit){
			url+="/"+me.saveMethod;
		}else{
			url+="/"+me.updateMethod;
		}
		var form=me.getCreateWindowFormObject();
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
						grid.getSelectionModel().deselectAll();	
						store.load();
					me.createWindow().hide();
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
			});
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
			if(btn == 'yes'){
				me.deleteRecord(grid, store, records);
				
			}			
		});
	},
	/**
	 * 新增、编辑窗口重置按钮单击事件
	 */
	resetButtonClick : function(btn){
		var me=this;
		var form=me.createWindow().down("form");
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
			url : me.getUrl()+"/"+me.deleteMethod,
			params : {"id": ids},
			success : function(response){
				 var text = response.responseText;
				  var result=Ext.decode(text);
				  Ext.example.msg('温馨提醒',result.msg);	
				
				grid.getSelectionModel().deselectAll();
				store.load();				
			},
			failure:function(response){
				
				  Ext.example.msg('温馨提醒',"请求失败！");
			}
		});
	},
	
	/**
	 * 搜索按钮单击事件处理函数
	 */
	searchButtonClick : function(){
		var me=this;
		var grid = me.getGrid(),
			store = grid.getStore();			
		store.removeAll();
		store.loadPage(1);	
		
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
	 * 返回搜索Panel
	 * @return {}
	 */
	getSearchPanel : function(){
		var me=this;		
		var s = me.ownerCt.getActiveTab().down("SearchPanel");
		return (!Ext.isEmpty(s) && s.getXType() === 'SearchPanel') ? s : null;
	},
	getGrid : function(){	
		var me=this;
		return me;
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
	getCreateWindowWidth:function(){
		return 740;
	},
	getCreateWindowHeight:function(){
		return 480;
	},
	getCreateWindowFormLayout:function(){
		var layout={
	            type: 'table',
	            columns: 4,
	            defaults: {width: 150},
	        };
		return layout;
	},
	getCreateWindowItem:function(){
		var me=this;
		var item=[{
			xtype:'form',
			autoScroll:true,					
			fieldDefaults: {
		        labelWidth: 120,
		        labelAlign:'right'
		    },		    
		    layout: me.getCreateWindowFormLayout(),
		    defaultType: 'textfield',				    
			items:me.getWindowFormItems()
		}];
		return item;
	},
	getCreateWidnowLayout:function(){
		return 'fit';
	},
	getCreateWindowButtonConfig:function(){
		var me=this;
		var buttons=[me.getSaveButton(),me.getResetButton(),me.getCancelButton()];
		return buttons;
	},
	/**
	 * 创建新增，编辑窗口
	 */
	createWindow : function() {
		var me=this;		
		if(Ext.isEmpty(me.formWindow)){
			me.formWindow=Ext.create("Ext.window.Window",{
				title : me.getPanelTitle()+me.editWindowTitle,	
				closeAction:'hide',
				maximizable:true, 
				minimizable:true,		
				width : me.getCreateWindowWidth(),
				height : me.getCreateWindowHeight(),
				layout:me.getCreateWidnowLayout(),				
				draggable:true,
				modal:true,
				//frame:true,
				//autoScroll:true,
				//modal: true,
				items :me.getCreateWindowItem(),				
				buttons:me.getCreateWindowButtonConfig()
			});
		}
		
		return me.formWindow;
	}
	
});
