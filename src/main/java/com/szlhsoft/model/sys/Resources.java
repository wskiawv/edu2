package com.szlhsoft.model.sys;

public class Resources {
    private Long menuId;

    private String iconcls;

    private Long leaf;

    private String modules;

    private Long ordernum;

    private String qtip;

    private String text;

    private String xtype;

    private Long pid;

    private String ctl;

    private String methodname;

    private String methoddesc;

    private String modulesname;

    private String url;

    private Long display;

    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long menuId) {
        this.menuId = menuId;
    }

    public String getIconcls() {
        return iconcls;
    }

    public void setIconcls(String iconcls) {
        this.iconcls = iconcls == null ? null : iconcls.trim();
    }

    public Long getLeaf() {
        return leaf;
    }

    public void setLeaf(Long leaf) {
        this.leaf = leaf;
    }

    public String getModules() {
        return modules;
    }

    public void setModules(String modules) {
        this.modules = modules == null ? null : modules.trim();
    }

    public Long getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(Long ordernum) {
        this.ordernum = ordernum;
    }

    public String getQtip() {
        return qtip;
    }

    public void setQtip(String qtip) {
        this.qtip = qtip == null ? null : qtip.trim();
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text == null ? null : text.trim();
    }

    public String getXtype() {
        return xtype;
    }

    public void setXtype(String xtype) {
        this.xtype = xtype == null ? null : xtype.trim();
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getCtl() {
        return ctl;
    }

    public void setCtl(String ctl) {
        this.ctl = ctl == null ? null : ctl.trim();
    }

    public String getMethodname() {
        return methodname;
    }

    public void setMethodname(String methodname) {
        this.methodname = methodname == null ? null : methodname.trim();
    }

    public String getMethoddesc() {
        return methoddesc;
    }

    public void setMethoddesc(String methoddesc) {
        this.methoddesc = methoddesc == null ? null : methoddesc.trim();
    }

    public String getModulesname() {
        return modulesname;
    }

    public void setModulesname(String modulesname) {
        this.modulesname = modulesname == null ? null : modulesname.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }
    public Long getDisplay() {
        return display;
    }

    public void setDisplay(Long display) {
        this.display = display;
    }
}
