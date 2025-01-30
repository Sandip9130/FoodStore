document.addEventListener("DOMContentLoaded", function () {
    const toggleSidebarButton = document.getElementById("toggleSidebar");
    const sidebar = document.getElementById("sidebar");
    const mainContent = document.getElementById("mainContent");

    toggleSidebarButton.addEventListener("click", function () {
        sidebar.classList.toggle("sidebar-collapsed");
        mainContent.classList.toggle("main-collapsed");
    });
});



const searchRec = () => {

    let filter = document.getElementById('searchName').value.toUpperCase();

    let tbody = document.getElementById('orderTableBody');
    let tr = orderTableBody.getElementsByTagName('tr');

    for (var i = 0; i < tr.length; i++) {

        let td = tr[i].getElementsByTagName('td')[2];

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


const comp = () => {

    let filter = document.getElementById('filterStatus').value.toUpperCase();

    let tbody = document.getElementById('orderTableBody');
    let tr = orderTableBody.getElementsByTagName('tr');
    var a = 'ALL';
    for (var i = 0; i < tr.length; i++) {

        let td = tr[i].getElementsByTagName('td')[9];

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



