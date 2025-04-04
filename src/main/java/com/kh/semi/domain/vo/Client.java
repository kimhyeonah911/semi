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
    private String clientCeo;
    private String clientPhone;
    private String clientAddress;
    private String status;
}
