Ext.define('desktop.app.eims.sys.User',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.User',
	moduleName:"sys",//请求模块名称
	controllersName:"Users",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.sys.model.User';
	},
	getSearchFieldHeight : function(){
		return 120;
	},
	getSearchFields : function(){
		return[		
		{
	        fieldLabel: '登陆名',
	        name: 'filter_LIKE_loginName',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '密码',
	        name: 'filter_LIKE_password',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '姓名',
	        name: 'filter_LIKE_userName',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '用户类型',
	        name: 'filter_LIKE_userType',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '邮箱',
	        name: 'filter_LIKE_email',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '手机',
	        name: 'filter_LIKE_phone',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '人民币账户余额',
	        name: 'filter_LIKE_rmb',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '美元账户余额',
	        name: 'filter_LIKE_usd',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '注册时间',
	        name: 'filter_LIKE_registerDate',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '最近登录时间',
	        name: 'filter_LIKE_loginDate',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '账户状态',
	        name: 'filter_LIKE_status',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '激活码',
	        name: 'filter_LIKE_activateCode',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: 'uuid',
	        name: 'filter_LIKE_uuid',	       
	        anchor:'100%'  
	    }		
	    ]
	},	
	getGridColumns:function(){
		var me=this;
		var columns = [Ext.create('Ext.grid.RowNumberer'),					
			{
				text:'登录名',
			    dataIndex:'loginName',
			    width:100,
				sortable:true	
			},		
			{
				text:'密码',
			    dataIndex:'password',
			    width:100,
				sortable:true	
			},		
			{
				text:'姓名',
			    dataIndex:'userName',
			    width:100,
				sortable:true	
			},		
			{
				text:'用户类型',
			    dataIndex:'userType',
			    width:100,
				sortable:true	
			},		
			{
				text:'邮箱',
			    dataIndex:'email',
			    width:100,
				sortable:true	
			},		
			{
				text:'手机',
			    dataIndex:'phone',
			    width:100,
				sortable:true	
			},		
			{
				text:'人民币账户余额',
			    dataIndex:'rmb',
			    width:100,
				sortable:true	
			},		
			{
				text:'美元账户余额',
			    dataIndex:'usd',
			    width:100,
				sortable:true	
			},		
			{
				text:'注册时间',
			    dataIndex:'registerDate',
			    width:100,
				sortable:true	
			},		
			{
				text:'最近登录时间',
			    dataIndex:'loginDate',
			    width:100,
				sortable:true	
			},		
			{
				text:'账户状态',
			    dataIndex:'status',
			    width:100,
				sortable:true	
			},		
			{
				text:'激活码',
			    dataIndex:'activateCode',
			    width:100,
				sortable:true	
			},		
			{
				text:'uuid',
			    dataIndex:'uuid',
			    width:100,
				sortable:true	
			},
			{
                text: '分配角色',
                width: 120,
                menuDisabled: true,
                xtype: 'actioncolumn',
                tooltip: '分配角色',
                align: 'center',
                iconCls:'settings',
                handler: function(grid, rowIndex, colIndex, actionItem, event, record, row) {
                  //Ext.Msg.alert("你选择了", record.get("name"));
                  me.assignRole(record.get("id"));
                }
			}
		];
		return columns;
	},
	assignRole:function(id){
		var win=Ext.create("desktop.app.eims.sys.AssignRole",{
			userId:id
		});
		win.show();
		return win;
	},
	getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'id'
		    },
		    {
		        fieldLabel: '登陆名',
		        name: 'loginName',
		        allowBlank:false,
		        emptyText:'loginName',
		        msgTarget:'loginName',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '密码',
		        name: 'password',
		        allowBlank:false,
		        emptyText:'password',
		        msgTarget:'password',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '姓名',
		        name: 'userName',
		        allowBlank:false,
		        emptyText:'userName',
		        msgTarget:'userName',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '用户类型',
		        name: 'userType',
		        allowBlank:false,
		        emptyText:'userType',
		        msgTarget:'userType',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '邮箱',
		        name: 'email',
		        allowBlank:false,
		        emptyText:'email',
		        msgTarget:'email',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '手机',
		        name: 'phone',
		        allowBlank:false,
		        emptyText:'phone',
		        msgTarget:'phone',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '人民币账户余额',
		        name: 'rmb',
		        allowBlank:false,
		        emptyText:'人民币账户余额',
		        msgTarget:'人民币账户余额',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '美元账户余额',
		        name: 'usd',
		        allowBlank:false,
		        emptyText:'美元账户余额',
		        msgTarget:'美元账户余额',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '注册时间',
		        name: 'registerDate',
		        allowBlank:false,
		        emptyText:'注册时间',
		        msgTarget:'注册时间',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '最近登录时间',
		        name: 'loginDate',
		        allowBlank:false,
		        emptyText:'最近登录时间',
		        msgTarget:'最近登录时间',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '账户状态',
		        name: 'status',
		        allowBlank:false,
		        emptyText:'账户状态',
		        msgTarget:'账户状态',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '激活码',
		        name: 'activateCode',
		        allowBlank:false,
		        emptyText:'激活码',
		        msgTarget:'激活码',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: 'uuid',
		        name: 'uuid',
		        allowBlank:false,
		        emptyText:'uuid',
		        msgTarget:'uuid',
		        anchor:'100%'  
		    }]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                      
                '<p><b>登陆名:</b> {loginName}</p><br>',              
                '<p><b>密码:</b> {password}</p><br>',              
                '<p><b>姓名:</b> {userName}</p><br>',              
                '<p><b>用户类型:</b> {userType}</p><br>',              
                '<p><b>邮箱:</b> {email}</p><br>',              
                '<p><b>手机:</b> {phone}</p><br>',              
                '<p><b>人民币账户余额:</b> {rmb}</p><br>',              
                '<p><b>美元账户余额:</b> {usd}</p><br>',              
                '<p><b>注册时间:</b> {registerDate}</p><br>',              
                '<p><b>最近登陆时间:</b> {loginDate}</p><br>',              
                '<p><b>账户状态:</b> {status}</p><br>',              
                '<p><b>激活码:</b> {activateCode}</p><br>',              
                '<p><b>uuid:</b> {uuid}</p><br>'            
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.sys.model.User',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'string'},	   
	        {name:'loginName',type: 'string'},	   
	        {name:'password',type: 'string'},	   
	        {name:'userName',type: 'string'},	   
	        {name:'userType',type: 'string'},	   
	        {name:'email',type: 'string'},	   
	        {name:'phone',type: 'string'},	   
	        {name:'rmb',type: 'string'},	   
	        {name:'usd',type: 'string'},	   
	        {name:'registerDate',type: 'string'},	   
	        {name:'loginDate',type: 'string'},	   
	        {name:'status',type: 'string'},	   
	        {name:'activateCode',type: 'string'},	   
	        {name:'uuid',type: 'string'}	        
	       ]
});