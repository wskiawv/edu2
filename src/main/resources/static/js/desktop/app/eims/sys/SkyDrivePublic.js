/**
 * 公共网盘
 * @class Desktop.
 */
Ext.define('desktop.app.eims.sys.SkyDrivePublic', {
	extend : 'Ext.ux.desktop.Module',

	requires : [
	            'Ext.form.*', 
	            'Ext.form.field.*', 
	            'Ext.tree.*', 
	            'Ext.data.*',
	            'Ext.data.reader.*',
	            'Ext.grid.*', 
	            'Ext.window.MessageBox',
	            'Ext.toolbar.Paging',	            
	            'Ext.util.*',
	            'Ext.state.*'
	           
	],
	id : 'SkyDrivePublic',
	windowId : 'SkyDrivePublic',
	title:'公共网盘',
	tipWidth : 160,
	tipHeight : 96,
	rootDir:Boolean(localFlag)?localPath:hdfsUrl,
	dir:"",
	init : function() {
		var me=this;
		this.launcher = {
			text : me.title,
			iconCls : 'notepad',
			handler : this.createWindow,
			scope : this
		}
	},

	createWindow : function() {
		var me = this, desktop = me.app.getDesktop(), win = desktop.getWindow(me.id);

		if (!win) {
			win = desktop.createWindow({
				id : me.id,
				title : '公共网盘',
				/*
				 * maximizable:true, minimizable:true,
				 */
				width : 740,
				height : 480,
				iconCls : 'video',
				animCollapse : false,
				constrainHeader : true,
				border : false,
				layout : 'border',
				items : [{
							region : 'center',
							// title:'资源中心',
							layout : 'border',
							xtype:'tabpanel',
							border : false,
							items : [{
								title:'网盘所有文件',
								xtype:'panel',
								glyph: 72,
								layout:'border',
								items:[me.searchPanel(), {
								region : 'center',
								frame : true,
								layout : 'border',
								items : this.createGridPanel()
							}]
							
							}]
						}]
			})
		}
		if (me.tip) {
			me.tip.setTarget(win.taskButton.el);
		}
		return win;
	},
	searchPanel:function(){
		var searchpanel=Ext.create('Ext.form.Panel',{
			region : 'north',
			title : '搜索',
			height : 100,
			split : true,
			id:'sp',
			collapsible : true,
			frame : true,	
			layout: {
		        type: 'hbox',
		        align: 'left'
		    },
		    fieldDefaults: {
	            labelWidth: 80,
	            labelAlign: 'right'
	        },
			defaultType: 'textfield',
			items:[{											
					name : 'filter_LIKE_FileName',
					fieldLabel:'文件名'						
				},{
					xtype:'datefield',
					name:'filter_LIKE_FileUploadTime',
					fieldLabel:'上传时间',
					format:'Y-m-d',										
					maxValue:new Date()
				},{
					name:'filter_EQ_FileType',
					fieldLabel:'文件扩展名'
				}],			
			buttons:[{
					text : '搜索',
					iconCls:'search',
					handler : function() {						
						var store = Ext.data.StoreManager.lookup('SkyDrivePublicStore');
						store.load();						
						Ext.example.msg('温馨提醒',"数据刷新成功");
					}
						
				}, {
					text : '重置',		
					iconCls:Ext.baseCSSPrefix + 'tbar-loading',
					handler : function() {
						var form = this.up('form').getForm();
						form.reset();
					}
				}]
		});
		return searchpanel;
	},
	createGridStore:function(){
		var store = Ext.create('Ext.data.JsonStore', {
					storeId : 'SkyDrivePublicStore',
					//autoLoad : true,
					pageSize: 20,
					model:'desktop.app.eims.sys.model.SkyDrivePublic',
					//scope:me,
					listeners:{
						//scope:me,
						beforeload:function(s,operation,eOpts){
							//var form = me.searchPanel().getForm(),
							var form=Ext.getCmp('sp').getForm(),
							_params = form.getValues() || {},										
							bsParams = {start: 0, limit: 20},
							params = {};
							
							//grid = me.createGridPanel(),
							var store1 = Ext.data.StoreManager.lookup('SkyDrivePublicStore');
							for(var p in _params){
								if(!Ext.isEmpty(_params[p])){//将没有值的属性排除
									params[p] = _params[p];
									console.log("param p:{0},val:{1}", p, params[p]);
								}			
							}
							Ext.apply(s.proxy.extraParams,bsParams);							
							//Ext.apply(s.proxy.extraParams,params);	
							Ext.apply(s.proxy.extraParams,Ext.getCmp('sp').getForm().getValues());
							
							
						}
					},
					proxy : {
						type : 'ajax',
						url : 'sys/SkyDrivePublics/search',
						reader : {
							type : 'json',
							totalProperty : 'totalCount',
							root : 'result',
							successProperty: 'success'

						},
						simpleSortMode : true
					},
					sorters : [{
								property : 'id',
								direction : 'ASC'
							}]
				});
		return store;
	},
	createGridPanel : function() {
		var me=this;	
		
		var Grid = Ext.create('Ext.grid.Panel', {
					title : '资源中心',
					// frame:true,
					region : 'center',
					autoScroll : true,
					store :me.createGridStore(),// Ext.data.StoreManager.lookup('filestore'),
					autoExpandColumn : 'UploadUser',
					tbar:[{
						text:'主目录',
						iconCls:'main',
						scope:this,
						handler:function(){
							var store=Grid.getStore();
							var records=Grid.getSelectionModel().getSelection();
							me.blackMainDir(records,store);
						}
					},{
						text:'上一级目录',
						iconCls:'black',
						scope:this,
						handler:function(){
							var store=Grid.getStore();
							var records=Grid.getSelectionModel().getSelection();
							me.blackDir(records,store);
						}
					},{
						text:'新建目录',
						iconCls:'new',
						scope:this,
						handler:function(){
							me.mkdir();
						}
					},{
						text:'复制',
						iconCls:'add',
						scope:this,
						handler:function(){
							me.copy();
						}
					},{
						text:'剪切',
						iconCls:'add',
						scope:this,
						handler:function(){
							me.move();
						}
					},{
						text:'粘贴',
						iconCls:'add',
						scope:this,
						handler:function(){
							
						}
					},{
						text:'删除',
						iconCls:'delete',
						scope:this,
						handler:function(){
							var records=Grid.getSelectionModel().getSelection();
							me.remove(records);
						}
					},{
						text:'在线预览',
						iconCls:'add',
						scope:this,
						handler:function(){
							var records=Grid.getSelectionModel().getSelection();
							var store=Grid.getStore();
							me.onLineShow(records,store);			         		
						}
					},{
						text:'批量上传',
						iconCls:'add',
						scope:this,
						handler:function(){
							me.filesUpLoad();
						}
					},{
						text:'上传',
						iconCls:'add',
						scope:this,
						handler:function(){
							me.upload();
						}
					},{
						text:'下载',
						iconCls: 'add',
			         	scope:this,
			         	handler:function(){
			         		var records=Grid.getSelectionModel().getSelection();
			         		me.download(records);			         		
			         	}
					}],
					selModel: Ext.create('Ext.selection.CheckboxModel'),
					columns : [{
								xtype: 'rownumberer'							
							},/* {
				                xtype: 'actioncolumn',
				                width: 25,
				                sortable: false,
				                menuDisabled: true,
				                items: [{
				                    iconCls: 'delete',
				                    tooltip: '图标',
				                    scope: this,
				                    handler: this.onRemoveClick
				                }]
				            }*/{
				            	//xtype: 'actioncolumn',
				            	width:30,
				            	//menuDisabled: true,
				            	//scope:this,
				            	sortable : true,
				            	dataIndex : 'FileType',
				            	//scope:this,
				            	renderer:function(value){
				            		var iconxtype=value.toLocaleLowerCase();
									return Ext.String.format('<img src="js/desktop/images/{0}.gif" class="doc"/>',iconxtype);
				            	}
				            },{
								text : '文件名称',
								dataIndex : 'FileName',
								sortable : true,
								width:200								
							}, {
								text : '文件路径',
								dataIndex : 'FilePath',
								sortable : true,
								width:150,
								flex : 1
							},{
								text : '文件大小',
								dataIndex : 'size',
								sortable : true,
								width:100
							}, {
								text : '文件类型',
								dataIndex : 'FileType',
								sortable : true,
								width:100
							}, {
								text : '上传时间',
								dataIndex : 'updatetime',
								width:150,
								sortable : true
							}, {
								text : '上传用户',
								dataIndex : 'owner',
								sortable : true,
								width:100
							}],
					listeners:{
						scope:me,
						itemdblclick:function(Grid,record,item,index,e){
							var records=Grid.getSelectionModel().getSelection();
							var store=Grid.getStore();
							me.onLineShow(records,store);
						},
						afterrender:function(grid){
							var store=grid.getStore();
							store.load();
						}
					},
					dockedItems : [{
								xtype : 'pagingtoolbar',
								store : Ext.data.StoreManager.lookup('SkyDrivePublicStore'), // same store
								// GridPanel is
								// using
								dock : 'bottom',
								displayInfo : true,
								displayMsg: '当前显示 {0} - {1} 共 {2}',
					            emptyMsg: "没有记录",
					            refreshText:'刷新',
					            prevText:'上一页',
					            nextText:'下一页',
					            firstText:'第一页',
					            afterPageText:'页',
					            beforePageText:'第',
					            lastText:'最后页'
							}]
				});
		return Grid;
	},
	/**
	 * 返回主目录
	 */
	blackMainDir:function(records,store){
		this.dir="";
		params={path:this.rootDir};
		Ext.apply(store.proxy.extraParams,params);
		store.load();		
	},
	blackDir:function(records,store){
		var me=this;
		if(me.dir==""){
			me.blackMainDir(records,store);
		}else{			
				
			var blackdir=me.dir.substring(me.dir.lastIndexOf("/"),0); 
			if(blackdir==""){
				me.blackMainDir(records,store);
			}else{
				me.dir=blackdir;				
				params={path:me.dir};
				Ext.apply(store.proxy.extraParams,params);
				store.load();
			}			
		}
	},
	/**
	 * 创建目录
	 */
	mkdir:function(){		
 		var  me=this,desktop = me.app.getDesktop();
		var swfwindowId="mkdirWindow";
        var  win = desktop.getWindow(swfwindowId); 	               	
       	if(!win){
			win=desktop.createWindow({
				id: swfwindowId,
                 title:"创建目录",
                // modal:true,
                 width: 350,
                 height: 100,
                 iconCls: 'video',
                 animCollapse: false,
                 border: false,
                 layout:'fit',	                 
                 items:[{
                	 xtype:'form',                	
         			 layout: {
         		        type: 'hbox',
         		        align: 'left'
         		     },
         		     fieldDefaults: {
         	            labelWidth: 80,
         	            labelAlign: 'right'
         	         },
         			 defaultType: 'textfield',
         			 items:[{											
         					name : 'path',
         					fieldLabel:'文件夹名称'						
         			 }],			
         			 buttons:[{
         					text : '保存',
         					iconCls:'save',
         					handler : function() {						
         						var form = this.up('form').getForm();
         						if (form.isValid()) {
    								form.submit({										
    									url : 'sys/SkyDrivePublics/mkdir',
    									waitMsg : '创建目录中',
    									success : function(fp, o) {			
    										try {														
    											Ext.example.msg('温馨提醒',o.result.msg);
    											Ext.data.StoreManager.lookup('SkyDrivePublicStore').load();
    											win.close();
    										} catch (e) {
    											if (o.status !== "500") {													
    												Ext.example.msg('温馨提醒',o.result.msg);
    											}																									
    										}											
    									}

    								})
    							}
    						
         					}
         						
         				}, {
         					text : '取消',		
         					iconCls:Ext.baseCSSPrefix + 'tbar-loading',
         					handler : function() {
         						win.close();
         					}
         				}]
                 }]
			});
		}
       	win.show();
	},
	/**
	 * 复制文件及文件夹
	 */
	copy:function(records){
		
	},
	/**
	 * 移动文件及文件夹
	 */
	move:function(records){
		
	},
	/**
	 * 重命名文件及文件夹
	 */
	rename:function(records){
		
	},
	/**
	 * 删除文件及文件夹
	 */
	remove:function(records){
		var i=records.length;	
		if(i==0)
 		{
 			Ext.Msg.alert('温馨提醒','你没有选择记录！');
 			Ext.example.msg('温馨提醒',"你没有选择记录");
 			return;
 		}
		var data=[];
		for(var i=0,len=records.length; i<len; i++){
			data.push(records[i].get("FilePath"));
		}
		Ext.Msg.confirm("温馨提醒","确定删除所选择的数据？",function(btn, text){
			if(btn == 'yes'){
				Ext.Ajax.request({
					url:appPath+"/sys/SkyDrivePublics/remove",
					params:{data:data},
					success:function(response,o){
						var data=Ext.decode(response.responseText);
						Ext.example.msg('温馨提醒',data["msg"]);
						var store=Ext.data.StoreManager.lookup('SkyDrivePublicStore');
						store.load();
					},
					failure:function(response,o){
						var data=Ext.decode(response.responseText);
						Ext.example.msg('温馨提醒',data["msg"]);
					}
				});
			}
		});		
		
	},
	/**
	 * 在线预览
	 */
	onLineShow:function(records,store){
		var i=records.length;	
		var store=store;
		if(i==0)
 		{
 			Ext.Msg.alert('温馨提醒','你没有选择记录！');
 			Ext.example.msg('温馨提醒',"你没有选择记录");
 			return;
 		}else if(i>1){
 			Ext.example.msg('温馨提醒',"一次预览一个文件！");
 			return;
 		}
 		var record=records[0];
 		var ids=[]; 	
 		var filextype=records[0].get("FileType").toLocaleLowerCase();
 		var filename=records[0].get("FileName");
 		var index=records[0].get("FilePath").indexOf(records[0].get("FileType"));
 		var filepath=records[0].get("FilePath").substring(0,index)+"swf";  		
 		if(filextype=="文件夹"){
 			this.dir=this.dir+"/"+filename;
 			var params={path:this.dir};
 			Ext.apply(store.proxy.extraParams,params);
 			store.load();
 		}
 		if(filextype=="jpg"||filextype=="png"||filextype=="gif"||filextype=="doc"||filextype=="docx"||filextype=="ppt"||filextype=="pptx"||filextype=="xls"||filextype=="xlsx"||filextype=="txt"||filextype=="swf"||filextype=="pdf"||filextype=="mp4"||filextype=="mp3"||filextype=="svg")
 		{
 			var  me=this,desktop = me.app.getDesktop();
			var swfwindowId="showswf"+records[0].get("size");
	        var  win = desktop.getWindow(swfwindowId); 	               	
	       	if(!win){
				win=desktop.createWindow({
					id: swfwindowId,
	                 title:filename,
	                // modal:true,
	                 width: 740,
	                 height: 480,
	                 iconCls: 'video',
	                 animCollapse: false,
	                 border: false,
	                 layout:'fit',	                 
	                 items:[/*Ext.create('Ext.ux.IFrame',{
	            	 	 laodMask:"页面加载中",
	            	 	 //src:"show"
	            	  	 src:"filesys/FileSyses/online?id="+records[0].get("id")+"&FilePath="+filepath
	            		 
	            	 })*/]
				});
			}else{
				win.show();
			}
			if(filextype=="jpg"||filextype=="png"||filextype=="gif"||filextype=="svg"){
				Ext.Ajax.request({
					url:appPath+"/sys/SkyDrivePersonals/downloadLocal",
					method:"GET", 
					params:{fileName:records[0].get("FilePath")},
					success:function(response){
						try {														
							var data=Ext.decode(response.responseText);
							Ext.example.msg('温馨提醒',data["msg"]);							
							var Img=Ext.create('Ext.Img',{
					       		src:appPath+"/download/"+filename
					       	});
							win.add(Img);
						} catch (e) {
							if (o.status !== "500") {													
								Ext.example.msg('温馨提醒',data["msg"]);
							}																									
						}							
					}
				});
	       	
			}else if(filextype=="mp4"){
				Ext.Ajax.request({
					url:appPath+"/sys/SkyDrivePublics/downloadLocal",
					method:"GET", 
					params:{fileName:records[0].get("FilePath")},
					success:function(response){
						try {														
							var data=Ext.decode(response.responseText);
							Ext.example.msg('温馨提醒',data["msg"]);							
							var videoplay=Ext.create('Ext.ux.desktop.Video',{
				       			src:[{ src: appPath+"/download/"+filename, type: 'video/mp4' }],
				       			autobuffer: true,
			                	autoplay : true,
			                	controls : true
				       		});
							win.add(videoplay);
						} catch (e) {
							if (o.status !== "500") {													
								Ext.example.msg('温馨提醒',data["msg"]);
							}																									
						}							
					},
					
				});
				
			}else if(filextype=="mp3"){
				Ext.Ajax.request({
					url:appPath+"/sys/SkyDrivePublics/downloadLocal",
					method:"GET", 
					params:{fileName:records[0].get("FilePath")},
					success:function(response){
						try {														
							var data=Ext.decode(response.responseText);
							Ext.example.msg('温馨提醒',data["msg"]);							
							var aduioplay=Ext.create('Ext.ux.desktop.Audio',{
								src:[{ src:appPath+"/download/"+filename, type: 'audio/mp3' }],
				       			autobuffer: true,
			                	autoplay : true,
			                	controls : true
							})
							win.add(aduioplay);
						} catch (e) {
							if (o.status !== "500") {													
								Ext.example.msg('温馨提醒',data["msg"]);
							}																									
						}	
						
					},
					
				});
				
			}else if(filextype=="pdf"){
				Ext.Ajax.request({
					url:appPath+"/sys/SkyDrivePublics/downloadLocal",
					method:"GET", 
					params:{fileName:records[0].get("FilePath")},
					success:function(response){
						try {														
							var data=Ext.decode(response.responseText);
							Ext.example.msg('温馨提醒',data["msg"]);							
							var iframe=Ext.create('Ext.ux.IFrame',{
				        		loadMask:'页面加载中',	        		
				        		//height:470,
				    	 	 	//src:"show"	        	
				    	  	 	src:"pdfShow.jsp?FilePath="+encodeURI(appPath+"/download/"+filename)
				       		});
							win.add(iframe);
						} catch (e) {
							if (o.status !== "500") {													
								Ext.example.msg('温馨提醒',data["msg"]);
							}																									
						}	
						
					},
					
				});
				
			}else{
				var iframe=Ext.create('Ext.ux.IFrame',{
	        		loadMask:'页面加载中',	        		        	
	    	  	 	src:"/sys/SkyDrivePublics/online?id="+records[0].get("id")+"&FilePath="+encodeURI(filepath)
	       		});
				win.add(iframe);			
			}		
			win.show();	
 			
 		}else{
 			Ext.example.msg('温馨提醒',"不支持"+filename+"该文件的预览，请重新选择文件！");
 			return;
 		}
		
	},
	downloadLocal:function(records){
		
	},
	/**
	 * 下载文件
	 */
	download :function(records){
		var i=records.length;			         	
 		var record=records[0];
 		var ids=[];
 		//this.Method='delete';
 		
 		if(i==0)
 		{
 			Ext.Msg.alert('温馨提醒','你没有选择记录！');
 			Ext.example.msg('温馨提醒',"你没有选择记录");
 			return;
 		}else if(i>1){
 			Ext.example.msg('温馨提醒',"一次只能下载一个文件！");
 			return;
 		}
 			
 		ids.push(records[0].get("FilePath"));
 		window.open(appPath+"/sys/SkyDrivePublics/download?fileName="+records[0].get("FilePath"));
 		/*if(loadOrShow){
 			
 		}*/
	},
	filesUpLoad:function(){
		var me=this,desktop = me.app.getDesktop();
		var swfwindowId="filesUpLoad";
        var  win = desktop.getWindow(swfwindowId);
        var uploadButton=Ext.create('Ext.ux.upload.Button', {
    		//renderTo: Ext.getBody(),
    		text: '选择文件',
    		iconCls:'add',
    		//singleFile: true,
    		plugins: [{
                          ptype: 'ux.upload.window',
                          title: '批量上传',
                          width: 520,
                          height: 350
                      }
            ],
    		uploader: 
    		{
    			url: appPath+'/sys/SkyDrivePublics/upload',
    			uploadpath: 'upload',
    			autoStart: false,
    			max_file_size: '2020mb',			
    			drop_element: 'dragload',
    			statusQueuedText: 'Ready to upload',
    			statusUploadingText: '上传中 ({0}%)',
    			statusFailedText: '<span style="color: red">错误</span>',
    			statusDoneText: '<span style="color: green">完成</span>',

    			statusInvalidSizeText: 'File too large',
    			statusInvalidExtensionText: 'Invalid file type'
    		},
    		listeners: 
    		{
    			filesadded: function(uploader, files)								
    			{
    				//console.log('filesadded');
    				return true;
    			},
    			
    			beforeupload: function(uploader, file)								
    			{
    				//console.log('beforeupload');			
    			},

    			fileuploaded: function(uploader, file)								
    			{
    				//console.log('fileuploaded');
    			},
    			
    			uploadcomplete: function(uploader, success, failed)								
    			{
    				var length=success.length;
    				Ext.example.msg('温馨提醒',"你上传的文件总数是:"+length);
    				if(win){
    					win.close();
    				}
    				var store=Ext.data.StoreManager.lookup('SkyDrivePublicStore');
					store.load();    				
    			},
    			scope: this
    		}
    				
    		
    	});
        if(!win){
        	
        	win=desktop.createWindow({
        		id: swfwindowId,
                title:"上传文件",
                width: 740,
                height: 480,
                iconCls: 'video',
                animCollapse: false,
                border: false,
                layout:'border',                
                items:[{
                	xtype:'form',
                	region: 'center',
                	frame:false,
                	html:'<div id="dragload" style="height:auto !important;height:344px;min-height:344px;"><h1>拖动文件到这里或者使用上传按钮选择文件！</h1></div>',
                	buttons:[uploadButton]
                }]                
        	});
        }
        win.show();	
	},
	/**
	 * 上传文件
	 */
	upload:function(){
		var me=this,desktop = me.app.getDesktop();
		var swfwindowId="uploadfile";
        var  win = desktop.getWindow(swfwindowId);
        if(!win){
        	win=desktop.createWindow({
        		id: swfwindowId,
                title:"上传文件",
                width: 740,
                height: 480,
                iconCls: 'video',
                animCollapse: false,
                border: false,
                layout:'fit',
                items:[{
                	xtype:'form',
                	frame:false,
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
					}],
					buttons:[{
						text : '上传',	
						iconCls:'save',
						//scope:me,
						handler : function() {
							var form = this.up('form').getForm();
							var hidden=this.up('form').down('hidden');
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
											Ext.data.StoreManager.lookup('SkyDrivePublicStore').load();
											win.close();
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
						text : '重置',		
						iconCls:Ext.baseCSSPrefix + 'tbar-loading',
						handler : function() {
							var form = this.up('form').getForm();
							form.reset();
						}
					},{
						text : '取消上传',		
						iconCls:'cancel',
						handler : function() {
							var form = this.up('form').getForm();
							form.reset();
							win.close();
						}
					}]
                }]
        	});
        }
        win.show();		
	}
});
/**
 * 数据模型
 */
Ext.define('desktop.app.eims.sys.model.SkyDrivePublic',{
			extend:'Ext.data.Model',
			idProperty: 'FileName',
			fields : [ {
						name : 'FileName',
						type : 'string'
					}, {
						name:'FilePath',
						type: 'string'
					},{
						name : 'size',
						type : 'string'
					}, {
						name : 'FileType',
						type : 'string'
					}, {
						name : 'updatetime',
						type : 'string'
					}, {
						name : 'owner',
						type : 'string'
					}]
			
});