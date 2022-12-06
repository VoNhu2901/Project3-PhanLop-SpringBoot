package com.nashtech.ecommercialwebsite.dto.response;

import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class CartResponse {

    List<CartItemsResponse> cartDetails = new ArrayList<>();
    private int cartId;
    private int totalPrice;
}
