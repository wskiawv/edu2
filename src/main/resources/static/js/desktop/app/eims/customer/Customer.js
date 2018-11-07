Ext.define('desktop.app.eims.customer.Customer',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.Customer',
	moduleName:"customer",//请求模块名称
	controllersName:"Customers",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.customer.model.Customer';
	},
	getSearchFieldHeight : function(){
		return 120;
	},
	getSearchFields : function(){
		return[		
		{
	        fieldLabel: '登录名',
	        name: 'filter_LIKE_loginName',
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '密码',
	        name: 'filter_LIKE_password',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '电子邮箱',
	        name: 'filter_LIKE_email',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '手机号码',
	        name: 'filter_LIKE_phone',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '人民币',
	        name: 'filter_LIKE_rmb',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '美元',
	        name: 'filter_LIKE_usd',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '注册IP',
	        name: 'filter_LIKE_ip',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '公司名',
	        name: 'filter_LIKE_company',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '城市',
	        name: 'filter_LIKE_city',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '公司网址',
	        name: 'filter_LIKE_companyWebsite',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '激活码',
	        name: 'filter_LIKE_activeCode',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '地址',
	        name: 'filter_LIKE_address',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '国家',
	        name: 'filter_LIKE_country',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '注册日期',
	        name: 'filter_LIKE_registerDate',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '登录日期',
	        name: 'filter_LIKE_loginDate',	       
	        anchor:'100%'  
	    },{
	        fieldLabel: '用户状态',
	        name: 'filter_LIKE_status',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学校ID',
	        name: 'filter_LIKE_schoolId',	       
	        anchor:'100%'  
	    }]
	},
	
	getGridColumns:function(){
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
				text:'电子邮箱',
			    dataIndex:'email',
			    width:100,
				sortable:true	
			},		
			{
				text:'手机号码',
			    dataIndex:'phone',
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
				text:'美元',
			    dataIndex:'usd',
			    width:100,
				sortable:true	
			},		
			{
				text:'注册IP',
			    dataIndex:'ip',
			    width:100,
				sortable:true	
			},		
			{
				text:'公司名',
			    dataIndex:'company',
			    width:100,
				sortable:true	
			},		
			{
				text:'城市',
			    dataIndex:'city',
			    width:100,
				sortable:true	
			},		
			{
				text:'公司网址',
			    dataIndex:'companyWebsite',
			    width:100,
				sortable:true	
			},		
			{
				text:'激活码',
			    dataIndex:'activeCode',
			    width:100,
				sortable:true	
			},		
			{
				text:'地址',
			    dataIndex:'address',
			    width:100,
				sortable:true	
			},		
			{
				text:'国家',
			    dataIndex:'country',
			    width:100,
				sortable:true	
			},		
			{
				text:'注册日期',
			    dataIndex:'registerDate',
			    width:100,
				sortable:true	
			},		
			{
				text:'登录日期',
			    dataIndex:'loginDate',
			    width:100,
				sortable:true	
			},		
			{
				text:'用户状态',
			    dataIndex:'status',
			    width:100,
                renderer:function(value){
                    if(value==1){
                        return '<span style="color:green;">' + "启用" + '</span>';
                    }else{
                         return '<span style="color:red;">' + "禁用" + '</span>';
                    }
                },
				sortable:true	
			},		
			{
				text:'学校ID',
			    dataIndex:'schoolId',
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
		        fieldLabel: '登录名',
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
		        fieldLabel: '电子邮箱',
		        name: 'email',
		        allowBlank:false,
		        emptyText:'email',
		        msgTarget:'email',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '手机号码',
		        name: 'phone',
		        allowBlank:false,
		        emptyText:'phone',
		        msgTarget:'phone',
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
		        fieldLabel: '美元',
		        name: 'usd',
		        allowBlank:false,
		        emptyText:'usd',
		        msgTarget:'usd',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '注册IP',
		        name: 'ip',
		        allowBlank:false,
		        emptyText:'ip',
		        msgTarget:'ip',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '公司名',
		        name: 'company',
		        allowBlank:false,
		        emptyText:'company',
		        msgTarget:'company',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '城市',
		        name: 'city',
		        allowBlank:false,
		        emptyText:'city',
		        msgTarget:'city',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '公司网址',
		        name: 'companyWebsite',
		        allowBlank:false,
		        emptyText:'companyWebsite',
		        msgTarget:'companyWebsite',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '激活码',
		        name: 'activeCode',
		        allowBlank:false,
		        emptyText:'activeCode',
		        msgTarget:'activeCode',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '地址',
		        name: 'address',
		        allowBlank:false,
		        emptyText:'address',
		        msgTarget:'address',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '国家',
		        name: 'country',
		        allowBlank:false,
		        emptyText:'country',
		        msgTarget:'country',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '注册日期',
		        name: 'registerDate',
		        allowBlank:false,
		        emptyText:'registerDate',
		        msgTarget:'registerDate',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '登录日期',
		        name: 'loginDate',
		        allowBlank:false,
		        emptyText:'loginDate',
		        msgTarget:'loginDate',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '用户状态',
		        name: 'status',
		        allowBlank:false,
		        emptyText:'用户状态',
		        msgTarget:'用户状态',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学校ID',
		        name: 'schoolId',
		        allowBlank:false,
		        emptyText:'schoolId',
		        msgTarget:'schoolId',
		        anchor:'100%'  
		    },
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                      
                '<p><b>登录名:</b> {loginName}</p><br>',
                '<p><b>密码:</b> {password}</p><br>',              
                '<p><b>电子邮箱:</b> {email}</p><br>',              
                '<p><b>手机号码:</b> {phone}</p><br>',              
                '<p><b>人民币:</b> {rmb}</p><br>',              
                '<p><b>美元:</b> {usd}</p><br>',              
                '<p><b>注册IP:</b> {ip}</p><br>',              
                '<p><b>公司名:</b> {company}</p><br>',              
                '<p><b>城市:</b> {city}</p><br>',              
                '<p><b>公司网址:</b> {companyWebsite}</p><br>',              
                '<p><b>激活码:</b> {activeCode}</p><br>',              
                '<p><b>地址:</b> {address}</p><br>',              
                '<p><b>国家:</b> {country}</p><br>',              
                '<p><b>注册日期:</b> {registerDate}</p><br>',              
                '<p><b>登录日期:</b> {loginDate}</p><br>', 
                '<p><b>用户状态:</b> {status}</p><br>',
                '<p><b>学校ID:</b> {schoolId}</p><br>'             
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.customer.model.Customer',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'int'},	   
	        {name:'loginName',type: 'string'},
	        {name:'password',type: 'string'},	   
	        {name:'email',type: 'string'},	   
	        {name:'phone',type: 'string'},	   
	        {name:'rmb',type: 'string'},	   
	        {name:'usd',type: 'string'},	   
	        {name:'ip',type: 'string'},	   
	        {name:'company',type: 'string'},	   
	        {name:'city',type: 'string'},	   
	        {name:'companyWebsite',type: 'string'},	   
	        {name:'activeCode',type: 'string'},	   
	        {name:'address',type: 'string'},	   
	        {name:'country',type: 'string'},	   
	        {name:'registerDate',type: 'string'},	   
	        {name:'loginDate',type: 'string'},
	        {name:'status',type: 'string'},
	        {name:'schoolId',type: 'string'}	   
	       ]
});