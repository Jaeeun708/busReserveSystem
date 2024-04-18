console.log("pay.js javaScript module.......");

var payInsertService = (function () {
    console.log("add pay........");

    function insert(pay, callback, error) {
        console.log("pay.js 의 pay" + pay);
        console.log("pay.js 의 payNo"+pay.payNo);
        $.ajax({
            url: '/reserve/reserve_pay_ok',
            type: 'post',
            data: JSON.stringify(pay),
            contentType: 'application/json; charset=utf-8',
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                } //end success if

                window.location.href = "/reserve/reserve_ok";
            }, //end success
            error: function (xhr, status, er) {
                if (error) {
                    error(er);
                } //end error if
            } //end error
        }); //end ajax
    } //end insert

    return {
        insert: insert
    };

})();