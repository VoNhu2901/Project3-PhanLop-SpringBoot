import { useState } from "react";
import Banner from "../../banner/Banner";
import Header from "../../header/Header";
import Services from "../../services/Service";
import "./css/bootstrap.min.css";
import "./css/font-awesome.min.css";
import "./css/home.css";
import "./css/jquery-ui.min.css";
import "./css/magnific-popup.css";
import "./css/owl.carousel.min.css";
import "./css/Pagination.css";
import "./css/slicknav.min.css";
import "./css/style.css";
import ListProduct from "./ListProduct";
import ListProductSelling from "./ListProductSelling";

function ContainerProduct() {
  const [loginStatus, setLoginStatus] = useState();
  // console.log("🚀 ~ file: ContainerProduct.jsx:23 ~ ContainerProduct ~ loginStatus", loginStatus)

  return (
    <>
      {/* <Header /> */}
      <Header
        status={loginStatus === "anonymousUser" ? false : true}
        name={loginStatus}
      />
      <Banner />
      <Services />
      <ListProduct setIsLogin={setLoginStatus} />
      <ListProductSelling setIsLogin={setLoginStatus} />
    </>
  );
}

export default ContainerProduct;
