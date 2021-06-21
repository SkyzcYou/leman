package com.leman.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created with IntelliJ IDEA.
 * User: skyzc
 * Date: 2019/12/10
 * Time: 18:33
 * To change this template use File | Settings | File Templates.
 * Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int id;
    private String email;
    private String password;
    private String username;
    private String gender;
}