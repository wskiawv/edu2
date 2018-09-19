(function() {
    function getQueryParam(name, queryString) {
        var match = RegExp(name + '=([^&]*)').exec(queryString || location.search);
        return match && decodeURIComponent(match[1]);
    }

    function hasOption(opt) {
        var s = window.location.search;
        var re = new RegExp('(?:^|[&?])' + opt + '(?:[=]([^&]*))?(?:$|[&])', 'i');
        var m = re.exec(s);

        return m ? (m[1] === undefined ? true : m[1]) : false;
    }

    var scriptTags = document.getElementsByTagName('script'),
        defaultTheme = 'classic',
        defaultRtl = false,
        i = scriptTags.length,
        requires = [
            'Ext.toolbar.Toolbar',
            'Ext.form.field.ComboBox',
            'Ext.form.FieldContainer',
            'Ext.form.field.Radio'

        ],
        defaultQueryString, src, theme, rtl;

    while (i--) {
        src = scriptTags[i].src;
        if (src.indexOf('include-ext.js') !== -1) {
            defaultQueryString = src.split('?')[1];
            if (defaultQueryString) {
                defaultTheme = getQueryParam('theme', defaultQueryString) || defaultTheme;
                defaultRtl = getQueryParam('rtl', defaultQueryString) || defaultRtl;
            }
            break;
        }
    }

    Ext.themeName = theme = getQueryParam('theme') || defaultTheme;
    
    rtl = getQueryParam('rtl') || defaultRtl;

    if (rtl.toString() === 'true') {
        requires.push('Ext.rtl.*');
        Ext.define('Ext.GlobalRtlComponent', {
            override: 'Ext.AbstractComponent',
            rtl: true
        });
    }

    Ext.require(requires);

    Ext.onReady(function() {
        Ext.getBody().addCls(Ext.baseCSSPrefix + 'theme-' + Ext.themeName);

        if (Ext.isIE6 && theme === 'neptune') {
            Ext.Msg.show({
                title: 'Browser Not Supported',
                msg: 'The Neptune theme is not supported in IE6.',
                buttons: Ext.Msg.OK,
                icon: Ext.Msg.WARNING
            });
        }
        
        if (hasOption('nocss3')) {
            Ext.supports.CSS3BorderRadius = false;
            Ext.getBody().addCls('x-nbr x-nlg');
        }
        function setParam(param) {
            var queryString = Ext.Object.toQueryString(
                Ext.apply(Ext.Object.fromQueryString(location.search), param)
            );
            location.search = queryString;
        }

        function removeParam(paramName) {
            var params = Ext.Object.fromQueryString(location.search);

            delete params[paramName];

            location.search = Ext.Object.toQueryString(params);
        }

        var toolbar;
            
        setTimeout(function() {
        	var url=appPath+"/sys/Roles/select";
    		var store=Ext.create('Ext.data.JsonStore',{
    			autoLoad: false,
    			fields: [{name : 'role_id'}, 
    			         {name : 'user_role_group_id'},
    			         {name : 'user_id'},
    			         {name:'role_company'},
    			         {name:'role_company_name'},
    			         {name : 'company_id'}],				
    			proxy : {
    				type : 'ajax',
    				url:url,
    				reader : {
    					type : 'json',
    					totalProperty : 'totalCount',
    					root : 'result'
    				},
    				simpleSortMode : true
    			}
    			
    		});
    		var params={user_id:user_id};
    		Ext.apply(store.proxy.extraParams,params);
    		//store.load();
    		var record=null;
            toolbar = Ext.widget({
                xtype: 'toolbar',
                border: true,
                rtl: false,
                id: 'options-toolbar',
                floating: true,
                fixed: true,
                preventFocusOnActivate: true,
                draggable: {
                    constrain: true
                },
                items: [{
        			xtype:'combobox',
        			fieldLabel:'角色',
        			name:'role_id',
        			store: store,
        		    queryMode: 'remote',
        		    displayField: 'role_company_name',
        		    valueField: 'role_id',
        		    autoScroll:true,
        		    width:300,
        		    //allowBlank:false,
        		    labelWidth: 45,
        			listWidth:600,
        			maxWidth:600,
        			minWidth:300,
        			matchFieldWidth:false,
        			labelStyle: 'cursor:move;',
                    margin: '0 5 0 0',
        			listeners:{
        				select:function(combo, records,e){
        					var val=combo.getValue();
        					var record=records[0];
        					var params=record.data;
        					var url=appPath+"/role_select";
        					Ext.Ajax.request({
            		            url: url,
            		            params:params,
            		            success: function(response){
            		                var text = response.responseText;
            		                var result=Ext.decode(text);
            		                if(result.success){
            		               		Ext.example.msg("温馨提示","登陆成功");
            		               		window.location.href=appPath+"/login";
            		                }else{
            		                	Ext.example.msg("温馨提示","登陆失败!");
            		                }
            		              
            		            },
            		            failure:function(){
            		               Ext.example.msg('温馨提醒',"登陆失败!");
            		             
            		            }
            		        });
        					
        				}
        			}
        		}, {
                    xtype: 'combo',
                    rtl: false,
                    width: 170,
                    labelWidth: 45,
                    fieldLabel: '主题',
                    displayField: 'name',
                    valueField: 'value',
                    labelStyle: 'cursor:move;',
                    margin: '0 5 0 0',
                    store: Ext.create('Ext.data.Store', {
                        fields: ['value', 'name'],
                        data : [
                            { value: 'access', name: '黑色' },
                            { value: 'classic', name: '经典' },
                            { value: 'gray', name: '灰色' },
                            { value: 'neptune', name: '自然' }
                        ]
                    }),
                    value: theme,
                    listeners: {
                        select: function(combo) {
                            var theme = combo.getValue();
                            if (theme !== defaultTheme) {
                                setParam({ theme: theme });
                            } else {
                                removeParam('theme');
                            }
                        }
                    }
                },{
                    xtype: 'button',
                    rtl: false,
                    hidden: !(Ext.repoDevMode || location.href.indexOf('qa.sencha.com') !== -1),
                    enableToggle: true,
                    pressed: rtl,
                    text: 'RTL',
                    margin: '0 5 0 0',
                    listeners: {
                        toggle: function(btn, pressed) {
                            if (pressed) {
                                setParam({ rtl: true });
                            } else {
                                removeParam('rtl');
                            }
                        }
                    }
                }, {
                    xtype: 'tool',
                    type: 'close',
                    rtl: false,
                    handler: function() {
                    	 Ext.Msg.confirm('温馨提示', '你确定要关闭角色和系统主题选择工具条?闭关后，如果需求重新打开工具条，按F5刷新网页即可！',function(btn){
                         	if(btn=="yes"){ 
                         		toolbar.destroy();                         		
                         	}});
                        
                    }
                }],

                // Extra constraint margins within default constrain region of parentNode
                constraintInsets: '0 -' + (Ext.getScrollbarSize().width + 4) + ' 0 0'
            });
            toolbar.show();
            toolbar.alignTo(
                document.body,
                Ext.optionsToolbarAlign || 'tr-tr',
                [
                    (Ext.getScrollbarSize().width + 4) * (Ext.rootHierarchyState.rtl ? 1 : -1),
                    -(document.body.scrollTop || document.documentElement.scrollTop)
                ]
            );
            
            var constrainer = function() {
                toolbar.doConstrain();
            };
            
            Ext.EventManager.onWindowResize(constrainer);
            toolbar.on('destroy', function() { 
                Ext.EventManager.removeResizeListener(constrainer);
            });
        }, 100);

    });
})();