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
        'desktop.app.user.User',
		'desktop.app.filesys.FileSys',
		'DouBan',
		'desktop.app.eims.Eims',
		'desktop.app.hec.Hec',
		'desktop.app.hr.Hr'
    ],

    init: function() {
        // custom logic before getXYZ methods get called...
		
        this.callParent();
       // this.desktop.initShortcut();

        // now ready...
    },

    getModules : function(){
        return [
            //new VideoWindow(),
            //new SWFVideo(),
            //new AudioWindow(),
          //  new Blockalanche(),
           // new SystemStatus(),
           // new GridWindow(),
           // new TabWindow(),
           // new AccordionWindow(),
           // new Notepad(),
           // new BogusMenuModule(),
           // new BogusModule(),
          //  new desktop.app.user.User(),
           // new desktop.app.filesys.FileSys(),
            //new desktop.app.eims.Eims(),
            new desktop.app.hec.Hec(),
            new desktop.app.hr.Hr(),
            new DouBan()
            
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
                    /*{ name: 'Grid Window', iconCls: 'grid-shortcut', module: 'grid-win' },  */  
                    //{ name: '视频播放器', iconCls: 'video', module: 'video' },
                   // { name: '音乐播放器', iconCls: 'audio', module: 'audio' },
                   /* { name: '用户管理', iconCls: 'grid-shortcut', module: 'user-grid' },*/
                    { name: '人力资源管理系统', iconCls: 'accordion-shortcut', module: 'hr' },
                    //{ name: 'SWF视频播放器', iconCls: 'video', module: 'swfvideo' },
                   /* { name: '文件管理', iconCls: 'grid-shortcut', module: 'FileSys' },*/
                    { name: '豆瓣电台', iconCls: 'dbfm-shortcut', module: 'douban' },
                  /*  { name: 'Accordion Window', iconCls: 'accordion-shortcut', module: 'acc-win' },                    
                    { name: 'Notepad', iconCls: 'notepad-shortcut', module: 'notepad' },      */          
                    /*{ name: '教务系统', iconCls: 'grid-shortcut', module: 'eims' }, */      
                    { name: '费用控制系统', iconCls: 'grid-shortcut', module: 'hec' }
                   /* { name: 'System Status', iconCls: 'cpu-shortcut', module: 'systemstatus'}*/
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
			/*{ name: 'Accordion Window', iconCls: 'accordion', module: 'acc-win' },*/
            /*{ name: 'Grid Window', iconCls: 'icon-grid', module: 'grid-win' },*/
           /* { name: '用户管理', iconCls: 'icon-grid', module: 'user-grid' },*/
            { name: '人力资源管理系统', iconCls: 'accordion', module: 'hr' },
            /*{ name: '文件管理', iconCls: 'icon-grid', module: 'FileSys' },*/
           /* { name: '教务管理系统', iconCls: 'icon-grid', module: 'eims' },*/
            { name: '费用控制系统', iconCls: 'icon-grid', module: 'hec' }
            
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
        		//window.location.href=appPath+"/teacher/Teachers/onLogout";
        	}
        });
    }
});
