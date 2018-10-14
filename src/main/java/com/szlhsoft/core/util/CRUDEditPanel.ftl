Ext.define('${_package}.${modules}.${model}',{
	extend:'desktop.app.comm.CRUDRowEditPanel',
	alias:'widget.${model}',
	moduleName:"${modules}",//请求模块名称
	controllersName:"${controller}",//请求控制器名称
	
	
	getStoreModel : function(){
		return '${_package}.${modules}.model.${model}';
	},
	getSearchFieldHeight : function(){
		return 200;
	},
	getSearchFields : function(){
		return[
		<#list fieldList as field>
		{
	        fieldLabel: '${field}',
	        name: 'filter_LIKE_${field}',	       
	        anchor:'100%'  
	    },
	    </#list>
	    ]
	},	
	getGridColumns:function(){
		var columns = [Ext.create('Ext.grid.RowNumberer'),
			<#list fieldList as field>
			{
				text:'${field}',
			    dataIndex:'${field}',
			    width:100,
			    editor: {
                    allowBlank: false
                },
				sortable:true	
			},		
			</#list>
		];
		return columns;
	},
	getWindowFormItems:function(){
		return[{
		    	xtype:'hidden',
		    	name:'id'
		    },
		    <#list fieldList as field>
		    {
		        fieldLabel: '${field}',
		        name: '${field}',
		        allowBlank:false,
		        emptyText:'${field}',
		        msgTarget:'${field}',
		        anchor:'100%'  
		    },
		    </#list>
		    ]
		    
	},	
	getRowBodyTpl:function(){
		var tpl=new Ext.XTemplate(
				<#list fieldList as field>
                '<p><b>${field}:</b> {${field}}</p><br>',              
                </#list>
           );
		return tpl;
	}
});
Ext.define('${_package}.${modules}.model.${model}',{
	extend: 'Ext.data.Model',
	fields:[
			<#list fieldList as field>
	        {name:'${field}',type: 'string'},	   
	        </#list>
	       ]
});