Ext.define('desktop.app.comm.WestPanel',{
	extend:'Ext.panel.Panel',
	alias:['widget.WestPanel'],
	requires:[
	'Ext.panel.Panel',
	'Ext.tree.Panel',
	'Ext.data.TreeStore'],
	
	
	//eimsMenuData:null,//菜单数据
	initComponent : function(config){
		var me=this;
			//me.getData();
		//var menus=me.getMenus(eimsMenuData);
		var menusItems = [];
		var menus=me.menus;
		if(menus) {
			for(var i = 0; i < menus.length; i++) {
				menusItems.push({
					xtype : 'treepanel',
					iconCls : 'x-tree-icon x-tree-icon-parent',
					rootVisible : false,
					title : menus[i]["text"],
					store : Ext.create('Ext.data.TreeStore', {
						root: menus[i]
					}),
					listeners:{
						itemclick:function(treepanel, record, item, index, e, opts){
							if(record.get('leaf')){
								var viewType=record.raw['xtype'];
								//var tabpanel=Ext.getCmp("mainTab");
								var tabpanel=me.getTabPanel();
								/**
				            	 * 如果没有此视图, 创建视图.
				            	 */
				            	if (!tabpanel.down(viewType)) {
				                    var panel = [];
				                    panel.push({
				                    	xtype:viewType,
				                    	title: record.get('text'),
				                    	iconCls: "icon-tab",
				                    	layout:'border',
				                    	closable : true,
				                    	frame:false,				      
				                    });				                    
				                    tabpanel.add(panel);
				                    var p=tabpanel.down(viewType);
				                    tabpanel.setActiveTab(p);				                   
				            	}
				            	/**
				            	 * 如果有此视图, 刷新视图.
				            	 */
				            	else {
				            		var panel = tabpanel.down(viewType);
				                    tabpanel.setActiveTab(panel);
				                    panel.doLayout();
				            	}
							}
						}
					}
				});
			}
		}
		Ext.apply(this,{
			region : 'west',
			title : '菜单',			
			width:200,
			collapsible : true,
			//xtype:'panel',
			/*split : true,
			width : 200,
			minWidth : 175,
			maxWidth : 400,
			collapsible : true,
			animCollapse : false,
			margins : '0 0 0 5',*/
			layout : 'accordion',
			border : true,
			items :menusItems
		});
		/**
		 * 注册侦听事件
		 */
		me.on({			
			//'beforerender':me.getMenus(),//组件渲染之前加载菜单数据
			//'add':me.getData()
			
		});
		me.callParent();
		
	},
	getTabPanel:function(){
		var me=this;
		var tabpanel=me.ownerCt.down('CenterTabPanel');
		return tabpanel;
	},
	
	
});