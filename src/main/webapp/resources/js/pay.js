console.log("pay.js javaScript module.......");

var payInsertService = (function () {
    console.log("add pay........");

    function insert(pay, callback, error) {
        $.ajax({
            url: '/pay/mainRegisterPay',
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

    function userAndCardInfo(userOrCardInfo, callback, error) {
        $.ajax({
            url: '/pay/mainRegisterPay',
            type: 'get',
            dataType: 'text',
            success: function (result, status, xhr) {
                if(callback) {
                    callback(result);
                } // end success if
            } // end success
        }); // end ajax
    } // end userAndCardInfo


    // function getList(param, callback, error) {
    //
    //     var bno = param.bno;
    //     var page = param.page || 1;
    //
    //     $.getJSON("/replies/pages/" + bno + "/" + page,
    //         function(data) {
    //             if (callback) {
    //                 callback(data);
    //             }
    //         }).fail(function(xhr, status, err) {
    //         if (error) {
    //             error();
    //         }
    //     });
    // }

    return {
        insert: insert,
        userAndCardInfo: userAndCardInfo
    };

})();