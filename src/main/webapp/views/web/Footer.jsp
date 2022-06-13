<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- start footer -->
<style>
    /* Popup container - can be anything you want */
    .popup1,
    .popup2{
        position: relative;
        display: inline-block;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    /* The actual popup */
    .popup1 .popuptext1 {
        font-style: italic;
        font-size: medium;
        line-height: 140%;
        visibility: hidden;
        width: 362px;
        background-color: #2d2c2c;
        color: #d0d0af;
        text-align: left;
        border-radius: 25px;
        padding: 8px 10px;
        position: absolute;
        z-index: 1;
        bottom: -130px;
        left: 2px;
        margin-left: -22px;
    }
    /* Toggle this class - hide and show the popup */
    .popup1 .show1 {
        visibility: visible;
        -webkit-animation: fadeIn 1s;
        animation: fadeIn 1s;
    }

    /* The actual popup */
    .popup2 .popuptext2 {
        font-style: italic;
        font-size: medium;
        line-height: 160%;
        visibility: hidden;
        width: 420px;
        background-color: #2d2c2c;
        color: #d0d0af;
        text-align: left;
        border-radius: 25px;
        padding: 8px 10px;
        position: absolute;
        z-index: 1;
        bottom: -172px;
        left: 2px;
        margin-left: -22px;
    }
    /* Toggle this class - hide and show the popup */
    .popup2 .show2 {
        visibility: visible;
        -webkit-animation: fadeIn 1s;
        animation: fadeIn 1s;
    }

    /* Add animation (fade in the popup) */
    @-webkit-keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity:1 ;
        }
    }

    .bonus{
        color: #93c7c7 !important;
        text-align: right;
        padding: 10px;
    }
    
    .span1_of_3 h3 {
        color: #fffefe;
    }

</style>
<div class="footer_top">
    <div class="wrap">
        <div class="footer">
            <!-- start grids_of_3 -->
            <div class="span_of_3">
                <div class="span1_of_3">
                    <h3>Về chúng tôi</h3>
                    <p>MenStore là trang web cửa hàng quần áo dành cho nam giới. Nơi mang đến cho bạn một góc nhìn hiện đại về thời trang công sở cho nam giới như áo sơ mi, suit, vest, quần tây, giày, ... MenStore là một lựa chọn sáng suốt cho những ai đang theo đuổi phong cách gọn gàng, lịch sự và có gu thẩm mỹ cao. Hơn nữa, shop còn có các chương trình ưu đãi, tích lũy điểm thưởng, sự kiện giảm giá vào các dịp lễ tết hàng năm.</p>
                </div>
                <div class="span1_of_3">
                    <div class="popup1" onclick="myFunction1()"><h3>Về việc sử dụng Voucher</h3>
                        <p>Bạn chỉ có thể sử dụng tối đa một Voucher cho mỗi lần thanh toán<br>
                            Ngoài ra để sử dụng được Voucher, bạn phải đạt được mức Thanh Toán tối thiểu mà Voucher đề ra...</p>
                        <p class="bonus">Nhấn để xem thêm</p>
                        <span class="popuptext1" id="myPopup1">
                            + Bạn chỉ có thể sử dụng tối đa một Voucher cho mỗi lần thanh toán. <br>
                            <br>
                            + Ngoài ra để sử dụng được Voucher, bạn phải đạt được mức Thanh Toán tối thiểu mà Voucher đề ra, Nếu số tiền trong giỏ dưới mức quy định, Voucher không thể áp dụng.<br>
                            <br>
                            + Mỗi Voucher của hệ thống cửa hàng Menstore đều được quy ước các giá trị giới hạn giảm giá tối đa. Số tiền được giảm bởi Voucher sẽ không thể vượt quá giới hạn quy định
                        </span>
                    </div>
                </div>
                <div class="span1_of_3">
                    <div class="popup2" onclick="myFunction2()"><h3>Về việc sử dụng Điểm thưởng</h3>
                        <p>Điểm thưởng sẽ chỉ áp dụng cho các khách hàng đang sử dụng tài khoản của Hệ thống MenStore.<br>
                            Với mỗi lượt mua hàng không áp dụng giảm giá từ điểm thưởng. Bạn sẽ Nhận được số lượng điểm thưởng nhất định phụ thuộc vào quy định của Hệ thống cửa hàng...</p>
                        <p class="bonus">Nhấn để xem thêm</p>
                        <span class="popuptext2" id="myPopup2">
                            + Điểm thưởng sẽ chỉ áp dụng cho các khách hàng đang sử dụng tài khoản của Hệ thống MenStore.<br>
                            + Với mỗi lượt mua hàng không áp dụng giảm giá từ điểm thưởng. Bạn sẽ Nhận được số lượng điểm thưởng nhất định phụ thuộc vào quy định của Hệ thống cửa hàng.<br>
                            + Bạn có thể sử dụng điểm thưởng để giảm giá cho hóa đơn hiện tại của mình.<br> 
                            * Lưu ý: Bạn sẽ không được nhận thêm điểm thưởng khi đang sử dụng điểm thưởng để giảm giá<br>
                            - Tất cả mọi điểm thưởng hiện tại của bạn sẽ được quy đổi thành số lượng giảm giá nhất định cho một lần thanh toán duy nhất.<br>
                            - Hệ thống cửa hàng MenStore sẽ không hoàn lại tiền thừa được quy đổi từ điểm thưởng.  
                        </span>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>
<script>
// When the user clicks on div, open the popup
    function myFunction1() {
        var popup1 = document.getElementById("myPopup1");
        popup1.classList.toggle("show1");
    }
    function myFunction2() {
        var popup2 = document.getElementById("myPopup2");
        popup2.classList.toggle("show2");
    }
</script>

<!-- start footer -->
<div class="footer_bg">
    <div class="wrap">
        <div class="footer">
            <!-- scroll_top_btn -->
            <script type="text/javascript">
                $(document).ready(function () {

                    var defaults = {
                        containerID: 'toTop', // fading element id
                        containerHoverID: 'toTopHover', // fading element hover id
                        scrollSpeed: 1200,
                        easingType: 'linear'
                    };


                    $().UItoTop({easingType: 'easeOutQuart'});

                });
            </script>
            <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
            <!--end scroll_top_btn -->
            <div class="f_nav1">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/home">home /</a></li>
                    <li><a href="https://www.facebook.com/hoang.duy.794/">supporter 1 /</a></li>
                    <li><a href="https://www.facebook.com/TrGiang.ne">supporter 2 /</a></li>
                    <li><a href="https://www.facebook.com/Ivor.Eoss">supporter 3 /</a></li>
                    <li><a href="https://www.facebook.com/DinhPhanHaiTrieu">supporter 4</a></li>
                </ul>
            </div>
            <div class="copy">
                <p class="link"><span>© All rights reserved | Designed by Group 3 - SE1602</span></p>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>