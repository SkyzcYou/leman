package com.leman.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created with IntelliJ IDEA.
 * User: skyzc
 * Date: 2019/12/10
 * Time: 18:38
 * To change this template use File | Settings | File Templates.
 * Description:
 */
/**
*  动漫类型
* */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Type {
    private int id;
    private String name;
}