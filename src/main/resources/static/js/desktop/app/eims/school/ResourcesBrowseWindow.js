Ext.define('desktop.app.eims.school.ResourcesBrowseWindow', {
	extend : 'Ext.window.Window',
	alias:'widget.ResourcesBrowseWindow',
	title:'资源浏览',	
	textField:null,//传递点击输入框
	rootDir:hdfsUrl+"/"+userId,
	dir:"",
	initComponent : function(){
		var me = this;
		var textField=me.textField;
		var store=Ext.create('Ext.data.JsonStore',{
			model:'desktop.app.eims.school.model.ResourcesBrowseWindow',
			autoLoad : false,
			proxy : {
				type : 'ajax',
				url : 'sys/SkyDrivePersonals/search',
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
		var grid=Ext.create('Ext.grid.Panel',{
			store:store,
			region:'center',
			autoExpandColumn : 'UploadUser',
			tbar:[{
				text:'主目录',
				iconCls:'main',
				scope:this,
				handler:function(){
					var store=grid.getStore();
					var records=grid.getSelectionModel().getSelection();
					me.blackMainDir(records,store);
				}
			},{
				text:'上一级目录',
				iconCls:'black',
				scope:this,
				handler:function(){
					var store=grid.getStore();
					var records=grid.getSelectionModel().getSelection();
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
					var records=grid.getSelectionModel().getSelection();
					me.remove(records);
				}
			},{
				text:'在线预览',
				iconCls:'add',
				scope:this,
				handler:function(){
					var records=grid.getSelectionModel().getSelection();
					var store=grid.getStore();
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
	         		var records=grid.getSelectionModel().getSelection();
	         		me.download(records);			         		
	         	}
			}],
			selModel: Ext.create('Ext.selection.CheckboxModel'),
			columns : [{
						xtype: 'rownumberer'							
					},{
		            	
		            	width:30,		            	
		            	sortable : true,
		            	dataIndex : 'FileType',		            	
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
				itemdblclick:function(grid,record,item,index,e){
					var records=grid.getSelectionModel().getSelection();
					var store=grid.getStore();
					me.setPath(records,store);
				},
				afterrender:function(grid){
					var store=grid.getStore();
					store.load();
				}
			}
		});
		Ext.apply(me,{
			title:me.title,
			animCollapse : false,
			constrainHeader : true,
			width : 740,
			height : 480,
			iconCls : 'video',
			layout:'border',
			items:[grid]
		});
		me.callParent();
		
	},
	getTextField:function(){
		var me=this;
		return me.textField;
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
	setPath:function(records,store){
		var me=this;
		var len=records.length;
		if(len==0)
 		{
 			Ext.Msg.alert('温馨提醒','你没有选择记录！');
 			Ext.example.msg('温馨提醒',"你没有选择记录");
 			return;
 		}else if(len>1){
 			Ext.example.msg('温馨提醒',"一次只能选择单个文件！");
 			return;
 		}
		var record=records[0];
		var filextype=record.get("FileType").toLocaleLowerCase();
		var filename=record.get("FileName");
		if(filextype=="文件夹"){
 			this.dir=this.dir+"/"+filename;
 			var params={path:"/"+userId+this.dir};
 			Ext.apply(store.proxy.extraParams,params);
 			store.load();
 		}else{
 			var textField=me.getTextField();
 			textField.setValue(record.get("FilePath"));
 			me.close();
 		}
	}
	
	
});
Ext.define('desktop.app.eims.school.model.ResourcesBrowseWindow',{
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