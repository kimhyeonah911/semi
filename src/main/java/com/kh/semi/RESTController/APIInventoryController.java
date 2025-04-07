package com.kh.semi.RESTController;

import com.kh.semi.domain.vo.Inventory;
import com.kh.semi.domain.vo.Stock;
import com.kh.semi.service.InventoryService;
import com.kh.semi.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("/api")
public class APIInventoryController {

    @Autowired
    private InventoryService inventoryService;

    @GetMapping("/getInventoryList")
    public ArrayList<Inventory> getInventoryList(){
        ArrayList<Inventory> list = inventoryService.getInventoryList();
        if(list == null){
            System.out.println("inventory list is null");
        } else {
            System.out.println("inventory list : " + list);
        }
        return inventoryService.getInventoryList();
    }

    @GetMapping("/searchInventoryList")
    public ArrayList<Inventory> searchInventoryList( @RequestParam(required = false) String selectedStorageNo,
                                                     @RequestParam(required = false) String searchedKeyword){
        Integer storageNo = (selectedStorageNo != null && !selectedStorageNo.isEmpty()) ? Integer.parseInt(selectedStorageNo) : null;
        String keyword = searchedKeyword != null ? searchedKeyword.toLowerCase().trim() : "";

        ArrayList<Inventory> list = inventoryService.searchInventoryList(storageNo, keyword);

        return list;
    }
}
