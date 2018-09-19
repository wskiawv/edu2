/*!
 * Ext JS Library 4.0
 * Copyright(c) 2006-2011 Sencha Inc.
 * licensing@sencha.com
 * http://www.sencha.com/license
 */

Ext.define('desktop.app.hr.Hr', {
    extend: 'Ext.ux.desktop.Module',

    requires: [ ],

    id:'hr',
    init : function(){
        this.launcher = {
            text: '人力资源管理系统',
            iconCls:'user'
        }
    },

    createWindow : function(){
    	var me=this;
        var desktop = me.app.getDesktop();
        var win = desktop.getWindow('hr');
        if(!win){
            win = desktop.createWindow({
                id: me.id,
                title:'人力资源管理系统',
                width:900,
                height:560,
               /* width:430,
                height:221,*/
                iconCls: 'notepad',
                animCollapse:false,
                border: false,
                hideMode: 'offsets',
                layout: 'fit',
                //html:'<iframe width=100% height=100% src="filesys/FileSyses/fileshow?id=30"></iframe>'
                //html:'<iframe width=100% height=100% src="http://web.kugou.com/"></iframe>'
                html:'<iframe width=100% height=100% src="http://10.107.98.110:9002/wbhr/login.screen"></iframe>'
            });
        }
        return win;
    }
});
