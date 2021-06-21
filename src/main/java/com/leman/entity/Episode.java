package com.leman.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created with IntelliJ IDEA.
 * User: skyzc
 * Date: 2019/12/10
 * Time: 18:37
 * To change this template use File | Settings | File Templates.
 * Description:
 */
/**
 *  Episode 一部动漫的一集
 * */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Episode {
    private int id;
    private int father_id;
    private String father_name;
    private int indexx;
    private String url;
}