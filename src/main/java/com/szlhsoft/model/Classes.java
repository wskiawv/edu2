package com.szlhsoft.model;

public class Classes {
    private Integer id;

    private String bh;

    private String bjmc;

    private String jbny;

    private Integer schoolid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBh() {
        return bh;
    }

    public void setBh(String bh) {
        this.bh = bh == null ? null : bh.trim();
    }

    public String getBjmc() {
        return bjmc;
    }

    public void setBjmc(String bjmc) {
        this.bjmc = bjmc == null ? null : bjmc.trim();
    }

    public String getJbny() {
        return jbny;
    }

    public void setJbny(String jbny) {
        this.jbny = jbny == null ? null : jbny.trim();
    }

    public Integer getSchoolid() {
        return schoolid;
    }

    public void setSchoolid(Integer schoolid) {
        this.schoolid = schoolid;
    }
}