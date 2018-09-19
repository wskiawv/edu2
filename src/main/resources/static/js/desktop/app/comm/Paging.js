/*
 * @author he
 * @description 分页插件扩展，控制每页显示条数
 */
Ext.define('desktop.app.comm.Paging', {
    extend: 'Ext.toolbar.Paging',
    alias: 'widget.pagingtoolbar',
    requires: ['Ext.form.field.ComboBox'],
    initComponent : function(){
    	var me = this;
    	Ext.apply(this,{
            prependButtons:true,
            minWidth:450,
            width:450
    	});
    	this.items = Ext.apply([], this.items);
    	this.items.push('每页');
    	this.items.push({
    		xtype : 'combo',
			store : {
				fields : ['text', 'value'],
				data : [{
                    text : '10',value : '10'
                },{
					text : '25',value : '25'
				},{
					text : '50',value : '50'
				},{
					text : '100',value : '100'
				},{
					text : '200',value : '200'
				},{
					text : '500',value : '500'
				},{
					text : '1000',value : '1000'
				}]
			},
			valueField : 'value',
			displayField : 'text',
			queryMode : 'local',
			value:25,
			width:50,
			listeners:{
				change:function(combo,newValue, oldValue, eOpts){
					me.store.pageSize = newValue;
					if (me.fireEvent('beforechange', this, 1) !== false){
						me.store.loadPage(1);
			        }
				}
			}
    	});
    	this.items.push('条');
        this.callParent();
    }
});