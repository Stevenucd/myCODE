package com.steven.myCODE.model.dto.questionBank;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 创建questionBank请求
 *
 *
 * 
 */
@Data
public class QuestionBankAddRequest implements Serializable {

    /**
     * 标题
     */
    private String title;

    /**
     * description
     */
    private String description;

    /**
     * picture
     */
    private String picture;

    private static final long serialVersionUID = 1L;
}