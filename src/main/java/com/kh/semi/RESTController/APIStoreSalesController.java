package com.kh.semi.RESTController;

import com.kh.semi.service.StoresalesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class APIStoreSalesController {
    @Autowired
    private StoresalesService storesalesService;


}
