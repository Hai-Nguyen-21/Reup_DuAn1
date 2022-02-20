var urlName = location.href;

var updateSuccess = urlName.search("updateSuccess");

if(updateSuccess > 0) {
    alert("Update Account Successfully!");
} else {
    console.log("Nothing");
}