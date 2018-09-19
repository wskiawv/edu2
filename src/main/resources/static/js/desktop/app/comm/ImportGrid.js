Ext.define('desktop.app.comm.ImportGrid',{
	extend:'Ext.grid.Panel',
	alias:['widget.ImportGrid'],
	requires:[
		'Ext.grid.plugin.*',
		'Ext.grid.*'		
	],
	viewConfig: {
        stripeRows: true,
        enableTextSelection: true
    },	
    getStoreModel : Ext.emptyFn,//需要子类覆盖此方法返回Store模型model
    pagesize:25,
    searchMethod:'search',
    importButton:null,//导入按钮
    checkButton:null,//校验按钮
    submitButton:null,//提交按钮
    /**
	 * grid列模型子类需要覆盖此方法
	 */
	getGridColumns :Ext.emptyFn,
	initComponent : function(config){
		var me=this;
		Ext.apply(me,{
			region:'center',
        	autoScroll:true,
        	tbar:me.getToolbar(),
        	store : me.getGridStore(),
			columns : me.getGridColumns()
        });
			
		me.on('afterrender',function(grid){
	            grid.getStore().load();
	            
	    });
		me.callParent([me]);
	},
	/**
	 * store数据
	 */
	getGridStore : function(){
		var me=this;
		var GridStore=Ext.create('Ext.data.JsonStore',{
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
		GridStore.on({
   			load:function(store,records,successful,eOpts){
   				var grid=me.getGrid();
   				grid.getSelectionModel().deselectAll();
   			},
   			beforeload:function(store,operation,eOpts){   				
   				/*var formPanel = me.getSearchFormPanel(),   					
   					params = formPanel.getForm().getValues() || {},
   					bsParams = {start: 0, limit: store.pageSize},
   					_params = {};
   				for(var p in params){
   					if(!Ext.isEmpty(params[p])){//将没有值的属性排除
   						_params[p] = params[p];
   						//A.log("param p:{0},val:{1}", p, _params[p]);
   					}			
   				}
   				store.removeAll();
   				Ext.apply(store.proxy.extraParams,bsParams);		
   				Ext.apply(store.proxy.extraParams,params);	   */				
   			}
   		});
		return GridStore;
	},
    getToolbar : function(){
		var tbar = [];				
		tbar.push(this.getAddButton());							
		tbar.push(this.getEditButton());				
		tbar.push(this.getDeleteButton());
		tbar.push(this.getImportButton());
		tbar.push(this.getExportButton());
		//添加分隔符
		var _tbar = [];
		for(var i=0, len=tbar.length; i<len; i++){
			_tbar.push(tbar[i]);
			if(i<tbar.length-1)
				_tbar.push('-');
		}
		 
		return _tbar.length==0 ? null : _tbar;
	}
	
});
