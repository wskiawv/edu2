Ext.define('desktop.app.eims.sys.AssignRole', {
	extend : 'Ext.window.Window',
	alias:'widget.AssignRole',
	title:'分配角色',	
	userId:null,//用户id
	selectRecords:null,
	grid:null,
	initComponent : function(){
		var me = this;
		var userId=me.userId;
		var store=Ext.create('Ext.data.JsonStore',{
			model:'desktop.app.eims.sys.model.Role',
			autoLoad : false,
			proxy : {
				type : 'ajax',
				url : 'sys/Roles/search',
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
			}],
			listeners:{
				scope:me,
				load:function(store){
					var url=appPath+"/sys/UserRoles/getUserRole";
					var id=parseInt(userId);
					Ext.Ajax.request({
						 url: url,
			             method:"POST",
			             params:{id:id}, 	
			             jsonData:{id:id},
			             success: function(response){
			                 var text = response.responseText;
			                 var jsonObject=Ext.decode(text);
			                 var data=jsonObject.result;
			                 if(jsonObject.success){			                	 
			                	 var i=0;
			                	 var len=data!=null?data.length:0;
			                	 var records=[];
			                	 for(var i=0;i<len;i++){
			                		 store.each(function(record){
				                		 if(data[i].roleId==record.get("id")){
				                			 records.push(record);
				                		 }
				                	 });
			                	 }
			                	 me.grid.getSelectionModel().select(records);
			                	
			                 }else{
			                	 //Ext.Msg.alert(jsonObject.title,jsonObject.msg);
			                 }
			                
			                // me.showWindow(jsonObject);
			                 // process server response here
			             }
					});
					
				}
			}
		});
		var bbar=Ext.create('desktop.app.comm.Paging', {
	        store: store,  
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
		});	
		
		var grid=Ext.create('Ext.grid.Panel',{
			store:store,
			region:'center',
			autoExpandColumn : 'UploadUser',
			bbar:bbar,
			tbar:[{
				text:'确定',
				iconCls:'save',
				scope:this,
				handler:function(){
					me.saveUserRole(grid);
				}
			},{
				text:'取消',
				iconCls:'canel',
				scope:this,
				handler:function(){
					//me.copy();
				}
			}],
			selModel: Ext.create('Ext.selection.CheckboxModel'),
			columns : [{
						xtype: 'rownumberer'							
					},{
		            	
		            	width:30,		            	
		            	sortable : true,
		            	dataIndex : 'code',		            	
		            	renderer:function(value){
		            		var iconxtype=value.toLocaleLowerCase();
							return Ext.String.format('<img src="js/desktop/images/{0}.gif" class="doc"/>',"user_green");
		            	}
		            },{
						text : '角色名称',
						dataIndex : 'name',
						sortable : true,
						width:200								
					}],
			listeners:{
				scope:me,
				itemdblclick:function(grid,record,item,index,e){
					/*var records=grid.getSelectionModel().getSelection();
					var store=grid.getStore();
					me.setPath(records,store);*/
				},
				afterrender:function(grid){
					var store=grid.getStore();
					store.load();
				}
			}
		});
		me.grid=grid;
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
	saveUserRole:function(grid){
		var me=this;
		var select = grid.getSelectionModel();
		var store = grid.getStore();
		var records = select.getSelection();
		if(Ext.isEmpty(records) || Ext.isEmpty(store)){
			Ext.example.msg('温馨提醒', "请选择需要数据!");	
			Ext.Msg.alert('温馨提醒',"请选择需要数据!");
			return ;
		}
		var url=appPath+"/sys/UserRoles/batchSave";
		var data=[];
		for(var i=0;i<records.length;i++){
			var id=parseInt(me.userId);
			var userRole={roleId:records[i].get("id"),userId:id};
			data.push(userRole);
		}
		
		Ext.Ajax.request({
			 url: url,
             method:"POST",
             //params:data, 
             jsonData:data,
             success: function(response){
                 var text = response.responseText;
                 var jsonObject=Ext.decode(text);
                 
                 if(jsonObject.success){
                	 Ext.Msg.alert(jsonObject.title,jsonObject.msg);
                 }else{
                	 Ext.Msg.alert(jsonObject.title,jsonObject.msg);
                 }
                
                // me.showWindow(jsonObject);
                 // process server response here
             }
		});
	}
	
	
	
	
});
Ext.define('desktop.app.eims.sys.model.Role',{
	extend:'Ext.data.Model',
	idProperty: 'FileName',
	fields : [ {
				name : 'id',
				type : 'int'
			}, {
				name:'name',
				type: 'string'
			},{
				name : 'code',
				type : 'string'
			}]
	
});