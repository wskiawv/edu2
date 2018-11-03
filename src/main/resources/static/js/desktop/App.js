/*!
 * Ext JS Library 4.2
 * Copyright(c) 2006-2011 Sencha Inc.
 * licensing@sencha.com
 * http://www.sencha.com/license
 */

Ext.define('App', {
    extend: 'Ext.ux.desktop.App',

    requires: [
        'Ext.window.MessageBox',        
        'Ext.ux.desktop.ShortcutModel',
        'SystemStatus',
        'VideoWindow',
        'SWFVideo',
        'AudioWindow',
        'GridWindow',
        'TabWindow',
        'AccordionWindow',
        'Notepad',
        'BogusMenuModule',
        'BogusModule',
        //'Blockalanche',
        'Settings',
		'desktop.app.eims.Eims',

    ],

    init: function() {
        // custom logic before getXYZ methods get called...
		
        this.callParent();
       // this.desktop.initShortcut();

        // now ready...
    },

    getModules : function(){
        return [
            new desktop.app.eims.Eims()

            
        ];
    },
    /**
     * 桌面图标、右键菜单、背景配置
     */
    getDesktopConfig: function () {
        var me = this, ret = me.callParent();

        return Ext.apply(ret, {
            //cls: 'ux-desktop-black',
        	//右键菜单
            contextMenuItems: [            	
                { text: '系统设置', handler: me.onSettings, scope: me }
                          
                
            ],
            //桌面图标store
            shortcuts: Ext.create('Ext.data.Store', {
                model: 'Ext.ux.desktop.ShortcutModel',
                data: this.getDesktopIocn()
            }),

            wallpaper: 'js/desktop/wallpapers/Blue-Sencha.jpg',
            wallpaperStretch: false
        });
    },    
    
    /**
     * 桌面图标配置数据
     */
	getDesktopIocn : function (){
		var data=[
                    { name: '教务系统', iconCls: 'grid-shortcut', module: 'eims' }
                ];
		return data;
	},
    // config for the start menu开始菜单配置
    getStartConfig : function() {
        var me = this, ret = me.callParent();

        return Ext.apply(ret, {
            title: '管理员',
            iconCls: 'user',
            height: 300,
            toolConfig: {
                width: 100,
                items: [
                    {
                        text:'设置',
                        iconCls:'settings',
                        handler: me.onSettings,
                        scope: me
                    },
                    '-',
                    {
                        text:'注销',
                        iconCls:'logout',
                        handler: me.onLogout,
                        scope: me
                    },
                    '-',
                    {
                        text:'重置系统菜单',
                        tooltip:'重置系统菜单',
                        iconCls:'settings',
                        handler: me.reSetSys,
                        scope: me
                    }
                ]
            }
        });
    },

    getTaskbarConfig: function () {
        var ret = this.callParent();

        return Ext.apply(ret, {
            quickStart: this.getQuickStartIocn(),
            trayItems: [
                { xtype: 'trayclock', flex: 1 }
            ]
        });
    },
    /**
     * 任务栏图标
     */
	getQuickStartIocn : function(){
		var data=[
                { name: '教务管理系统', iconCls: 'icon-grid', module: 'eims' },
            ];
         return data;
	},
	/**
	 * 退出系统
	 */
    onLogout: function () {
        Ext.Msg.confirm('温馨提示', '你确定退出系统?',function(btn){
        	if(btn=="yes"){        		
        		
        		Ext.Ajax.request({
        			url: appPath+'/sys/Users/onLogout',
        			success: function(response){
		                var text = response.responseText;
		                var result=Ext.decode(text);
		                if(result.success){
		               		Ext.example.msg("温馨提示","注销成功！");
		               		window.location.href=appPath+"/login.jsp";
		                }else{
		                	Ext.example.msg("温馨提示","注销失败!");
		                }
		              
		            },
		            failure:function(){
		               Ext.example.msg('温馨提醒',"注销失败!");
		              
		            }
        		});
        	}
        });
    },
    /**
     * 系统设置
     */
    onSettings: function () {
        var dlg = new Settings({
            desktop: this.desktop
        });
        dlg.show();
    },
    /**
     * 初始化系统菜单
     */
    reSetSys:function(){
    	Ext.Msg.confirm('温馨提示', '你确定重新初始化系统数据?',function(btn){
        	if(btn=="yes"){
        		Ext.Ajax.request({
        			method:'POST',
        			timeout:300000,
        			url: appPath+'/init',
        			params: {
        		        id: 1
        		    },
        			success:function(response){
        				var text = response.responseText;
		                var result=Ext.decode(text);
        				if(result.success==true){
        					Ext.Msg.alert(result.title,result.content);
        				}else{
        					Ext.Msg.alert(result.title,result.content);
        				}
        			}
        		});
        	}
        });
    }
});
