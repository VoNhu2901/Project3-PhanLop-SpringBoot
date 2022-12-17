import React from "react";
import Footer from "../../components/footer/Footer";
import Discount from "../../components/services/Discount";
import ContainerProduct from "../../components/product/home/ContainerProduct";


export default function HomePage() {
    return (
        <>
            <ContainerProduct />
            <Discount />
            <Footer />
        </>

    );
}