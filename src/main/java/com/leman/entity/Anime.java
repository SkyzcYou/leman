package com.leman.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created with IntelliJ IDEA.
 * User: skyzc
 * Date: 2019/12/10
 * Time: 18:34
 * To change this template use File | Settings | File Templates.
 * Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Anime {
    private int id;
    private String name;
    private String tip;
    private String pimage;
}