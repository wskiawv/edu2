Ext.define('desktop.app.eims.school.Curriculum',{
	extend:'desktop.app.comm.CRUDPanel',
	alias:'widget.Curriculum',
	moduleName:"school",//请求模块名称
	controllersName:"Curriculums",//请求控制器名称
	documnetButton:null,//课件按
	getDocumnetButton:function(){
		if(Ext.isEmpty(this.documnetButton)){
			this.documnetButton = Ext.create('desktop.app.comm.DocumnetButton',{               
	            scope: this,	           
	            handler: this.documnetButtonClick
	        });
		}
		return this.documnetButton;
	},
	documnetButtonClick:function(){
		var me=this;
		var grid = me.getGrid();
		var select = grid.getSelectionModel();
		var records = select.getSelection();
		if(Ext.isEmpty(records) || records.length>1){
			Ext.example.msg('温馨提醒', "编辑时只能选择一条记录!");			
			return;
		} 
		var curriculumId=records[0].get("id");
		if(!Ext.isEmpty(me.documentWin)){
			me.documentWin.show();
			return me.documentWin;
		}
		var documentWin=Ext.create("Ext.window.Window",{
			title:"课件信息",
			layout:'border',
			closeAction:'hide',
			maximizable:true, 
			minimizable:true,
			//renderTo: document.body,
			width : me.getCreateWindowWidth(),
			height : me.getCreateWindowHeight(),
			layout:me.getCreateWidnowLayout(),				
			draggable:true,
			items:[{
				layout:'border',
				xtype:'CurriculumDocument',
				region:"center",
				curriculumId:curriculumId
			}]
			
		});
		me.documentWin=documentWin;
		documentWin.show();
		return documentWin;
	},
	getCreateWidnowLayout:function(){
		return 'border';
	},
	formSaveButtonClick:function(){
		var me=this;
		var url=me.getUrl();
		if(me.newOrEdit){
			url+="/save";
		}else{
			url+="/update";
		}
		var form=me.getCreateWindowFormObject();
		if(form.getForm().isValid()){
			form.submit({
				clientValidation:true,
				//scope:this,
				url:url,
				waitTitle:'温馨提醒',
				waitMsg:'数据提交中...',				
			    scope:me,
				success:function(form,action){
					var grid=me.getGrid(),store =grid.getStore();
						grid.getSelectionModel().deselectAll();	
						store.load();
					//me.createWindow().hide();
					//this.getStore().load();
					Ext.example.msg('温馨提醒', action.result.msg);
					Ext.Msg.alert('温馨提醒', action.result.msg);
					var object=action.result.object;
					var form=me.getCreateWindowFormObject();
					var id=form.child("hidden");
					id.setValue(object.id);
					//Ext.Msg.alert('温馨提醒',action.result.msg);	
				},
				failure:function(form,action){
					switch (action.failureType) {
			            case Ext.form.action.Action.CLIENT_INVALID:
			            	Ext.Msg.alert('温馨提醒', '数据验证没通过！');
			                break;
			            case Ext.form.action.Action.CONNECT_FAILURE:
			                Ext.Msg.alert('温馨提醒', '请求失败！');
			                break;
			            case Ext.form.action.Action.SERVER_INVALID:
			            	Ext.Msg.alert('温馨提醒', action.result.msg);			               
			       }
				}
			});
		}
	},
	getCreateWindowButtonConfig:function(){
		var me=this;
		var buttons=[me.getCancelButton()];
		return buttons;
	},
	formResetButtonClick:function(){
		var me=this;
		var form=me.getCreateWindowFormObject();
		form.getForm().reset();
	},
	getCreateWindowItem:function(){
		var me=this;
		var item=[{
			xtype:'form',
			region: 'north',
			height:260,
			autoScroll:true,					
			fieldDefaults: {
		        labelWidth: 120,
		        labelAlign:'right'
		    },		    
		    layout: me.getCreateWindowFormLayout(),
		    defaultType: 'textfield',				    
			items:me.getWindowFormItems(),
			buttonAlign:'center',
			buttons:[{
				xtype:'SaveButton',
				handler:function(){
					me.formSaveButtonClick();
				}
			},{
				xtype:'ResetButton',
				handler:function(){
					me.formResetButtonClick();
				}
			}]
		},{				
			region:'center',
			layout:'border',
			xtype:'CurriculumChapterSetting'
		}];
		return item;
	},
	getStoreModel : function(){
		return 'desktop.app.eims.school.model.Curriculum';
	},
	getSearchFieldHeight : function(){
		return 200;
	},
	getSearchFields : function(){
		return[
		{
		    fieldLabel:'专业',
		    xtype:'CommComboBox',
            hiddenName : 'filter_EQ_zymc',
            name:'filter_EQ_majorId',
            url:appPath+'/school/Majors/getMajorList'
		},
		{
		    fieldLabel: '课程名称',
		    name: 'filter_LIKE_kcmc',	       
		    anchor:'100%'  
		},
		{
	        fieldLabel: '开设学年度',
	        name: 'filter_LIKE_ksxnd',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '开课学期码',
	        name: 'filter_LIKE_ksxqm',	       
	        anchor:'100%'  
	    },
	    {
	        fieldLabel: '课程开始时间',
	        name: 'filter_GT_kkkssj', 
	        format: 'Y-m-d H:i:s ',
	        xtype:'datetimefield'
	    },
	    {
	        fieldLabel: '课程结束时间',
	        name: 'filter_LT_kkjssj',	 
	        format: 'Y-m-d H:i:s ',
	        xtype:'datetimefield'
	    },
		{
	        fieldLabel: '课程号',
	        name: 'filter_LIKE_kch',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '课程类别码',
	        name: 'filter_LIKE_kclbm',	       
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学分',
	        name: 'filter_EQ_xf',
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '学时',
	        name: 'filter_EQ_xs',
	        anchor:'100%'  
	    },
		{
	        fieldLabel: '课程收费',
	        name: 'filter_LIKE_charge',	       
	        anchor:'100%'  
	    },
		{
            xtype:'CommComboBox',
            fieldLabel : '任课老师',
            hiddenName : 'filter_EQ_xm',
            name:'filter_EQ_teacherId',
            url:appPath+'/teacher/Teachers/getTeacherList'
        },
		{
	        fieldLabel: '课程封面',
	        name: 'filter_LIKE_cover',	       
	        anchor:'100%'	        
	    },
		{
	        fieldLabel: '课程描述',
	        name: 'filter_LIKE_description',	       
	        anchor:'100%'  
	    }
	    ]
	},
	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),
		    {
		        text:'专业',
		        data:'majorId',
		        width:100,
                sortable:true
		    },
		    {
				text:'课程名称',
			    dataIndex:'kcmc',
			    width:100,
				sortable:true	
			},
			{
				text:'课程英文名称',
			    dataIndex:'kcywmc',
			    width:100,
				sortable:true	
			},
			{
				text:'课程要求',
			    dataIndex:'kcyq',
			    width:100,
				sortable:true	
			},
			{
				text:'网上教学状况',
			    dataIndex:'wsjxzk',
			    width:100,
				sortable:true	
			},
			{
				text:'开设学年度',
			    dataIndex:'ksxnd',
			    width:100,
				sortable:true	
			},		
			{
				text:'开课学期码',
			    dataIndex:'ksxqm',
			    width:100,
				sortable:true	
			},		
			{
				text: '课程开始时间',
				dataIndex: 'kkkssj',       
				width:100,
				sortable:true
		    },
		    {
		    	text: '课程结束时间',
		    	dataIndex: 'kkjssj',	  
		    	width:100,
				sortable:true
		    },
			{
				text:'课程号',
			    dataIndex:'kch',
			    width:100,
				sortable:true	
			},		
			{
				text:'课程类别码',
			    dataIndex:'kclbm',
			    width:100,
				sortable:true	
			},		
			{
				text:'学分',
			    dataIndex:'xf',
			    width:100,
				sortable:true	
			},		
			{
				text:'学时',
			    dataIndex:'xs',
			    width:100,
				sortable:true	
			},		
			{
				text:'课程收费',
			    dataIndex:'charge',
			    width:100,
				sortable:true	
			},
			{
				text:'任课老师',
			    dataIndex:'teacherId',
			    width:100,
				sortable:true	
			},		
			{
				text:'课程封面',
			    dataIndex:'cover',
			    width:100,
				sortable:true	
			},
			{
				text:'课程简介',
			    dataIndex:'kcjj',
			    width:100,
				sortable:true	
			}		
		];
		return columns;
	},
	getWindowFormItems:function(){
		var me=this;
		return[{
		    	xtype:'hidden',
		    	name:'id'
		    },
		    {
                fieldLabel:'专业',
                xtype:'CommComboBox',
                hiddenName : 'filter_EQ_zymc',
                name:'majorId',
                url:appPath+'/school/Majors/getMajorList'
            },
		    {
		        fieldLabel: '开设学年度',		       
		        name: 'ksxnd',		        
		        emptyText:'ksxnd',
		        msgTarget:'ksxnd',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '开学学期码',
		        name: 'ksxqm',		        
		        emptyText:'ksxqm',
		        msgTarget:'ksxqm',
		        anchor:'100%' 
		    },
		    {
		        fieldLabel: '课程开始时间',
		        name: 'kkkssj',        
		        format: 'Y-m-d H:i:s ',
		        xtype:'datetimefield',
		        anchor:'100%' 
		    },
		    {
		        fieldLabel: '课程结束时间',
		        name: 'kkjssj',	  
		        format: 'Y-m-d H:i:s ',
		        xtype:'datetimefield',
		        anchor:'100%' 
		    },
		    {
		        fieldLabel: '课程号',
		        name: 'kch',
		        allowBlank:false,
		        emptyText:'kch',
		        msgTarget:'kch',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '课程类别码',
		        name: 'kclbm',		        
		        emptyText:'kclbm',
		        msgTarget:'kclbm',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学分',
		        name: 'xf',		        
		        emptyText:'xf',
		        msgTarget:'xf',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '学时',
		        name: 'xs',		       
		        emptyText:'xs',
		        msgTarget:'xs',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '课程收费',
		        xtype:'numberfield',
		        name: 'charge',
		        decimalPrecision:2,
		        step:0.5,
		        allowDecimals: true,
		        allowBlank:false,
		        emptyText:'charge',
		        msgTarget:'charge',
		        anchor:'100%'  
		    },
		    {
                xtype:'CommComboBox',
                fieldLabel : '任课老师',
                hiddenName : 'teacherId',
                name:'teacherId',
                listWidth:600,
                autoScroll:true,
                url:appPath+'/teacher/Teachers/getTeacherList'
            },
		    /*{
		        fieldLabel: '任课老师',
		        name: 'teacherId',		        
		        emptyText:'teacherId',
		        msgTarget:'teacherId',
		        anchor:'100%'  
		    },*/
		    {
		        fieldLabel: '课程封面',
		        name: 'cover',		        
		        emptyText:'cover',
		        msgTarget:'cover',
		        anchor:'100%',
		        listeners:{
		        	scope:this,
		        	focus:function(textField){
		        		me.createResourcesBrowseWindow(textField);
		        	}
		        }
		    },		    
		    {
		        fieldLabel: '课程名称',
		        name: 'kcmc',
		        allowBlank:false,
		        emptyText:'课程名称',
		        msgTarget:'课程名称',
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '课程英文名称',
		        name: 'kcywmc',		       
		        emptyText:'课程英文名称',
		        msgTarget:'课程英文名称',
		        anchor:'100%'  
		    },		    
		    {
		        fieldLabel: '课程要求',
		        name: 'kcyq',		        
		        emptyText:'课程要求',
		        msgTarget:'课程要求',
		        anchor:'100%'  
		    },	
		    {
		        fieldLabel: '网上教学状况',
		        name: 'wsjxzk',		        
		        emptyText:'网上教学状况',
		        msgTarget:'网上教学状况',
		        colspan:2,
		        anchor:'100%'  
		    },
		    {
		        fieldLabel: '课程简介',
		        xtype:'htmleditor',
		        name: 'kcjj',		        
		        emptyText:'课程简介',
		        msgTarget:'课程简介',
		        colspan:3,
		        width:830
		    }
		    
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                    
                '<p><b>ksxnd:</b> {ksxnd}</p><br>',              
                '<p><b>ksxqm:</b> {ksxqm}</p><br>',              
                '<p><b>kch:</b> {kch}</p><br>',              
                '<p><b>kclbm:</b> {kclbm}</p><br>',              
                '<p><b>xf:</b> {xf}</p><br>',              
                '<p><b>xs:</b> {xs}</p><br>',              
                '<p><b>charge:</b> {charge}</p><br>',              
                '<p><b>teacherId:</b> {teacherId}</p><br>',              
                '<p><b>cover:</b> {cover}</p><br>',              
                '<p><b>课程简介:</b> {kcjj}</p><br>'           
           );
		return tpl;
	},
	createResourcesBrowseWindow:function(textField){
		var win =Ext.create('desktop.app.eims.school.ResourcesBrowseWindow',{
			textField:textField
		});
		win.show();
		return win;
	},
	/**
	 * 增删改工具条
	 */
	getToolbar : function(){
		var tbar = [];				
		tbar.push(this.getAddButton());							
		tbar.push(this.getEditButton());				
		tbar.push(this.getDeleteButton());
		tbar.push(this.getImportButton());
		tbar.push(this.getExportButton());
		tbar.push(this.getDownloadTemplateButton());
		tbar.push(this.getDocumnetButton());
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
Ext.define('desktop.app.eims.school.model.Curriculum',{
	extend: 'Ext.data.Model',
	fields:[
	        {name:'id',type: 'int'},	   
	        {name:'ksxnd',type: 'string'},	   
	        {name:'ksxqm',type: 'string'},	   
	        {name:'kch',type: 'string'},	   
	        {name:'kclbm',type: 'string'},	   
	        {name:'xf',type: 'string'},	   
	        {name:'xs',type: 'string'},	   
	        {name:'charge',type: 'string'},	   
	        {name:'teacherId',type: 'string'},	   
	        {name:'cover',type: 'string'},	   	        
	        {name:'kcmc',type: 'string'},
	        {name:'kcywmc',type: 'string'},
	        {name:'kcyq',type: 'string'},
	        {name:'kcjj',type: 'string'},
	        {name:'kkkssj',type: 'string'},
	        {name:'kkjssj',type: 'string'},	        
	        {name:'wsjxzk',type: 'string'},
	        {name:'majorId',type:'int'}
	       ]
});