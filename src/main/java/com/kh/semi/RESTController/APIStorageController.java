package com.kh.semi.RESTController;

import com.kh.semi.domain.vo.Storage;
import com.kh.semi.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

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

    @GetMapping("/getStorageList")
    public ArrayList<Storage> getStorageList() {
        ArrayList<Storage> list = storageService.getStorageList();
        if (list == null) {
            System.out.println("Storage list is null");
        } else {
            System.out.println("Storage list : " + list);
        }
        return list;
    }

    @GetMapping("/searchStorage")
    public Storage searchStorage(int storageNo) {
        return storageService.searchStorage(storageNo);
    }
}
