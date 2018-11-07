Ext.define('desktop.app.eims.school.School',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.School',
	moduleName:"school",//请求模块名称
	controllersName:"Schools",//请求控制器名称
	
	
	getStoreModel : function(){
		return 'desktop.app.eims.school.model.School';
	},
	getSearchFieldHeight : function(){
		return 230;
	},
	
	getSearchFields : function(){
		return[
		{
            xtype:'CommComboBox',
            fieldLabel : '学校代码',
            hiddenName : 'filter_LIKE_name',
            name:'filter_EQ_xxdm',
            url:appPath+'/sys/FlatCodes/search?filter_EQ_category=DM_XXDM'
		},	
		{
	        fieldLabel: '学校中文名称',
	        name: 'filter_LIKE_xxmc'       
	    },
		{
	        fieldLabel: '学校英文名称',
	        name: 'filter_LIKE_xxywmc',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学校地址',
	        name: 'filter_LIKE_xxdz',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '所在地行政区',
	        name: 'filter_LIKE_xxqhm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学校校长',
	        name: 'filter_LIKE_xxxz',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '党委负责人',
	        name: 'filter_LIKE_dwfzr',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '建校年月',
	        name: 'filter_LIKE_jxny',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '校庆日',
	        name: 'filter_LIKE_xqr',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学校性质代码',
	        name: 'filter_LIKE_xxxzm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学校办学类别',
	        name: 'filter_LIKE_xxbxlxm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学校举办者码',
	        name: 'filter_LIKE_xxjbzm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学校主管部门名称',
	        name: 'filter_LIKE_xxzgbmmc',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学校主管部门码',
	        name: 'filter_LIKE_xxzgbmm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '211工程院校状况',
	        name: 'filter_LIKE_gcyxzk',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '重点院长校状况',
	        name: 'filter_LIKE_zdyxzk',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '设立研究生院状况',
	        name: 'filter_LIKE_yjsyzk',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '附设网络学院状况',
	        name: 'filter_LIKE_wlxyzk',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '附设成教学院状况',
	        name: 'filter_LIKE_cjxyzk',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学科门类数',
	        name: 'filter_LIKE_xkmls',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '邮政编码',
	        name: 'filter_LIKE_yzbm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '联系电话',
	        name: 'filter_LIKE_lxdh',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '传真电话',
	        name: 'filter_LIKE_czdh',	       
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
	        fieldLabel: '组织机构代码',
	        name: 'filter_LIKE_zzjgdm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '历史沿革',
	        name: 'filter_LIKE_lsyg',	       
	        anchor:'100%'  
	    }
	    ]
	},
	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),					
			{
				text:'学校代码',
			    dataIndex:'xxdm',
			    width:100,
				sortable:true	
			},		
			{
				text:'学校中文名称',
			    dataIndex:'xxmc',
			    width:100,
				sortable:true	
			},		
			{
				text:'学校英文名称',
			    dataIndex:'xxywmc',
			    width:100,
				sortable:true	
			},		
			{
				text:'学校地址',
			    dataIndex:'xxdz',
			    width:100,
				sortable:true	
			},		
			{
				text:'所在地行政区',
			    dataIndex:'xxqhm',
			    width:100,
				sortable:true	
			},		
			{
				text:'学校校长',
			    dataIndex:'xxxz',
			    width:100,
				sortable:true	
			},		
			{
				text:'党委负责人',
			    dataIndex:'dwfzr',
			    width:100,
				sortable:true	
			},		
			{
				text:'建校年月',
			    dataIndex:'jxny',
			    width:100,
				sortable:true	
			},		
			{
				text:'校庆日',
			    dataIndex:'xqr',
			    width:100,
				sortable:true	
			},		
			{
				text:'学校性质代码',
			    dataIndex:'xxxzm',
			    width:100,
				sortable:true	
			},		
			{
				text:'学校办学类型',
			    dataIndex:'xxbxlxm',
			    width:100,
				sortable:true	
			},		
			{
				text:'学校举办者码',
			    dataIndex:'xxjbzm',
			    width:100,
				sortable:true	
			},		
			{
				text:'学校主管部门名称',
			    dataIndex:'xxzgbmmc',
			    width:100,
				sortable:true	
			},		
			{
				text:'学校主管部门码',
			    dataIndex:'xxzgbmm',
			    width:100,
				sortable:true	
			},		
			{
				text:'211工程院校状况',
			    dataIndex:'gcyxzk',
			    width:100,
				sortable:true	
			},		
			{
				text:'重点院校状况',
			    dataIndex:'zdyxzk',
			    width:100,
				sortable:true	
			},		
			{
				text:'设立研究生院状况',
			    dataIndex:'yjsyzk',
			    width:100,
				sortable:true	
			},		
			{
				text:'附设网络学院状况',
			    dataIndex:'wlxyzk',
			    width:100,
				sortable:true	
			},		
			{
				text:'附设成教学院状况',
			    dataIndex:'cjxyzk',
			    width:100,
				sortable:true	
			},		
			{
				text:'学科门类数',
			    dataIndex:'xkmls',
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
				text:'联系电话',
			    dataIndex:'lxdh',
			    width:100,
				sortable:true	
			},		
			{
				text:'传真电话',
			    dataIndex:'czdh',
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
				text:'组织机构代码',
			    dataIndex:'zzjgdm',
			    width:100,
				sortable:true	
			},		
			{
				text:'历史沿革',
			    dataIndex:'lsyg',
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
				xtype:'CommComboBox',
				fieldLabel : '学校代码',
				hiddenName : 'filter_EQ_xxdm',
				name:'xxdm',
				url:appPath+'/sys/FlatCodes/search?filter_EQ_category=DM_XXDM',
			},
		    {
		        fieldLabel: '学校中文名称',
		        name: 'xxmc',
		        allowBlank:false,
		        emptyText:'学校中文名称',
		        msgTarget:'学校中文名称',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学校英文名称',
		        name: 'xxywmc',
		        allowBlank:false,
		        emptyText:'学校英文名称',
		        msgTarget:'学校英文名称',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学校地址',
		        name: 'xxdz',
		        allowBlank:false,
		        emptyText:'学校地址',
		        msgTarget:'学校地址',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '所在地行政区',
		        name: 'xxqhm',
		        allowBlank:false,
		        emptyText:'所在地行政区',
		        msgTarget:'所在地行政区',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学校校长',
		        name: 'xxxz',
		        allowBlank:false,
		        emptyText:'学校校长',
		        msgTarget:'学校校长',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '党委负责人',
		        name: 'dwfzr',
		        allowBlank:false,
		        emptyText:'党委负责人',
		        msgTarget:'党委负责人',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '建校年月',
		        name: 'jxny',
		        allowBlank:false,
		        emptyText:'建校年月',
		        msgTarget:'建校年月',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '校庆日',
		        name: 'xqr',
		        allowBlank:false,
		        emptyText:'校庆日',
		        msgTarget:'校庆日',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学校性质代码',
		        name: 'xxxzm',
		        allowBlank:false,
		        emptyText:'学校性质代码',
		        msgTarget:'学校性质代码',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学校办学类型',
		        name: 'xxbxlxm',
		        allowBlank:false,
		        emptyText:'学校办学类型',
		        msgTarget:'学校办学类型',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学校举办者码',
		        name: 'xxjbzm',
		        allowBlank:false,
		        emptyText:'学校举办者码',
		        msgTarget:'学校举办者码',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学校主管部门名称',
		        name: 'xxzgbmmc',
		        allowBlank:false,
		        emptyText:'学校主管部门名称',
		        msgTarget:'学校主管部门名称',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学校主管理部门码',
		        name: 'xxzgbmm',
		        allowBlank:false,
		        emptyText:'学校主管理部门码',
		        msgTarget:'学校主管理部门码',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '211工程院校状况',
		        name: 'gcyxzk',
		        allowBlank:false,
		        emptyText:'211工程院校状况',
		        msgTarget:'211工程院校状况',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '重点院校状况',
		        name: 'zdyxzk',
		        allowBlank:false,
		        emptyText:'重点院校状况',
		        msgTarget:'重点院校状况',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '设立研究生院状况',
		        name: 'yjsyzk',
		        allowBlank:false,
		        emptyText:'设立研究生院状况',
		        msgTarget:'设立研究生院状况',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '附设网络学院状况',
		        name: 'wlxyzk',
		        allowBlank:false,
		        emptyText:'附设网络学院状况',
		        msgTarget:'附设网络学院状况',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '附设成教学院状况',
		        name: 'cjxyzk',
		        allowBlank:false,
		        emptyText:'附设成教学院状况',
		        msgTarget:'附设成教学院状况',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学科门类数',
		        name: 'xkmls',
		        allowBlank:false,
		        emptyText:'学科门类数',
		        msgTarget:'学科门类数',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '邮政编码',
		        name: 'yzbm',
		        allowBlank:false,
		        emptyText:'邮政编码',
		        msgTarget:'邮政编码',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '联系电话',
		        name: 'lxdh',
		        allowBlank:false,
		        emptyText:'联系电话',
		        msgTarget:'联系电话',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '传真电话',
		        name: 'czdh',
		        allowBlank:false,
		        emptyText:'传真电话',
		        msgTarget:'传真电话',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '电子信箱',
		        name: 'dzxx',
		        allowBlank:false,
		        emptyText:'电子信箱',
		        msgTarget:'电子信箱',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '主页地址',
		        name: 'zydz',
		        allowBlank:false,
		        emptyText:'主页地址',
		        msgTarget:'主页地址',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '组织机构代码',
		        name: 'zzjgdm',
		        allowBlank:false,
		        emptyText:'组织机构代码',
		        msgTarget:'组织机构代码',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '历史沿革',
		        name: 'lsyg',
		        allowBlank:false,
		        emptyText:'历史沿革',
		        msgTarget:'历史沿革',
		        anchor:'100%'  
		    }
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(               
                '<p><b>学校代码:</b> {xxdm}</p><br>',              
                '<p><b>学校中文名称:</b> {xxmc}</p><br>',              
                '<p><b>学校英文名称:</b> {xxywmc}</p><br>',              
                '<p><b>学校地址:</b> {xxdz}</p><br>',              
                '<p><b>所在地行政区:</b> {xxqhm}</p><br>',              
                '<p><b>学校校长:</b> {xxxz}</p><br>',              
                '<p><b>党委负责人:</b> {dwfzr}</p><br>',              
                '<p><b>建校年月:</b> {jxny}</p><br>',              
                '<p><b>校庆日:</b> {xqr}</p><br>',              
                '<p><b>学校性质代码:</b> {xxxzm}</p><br>',              
                '<p><b>学校办学类别:</b> {xxbxlxm}</p><br>',              
                '<p><b>学校举办者码:</b> {xxjbzm}</p><br>',              
                '<p><b>学校主管部门名称:</b> {xxzgbmmc}</p><br>',              
                '<p><b>学校主管部门码:</b> {xxzgbmm}</p><br>',              
                '<p><b>211工程院校状况:</b> {gcyxzk}</p><br>',              
                '<p><b>重点院长校状况:</b> {zdyxzk}</p><br>',              
                '<p><b>设立研究生院状况:</b> {yjsyzk}</p><br>',              
                '<p><b>附设网络学院状况:</b> {wlxyzk}</p><br>',              
                '<p><b>附设成教学院状况:</b> {cjxyzk}</p><br>',              
                '<p><b>学科门类数:</b> {xkmls}</p><br>',              
                '<p><b>邮政编码:</b> {yzbm}</p><br>',              
                '<p><b>联系电话:</b> {lxdh}</p><br>',              
                '<p><b>传真电话:</b> {czdh}</p><br>',              
                '<p><b>电子信箱:</b> {dzxx}</p><br>',              
                '<p><b>主页地址:</b> {zydz}</p><br>',              
                '<p><b>组织机构代码:</b> {zzjgdm}</p><br>',              
                '<p><b>历史沿革:</b> {lsyg}</p><br>'           
           );
		return tpl;
	}
});
Ext.define('desktop.app.eims.school.model.School',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'int'},	   
	        {name:'xxdm',type: 'string'},	   
	        {name:'xxmc',type: 'string'},	   
	        {name:'xxywmc',type: 'string'},	   
	        {name:'xxdz',type: 'string'},	   
	        {name:'xxqhm',type: 'string'},	   
	        {name:'xxxz',type: 'string'},	   
	        {name:'dwfzr',type: 'string'},	   
	        {name:'jxny',type: 'string'},	   
	        {name:'xqr',type: 'string'},	   
	        {name:'xxxzm',type: 'string'},	   
	        {name:'xxbxlxm',type: 'string'},	   
	        {name:'xxjbzm',type: 'string'},	   
	        {name:'xxzgbmmc',type: 'string'},	   
	        {name:'xxzgbmm',type: 'string'},	   
	        {name:'gcyxzk',type: 'string'},	   
	        {name:'zdyxzk',type: 'string'},	   
	        {name:'yjsyzk',type: 'string'},	   
	        {name:'wlxyzk',type: 'string'},	   
	        {name:'cjxyzk',type: 'string'},	   
	        {name:'xkmls',type: 'string'},	   
	        {name:'yzbm',type: 'string'},	   
	        {name:'lxdh',type: 'string'},	   
	        {name:'czdh',type: 'string'},	   
	        {name:'dzxx',type: 'string'},	   
	        {name:'zydz',type: 'string'},	   
	        {name:'zzjgdm',type: 'string'},	   
	        {name:'lsyg',type: 'string'}	   
	       ]
});