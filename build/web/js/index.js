function doLike(pid, uid) {
    const obj = {
        pid : pid,
        uid : uid,
        operation : 'like'
    }
    
    $.ajax({
        url: "LikeServlet",
        data : obj,
        success: function (data, textStatus, jqXHR) {
            
            if(data.trim()=='true') {
                let c = $(`.likeCount${pid}`).html();
                c++;
                $(`.likeCount${pid}`).html(c);
                $(`.post_Like${pid}`).addClass("postLike");
                
            } else {
                let c = $(`.likeCount${pid}`).html();
                c--;
                $(`.likeCount${pid}`).html(c);
                $(`.post_Like${pid}`).removeClass("postLike");
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    })
}