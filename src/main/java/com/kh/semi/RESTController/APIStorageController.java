package com.kh.semi.RESTController;

import com.kh.semi.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class APIStorageController {
    @Autowired
    private StorageService storageService;

    @PostMapping("delete.sto")
    public String deleteStorage(int storageNo) {
        int result = storageService.deleteStorage(storageNo);
        if (result > 0) {
            return "success";
        } else {
            return "fail";
        }
    }
}
