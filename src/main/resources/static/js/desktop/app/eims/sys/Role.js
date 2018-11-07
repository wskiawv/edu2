Ext.define('desktop.app.eims.sys.Role',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.Role',
	moduleName:"sys",//请求模块名称
	controllersName:"Roles",//请求控制器名称
	
	roleId:null,
	getStoreModel : function(){
		return 'desktop.app.eims.sys.model.Role';
	},
	getSearchFieldHeight : function(){
		return 120;
	},
	getSearchFields : function(){
		return[		
		{
	        fieldLabel: '角色名称',
	        name: 'filter_LIKE_name',	       
	        anchor:'100%'  
	    },
	    {
            fieldLabel: '角色代码',
            name: 'filter_LIKE_code',
            anchor:'100%'
        },
		{
	        fieldLabel: '创建时间',
	        name: 'filter_LIKE_create_date',
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '更新时间',
	        name: 'filter_LIKE_update_date',
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '角色类型',
	        name: 'filter_LIKE_role_type',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '状态',
	        name: 'filter_LIKE_status',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '备注',
	        name: 'filter_LIKE_remark',	       
	        anchor:'100%'  
	    }
	    ]
	},	
	getGridColumns:function(){
	    var me=this;
		var columns = [Ext.create('Ext.grid.RowNumberer'),				
			{
				text:'角色名称',
			    dataIndex:'name',
			    width:100,
				sortable:true	
			},
			{
                text:'角色代码',
                dataIndex:'code',
                width:100,
                sortable:true
            },
			{
				text:'创建时间',
			    dataIndex:'create_date',
			    width:150,
				sortable:true	
			},		
			{
				text:'更新时间',
			    dataIndex:'update_date',
			    width:150,
				sortable:true	
			},		
			{
				text:'角色类型',
			    dataIndex:'role_type',
			    width:100,
				sortable:true	
			},		
			{
				text:'状态',
			    dataIndex:'status',
			    width:100,
			    renderer:function(value){
			        if(value==1){
			            return '<span style="color:green;">' + "启用" + '</span>';
			        }else{
			             return '<span style="color:red;">' + "禁用" + '</span>';
			        }
			    },
				sortable:true	
			},		
			{
				text:'备注',
			    dataIndex:'remark',
			    width:100,
				sortable:true	
			},{
                text: '分配权限',
                width: 120,
                menuDisabled: true,
                xtype: 'actioncolumn',
                tooltip: '分配权限',
                align: 'center',
                iconCls:'settings',
                handler: function(grid, rowIndex, colIndex, actionItem, event, record, row) {
                  //Ext.Msg.alert("你选择了", record.get("name"));
                  me.getRolePermissions(record.get("id"));
             }
          }

		];
		return columns;
	},
	getRolePermissions:function(id){
	        var me=this;
	        me.roleId=id;
            var url=appPath+"/sys/Roles/getRolePermissions?id="+id;
            var rootData=null;
            var i=0;
            /*Ext.Ajax.request({
                url: url,
                method:"GET",
                params: {
                    id: id
                },
                success: function(response){
                    var text = response.responseText;
                    var jsonObject=Ext.decode(text);
                    rootData=jsonObject.result;
                    data=Ext.encode(rootData);
                   // me.showWindow(jsonObject);
                    // process server response here
                }
            });*/
            var store=Ext.create("Ext.data.TreeStore",{
                 model:desktop.app.eims.sys.model.RoleTreeModel,
                 autoLoad : false,
                 autoSync : false,
                 defaultRootText:'功能列表',
                 proxy: {
                     type: 'ajax',
                     url:url,
                     reader : {
                                type : 'json'
                               // totalProperty : 'totalCount',
                               // root : 'result'
                            },
                     simpleSortMode : true
                 },
                 folderSort: true,
                 sorters : [{
                    property : 'id',
                    direction : 'DESC'
                }],
                listeners:{
             	   beforeload:function(){
             		   if(i==0){
             			   i++;
             			   return true;
             		   }
             		   return false;
             	   },
             	  load:function(){
             		  
             	  }
                }
            });
           // store.load();

            var treeGridPanel=Ext.create("Ext.tree.Panel",{
                 store:store,
                 region:'center',
                 rootVisible:false,
                 multiSelect: true,
                 useArrows: true,
                 singleExpand: true,
                // selType: 'checkboxmodel',
                 columns:[{
                    xtype: 'treecolumn', //this is so we know which column will show the tree
                    text: '功能列表',                   
                    flex: 2,
                    sortable: true,
                    dataIndex: 'text'
                 },{
                    text:'模块名称',
                    flex: 1,
                    dataIndex: 'modulesName',
                    sortable: true
                 },{
                     text:'方法名称',
                     flex: 1,
                     dataIndex: 'methodName',
                     sortable: true
                  },{
                      text:'url',
                      flex: 1,
                      dataIndex: 'url',
                      sortable: true
                  }],
                  listeners:{
                	  checkchange:function(node,checked,opts){
                		  if(checked){                			
                			  me.nodeCheck(node,checked);                			
                		  }else{                			  
                			  me.nodeCheck(node,checked);    
                		  }
                	  }
                  }

            });
            var window=Ext.create("Ext.window.Window",{
                title:"角色权限",
                layout:'border',
                animCollapse : false,
               // constrainHeader : true,
                closeAction:'hide',
                maximizable:true,
                minimizable:true,
                width:800,
                height:600,
                tbar:[{
                	xtype:'SelectButton',
                	handler:function(btn){
                		me.selectAllNode(treeGridPanel);
                	}
                },{
                	xtype:'CancelSelectButton',
                	handler:function(btn){
                		me.cancelAllNodeCheck(treeGridPanel);
                	}
                },{
                	xtype:'ReverseSelectButton',
                	handler:function(btn){
                		me.ReverseSelectNodeClick(treeGridPanel);
                	}
                }],
                items:[treeGridPanel],
                buttons:[{
                    xtype:'SaveButton',
                    handler:function(){
                    	me.saveRolePermissions(treeGridPanel);
                    }
                },{
                    xtype:'CancelButton',
                    scope:me,
                    handler:function(btn){
                    	me.CancelClick(btn);
                    }
                    	
                },{
                    xtype:'ResetButton',
                    handler:function(){
                    	me.resetClick(treeGridPanel);
                    }
                }],
                listeners:{
                    beforerender:function(win){
                        store.load();
                        //treeGridPanel.expandAll();
                    },
                    afterrender:function(){
                        //store.load();
                    }
                }
            });
            window.show();
            return window;
	},
	selectAllNode:function(tree){
		var me=this;
		var rootNode=tree.getRootNode();
		me.nodeCheck(rootNode,true);
	},
	cancelAllNodeCheck:function(tree){
		var me=this;
		var rootNode=tree.getRootNode();
		me.nodeCheck(rootNode,false);
	},
	ReverseSelectNodeClick:function(tree){
		var me=this;
		var rootNode=tree.getRootNode();
		rootNode.eachChild(function (child){ 
			if(child.checked){
				me.nodeCheck(child,child.checked);
				var parentNode=child.parentNode;
				if(parentNode.checked){
					me.parentNodeCheck(parentNode,parentNode.checked);
				}else{
					me.parentNodeCheck(parentNode,parentNode.checked);
				}
				
			}else{
				me.nodeCheck(child,child.checked);
				var parentNode=child.parentNode;
				if(parentNode.checked){
					me.parentNodeCheck(parentNode,parentNode.checked);
				}else{
					me.parentNodeCheck(parentNode,parentNode.checked);
				}
			}			
		});
	},
	/**
	 * 保存角色权限
	 */
	saveRolePermissions:function(tree){
		var me=this;
		var nodes=tree.getChecked();
		var data=[];
		Ext.Array.each(nodes, function(n){
			var roleResources={roleId:me.roleId,resourcesId:n.get('id')};
			data.push(roleResources);
        });
		if(data.length<=0){
			Ext.Msg.alert("温馨提示","请选择功能！");
			return;
		}else{
			var url=appPath+"/sys/RoleResourceses/batchSave";
            var rootData=null;
            var i=0;
            Ext.Ajax.request({
                url: url,
                method:"POST",
               // params:data,
                jsonData:data,
                success: function(response){
                    var text = response.responseText;
                    var jsonObject=Ext.decode(text);
                    Ext.Msg.alert(jsonObject.title,jsonObject.msg);
                    
                    
                  
                }
            });
		}
		
		
	},
	/**
	 * 关闭角色权限分配窗口win
	 */
	CancelClick:function(btn){
		var me=this;
		var win=btn.ownerCt.ownerCt;
		win.close();
		
	},
	/**
	 * 重置取消所有节点选中状态
	 */
	resetClick:function(tree){
		var me=this;
		var nodes=tree.getChecked();//获取所有选中节点
		for(var i=0;nodes.length;i++){
			var n=nodes[i];
			me.nodeCheck(n,false);
		}
	},
	/**
	 * 设置节点选中或取消状态
	 */
	nodeCheck:function(node,checked){
		var me=this;
		node.eachChild(function(n){
			  if(n.isLeaf()){
				  n.set('checked', checked);
				 // var p=n.get('parentNode');
				 // me.parentNodeCheck(p,checked);
			  }else{
				  n.set('checked', checked);
				  me.nodeCheck(n,checked);
			  }
			
		});
	},
	parentNodeCheck:function(node,checked){
		var me=this;
		node.set('checked', checked);
		var n=node.parentNode;
		if(n!=null){
			me.parentNodeCheck(n,checked);
		}
		
	},
    showWindow:function(rootData){
        var store=Ext.create("Ext.data.TreeStore",{
            model:desktop.app.eims.sys.model.RoleTreeModel,
            proxy: {
                type: 'ajax',
                url: rootData
            },
            folderSort: true
        });
        var treeGridPanel=Ext.create("Ext.tree.Panel",{
             store:store,
             region:'center',
             columns:[{
                xtype: 'treecolumn', //this is so we know which column will show the tree
                text: '功能列表',
                flex: 2,
                sortable: true,
                dataIndex: 'text'
             },{
                  text:'功能名称',
                  flex: 1,
                  dataIndex: 'text',
                  sortable: true
               },{
                text:'模块名称',
                flex: 1,
                dataIndex: 'modulesName',
                sortable: true
             },{
                  text:'url',
                  flex: 1,
                  dataIndex: 'url',
                  sortable: true
              }]

        });
        var window=Ext.create("Ext.window.Window",{
            title:"角色权限",
            layout:'border',
            animCollapse : false,
           // constrainHeader : true,
            closeAction:'hide',
            maximizable:true,
            minimizable:true,
            width:800,
            height:600,
            items:[treeGridPanel],
            buttons:[{
                xtype:'SaveButton'
            },{
                xtype:'CancelButton'
            },{
                xtype:'ResetButton'
            }],
            listeners:{
                beforerender:function(win){
                    store.load();

                },
                afterrender:function(){
                    //store.load();
                    treeGridPanel.expandAll();
                }
            }
        });
        window.show();

    },
	getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'id'
		    },		   
		    {
		        fieldLabel: '角色名称',
		        name: 'name',
		        allowBlank:false,
		        emptyText:'name',
		        msgTarget:'name',
		        anchor:'100%'  
		    },
		    {
                fieldLabel: '角色代码',
                name: 'code',
                allowBlank:false,
                emptyText:'code',
                msgTarget:'code',
                anchor:'100%'
            },
		    {
		        fieldLabel: '创建时间',
		        name: 'create_date',
		        allowBlank:false,
		        emptyText:'create_datet',
		        msgTarget:'create_date',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '更新时间',
		        name: 'update_datetime',
		        allowBlank:false,
		        emptyText:'update_date',
		        msgTarget:'update_date',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '角色类型',
		        name: 'role_type',
		        allowBlank:false,
		        emptyText:'role_type',
		        msgTarget:'role_type',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '状态',
		        name: 'status',
		        allowBlank:false,
		        emptyText:'status',
		        msgTarget:'status',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '备注',
		        name: 'remark',
		        allowBlank:false,
		        emptyText:'remark',
		        msgTarget:'remark',
		        anchor:'100%'  
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                         
                '<p><b>角色名称:</b> {name}</p><br>',
                '<p><b>角色代码:</b> {code}</p><br>',
                '<p><b>创建时间:</b> {create_date}</p><br>',
                '<p><b>更新时间:</b> {update_date}</p><br>',
                '<p><b>角色类型:</b> {role_type}</p><br>',              
                '<p><b>状态:</b> {status}</p><br>',              
                '<p><b>备注:</b> {remark}</p><br>'             
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.sys.model.Role',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'int'},	   
	        {name:'name',type: 'string'},
	        {name:'code',type: 'string'},
	        {name:'create_date',type: 'string'},
	        {name:'update_date',type: 'string'},
	        {name:'role_type',type: 'string'},	   
	        {name:'status',type: 'string'},	   
	        {name:'remark',type: 'string'}	   
	       ]
});
Ext.define('desktop.app.eims.sys.model.RoleTreeModel', {
        extend: 'Ext.data.Model',
        fields: [
            {name:'id',type:'int'},
            {name: 'text',type: 'string'},
            {name: 'leaf',type: 'boolean'},
            {name: 'iconCls',type: 'string'},
            {name: 'roleId',type: 'int'},
            {name: 'checked',type: 'boolean'},
            {name: 'expanded',type: 'boolean'},
            {name: 'qtip',type: 'string'},
            {name: 'xtype',type: 'string'},
            {name: 'url',type: 'string'},
            {name: 'modules',type: 'string'},
            {name: 'modulesName',type: 'string'},
            {name: 'method',type: 'string'},
            {name: 'methodName',type: 'string'}
        ]
});