package com.leman.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created with IntelliJ IDEA.
 * User: skyzc
 * Date: 2019/12/9
 * Time: 23:26
 * To change this template use File | Settings | File Templates.
 * Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Books {
    public int bookID;
    private String bookName;
    private int bookCounts;
    private String detail;
}