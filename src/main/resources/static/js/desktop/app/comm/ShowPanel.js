Ext.define('desktop.app.comm.ShowPanel',{
	extend:'Ext.form.Panel',
	alias:['widget.ShowPanel'],
	requires: [    	
    	'Ext.form.Panel'           
    ],
    moduleName:"",//请求模块名称
	controllersName:"",//请求控制器名称	
	searchMethod:'search',
	pagesize:25,
    getButtons:Ext.emptyFn,
    getToolbar:Ext.emptyFn,
    getItems:Ext.emptyFn,
    getStoreModel:Ext.emptyFn,
    initComponent:function(config){
        var me=this;
        var height=me.height;
        var params=me.params;
        var buttons=me.getButtons();
        var items=me.getItems();
        var toolbar=me.getToolbar();        
        var title=me.title;
		me=Ext.apply(me,{
			title:title,
			layout:{
				anchor: '100%',	            
				labelWidth: 120
	        },
			height: height,
			border: false,
			minSize: 40,
			split:true,
			labelWidth: 120,
			labelAlign: 'right',
			defaultType: 'textfield',
			fieldDefaults: {
		        labelWidth: 120,
		        labelAlign:'right',
		        readOnly:true
		    },
			frame: false,
			autoScroll : true,
			buttonAlign:'center',
			tbar : toolbar,
			items:items,
			buttons:buttons
		});		
		me.callParent();
		me.on({
			afterrender:function(panel){
				me.getStore(params).load();
			},
			scope:me
		})
		
	},
	getUrl : function(){
		return this.moduleName+"/"+this.controllersName;
	},	
	/**
	 * store数据
	 */
	getStore : function(params){
		var me=this;
		var store=Ext.create('Ext.data.JsonStore',{
				//storeId:me.storeid,
				pageSize:me.pagesize,
				model : me.getStoreModel(),	
				//fields:me.getFields(),
				//autoLoad:true,
				//remoteSort: true,
				proxy : {
					type : 'ajax',
					url : me.getUrl()+"/"+me.searchMethod,
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
		store.on({
   			load:function(store,records,successful,e){
   				var record=store.getAt(0);
   				me.loadRecord(record);
   			},
   			beforeload:function(store,operation,e){				
   				 					
   				Ext.apply(store.proxy.extraParams,params);	   				
   			},
   			beforeprefetch:function(store,operation,e){
   				if(operation.groupers && operation.groupers.length){
   					var page=operation.page;
   					store.loadPage(page);
   				}
   			}
   		});
		return store;
	},
	
	
	
	
	
})