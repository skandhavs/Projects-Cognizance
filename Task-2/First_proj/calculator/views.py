from django.shortcuts import render
# Create your views here.
def index(request):
    global inp_fld
    inp_fld=""
    return render(request, "index.html")
def input(request):
    global inp_fld
    inp_fld+=request.POST['input_value']
    return render(request, "index.html", {"result": inp_fld})
def eq_res_pst(request):
    global inp_fld
    inp_fld=request.POST['final_value']
    return render(request, "index.html", {"result": inp_fld})
def delete(request):
    global inp_fld
    inp_fld="0"
    return render(request, "index.html", {"result": inp_fld})
def erase(request):
    global inp_fld
    inp_fld=""
    return render(request, "index.html", {"result": inp_fld})
def fin_val(request):
    global inp_fld
    if inp_fld == "":
        inp_fld= '0'
    inp_fld=str(eval(inp_fld))
    return render(request, "index.html", {"result": inp_fld})