package com.jtspringproject.JtSpringProject.controller;


import lombok.Data;

import java.net.URI;

@Data
public class CreatedOrder {
    private final String orderId;
    private final URI approvalLink;
}