package com.nashtech.ecommercialwebsite.data.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "cart_detail")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CartDetail {
    @EmbeddedId
    CartDetailId id;
    @ManyToOne
    @MapsId("cartID")
    @JoinColumn(name = "cart_id")
    Cart cart;
    @ManyToOne
    @MapsId("productID")
    @JoinColumn(name = "product_id")
    Product product;
    @Column(name = "quantity")
    private Integer quantity;
    @Column(name = "actived")
    private Boolean actived = true;
}
