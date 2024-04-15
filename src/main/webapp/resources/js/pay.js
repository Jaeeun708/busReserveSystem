console.log("pay.js javaScript module.......");

var payInsertService = (function () {
    console.log("add pay........");

    function insert(pay, callback, error) {
        $.ajax({
            url: '/reserve/reserve_pay',
            type: 'post',
            data: JSON.stringify(pay),
            contentType: 'application/json; charset=utf-8',
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                } //end success if
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