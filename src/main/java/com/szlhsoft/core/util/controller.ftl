package com.szlhsoft.web.controller${_package};

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.szlhsoft.core.annotation.Ctl;
import com.szlhsoft.core.annotation.Method;
import com.szlhsoft.web.model${_package}.${model};
import com.szlhsoft.core.controller.${cextend};
import net.sf.json.JSONObject;
import com.szlhsoft.core.model.Constant;
import com.szlhsoft.core.model.Msg;
import com.szlhsoft.core.util.DateUtil;
import com.szlhsoft.core.util.XmlUtil;
<#if (controllerImports?has_content)>
	${controllerImports}
</#if>

/**
 * ${desc} 控制器
 * 
 * @author he
 */
@Controller
@RequestMapping("${moduleName}/${controller}")
@Ctl(name="${desc}")
public class ${controller} extends ${cextend} {
	
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseBody
	@Method(name="保存")
	public Object save(${model} model) {
		return _Save(model);
	}
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	@Method(name="删除")
	public Object delete(String id) {
		return _Delete(${model}.class,id);
	}
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	@Method(name="更新")
	public Object update(${model} model) {
		return _Update(model);		
	}
	@RequestMapping(value="/search", method=RequestMethod.GET)
	@ResponseBody
	@Method(name="查询")
	public Object search() {
		return _Search(${model}.class);
	}
	@RequestMapping(value="/show", method=RequestMethod.POST)
	@ResponseBody
	@Method(name="查看")
	public ${model} show(Long id){
		return (${model})_Show(${model}.class, id);
	}
	@RequestMapping(value="/export", method=RequestMethod.GET)
    @ResponseBody
    @Method(name="导出excel")
    public Object export() {
        String sql="";
        return _Export(sql);
    }
	@RequestMapping(value="/importExcel", method=RequestMethod.GET)
	@ResponseBody
	@Method(name="导入excel")
	public Object importExcel(String excelFileName) {
		Msg msg=new Msg(Constant.importSuccessMessage,true);
		try{
			List<JSONObject>list=_Import(excelFileName);
			msg.setResult(list);
		}catch(Exception e){
			msg.setMsg(Constant.importFailMessage);
			msg.setSuccess(false);
		}
		return msg;
	}
	@RequestMapping(value="/downloadTemplate", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	@Method(name="下载excel导入模板")
	public Object downloadTemplate(){
		List<Map<String,Object>>urlList=XmlUtil.getElementObject(null);		
		String downloadPath=urlList.get(1).get("url").toString();
		String name=downloadPath+File.separator+"${desc}"+DateUtil.dataToStringDate(new Date())+".xls";
		File excel=new File(name);
		return genExcelTemplate(excel);
	}
	${controllerBusCode}
}
