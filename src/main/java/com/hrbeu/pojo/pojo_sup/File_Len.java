package com.hrbeu.pojo.pojo_sup;

import com.hrbeu.pojo.Document;
import com.hrbeu.pojo.File;
import com.hrbeu.pojo.User;

import java.util.Date;

public class File_Len  {
    private File file;
    private Double length;
    public File_Len(){}

    public Double getLength() {
        return length;
    }

    public File getFile() {
        return file;
    }

    public void setLength(Double length) {
        this.length = length;
    }

    public void setFile(File file) {
        this.file = file;
    }
    public File_Len(File file,Double length){
        this.file = file;
        this.length = length;
    }
}
