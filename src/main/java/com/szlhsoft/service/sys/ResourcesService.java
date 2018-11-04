package com.szlhsoft.service.sys;

import com.szlhsoft.core.util.AnnotationUtil;
import com.szlhsoft.core.util.XmlUtil;
import com.szlhsoft.dao.sys.ResourcesDaoI;
import com.szlhsoft.model.sys.Resources;
import net.sf.json.JSONObject;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.*;

@Service
public class ResourcesService implements ResourcesServiceI {
    @Autowired
    private ResourcesDaoI resourcesDaoI;
    private boolean flag = false;
    @Override
    public Map<String, Object> initResources() {
        String menuFile="modules.xml";
        String path=this.getClass().getClassLoader().getResource("").getPath()+"/config/";
        SAXReader saxReader = new SAXReader();
        boolean isUpdateModules=false;

        try{
            InputStream is = new FileInputStream(path+menuFile);
            InputStreamReader isr = new InputStreamReader(is, "UTF-8");
            Document document = saxReader.read(isr);

            Element root = document.getRootElement();
            isUpdateModules = Boolean.parseBoolean(root.attribute("isUpdateModules").getValue());
            this.flag=true;
            if(this.flag){
                resourcesDaoI.deleteAll();
                List<Map<String,String>> list= XmlUtil.getModules(path+menuFile);
                for(Map<String,String> m:list){
                    if(m.get("menu")!=null && !m.get("menu").toString().equals("")){
                        String modulesXmlFile=path+m.get("menu");
                        String modules=m.get("name").toString();
                        String modulesName=m.get("text").toString();
                        String packageName=m.get("package").toString();
                        InputStream isModules = new FileInputStream(modulesXmlFile);
                        InputStreamReader isrModules = new InputStreamReader(isModules, "UTF-8");
                        Document documentModules = saxReader.read(isrModules);
                        Element rootModules = documentModules.getRootElement();
                        toSaveMenus(rootModules,null,modules,modulesName,packageName);
                    }
                }

            }
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<JSONObject> getNode(List<Resources> list,List<JSONObject>nodeList,String id){
        //List<JSONObject> nodeList =new ArrayList();
        for(Resources mL:list){
            JSONObject node=new JSONObject();
            if(mL.getPid()!=null && id.equals(String.valueOf(mL.getPid()))){
                Boolean l=mL.getLeaf();
                String s=l.toString();
                Boolean leaf=false;
                if(s.equals("0")){
                    leaf=false;
                }else{
                    leaf=true;
                }
                //Boolean leaf=Boolean.parseBoolean(String.valueOf(mL.getLeaf()));
                node.put("id", mL.getId());
                node.put("leaf", leaf);
                node.put("xtype", mL.getXtype());
                node.put("text", mL.getText());
                node.put("qtip",mL.getQtip());
                node.put("iconCls", mL.getIconcls());
                if(!leaf){
                    List<JSONObject> cList=new ArrayList();
                    JSONObject js=new JSONObject();
                    cList=getNode(list,cList,String.valueOf(mL.getId()));
                    node.put("children", cList);

                }else{

                }
                nodeList.add(node);
            }
        }
        return nodeList;
    }
    @Override
    public Map<String, Object> getResources() {
        Map<String,Object> menu=new HashMap();
        String modulesXmlFile=this.getClass().getClassLoader().getResource("").getPath()+"/config/modules.xml";
        List<Map<String,String>> modulesList=XmlUtil.getModules(modulesXmlFile);
        for(Map<String,String> m:modulesList){
            if(m.get("menu")!=null && !m.get("menu").toString().equals("") && m.get("name")!=null && !m.get("name").toString().equals("")){

                List<Resources> resourcesList=resourcesDaoI.select(m.get("name").toString());
                List<JSONObject> list=new ArrayList();
                for(Resources  mL:resourcesList){
                    if(mL.getPid()==null){
                        Boolean l=mL.getLeaf();
                        String s=l.toString();
                        Boolean leaf=false;
                        if(s.equals("0")){
                            leaf=false;
                        }else{
                            leaf=true;
                        }

                        JSONObject js=new JSONObject();
                        js.put("id", mL.getId());
                        js.put("leaf", leaf);
                        js.put("xtype", mL.getXtype());
                        js.put("text", mL.getText());
                        js.put("qtip",mL.getQtip());
                        js.put("iconCls", mL.getIconcls());
                        //JSONObject node=new JSONObject();
                        List<JSONObject> node=new ArrayList();
                        node=getNode(resourcesList,node,String.valueOf(mL.getId()));
                        js.put("children",node);
                        list.add(js);
                    }

                }
                menu.put(m.get("name"), list);
            }
        }
        return menu;
    }
    public void toSaveMenus(Element element, Resources parentResources, String modules, String modulesName, String packageName) {
        int i = 0;
        for (Iterator iterInner = element.elementIterator(); iterInner.hasNext();) {
            Element elementInner = (Element) iterInner.next();
            Resources resources = new Resources();
            // 获取person节点的text属性的值
            if(parentResources !=null && parentResources.getId()!=null ){
                resources.setPid(parentResources.getId());
            }
            resources.setModules(modules);
            resources.setModulesname(modulesName);
            resources.setOrdernum(Integer.valueOf(i));
            i++;
            Attribute textAttr = elementInner.attribute("text");
            if (textAttr != null) {
                String text = textAttr.getValue();
                if (text != null && !text.equals("")) {
                    resources.setText(text);
                    resources.setQtip(text);
                }
            }
            Attribute xtypeAttr = elementInner.attribute("xtype");
            if (xtypeAttr != null) {
                String xtype = xtypeAttr.getValue();
                if (xtype != null && !xtype.equals("")) {
                    resources.setXtype(xtype);
                    resources.setLeaf(true);
                }else{
                    resources.setLeaf(false);
                }
            }else{
                resources.setLeaf(false);
            }
            Attribute ctlAttr = elementInner.attribute("ctl");
            if(ctlAttr!=null){
                String ctl=ctlAttr.getValue();
                if(ctl !=null && !ctl.equals("")){
                    resources.setCtl(ctl);

                }
            }
            Attribute displayAttr = elementInner.attribute("display");
            if(displayAttr!=null){
                Boolean display=Boolean.valueOf(displayAttr.getValue());
                if(display !=null && !display.equals("")){
                    resources.setDisplay(display);

                }
            }
            resourcesDaoI.insertSelective(resources);
            if(resources.getCtl()!=null && !resources.getCtl().equals("")){
                String c=packageName+'.'+resources.getCtl();
                List<Map<String,String>> list =new ArrayList();
                list= AnnotationUtil.getCtlAnnotationConfig(c);
                saveCtlConfigInfo(list,resources,modules,modulesName);
            }
            toSaveMenus(elementInner, resources,modules,modulesName,packageName);
        }
    }
    public void saveCtlConfigInfo(List<Map<String,String>>list,Resources parentResources,String modules,String modulesName){
        for(Map m:list){
            Resources resources =new Resources();
            resources.setPid(parentResources.getId());
            resources.setModules(modules);
            resources.setModulesname(modulesName);
            resources.setCtl(parentResources.getCtl());
            resources.setXtype(parentResources.getXtype());
            if(m.containsKey("method") && m.get("method") !=null){
                String url=parentResources.getCtl()+'.'+m.get("method").toString();
                resources.setUrl(url);
                resources.setMethod(m.get("method").toString());
                resources.setMethodname(m.get("method").toString());

            }
            if(m.containsKey("methodName") && m.get("methodName") !=null){
                resources.setMethodname(m.get("methodName").toString());
                resources.setText(m.get("methodName").toString());
                resources.setQtip(m.get("methodName").toString());
            }
            resourcesDaoI.insertSelective(resources);
        }

    }
}
