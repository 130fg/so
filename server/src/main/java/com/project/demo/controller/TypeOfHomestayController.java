package com.project.demo.controller;

import com.project.demo.entity.TypeOfHomestay;
import com.project.demo.service.TypeOfHomestayService;
import com.project.demo.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.*;


/**
 * 民宿类型：(TypeOfHomestay)表控制层
 *
 */
@RestController
@RequestMapping("/type_of_homestay")
public class TypeOfHomestayController extends BaseController<TypeOfHomestay, TypeOfHomestayService> {

    /**
     * 民宿类型对象
     */
    @Autowired
    public TypeOfHomestayController(TypeOfHomestayService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        return success(1);
    }

}
