var EnrollBtn=document.getElementById("btn");
var input=document.getElementById("inpt");
EnrollBtn.onclick=function(){
    if(input.value=="")
    {
        alert("Please Enter Your email ID.")
    }
    else{
        alert("Thank You for signing up for the Beta Program. We will reach to you shortly");
        var form=document.getElementById("form");
        form.classList.add("hidden");
        var Beta=document.getElementById("bt");
        Beta.innerHTML+=`<h3>Thank You for Signing Up for the Beta Program.We will reach to you shortly !!!</h3>`;
    }
    return false;

};