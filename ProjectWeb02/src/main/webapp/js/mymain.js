// .choosedfilter .btn
function removeFilter(element, id, value) {
    if ($(element).hasClass("btn-primary")) {
        console.log("enter here 1");
        if ($(".choosedfilter .btn-primary").size() <= 1) {
            // remove this checkbox
            $(".choosedfilter .btn").remove();
            $(".resultFilter .choosedfilter").hide();
        } else {
            $(element).remove();
        }

        // uncheck this checkbox
        $("#" + id).find("input").each(function () {
            console.log($(this).val() + ":" + value);
            if ($(this).val() == value) {
                console.log("enter hẻe2");
                $(this).prop("checked", false);
            }
        });
    } else {
        console.log("enter here 2");
        $(".choosedfilter .btn").remove();
        $(".resultFilter .choosedfilter").hide();

        // uncheck all checkbox
        $('input:checked').prop("checked", false);
    }
    // Tick the all-checkbox if there is no any checkboxes checked
    checkAllCheckbox();
    // call AJAX method to load new data from server
    getProductFilter();
}

// $(".choosedfilter .btn").click(function () {
//     console.log("enter choooo");
//     if ($(this).hasClass(".primary")) {
//         $(this).remove();
//     } else {
//         $(".choosedfilter .btn").remove();
//     }
// });

// js for pagination
var current_page = 1;
var numPages = $(".pagination .list-page .item").length;
var btn_next = $("#btn_next");
var btn_prev = $("#btn_prev");

var itemActive = $(".pagination .list-page .item.active a").text().trim();

function prevPage() {
    console.log("enter pre");
    if (current_page > 1) {
        current_page--;
        changePage(current_page);
    }
}

function items(divElement) {
    console.log("enter pagination items");
    // $(divElement).parent().parent().find(".page-item").removeClass("active");
    // $(divElement).parent().addClass("active");
    current_page = $(divElement).text();
    changePage(current_page);
}

function nextPage() {
    console.log("enter next");
    if (current_page < numPages) {
        current_page++;
        changePage(current_page);
    }
}

function changePage(page) {

    var list = $(".pagination .list-page .item");
    //var page_span = document.getElementById("page");

    $(list).removeClass("active");
    $(list).each(function () {
        if ($(this).find('a').text() == page) {
            $(this).addClass("active");
        }
    });


    getProductFilter(page);
}


$('#sort .dropdown-item').click(function () {

    $('#sort .dropdown-item i').remove();
    $(this).prepend('<i class="fas fa-check"></i>');

    $('#sort .sortText').html($(this).text());
    $('#sort #dropdownMenuButton').data('value', $(this).data('value'));

    getProductFilter();
});
$('input[type=checkbox]').click(function () {
    getProductFilter();
});

function getProductFilter(current_page) {
    // data send to server
    var brand = get_filter_text('brand');
    var price = get_filter_text('price');
    var sort = $('#sort #dropdownMenuButton').data('value');
    var page = current_page;
    if (current_page === undefined) page = 1;

    // html
    var resultFilter = $(".resultFilter");
    var sectionTitle = resultFilter.find(".sectionTitle");
    var choosedfilter = resultFilter.find(".choosedfilter");
    var productList = resultFilter.find(".list-product").find(".row");
    var pagination = resultFilter.find(".pagination");
    var loader = resultFilter.find(".loaderWrap");
    var nullResult = resultFilter.find(".nullResult");

    sectionTitle.hide();
    choosedfilter.hide();
    productList.hide();
    productList.empty();
    pagination.hide();
    nullResult.hide();
    loader.show();

    var ajaxCall = function () {
        $.ajax({
                url: 'mobileList',
                type: 'post',
                data: { // Danh sách các thuộc tính sẽ gửi đi
                    brand: brand, price: price, sort: sort, page: page
                },
                datatype: 'json',
                headers: {
                    Accept: "application/json; charset=utf-8",
                },
                error: function () {

                },
                success: function (data) {
                    // alert("success");
                    var obj = JSON.parse(data);
                    var list = obj.list;
                    if (list.length != 0) {
                        for (let i = 0; i < list.length; i++) {
                            productList.append("<div class=\"product col-sm-3 col-12\">\n" +
                                "                                    <a href=\"DetailProduct?id=" + list[i].code + "\">" +
                                "                                                <img src=\"" + list[i].listImg[0] + " \"" +
                                "                                                     alt=\"" + list[i].listImg[0] + " \">" +
                                "                                        <div class=\"content\">\n" +
                                "                                            <h3>" + list[i].name + "</h3>" +
                                "                                            <div class=\"price\">\n" +
                                "                                                <strong>\n" +
                                "                                                     " + formatNumber(list[i].promotionPrice, ',', '.') +
                                "                                                </strong>\n" +
                                "                                                <span>\n" +
                                "                                         " + formatNumber(list[i].price, ',', '.') +
                                "                                    </span>\n" +
                                "                                            </div>\n" +
                                "                                            <div class=\"rating\">\n" +
                                "                                                <i class=\"fas fa-star\"></i>\n" +
                                "                                                <i class=\"fas fa-star\"></i>\n" +
                                "                                                <i class=\"fas fa-star\"></i>\n" +
                                "                                                <i class=\"fas fa-star-half-alt\"></i>\n" +
                                "                                                <i class=\"far fa-star\"></i>\n" +
                                "                                                <span>50 Đánh giá</span>\n" +
                                "                                            </div>\n" +
                                "                                            <lablel class=\"discount\">\n" +
                                "                                                GIẢM  " + formatNumber(list[i].price - list[i].promotionPrice, ',', '.') +
                                "                                            </lablel>\n" +
                                "                                            <div class=\"promo\">\n" +
                                "                                                <p> Phiếu mua hàng trị giá 1 triệu</p>\n" +
                                "                                            </div>\n" +
                                "                                        </div>\n" +
                                "                                    </a>\n" +
                                "                                </div>"
                            );
                        }
                        sectionTitle.show();
                        choosedfilter.show();
                        productList.show();
                        pagination.show();
                        loader.hide();
                        nullResult.hide();

                        var numberOfPages = obj.numberOfPages;
                        console.log("numberOfPages " + numberOfPages);
                        // tổng số trang = 1
                        // tổng số trang > 1
                        // vị trí đang ở trang đầu
                        // vị trí đang ở trang cuối

                        if (numberOfPages == 1) {
                            $(".pagination .list-page").empty();
                            $(".pagination .list-page").append("<li class=\"page-item active\">\n" +
                                "                                            <a class=\"page-link\" onclick=\"items(this)\"  href=\"javascript:;\">1\n" +
                                "                                            </a>\n" +
                                "                                        </li>");
                        }
                        if (numberOfPages > 1) {
                            var active;
                            $(".pagination .list-page").empty();


                            $(".pagination .list-page").append("<li id=\"btn_prev\" class=\"page-item\">\n" +
                                "                                            <a class=\"page-link\" onclick=\"prevPage()\"  href=\"javascript:;\"\n" +
                                "                                               aria-label=\"Previous\">\n" +
                                "                                                <span aria-hidden=\"true\">Trước</span>\n" +
                                "                                            </a>\n" +
                                "                                        </li>");
                            for (let i = 0; i < numberOfPages; i++) {
                                var temp = i + 1 == page ? " active" : "";
                                $(".pagination .list-page").append(" <li class=\"page-item item" + temp + "\">\n" +
                                    "                                            <a class=\"page-link\" onclick=\"items(this)\" href=\"javascript:;\">" + (i + 1) +
                                    "                                            </a>\n" +
                                    "                                        </li>");
                            }
                            $(".pagination .list-page").append("<li id=\"btn_next\" class=\"page-item\">\n" +
                                "                                            <a class=\"page-link\" onclick=\"nextPage()\"  href=\"javascript:;\"\n" +
                                "                                               aria-label=\"Next\">\n" +
                                "                                                <span aria-hidden=\"true\">Tiếp</span>\n" +
                                "                                            </a>\n" +
                                "                                        </li>");

                            if (itemActive == "1") {
                                console.log("enter here1")
                                btn_prev.addClass("disabled");
                            } else {
                                console.log("enter here2");
                                btn_prev.removeClass("disabled");
                            }
                            if (itemActive == numPages) {
                                btn_next.addClass("disabled");
                            } else {
                                btn_next.removeClass("disabled");
                            }
                            //console.log($(".pagination .list-page .page-item"))
                        }
                    } else {
                        sectionTitle.show();
                        choosedfilter.show();
                        loader.hide();
                        nullResult.show();
                    }
                    choosedfilter.find("span").remove();
                    choosedfilter.find(".content").append(findChoosedfilter());
                    if (choosedfilter.find("span").length == 0) {
                        choosedfilter.hide();
                    }

                    var sub_url = window.location.origin + window.location.pathname;
                    var map = new Map();
                    map.set("brand", brand);
                    map.set("price", price);
                    map.set("sort", sort);
                    map.set("page", page);
                    var url_query = concat_url_query(map);


                    var url = sub_url + url_query;
                    //console.log(get_filter_text('brand'));
                    window.history.replaceState({}, null, url);

                    //$(document).scrollTo('.resultFilter');
                    $('html,body').animate({
                        scrollTop: $('.resultFilter').offset().top - 80
                    }, 'slow');
                }
            }
        );
    };
    setTimeout(ajaxCall, 200);
}

function get_filter_text(text_class) {
    var filter_data = '';
    var set = $('.' + text_class + ':checked');
    var length = set.length;
    set.each(function (index) {
        if (index !== (length - 1)) {
            filter_data += $(this).val() + ',';
        } else {
            filter_data += $(this).val();
        }
    });
    //console.log("filter_data"+filter_data+"2");
    return filter_data
}

function findChoosedfilter() {
    var filter_data = '';
    var set = $('input:checked');
    var length = set.length;
    console.log("enter filter check");
    set.each(function (index) {
        if ($(this).parent().text().trim() != "Tất cả") {
            var dataID = $(this).parent().find("input").data("id");
            var value = $(this).parent().find("input").val();
            filter_data += "<span class=\"btn btn-primary\" onclick=\"removeFilter(this, '" + dataID + "', '" + value + "')\">" + $(this).parent().text().trim() +
                "                                    <i class=\"fas fa-times\"></i>\n" +
                "                                </span>";
        }
        //console.log("filter_data: " + filter_data);
    });
    if (filter_data.trim() != "") {
        filter_data += "<span class=\"btn btn-danger\"onclick='removeFilter(this)'>Xóa tất cả\n" +
            "                                    <i class=\"fas fa-times\"></i>\n" +
            "                                </span>";
    }
    return filter_data
}

function concat_url_query(map) {
    var url_query = '?';
    for (var [key, value] of map) {
        if (value !== '') {
            url_query += key + "=" + value + "&";
        }
    }
    if (url_query.charAt(url_query.length - 1) === "&") {
        url_query = url_query.substring(0, url_query.length - 1);
    }

    if (url_query.charAt(url_query.length - 1) === "?") {
        url_query = url_query.substring(0, url_query.length - 1);
    }
    return url_query;
}
