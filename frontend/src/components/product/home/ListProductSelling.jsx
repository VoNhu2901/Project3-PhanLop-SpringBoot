import { useEffect, useState } from "react";
import ReactPaginate from "react-paginate";
import { Link, useParams } from "react-router-dom";
import CartService from "../../../services/CartService";
import PriceFormatterService from "../../../services/PriceFormatterService";
import ProductService from "../../../services/ProductService";
import "./css/bootstrap.min.css";
import "./css/font-awesome.min.css";
import "./css/home.css";
import "./css/jquery-ui.min.css";
import "./css/magnific-popup.css";
import "./css/owl.carousel.min.css";
import "./css/Pagination.css";
import "./css/slicknav.min.css";
import "./css/style.css";

function ListProductSelling(props) {
  const { brandName } = useParams();
  const { gender } = useParams();
  const [brand, setBrand] = useState();
  const [sex, setSex] = useState("");

  const PRODUCTS_API_BASE_URL = "http://localhost:8080/user/api/products/selling";

  const PRODUCTS_BY_BRAND_API_BASE_URL = `http://localhost:8080/user/api/products/brand/${brandName}`;

  const PRODUCTS_BY_GENDER_API_BASE_URL = `http://localhost:8080/user/api/products/gender/${gender}`;

  const [products, setProducts] = useState([]);

  //pagination
  const [pageNo, setPageNo] = useState(0);
  const [pageSize, setPageSize] = useState();
  const [totalPage, setTotalPage] = useState();
  const [loginStatus, setLoginStatus] = useState();
  // console.log("🚀 ~ file: ListProduct.jsx:36 ~ ListProduct ~ loginStatus", loginStatus)
  props.setIsLogin(loginStatus);

  //change page
  const changePage = ({ selected }) => {
    setPageNo(selected);
  };

  //fetch product info
  const fetchProducts = () => {
    const token = localStorage.getItem("accessToken");
    const params = {
      params: {
        pageNo: pageNo,
      },
      headers: {
        Authorization: `Bearer ${token}`,
      },
    };
    if (brandName) {
      setBrand(` ${brandName} Product`);
      ProductService.getProducts(PRODUCTS_BY_BRAND_API_BASE_URL, params).then(
        (res) => {
          setProducts(res.data.productContent);
          setPageNo(res.data.pageNo);
          setPageSize(res.data.pageSize);
          setTotalPage(res.data.totalPages);
          setLoginStatus(res.data.currentUser);
        }
      );
    } else if (gender) {
      setSex((gender == "true" ? "Men " : "Women ") + "Product");
      ProductService.getProducts(PRODUCTS_BY_GENDER_API_BASE_URL, params).then(
        (res) => {
          setProducts(res.data.productContent);
          setPageNo(res.data.pageNo);
          setPageSize(res.data.pageSize);
          setTotalPage(res.data.totalPages);
          setLoginStatus(res.data.currentUser);
        }
      );
    } else {
      ProductService.getProducts(PRODUCTS_API_BASE_URL, params).then((res) => {
        setProducts(res.data.productContent);
        setPageNo(res.data.pageNo);
        setPageSize(res.data.pageSize);
        setTotalPage(res.data.totalPages);
        setLoginStatus(res.data.currentUser);
      });
    }
  };

  //put product to cart
  const putProductToCart = (id) => {
    CartService.addProductToCart(id);
  };

  useEffect(() => {
    fetchProducts();
  }, [pageNo]);

  return (
    <>
      <div className="container-fluid pt-5">
        <div className="text-center mb-4">
          <h2 className="section-title px-5">
            <span className="px-2">SẢN PHẨM BÁN CHẠY</span>
          </h2>
          <br />
          <h5 className="section-title px-5">
            <span className="px-2">{brand}</span>
            <span className="px-2">{sex}</span>
          </h5>
        </div>
        <div
          className="row px-xl-5 pb-3"
          style={{ marginLeft: "20px", marginRight: "20px" }}
        >
          {products.map((product) => (
            <div className="col-lg-3 col-md-6 col-sm-12 pb-1" key={product.id}>
              <div
                className="card product-item border-0 mb-4"
                style={{ width: "105%", height: "85%" }}
              >
                <div className="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                  <img
                    className="img-fluid w-100"
                    src={product.thumbnail}
                    alt=""
                  />
                </div>
                <div className="card-body border-left border-right text-center p-0 pt-4 pb-3">
                  <h6 className="text-truncate mb-3">{product.name}</h6>
                  <div className="d-flex justify-content-center">
                    <h6>{PriceFormatterService.formatPrice(product.price)}</h6>
                    <h6 className="text-muted ml-2">
                      <del>
                        {PriceFormatterService.formatPrice(product.price)}
                      </del>
                    </h6>
                  </div>
                </div>
                <div className="card-footer d-flex justify-content-between bg-light border">
                  <Link
                    to={"/detail/" + product.id}
                    className="btn btn-sm text-dark p-0"
                    style={{ color: "blue" }}
                  >
                    <i></i>👁 View Detail
                  </Link>
                  <a
                    className="btn btn-sm text-dark p-0"
                    onClick={() => putProductToCart(product.id)}
                  >
                    <i></i>
                    🛒 Add To Cart
                  </a>
                </div>
              </div>
            </div>
          ))}
        </div>
        <ReactPaginate
          previousLabel={"Previous"}
          nextLabel={"Next"}
          pageCount={totalPage}
          onPageChange={changePage}
          containerClassName={"paginationBtns"}
          previousLinkClassName={"previousBtn"}
          nextClassName={"nextBtn"}
          disabledClassName={"paginationDisabled"}
          activeClassName={"paginationActive"}
        />
      </div>
    </>
  );
}

export default ListProductSelling;
