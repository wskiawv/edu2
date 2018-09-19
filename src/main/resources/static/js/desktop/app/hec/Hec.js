/**
 * 教育信息管理系统
 */
Ext.define('desktop.app.hec.Hec',{
	extend: 'Ext.ux.desktop.Module',
	requires:[
	'Ext.ux.desktop.Module',
	'desktop.app.comm.WestPanel',
	'desktop.app.comm.CenterTabPanel'
	],
	id:'hec',
	init: function(){
    	this.launcher = {
            text: '费用控制系统',
            iconCls:'icon-grid',
            handler : this.createWindow,
            scope: this
        };
       
    },
    /*config:[{items:[{xtype:'WestPanel'}]}],*/
    
	createWindow : function(){
    	var me=this,desktop = this.app.getDesktop();    	
        var win = desktop.getWindow(me.id);
        if(!win){
        	win = desktop.createWindow({
        		id:me.id,
        		title:'费用控制系统',
                width:980,
                height:560,
                iconCls: 'icon-grid',
                animCollapse:false,
                constrainHeader:true,                
                layout:'border',
            	items:[{
                	xtype:'WestPanel',
                	menus:hecMenu
            	},{
            	xtype:'CenterTabPanel',
            	items:[{
            		title:'待审批单据',
            		xtype:'WflWorkflowWaitApprove',
            		closable: true
            	}]
                }]
        	});
        	win.on({
        		beforeshow:function(w){
        			var url=appPath+"/sys/Menus/getMenu";
        			var params={};
        			Ext.Ajax.request({
    		            url: url,
    		            params:params,
    		            success: function(response){
    		                var text = response.responseText;
    		                var result=Ext.decode(text);
    		                if(result.success){
    		                	hecMenu=result.result.hec;    		
    		                	Ext.example.msg("温馨提示","菜单加载成功！");
    		                }else{
    		                	Ext.example.msg("温馨提示","菜单加载失败！");
    		                }
    		              
    		            },
    		            failure:function(){
    		               Ext.example.msg('温馨提醒',"服务端错误，菜单加载失败！");
    		              // wait.close();
    		            }
    		        });
        		},
        		beforerender:function(w){
        			
        		},
        		scope:this
        	});
        }
      	win.show();       
        return win;
    }
});