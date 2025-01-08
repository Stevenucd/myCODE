package com.steven.myCODE.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.steven.myCODE.annotation.AuthCheck;
import com.steven.myCODE.common.BaseResponse;
import com.steven.myCODE.constant.UserConstant;
import com.steven.myCODE.model.dto.question.QuestionQueryRequest;
import com.steven.myCODE.model.entity.Question;
import com.steven.myCODE.model.vo.QuestionVO;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;

/**
 * question服务
 *
 *
 * 
 */
public interface QuestionService extends IService<Question> {

    /**
     * 校验数据
     *
     * @param question
     * @param add 对创建的数据进行校验
     */
    void validQuestion(Question question, boolean add);

    /**
     * 获取查询条件
     *
     * @param questionQueryRequest
     * @return
     */
    QueryWrapper<Question> getQueryWrapper(QuestionQueryRequest questionQueryRequest);
    
    /**
     * 获取question封装
     *
     * @param question
     * @param request
     * @return
     */
    QuestionVO getQuestionVO(Question question, HttpServletRequest request);

    /**
     * 分页获取question封装
     *
     * @param questionPage
     * @param request
     * @return
     */
    Page<QuestionVO> getQuestionVOPage(Page<Question> questionPage, HttpServletRequest request);

    /**
     * 分页获取question列表（仅管理员可用）
     *
     * @param questionQueryRequest
     * @return
     */
    Page<Question> listQuestionByPage(@RequestBody QuestionQueryRequest questionQueryRequest);
}
