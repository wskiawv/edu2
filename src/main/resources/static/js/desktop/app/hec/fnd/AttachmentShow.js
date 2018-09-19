Ext.define('desktop.app.hec.fnd.AttachmentShow',{
	extend:'desktop.app.comm.ShowGrid',
	alias:['widget.AttachmentShow'],
	
	
	moduleName:"fnd",//请求模块名称    
	controllersName:"AttachmentShows",//请求控制器名称
	 
    getStoreModel : function(){
		return 'desktop.app.hec.fnd.model.AttachmentShow';
	},

    /**
     * 搜索panel的高度
     * @return {Number}
     */
    getSearchFieldHeight : function(){
    	return 100;
    },    
    
    detailNewWindow:function(header_id){
    	
    },
    cellClick:function(grid,td,cellIndex,record,tr,rowIndex,e){
    	var header_id=record.get('attachment_id');
    	var me=this;
    	if(cellIndex==3){    		    		
        	me.detailNewWindow(header_id);
    	}
    	
    },
    getGridColumns : function(){ 
    	var me=this;
    	
    	var columns=[Ext.create('Ext.grid.RowNumberer',{
			    		width:35,
						text:'序号'
    				}),{        	
			         	text:'文件类型',
			         	width:80,
			         	dataIndex:'file_type',
			         	sortable:true,
			         	renderer:function(value){
		            		var iconxtype=value.toLocaleLowerCase();
							return Ext.String.format('<img src="js/desktop/images/{0}.gif" class="doc"/>',iconxtype);
		            	}
			         },{
			         	text:'文件名',
			         	dataIndex:'file_name',
			         	width:150,
			         	sortable:true
			         },{
			         	text:'文件大小',
			         	dataIndex:'file_size',
			         	width:100,
			         	sortable:true,
			         	renderer:function(value){
			         		if(value>=0){
			         			return Ext.util.Format.fileSize(value);
			         		}else{
			         			return value;
			         		}
			         	}
				     },{
			         	text:'上传用户',
			         	dataIndex:'userName',
			         	width:100,
			         	sortable:true			         	
				     },{
			         	text:'上传时间',
			         	dataIndex:'uploadDate',
			         	width:150,
			         	sortable:true			         	
				     },{
			            xtype:'actioncolumn',
			            width:100,
			            text:'操作',
			            items: [{
			                //icon: 'extjs/examples/shared/icons/fam/cog_edit.png',  // Use a URL in the icon config
			                tooltip: '预览',
			                iconCls:'preview',
			                width:50,
			                handler: function(grid, rowIndex, colIndex) {
			                    var rec = grid.getStore().getAt(rowIndex);
			                    //alert("Edit " + rec.get('firstname'));
			                }
			            },{
			                //icon: 'extjs/examples/restful/images/delete.png',
			                tooltip: '下载',
			                iconCls:'download',
			                width:50,
			                handler: function(grid, rowIndex, colIndex) {
			                    var rec = grid.getStore().getAt(rowIndex);
			                    var attachment_id=rec.get('attachment_id');
			                    var url=appPath+"/"+me.getUrl()+'/download?attachment_id='+attachment_id;
			                    window.open(url);
			                    //alert("Terminate " + rec.get('firstname'));
			                }
			            },{
			                //icon: 'extjs/examples/restful/images/delete.png',
			                tooltip: '删除',
			                iconCls:'delete',
			                width:50,
			                handler: function(grid, rowIndex, colIndex) {
			                    var rec = grid.getStore().getAt(rowIndex);
			                    var attachment_id=rec.get('attachment_id');
			                    Ext.Msg.confirm("温馨提醒","只有上传用户本人或者管理员才可以删除附件，确定删除附件？",function(btn, text){			            			
			            			if(btn == 'yes'){
			            				Ext.Ajax.request({
			            					url : me.getUrl()+"/remove",
			            					params : {"attachment_id": attachment_id},
			            					success : function(response){
			            						  var text = response.responseText;
			            						  var result=Ext.decode(text);
			            						  Ext.example.msg('温馨提醒',result.content);
			            						  Ext.Msg.alert('温馨提醒',result.content);		            						
			            					},
			            					failure:function(response){
			            						
			            						  Ext.example.msg('温馨提醒',"请求失败！");
			            					}
			            				});
			            			}			
			            		});
			                }
			            }]
			        }]
    	return columns;
    },
    getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'attachment_id'
		    }	    
		    ]
		    
	},	
    getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(                      
                '<p><b>文件名:</b> {file_name}</p><br>'           
                            
           );
		return tpl;
	},
    /**
     * 配置搜索字段
     * @return {}
     */
    getSearchFields: function(){
		return [{
				fieldLabel: '报销单编号',
				name: 'expReportNumber',
				anchor: '100%'
			},{
				fieldLabel: '描述',
				name: 'description',
				anchor: '100%'		
			
			},{
				fieldLabel:'申请人',
				name:'employee_name',
				fieldCls:'userWin',
				listeners:{
		        	scope:this,
		        	focus:function(textField){
		        		var win=Ext.create('desktop.app.hec.sys.Employee',{
		        			textField:textField,
		        			returnFieldName:'name',
		        			title:'员工查询',	        			
		        			width:800,
		        			height:600,
		        		});
		        		win.show();
		        	}
		        }
			}]
		
	}
});
Ext.define('desktop.app.hec.fnd.model.AttachmentShow',{
	extend: 'Ext.data.Model',
	fields:[ 
            {name: 'attachment_id'},
            {name: 'table_name'},
            {name: 'table_pk_value'},
            {name: 'file_name'},
            {name: 'file_size'},
            {name: 'file_type'},
            {name: 'userName'},
            {name:'created_by'},
            {name:'uploadDate'}
	       ]
});
