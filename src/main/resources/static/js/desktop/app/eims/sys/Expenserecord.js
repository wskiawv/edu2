Ext.define('desktop.app.eims.sys.Expenserecord',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.Expenserecord',
	moduleName:"sys",//请求模块名称
	controllersName:"Expenserecords",//请求控制器名称
	
	getToolbar : function(){
		var tbar = [];									
		tbar.push(this.getDeleteButton());			
		//添加分隔符
		var _tbar = [];
		for(var i=0, len=tbar.length; i<len; i++){
			_tbar.push(tbar[i]);
			if(i<tbar.length-1)
				_tbar.push('-');
		}		 
		return _tbar.length==0 ? null : _tbar;
	},
	getStoreModel : function(){
		return 'desktop.app.eims.sys.model.Expenserecord';
	},
	getSearchFieldHeight : function(){
		return 120;
	},
	getSearchFields : function(){
		return[		
		{
	        fieldLabel: '客户ID',
	        name: 'filter_LIKE_customerId',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '人民币',
	        name: 'filter_LIKE_rmb',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '扣费时间',
	        name: 'filter_LIKE_datetime',	       
	        anchor:'100%',
	        format: 'Y-m-d H:i:s ',
	        xtype:'datetimefield'
	    },
		{
	        fieldLabel: '扣费币种',
	        name: 'filter_LIKE_currency',	       
	        anchor:'100%'  
	    }
	    ]
	},
	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),					
			{
				text:'客户ID',
			    dataIndex:'customerId',
			    width:100,
				sortable:true	
			},		
			{
				text:'人民币',
			    dataIndex:'rmb',
			    width:100,
				sortable:true	
			},		
			{
				text:'扣费时间',
			    dataIndex:'datetime',
			    width:100,
				sortable:true	
			},		
			{
				text:'扣费币种',
			    dataIndex:'currency',
			    width:100,
				sortable:true	
			}		
		];
		return columns;
	},
	getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'id'
		    },	    
		    {
		        fieldLabel: '客户ID',
		        name: 'customerId',
		        allowBlank:false,
		        emptyText:'customerId',
		        msgTarget:'customerId',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '人民币',
		        name: 'rmb',
		        allowBlank:false,
		        emptyText:'rmb',
		        msgTarget:'rmb',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '扣费时间',
		        name: 'datetime',	        
		        anchor:'100%',
		        disabled:true
		    },
		    {
		        fieldLabel: '扣费币种',
		        name: 'currency',
		        allowBlank:false,
		        emptyText:'currency',
		        msgTarget:'currency',
		        anchor:'100%'  
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                      
                '<p><b>客户ID:</b> {customerId}</p><br>',              
                '<p><b>人民币:</b> {rmb}</p><br>',              
                '<p><b>扣费时间:</b> {datetime}</p><br>',              
                '<p><b>扣费币种:</b> {currency}</p><br>'             
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.sys.model.Expenserecord',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'int'},	   
	        {name:'customerId',type: 'string'},	   
	        {name:'rmb',type: 'string'},	   
	        {name:'datetime',type: 'string'},	   
	        {name:'currency',type: 'string'}	   
	       ]
});