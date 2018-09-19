Ext.define('desktop.app.comm.CenterTabPanel',{
	extend:'Ext.tab.Panel',
	alias:['widget.CenterTabPanel'],
	requires:[
	          'Ext.tab.Panel',
	          'Ext.ux.TabCloseMenu'
	],	
	
	
	initComponent : function(){
		var me=this;
		var items=me.items;
		Ext.apply(this,{			
			region:'center',
			renderTo: document.body,
			/*plugins: Ext.create('Ext.ux.TabCloseMenu',{
				closeAllTabsText:'关闭所有窗口',
				closeOthersTabsText:'关闭其他窗口',
				closeTabText:'关闭窗口'
			}),*/
			layout:'fit',
			items:items||[{
				title:'首页'
			}],
			plugins: Ext.create('Ext.ux.TabCloseMenu', {
				closeAllTabsText:'关闭所有窗口',
				closeOthersTabsText:'关闭其他窗口',
				closeTabText:'关闭窗口',
	            extraItemsTail: [
	                '-',
	                {
	                    text: '显示或隐藏关闭标签',
	                    checked: true,
	                    name:'Closable',
	                    hideOnClick: true,
	                    handler: function (item) {
	                        currentItem.tab.setClosable(item.checked);
	                    }
	                },
	                '-',
	                {
	                    text: '启用或禁用面板',
	                    checked: true,
	                    name:'Enabled',
	                    hideOnClick: true,
	                    handler: function(item) {
	                        currentItem.tab.setDisabled(!item.checked);
	                    }
	                }
	            ],
	            listeners: {
	                beforemenu: function (menu, item) {
	                    var enabled = menu.child('[name="Enabled"]'); 
	                    menu.child('[name="Closable"]').setChecked(item.closable);
	                    if (item.tab.active) {
	                        enabled.disable();
	                    } else {
	                        enabled.enable();
	                        enabled.setChecked(!item.tab.isDisabled());
	                    }

	                    currentItem = item;
	                }
	            }
	        })
		});
		this.callParent(arguments);
	}
	
});
