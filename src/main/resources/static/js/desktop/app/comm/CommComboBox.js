Ext.define('desktop.app.comm.CommComboBox',{
	extend:'Ext.form.field.ComboBox',
	alias:['widget.CommComboBox'],
	requires:[
	          'Ext.data.JsonStore',
	          'desktop.app.comm.Paging',
	          'Ext.grid.plugin.*'	          
	],			
	config:{
		url:null,
		pageSize:10,
	},	
	setStore:function(){
		var me=this;
		var store=Ext.create('Ext.data.JsonStore',{
			pageSize:me.pageSize,
			autoLoad: false,
			fields: [{name : 'code'}, {name : 'name'}],				
			proxy : {
				type : 'ajax',
				url:me.url,
				reader : {
					type : 'json',
					totalProperty : 'totalCount',
					root : 'result'
				},
				simpleSortMode : true
			},
			sorters : [{
				property : 'id',
				direction : 'DESC'
			}]
		});
		return store;
	},
	initComponent : function(config){
		var me=this;			
		me.store=me.setStore();		
		Ext.apply(me,{
			store:me.store,
			queryMode: 'remote',
			displayField: 'name',
			autoScroll:true,
			listWidth:600,
			maxWidth:600,
			minWidth:600,
			matchFieldWidth:false,
			valueField: 'code'
		});
		me.on({
			afterrender:me.loadStoreData,
			change:function(combo,newValue, oldValue, eOpts){
				var name=combo.hiddenName;
				var params={};
				    params[name]=newValue;
                    Ext.apply(me.store.proxy.extraParams,params);
                    me.store.load();
			},
			expand:function(combo){
				
			}
		});
		me.callParent();
	},
	loadStoreData:function(){
		var me=this;
		var store=me.getStore();
		store.load();
	}
	
});
