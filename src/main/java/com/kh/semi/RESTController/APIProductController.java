package com.kh.semi.RESTController;

import com.kh.semi.domain.vo.Category;
import com.kh.semi.domain.vo.Client;
import com.kh.semi.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
public class APIProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/categoryList")
    public ArrayList<Category> getCategoryList() {
        ArrayList<Category> list = productService.getCategoryList();
        if (list == null) {
            System.out.println("category list null");
        } else {
            System.out.println("category list: " + list);
        }
        return list;
    }

    @GetMapping("/categoryList")
    public ArrayList<Client> getClientList() {
        ArrayList<Client> list = productService.getClientList();
        if (list == null) {
            System.out.println("client list null");
        } else {
            System.out.println("client list: " + list);
        }
        return list;
    }

    @PostMapping("/updateProductPause")
    public ResponseEntity<?> updateProductPause(@RequestParam("productNos") String productNos) { //1,2,3이런 형태로 들어옴
        //1,2,3 형태로 들어온 번호들을 리스트로 추출
        List<Integer> productNoList = Arrays.stream(productNos.split(",")) //split -> ["1", "2", "3" ..]배열로 바뀜 //Arrays.stream -> Stream<String> = "1", "2", ..형태로 변환
                                            .map(Integer::parseInt) //"1"를 1로 변환 (문자열을 숫자로 변)
                                            .toList(); //최종적으로 숫자 리스트로 변환

        int result = productService.updateProductPause(productNoList);

        if (result > 0){
            return ResponseEntity.ok(Collections.singletonMap("success", true));
        } else {
            return ResponseEntity.ok(Collections.singletonMap("success", false));
        }
    }

    @PostMapping("/updateProductDelete")
    public ResponseEntity<?> updateProductDelete(@RequestParam("productNos") String productNos) { //1,2,3이런 형태로 들어옴
        //1,2,3 형태로 들어온 번호들을 리스트로 추출
        List<Integer> productNoList = Arrays.stream(productNos.split(",")) //split -> ["1", "2", "3" ..]배열로 바뀜 //Arrays.stream -> Stream<String> = "1", "2", ..형태로 변환
                .map(Integer::parseInt) //"1"를 1로 변환 (문자열을 숫자로 변)
                .toList(); //최종적으로 숫자 리스트로 변환

        int result = productService.updateProductDelete(productNoList);

        if (result > 0){
            return ResponseEntity.ok(Collections.singletonMap("success", true));
        } else {
            return ResponseEntity.ok(Collections.singletonMap("success", false));
        }
    }

}
