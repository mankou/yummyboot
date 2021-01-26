package yummy.boot.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class TestObject implements Serializable {
    private static final long serialVersionUID = 1L;

    private String code;

    private Integer id;

    private String name;

    private Date createDate;



}