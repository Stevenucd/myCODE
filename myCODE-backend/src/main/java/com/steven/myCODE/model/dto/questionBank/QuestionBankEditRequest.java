package com.steven.myCODE.model.dto.questionBank;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 编辑questionBank请求
 *
 *
 * 
 */
@Data
public class QuestionBankEditRequest implements Serializable {

    /**
     * id
     */
    private Long id;

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