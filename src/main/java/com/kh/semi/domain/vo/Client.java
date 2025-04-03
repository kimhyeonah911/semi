package com.kh.semi.domain.vo;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Client {
    private int clientId;
    private String clientName;
    private String clientCEO;
    private String clientPhone;
    private String clientAddress;
}
