/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author user
 */
@Entity

public class Coreconf implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    private Integer confId;
    private String confTitle;
   
    private String acronym;
    @Size(max = 15)

    private String rank;

    private Boolean changed;
    @Size(max = 4)

    private String forcode;

    public Coreconf() {
    }

    public Coreconf(Integer confId) {
        this.confId = confId;
    }

    public Coreconf(Integer confId, String confTitle) {
        this.confId = confId;
        this.confTitle = confTitle;
    }

    public Integer getConfId() {
        return confId;
    }

    public void setConfId(Integer confId) {
        this.confId = confId;
    }

    public String getConfTitle() {
        return confTitle;
    }

    public void setConfTitle(String confTitle) {
        this.confTitle = confTitle;
    }

    public String getAcronym() {
        return acronym;
    }

    public void setAcronym(String acronym) {
        this.acronym = acronym;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public Boolean isChanged() {
        return changed;
    }

    public void setChanged(Boolean changed) {
        this.changed = changed;
    }

    public String getForcode() {
        return forcode;
    }

    public void setForcode(String forcode) {
        this.forcode = forcode;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (confId != null ? confId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Coreconf)) {
            return false;
        }
        Coreconf other = (Coreconf) object;
        if ((this.confId == null && other.confId != null) || (this.confId != null && !this.confId.equals(other.confId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Coreconf[ confId=" + confId + " ]";
    }
    
}
