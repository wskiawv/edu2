package com.szlhsoft.model;

import java.math.BigDecimal;
import java.util.Date;

public class Curriculum {
    private Long id;

    private BigDecimal charge;

    private String cover;

    private String kch;

    private String kcjj;

    private String kclbm;

    private String kcmc;

    private String kcyq;

    private String kcywmc;

    private Date kkjssj;

    private Date kkkssj;

    private String ksxnd;

    private String ksxqm;

    private String status;

    private String wsjxzk;

    private Integer xf;

    private Integer xs;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BigDecimal getCharge() {
        return charge;
    }

    public void setCharge(BigDecimal charge) {
        this.charge = charge;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover == null ? null : cover.trim();
    }

    public String getKch() {
        return kch;
    }

    public void setKch(String kch) {
        this.kch = kch == null ? null : kch.trim();
    }

    public String getKcjj() {
        return kcjj;
    }

    public void setKcjj(String kcjj) {
        this.kcjj = kcjj == null ? null : kcjj.trim();
    }

    public String getKclbm() {
        return kclbm;
    }

    public void setKclbm(String kclbm) {
        this.kclbm = kclbm == null ? null : kclbm.trim();
    }

    public String getKcmc() {
        return kcmc;
    }

    public void setKcmc(String kcmc) {
        this.kcmc = kcmc == null ? null : kcmc.trim();
    }

    public String getKcyq() {
        return kcyq;
    }

    public void setKcyq(String kcyq) {
        this.kcyq = kcyq == null ? null : kcyq.trim();
    }

    public String getKcywmc() {
        return kcywmc;
    }

    public void setKcywmc(String kcywmc) {
        this.kcywmc = kcywmc == null ? null : kcywmc.trim();
    }

    public Date getKkjssj() {
        return kkjssj;
    }

    public void setKkjssj(Date kkjssj) {
        this.kkjssj = kkjssj;
    }

    public Date getKkkssj() {
        return kkkssj;
    }

    public void setKkkssj(Date kkkssj) {
        this.kkkssj = kkkssj;
    }

    public String getKsxnd() {
        return ksxnd;
    }

    public void setKsxnd(String ksxnd) {
        this.ksxnd = ksxnd == null ? null : ksxnd.trim();
    }

    public String getKsxqm() {
        return ksxqm;
    }

    public void setKsxqm(String ksxqm) {
        this.ksxqm = ksxqm == null ? null : ksxqm.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getWsjxzk() {
        return wsjxzk;
    }

    public void setWsjxzk(String wsjxzk) {
        this.wsjxzk = wsjxzk == null ? null : wsjxzk.trim();
    }

    public Integer getXf() {
        return xf;
    }

    public void setXf(Integer xf) {
        this.xf = xf;
    }

    public Integer getXs() {
        return xs;
    }

    public void setXs(Integer xs) {
        this.xs = xs;
    }
}