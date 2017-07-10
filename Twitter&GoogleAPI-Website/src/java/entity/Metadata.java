package entity;

import javax.inject.Named;

@Named(value = "metadata")

public class Metadata {
   
    private String iso_language_code;
    private String result_type;

    
    public Metadata() {
    }

    public String getIso_language_code() {
        return iso_language_code;
    }

    public void setIso_language_code(String iso_language_code) {
        this.iso_language_code = iso_language_code;
    }

    public String getResult_type() {
        return result_type;
    }

    public void setResult_type(String result_type) {
        this.result_type = result_type;
    }

    

    
}

