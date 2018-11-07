Ext.define('desktop.app.eims.student.Student',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.Student',
	moduleName:"student",//请求模块名称
	controllersName:"Students",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.student.model.Student';
	},
	getSearchFieldHeight : function(){
		return 300;
	},
	getSearchFields : function(){
		return[		
		{
	        fieldLabel: '学号',
	        name: 'filter_LIKE_xh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '姓名',
	        name: 'filter_LIKE_xm',	       
	        anchor:'100%'  
	    },
	    {
	        fieldLabel: '登陆名',
	        name: 'filter_LIKE_loginName',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '姓名拼音',
	        name: 'filter_LIKE_xmpy',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '曾用名',
	        name: 'filter_LIKE_cym',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '院系所部中心号',
	        name: 'filter_LIKE_yxsm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '专业号',
	        name: 'filter_LIKE_zyh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '专业科类码',
	        name: 'filter_LIKE_zyklm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '培养方式码',
	        name: 'filter_LIKE_pyfsm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学生类别',
	        name: 'filter_LIKE_xslbm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '研究方向码',
	        name: 'filter_LIKE_yjfxm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '导师职工号',
	        name: 'filter_LIKE_dszgh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '获得学历方式码',
	        name: 'filter_LIKE_hdxlfsm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学分制学生状况',
	        name: 'filter_LIKE_xfzxszk',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学制',
	        name: 'filter_LIKE_xz',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '入学年月',
	        name: 'filter_LIKE_rxny',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '年级',
	        name: 'filter_LIKE_nj',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '班号',
	        name: 'filter_LIKE_bh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '身份证号',
	        name: 'filter_LIKE_sfzh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '性别码',
	        name: 'filter_LIKE_xbm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '血型码',
	        name: 'filter_LIKE_xxm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '出生日期',
	        name: 'filter_LIKE_csrq',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '出生地码',
	        name: 'filter_LIKE_csdm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '籍贯码',
	        name: 'filter_LIKE_jgm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '民族码',
	        name: 'filter_LIKE_mzm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '宗教信仰',
	        name: 'filter_LIKE_zjxy',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '港澳台侨码',
	        name: 'filter_LIKE_gatqm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '健康状况码',
	        name: 'filter_LIKE_jkzkm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '婚姻状况码',
	        name: 'filter_LIKE_hyzkm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '现住址',
	        name: 'filter_LIKE_xzz',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '户口所在地',
	        name: 'filter_LIKE_hkszd',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '户口性质码',
	        name: 'filter_LIKE_hkxzm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '国别码',
	        name: 'filter_LIKE_gbm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '联系电话',
	        name: 'filter_LIKE_lxdh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '通信地址',
	        name: 'filter_LIKE_txdz',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '邮政编码',
	        name: 'filter_LIKE_yzbm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '电子信箱',
	        name: 'filter_LIKE_dzxx',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '主页地址',
	        name: 'filter_LIKE_zydz',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学校ID',
	        name: 'filter_LIKE_schoolId',	       
	        anchor:'100%'  
	    },
	    {
	        fieldLabel: '用户状态',
	        name: 'filter_LIKE_status',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '特长',
	        name: 'filter_LIKE_tc',	       
	        anchor:'100%'  
	    }
	    ]
	},
	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),				
			{
				text:'学号',
			    dataIndex:'xh',
			    width:100,
				sortable:true	
			},		
			{
				text:'姓名',
			    dataIndex:'xm',
			    width:100,
				sortable:true	
			},		
			{
				text:'登陆名',
			    dataIndex:'loginName',
			    width:100,
				sortable:true	
			},
			{
				text:'密码',
			    dataIndex:'pwd',
			    width:100,
				sortable:true	
			},
			{
				text:'姓名拼音',
			    dataIndex:'xmpy',
			    width:100,
				sortable:true	
			},		
			{
				text:'曾用名',
			    dataIndex:'cym',
			    width:100,
				sortable:true	
			},		
			{
				text:'院系所部中心号',
			    dataIndex:'yxsm',
			    width:100,
				sortable:true	
			},		
			{
				text:'专业号',
			    dataIndex:'zyh',
			    width:100,
				sortable:true	
			},		
			{
				text:'专业科类码',
			    dataIndex:'zyklm',
			    width:100,
				sortable:true	
			},		
			{
				text:'培养方式码',
			    dataIndex:'pyfsm',
			    width:100,
				sortable:true	
			},		
			{
				text:'学生类别',
			    dataIndex:'xslbm',
			    width:100,
				sortable:true	
			},		
			{
				text:'研究方向码',
			    dataIndex:'yjfxm',
			    width:100,
				sortable:true	
			},		
			{
				text:'导师职工号',
			    dataIndex:'dszgh',
			    width:100,
				sortable:true	
			},		
			{
				text:'获得学历方式码',
			    dataIndex:'hdxlfsm',
			    width:100,
				sortable:true	
			},		
			{
				text:'学分制学生状况',
			    dataIndex:'xfzxszk',
			    width:100,
				sortable:true	
			},		
			{
				text:'学制',
			    dataIndex:'xz',
			    width:100,
				sortable:true	
			},		
			{
				text:'入学年月',
			    dataIndex:'rxny',
			    width:100,
				sortable:true	
			},		
			{
				text:'年级',
			    dataIndex:'nj',
			    width:100,
				sortable:true	
			},		
			{
				text:'班号',
			    dataIndex:'bh',
			    width:100,
				sortable:true	
			},		
			{
				text:'身份证号',
			    dataIndex:'sfzh',
			    width:100,
				sortable:true	
			},		
			{
				text:'性别码',
			    dataIndex:'xbm',
			    width:100,
				sortable:true	
			},		
			{
				text:'血型码',
			    dataIndex:'xxm',
			    width:100,
				sortable:true	
			},		
			{
				text:'出生日期',
			    dataIndex:'csrq',
			    width:100,
				sortable:true	
			},		
			{
				text:'出生地码',
			    dataIndex:'csdm',
			    width:100,
				sortable:true	
			},		
			{
				text:'籍贯码',
			    dataIndex:'jgm',
			    width:100,
				sortable:true	
			},		
			{
				text:'民族码',
			    dataIndex:'mzm',
			    width:100,
				sortable:true	
			},		
			{
				text:'宗教信仰',
			    dataIndex:'zjxy',
			    width:100,
				sortable:true	
			},		
			{
				text:'港澳台侨码',
			    dataIndex:'gatqm',
			    width:100,
				sortable:true	
			},		
			{
				text:'健康状况码',
			    dataIndex:'jkzkm',
			    width:100,
				sortable:true	
			},		
			{
				text:'婚姻状况码',
			    dataIndex:'hyzkm',
			    width:100,
				sortable:true	
			},		
			{
				text:'现住址',
			    dataIndex:'xzz',
			    width:100,
				sortable:true	
			},		
			{
				text:'户口所在地',
			    dataIndex:'hkszd',
			    width:100,
				sortable:true	
			},		
			{
				text:'户口性质码',
			    dataIndex:'hkxzm',
			    width:100,
				sortable:true	
			},		
			{
				text:'国别码',
			    dataIndex:'gbm',
			    width:100,
				sortable:true	
			},		
			{
				text:'联系电话',
			    dataIndex:'lxdh',
			    width:100,
				sortable:true	
			},		
			{
				text:'通信地址',
			    dataIndex:'txdz',
			    width:100,
				sortable:true	
			},		
			{
				text:'邮政编码',
			    dataIndex:'yzbm',
			    width:100,
				sortable:true	
			},		
			{
				text:'电子信箱',
			    dataIndex:'dzxx',
			    width:100,
				sortable:true	
			},		
			{
				text:'主页地址',
			    dataIndex:'zydz',
			    width:100,
				sortable:true	
			},		
			{
				text:'学校ID',
			    dataIndex:'schoolId',
			    width:100,
				sortable:true	
			},
			{
				text:'注册时间',
			    dataIndex:'registerDate',
			    width:100,
			    xtype:'datecolumn',
			    format:'Y-m-d',
				sortable:true	
			},
			{
				text:'最近登录时间',
			    dataIndex:'loginDate',
			    xtype:'datecolumn',
			    format:'Y-m-d',
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
				text:'特长',
			    dataIndex:'tc',
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
		        fieldLabel: '学号',
		        name: 'xh',
		        allowBlank:false,
		        emptyText:'xh',
		        msgTarget:'xh',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '姓名',
		        name: 'xm',
		        allowBlank:false,
		        emptyText:'xm',
		        msgTarget:'xm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '登陆名',
		        name: 'loginName',
		        allowBlank:false,
		        emptyText:'登陆名',
		        msgTarget:'登陆名',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '密码',
		        name: 'pwd',
		        allowBlank:false,
		        emptyText:'pwd',
		        msgTarget:'pwd',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '姓名拼音',
		        name: 'xmpy',
		        allowBlank:false,
		        emptyText:'xmpy',
		        msgTarget:'xmpy',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '曾用名',
		        name: 'cym',
		        allowBlank:false,
		        emptyText:'cym',
		        msgTarget:'cym',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '院系所部中心号',
		        name: 'yxsm',
		        allowBlank:false,
		        emptyText:'yxsm',
		        msgTarget:'yxsm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '专业号',
		        name: 'zyh',
		        allowBlank:false,
		        emptyText:'zyh',
		        msgTarget:'zyh',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '专业科类码',
		        name: 'zyklm',
		        allowBlank:false,
		        emptyText:'zyklm',
		        msgTarget:'zyklm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '培养方式码',
		        name: 'pyfsm',
		        allowBlank:false,
		        emptyText:'pyfsm',
		        msgTarget:'pyfsm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学生类别',
		        name: 'xslbm',
		        allowBlank:false,
		        emptyText:'xslbm',
		        msgTarget:'xslbm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '研究方向码',
		        name: 'yjfxm',
		        allowBlank:false,
		        emptyText:'yjfxm',
		        msgTarget:'yjfxm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '导师职工号',
		        name: 'dszgh',
		        allowBlank:false,
		        emptyText:'dszgh',
		        msgTarget:'dszgh',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '获得学历方式码',
		        name: 'hdxlfsm',
		        allowBlank:false,
		        emptyText:'hdxlfsm',
		        msgTarget:'hdxlfsm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学分制学生状况',
		        name: 'xfzxszk',
		        allowBlank:false,
		        emptyText:'xfzxszk',
		        msgTarget:'xfzxszk',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学制',
		        name: 'xz',
		        allowBlank:false,
		        emptyText:'xz',
		        msgTarget:'xz',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '入学年月',
		        name: 'rxny',
		        allowBlank:false,
		        emptyText:'rxny',
		        msgTarget:'rxny',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '年级',
		        name: 'nj',
		        allowBlank:false,
		        emptyText:'nj',
		        msgTarget:'nj',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '班号',
		        name: 'bh',
		        allowBlank:false,
		        emptyText:'bh',
		        msgTarget:'bh',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '身份证号',
		        name: 'sfzh',
		        allowBlank:false,
		        emptyText:'sfzh',
		        msgTarget:'sfzh',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '性别码',
		        name: 'xbm',
		        allowBlank:false,
		        emptyText:'xbm',
		        msgTarget:'xbm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '血型码',
		        name: 'xxm',
		        allowBlank:false,
		        emptyText:'xxm',
		        msgTarget:'xxm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '出生日期',
		        name: 'csrq',
		        allowBlank:false,
		        emptyText:'csrq',
		        msgTarget:'csrq',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '出生地码',
		        name: 'csdm',
		        allowBlank:false,
		        emptyText:'csdm',
		        msgTarget:'csdm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '籍贯码',
		        name: 'jgm',
		        allowBlank:false,
		        emptyText:'jgm',
		        msgTarget:'jgm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '民族码',
		        name: 'mzm',
		        allowBlank:false,
		        emptyText:'mzm',
		        msgTarget:'mzm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '宗教信仰',
		        name: 'zjxy',
		        allowBlank:false,
		        emptyText:'zjxy',
		        msgTarget:'zjxy',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '港澳台侨码',
		        name: 'gatqm',
		        allowBlank:false,
		        emptyText:'gatqm',
		        msgTarget:'gatqm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '健康状况码',
		        name: 'jkzkm',
		        allowBlank:false,
		        emptyText:'jkzkm',
		        msgTarget:'jkzkm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '婚姻状况码',
		        name: 'hyzkm',
		        allowBlank:false,
		        emptyText:'hyzkm',
		        msgTarget:'hyzkm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '现住址',
		        name: 'xzz',
		        allowBlank:false,
		        emptyText:'xzz',
		        msgTarget:'xzz',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '户口所在地',
		        name: 'hkszd',
		        allowBlank:false,
		        emptyText:'hkszd',
		        msgTarget:'hkszd',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '户口性质码',
		        name: 'hkxzm',
		        allowBlank:false,
		        emptyText:'hkxzm',
		        msgTarget:'hkxzm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '国别码',
		        name: 'gbm',
		        allowBlank:false,
		        emptyText:'gbm',
		        msgTarget:'gbm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '联系电话',
		        name: 'lxdh',
		        allowBlank:false,
		        emptyText:'lxdh',
		        msgTarget:'lxdh',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '通信地址',
		        name: 'txdz',
		        allowBlank:false,
		        emptyText:'txdz',
		        msgTarget:'txdz',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '邮政编码',
		        name: 'yzbm',
		        allowBlank:false,
		        emptyText:'yzbm',
		        msgTarget:'yzbm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '电子信箱',
		        name: 'dzxx',
		        allowBlank:false,
		        emptyText:'dzxx',
		        msgTarget:'dzxx',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '主页地址',
		        name: 'zydz',
		        allowBlank:false,
		        emptyText:'zydz',
		        msgTarget:'zydz',
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
		    {		        
		        name: 'registerDate',
		        xtype:'hidde'		       
		    },
		    {		        
		        xtype:'hidde',
		        name: 'loginDate'		       
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
		        fieldLabel: '特长',
		        name: 'tc',
		        allowBlank:false,
		        emptyText:'tc',
		        msgTarget:'tc',
		        anchor:'100%'  
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                   
                '<p><b>学号:</b> {xh}</p><br>',              
                '<p><b>姓名:</b> {xm}</p><br>',     
                '<p><b>登录名:</b> {loginName}</p><br>',  
                '<p><b>密码:</b> {pwd}</p><br>',  
                '<p><b>姓名拼音:</b> {xmpy}</p><br>',              
                '<p><b>曾用名:</b> {cym}</p><br>',              
                '<p><b>院系所部中心号:</b> {yxsm}</p><br>',              
                '<p><b>专业号:</b> {zyh}</p><br>',              
                '<p><b>专业科类码:</b> {zyklm}</p><br>',              
                '<p><b>培养方式码:</b> {pyfsm}</p><br>',              
                '<p><b>学生类别:</b> {xslbm}</p><br>',              
                '<p><b>研究方向码:</b> {yjfxm}</p><br>',              
                '<p><b>导师职工号:</b> {dszgh}</p><br>',              
                '<p><b>获得学历方式码:</b> {hdxlfsm}</p><br>',              
                '<p><b>学分制学生状况:</b> {xfzxszk}</p><br>',              
                '<p><b>学制:</b> {xz}</p><br>',              
                '<p><b>入学年月:</b> {rxny}</p><br>',              
                '<p><b>年级:</b> {nj}</p><br>',              
                '<p><b>班号:</b> {bh}</p><br>',              
                '<p><b>身份证号:</b> {sfzh}</p><br>',              
                '<p><b>性别码:</b> {xbm}</p><br>',              
                '<p><b>血型码:</b> {xxm}</p><br>',              
                '<p><b>出生日期:</b> {csrq}</p><br>',              
                '<p><b>出生地码:</b> {csdm}</p><br>',              
                '<p><b>籍贯码:</b> {jgm}</p><br>',              
                '<p><b>民族码:</b> {mzm}</p><br>',              
                '<p><b>宗教信仰:</b> {zjxy}</p><br>',              
                '<p><b>港澳台侨码:</b> {gatqm}</p><br>',              
                '<p><b>健康状况码:</b> {jkzkm}</p><br>',              
                '<p><b>婚姻状况码:</b> {hyzkm}</p><br>',              
                '<p><b>现住址:</b> {xzz}</p><br>',              
                '<p><b>户口所在地:</b> {hkszd}</p><br>',              
                '<p><b>户口性质码:</b> {hkxzm}</p><br>',              
                '<p><b>国别码:</b> {gbm}</p><br>',              
                '<p><b>联系电话:</b> {lxdh}</p><br>',              
                '<p><b>通信地址:</b> {txdz}</p><br>',              
                '<p><b>邮政编码:</b> {yzbm}</p><br>',              
                '<p><b>电子信箱:</b> {dzxx}</p><br>',              
                '<p><b>主页地址:</b> {zydz}</p><br>',     
                '<p><b>用户状态:</b> {status}</p><br>',
                '<p><b>学校ID:</b> {schoolId}</p><br>',              
                '<p><b>特长:</b> {tc}</p><br>'              
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.student.model.Student',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'int'},	   
	        {name:'xh',type: 'string'},	   
	        {name:'xm',type: 'string'},	
	        {name:'loginName',type: 'string'},	   
	        {name:'pwd',type: 'string'},	   
	        {name:'xmpy',type: 'string'},	   
	        {name:'cym',type: 'string'},	   
	        {name:'yxsm',type: 'string'},	   
	        {name:'zyh',type: 'string'},	   
	        {name:'zyklm',type: 'string'},	   
	        {name:'pyfsm',type: 'string'},	   
	        {name:'xslbm',type: 'string'},	   
	        {name:'yjfxm',type: 'string'},	   
	        {name:'dszgh',type: 'string'},	   
	        {name:'hdxlfsm',type: 'string'},	   
	        {name:'xfzxszk',type: 'string'},	   
	        {name:'xz',type: 'string'},	   
	        {name:'rxny',type: 'string'},	   
	        {name:'nj',type: 'string'},	   
	        {name:'bh',type: 'string'},	   
	        {name:'sfzh',type: 'string'},	   
	        {name:'xbm',type: 'string'},	   
	        {name:'xxm',type: 'string'},	   
	        {name:'csrq',type: 'string'},	   
	        {name:'csdm',type: 'string'},	   
	        {name:'jgm',type: 'string'},	   
	        {name:'mzm',type: 'string'},	   
	        {name:'zjxy',type: 'string'},	   
	        {name:'gatqm',type: 'string'},	   
	        {name:'jkzkm',type: 'string'},	   
	        {name:'hyzkm',type: 'string'},	   
	        {name:'xzz',type: 'string'},	   
	        {name:'hkszd',type: 'string'},	   
	        {name:'hkxzm',type: 'string'},	   
	        {name:'gbm',type: 'string'},	   
	        {name:'lxdh',type: 'string'},	   
	        {name:'txdz',type: 'string'},	   
	        {name:'yzbm',type: 'string'},	   
	        {name:'dzxx',type: 'string'},	   
	        {name:'zydz',type: 'string'},	   
	        {name:'schoolId',type: 'string'},	
	        {name:'registerDate',type:'date',dateFormat: 'Y-m-d H:i:s'},
	        {name:'loginDate',type:'date',dateFormat: 'Y-m-d H:i:s'},
	        {name:'status',type: 'string'},
	        {name:'tc',type: 'string'}	   
	       ]
});