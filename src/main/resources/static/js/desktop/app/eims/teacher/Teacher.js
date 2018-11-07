Ext.define('desktop.app.eims.teacher.Teacher',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.Teacher',
	moduleName:"teacher",//请求模块名称
	controllersName:"Teachers",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.teacher.model.Teacher';
	},
	getSearchFieldHeight : function(){
		return 300;
	},
	getSearchFields : function(){
		return[		
		{
	        fieldLabel: '职工号',
	        name: 'filter_LIKE_zgh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '院系所部中心号',
	        name: 'filter_LIKE_yxsh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '科室号',
	        name: 'filter_LIKE_ksh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '姓名',
	        name: 'filter_LIKE_xm',	       
	        anchor:'100%'  
	    },
	    {
	        fieldLabel: '登录名',
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
	        fieldLabel: '身份证号',
	        name: 'filter_LIKE_sfzh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '出生日期',
	        name: 'filter_LIKE_csrq',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '性别码',
	        name: 'filter_LIKE_xbm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '民族码',
	        name: 'filter_LIKE_mzm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '健康状况码',
	        name: 'filter_LIKE_jkzkm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '血型码',
	        name: 'filter_LIKE_xxm',	       
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
	        fieldLabel: '婚姻状况码',
	        name: 'filter_LIKE_hyzkm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '籍贯码',
	        name: 'filter_LIKE_jgm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '出生地码',
	        name: 'filter_LIKE_csdm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '家庭出身码',
	        name: 'filter_LIKE_jtcsm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '本人成份码',
	        name: 'filter_LIKE_brcfm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '家庭住址',
	        name: 'filter_LIKE_jtzz',	       
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
	        fieldLabel: '文化程序码',
	        name: 'filter_LIKE_whcdm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '参加工作年月',
	        name: 'filter_LIKE_cjgzny',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '来校年月',
	        name: 'filter_LIKE_lxny',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '从教年月',
	        name: 'filter_LIKE_cjny',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '编制类别码',
	        name: 'filter_LIKE_bzlbm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '教职工类别码',
	        name: 'filter_LIKE_jzglbm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '现从事专业号',
	        name: 'filter_LIKE_zyh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '任课状况码',
	        name: 'filter_LIKE_rkzkm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '档案编号',
	        name: 'filter_LIKE_dabh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '照片',
	        name: 'filter_LIKE_zp',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '通信地址',
	        name: 'filter_LIKE_txdz',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '联系电话',
	        name: 'filter_LIKE_lxdh',	       
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
	        fieldLabel: '用户状态',
	        name: 'filter_LIKE_status',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学校ID',
	        name: 'filter_LIKE_schoolId',	       
	        anchor:'100%'  
	    }
	    ]
	},	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),			
			{
				text:'职工号',
			    dataIndex:'zgh',
			    width:100,
				sortable:true	
			},		
			{
				text:'院系所部中心号',
			    dataIndex:'yxsh',
			    width:100,
				sortable:true	
			},		
			{
				text:'科室号',
			    dataIndex:'ksh',
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
				text:'身份证号',
			    dataIndex:'sfzh',
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
				text:'性别码',
			    dataIndex:'xbm',
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
				text:'健康状况码',
			    dataIndex:'jkzkm',
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
				text:'婚姻状况码',
			    dataIndex:'hyzkm',
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
				text:'出生地码',
			    dataIndex:'csdm',
			    width:100,
				sortable:true	
			},		
			{
				text:'家庭出身码',
			    dataIndex:'jtcsm',
			    width:100,
				sortable:true	
			},		
			{
				text:'本人成份码',
			    dataIndex:'brcfm',
			    width:100,
				sortable:true	
			},		
			{
				text:'家庭住址',
			    dataIndex:'jtzz',
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
				text:'文化程序码',
			    dataIndex:'whcdm',
			    width:100,
				sortable:true	
			},		
			{
				text:'参加工作年月',
			    dataIndex:'cjgzny',
			    width:100,
				sortable:true	
			},		
			{
				text:'来校年月',
			    dataIndex:'lxny',
			    width:100,
				sortable:true	
			},		
			{
				text:'从教年月',
			    dataIndex:'cjny',
			    width:100,
				sortable:true	
			},		
			{
				text:'编制类别码',
			    dataIndex:'bzlbm',
			    width:100,
				sortable:true	
			},		
			{
				text:'教职工类别码',
			    dataIndex:'jzglbm',
			    width:100,
				sortable:true	
			},		
			{
				text:'现从事专业号',
			    dataIndex:'zyh',
			    width:100,
				sortable:true	
			},		
			{
				text:'任课状况码',
			    dataIndex:'rkzkm',
			    width:100,
				sortable:true	
			},		
			{
				text:'档案编号',
			    dataIndex:'dabh',
			    width:100,
				sortable:true	
			},		
			{
				text:'照片',
			    dataIndex:'zp',
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
				text:'联系电话',
			    dataIndex:'lxdh',
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
		        fieldLabel: '职工号',
		        name: 'zgh',
		        allowBlank:false,
		        emptyText:'zgh',
		        msgTarget:'zgh',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '院系所部中心号',
		        name: 'yxsh',
		        allowBlank:false,
		        emptyText:'yxsh',
		        msgTarget:'yxsh',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '科室号',
		        name: 'ksh',
		        allowBlank:false,
		        emptyText:'ksh',
		        msgTarget:'ksh',
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
		        emptyText:'密码',
		        msgTarget:'密码',
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
		        fieldLabel: '身份证号',
		        name: 'sfzh',
		        allowBlank:false,
		        emptyText:'sfzh',
		        msgTarget:'sfzh',
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
		        fieldLabel: '性别码',
		        name: 'xbm',
		        allowBlank:false,
		        emptyText:'xbm',
		        msgTarget:'xbm',
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
		        fieldLabel: '健康状况码',
		        name: 'jkzkm',
		        allowBlank:false,
		        emptyText:'jkzkm',
		        msgTarget:'jkzkm',
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
		        fieldLabel: '婚姻状况码',
		        name: 'hyzkm',
		        allowBlank:false,
		        emptyText:'hyzkm',
		        msgTarget:'hyzkm',
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
		        fieldLabel: '出生地码',
		        name: 'csdm',
		        allowBlank:false,
		        emptyText:'csdm',
		        msgTarget:'csdm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '家庭出身码',
		        name: 'jtcsm',
		        allowBlank:false,
		        emptyText:'jtcsm',
		        msgTarget:'jtcsm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '本人成份码',
		        name: 'brcfm',
		        allowBlank:false,
		        emptyText:'brcfm',
		        msgTarget:'brcfm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '家庭住址',
		        name: 'jtzz',
		        allowBlank:false,
		        emptyText:'jtzz',
		        msgTarget:'jtzz',
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
		        fieldLabel: '文化程序码',
		        name: 'whcdm',
		        allowBlank:false,
		        emptyText:'whcdm',
		        msgTarget:'whcdm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '参加工作年月',
		        name: 'cjgzny',
		        allowBlank:false,
		        emptyText:'cjgzny',
		        msgTarget:'cjgzny',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '来校年月',
		        name: 'lxny',
		        allowBlank:false,
		        emptyText:'lxny',
		        msgTarget:'lxny',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '从教年月',
		        name: 'cjny',
		        allowBlank:false,
		        emptyText:'cjny',
		        msgTarget:'cjny',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '编制类别码',
		        name: 'bzlbm',
		        allowBlank:false,
		        emptyText:'bzlbm',
		        msgTarget:'bzlbm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '教职工类别码',
		        name: 'jzglbm',
		        allowBlank:false,
		        emptyText:'jzglbm',
		        msgTarget:'jzglbm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '现从事专业号',
		        name: 'zyh',
		        allowBlank:false,
		        emptyText:'zyh',
		        msgTarget:'zyh',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '任课状况码',
		        name: 'rkzkm',
		        allowBlank:false,
		        emptyText:'rkzkm',
		        msgTarget:'rkzkm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '档案编号',
		        name: 'dabh',
		        allowBlank:false,
		        emptyText:'dabh',
		        msgTarget:'dabh',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '照片',
		        name: 'zp',
		        allowBlank:false,
		        emptyText:'zp',
		        msgTarget:'zp',
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
		        fieldLabel: '联系电话',
		        name: 'lxdh',
		        allowBlank:false,
		        emptyText:'lxdh',
		        msgTarget:'lxdh',
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
		        fieldLabel: '特长',
		        name: 'tc',
		        allowBlank:false,
		        emptyText:'zydz',
		        msgTarget:'zydz',
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
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                              
                '<p><b>职工号:</b> {zgh}</p><br>',              
                '<p><b>院系所部中心号:</b> {yxsh}</p><br>',              
                '<p><b>科室号:</b> {ksh}</p><br>',              
                '<p><b>姓名:</b> {xm}</p><br>',    
                '<p><b>登陆名:</b> {loginName}</p><br>', 
                '<p><b>姓名拼音:</b> {xmpy}</p><br>',              
                '<p><b>曾用名:</b> {cym}</p><br>',              
                '<p><b>身份证号:</b> {sfzh}</p><br>',              
                '<p><b>出生日期:</b> {csrq}</p><br>',              
                '<p><b>性别码:</b> {xbm}</p><br>',              
                '<p><b>民族码:</b> {mzm}</p><br>',              
                '<p><b>健康状况码:</b> {jkzkm}</p><br>',              
                '<p><b>血型码:</b> {xxm}</p><br>',              
                '<p><b>宗教信仰:</b> {zjxy}</p><br>',              
                '<p><b>港澳台侨码:</b> {gatqm}</p><br>',              
                '<p><b>婚姻状况码:</b> {hyzkm}</p><br>',              
                '<p><b>籍贯码:</b> {jgm}</p><br>',              
                '<p><b>出生地码:</b> {csdm}</p><br>',              
                '<p><b>家庭出身码:</b> {jtcsm}</p><br>',              
                '<p><b>本人成份码:</b> {brcfm}</p><br>',              
                '<p><b>家庭住址:</b> {jtzz}</p><br>',              
                '<p><b>现住址:</b> {xzz}</p><br>',              
                '<p><b>户口所在地:</b> {hkszd}</p><br>',              
                '<p><b>户口性质码:</b> {hkxzm}</p><br>',              
                '<p><b>文化程序码:</b> {whcdm}</p><br>',              
                '<p><b>参加工作年月:</b> {cjgzny}</p><br>',              
                '<p><b>来校年月:</b> {lxny}</p><br>',              
                '<p><b>从教年月:</b> {cjny}</p><br>',              
                '<p><b>编制类别码:</b> {bzlbm}</p><br>',              
                '<p><b>教职工类别码:</b> {jzglbm}</p><br>',              
                '<p><b>现从事专业号:</b> {zyh}</p><br>',              
                '<p><b>任课状况码:</b> {rkzkm}</p><br>',              
                '<p><b>档案编号:</b> {dabh}</p><br>',              
                '<p><b>照片:</b> {zp}</p><br>',              
                '<p><b>通信地址:</b> {txdz}</p><br>',              
                '<p><b>联系电话:</b> {lxdh}</p><br>',              
                '<p><b>邮政编码:</b> {yzbm}</p><br>',              
                '<p><b>电子信箱:</b> {dzxx}</p><br>',              
                '<p><b>主页地址:</b> {zydz}</p><br>',   
                '<p><b>主页地址:</b> {tc}</p><br>',   
                '<p><b>用户状态:</b> {status}</p><br>',
                '<p><b>学校ID:</b> {schoolId}</p><br>'           
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.teacher.model.Teacher',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'int'},	   
	        {name:'zgh',type: 'string'},	   
	        {name:'yxsh',type: 'string'},	   
	        {name:'ksh',type: 'string'},	   
	        {name:'xm',type: 'string'},	   
	        {name:'loginName',type: 'string'},	   
	        {name:'pwd',type: 'string'},	   
	        {name:'xmpy',type: 'string'},	   
	        {name:'cym',type: 'string'},	   
	        {name:'sfzh',type: 'string'},	   
	        {name:'csrq',type: 'string'},	   
	        {name:'xbm',type: 'string'},	   
	        {name:'mzm',type: 'string'},	   
	        {name:'jkzkm',type: 'string'},	   
	        {name:'xxm',type: 'string'},	   
	        {name:'zjxy',type: 'string'},	   
	        {name:'gatqm',type: 'string'},	   
	        {name:'hyzkm',type: 'string'},	   
	        {name:'jgm',type: 'string'},	   
	        {name:'csdm',type: 'string'},	   
	        {name:'jtcsm',type: 'string'},	   
	        {name:'brcfm',type: 'string'},	   
	        {name:'jtzz',type: 'string'},	   
	        {name:'xzz',type: 'string'},	   
	        {name:'hkszd',type: 'string'},	   
	        {name:'hkxzm',type: 'string'},	   
	        {name:'whcdm',type: 'string'},	   
	        {name:'cjgzny',type: 'string'},	   
	        {name:'lxny',type: 'string'},	   
	        {name:'cjny',type: 'string'},	   
	        {name:'bzlbm',type: 'string'},	   
	        {name:'jzglbm',type: 'string'},	   
	        {name:'zyh',type: 'string'},	   
	        {name:'rkzkm',type: 'string'},	   
	        {name:'dabh',type: 'string'},	   
	        {name:'zp',type: 'string'},	   
	        {name:'txdz',type: 'string'},	   
	        {name:'lxdh',type: 'string'},	   
	        {name:'yzbm',type: 'string'},	   
	        {name:'dzxx',type: 'string'},	   
	        {name:'zydz',type: 'string'},
	        {name:'tc',type: 'string'},
	        {name:'registerDate',type: 'string'},
	        {name:'loginDate',type: 'string'},
	        {name:'status',type: 'string'},
	        {name:'schoolId',type: 'string'}	   
	       ]
});