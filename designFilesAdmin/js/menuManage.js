const dropDawnFilter = () => {

    let filter = document.getElementById('filterCatagory').value.toUpperCase();

    let tbody = document.getElementById('menuManTbody');
    let tr = menuManTbody.getElementsByTagName('tr');
    var a = 'ALL';
    for (var i = 0; i < tr.length; i++) {

        let td = tr[i].getElementsByTagName('td')[3];

        if (td) {
            let textvalue = td.textContent || td.innerHTML;

            if (textvalue.toUpperCase() == filter) {
                tr[i].style.display = "";
            }
            else if (filter == a) {
                tr[i].style.display = "";
            }
            else {
                tr[i].style.display = "none";
            }

        }

    }

}


const searchItem = () => {

    let filter = document.getElementById('searchItem').value.toUpperCase();

    let tbody = document.getElementById('menuManTbody');
    let tr = menuManTbody.getElementsByTagName('tr');

    for (var i = 0; i < tr.length; i++) {

        let td = tr[i].getElementsByTagName('td')[0];

        if (td) {
            let textvalue = td.textContent || td.innerHTML;

            if (textvalue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";

            }
            else {
                tr[i].style.display = "none"
            }
        }

    }

}
