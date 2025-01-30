document.addEventListener("DOMContentLoaded", function () {
    const toggleSidebarButton = document.getElementById("toggleSidebar");
    const sidebar = document.getElementById("sidebar");
    const mainContent = document.getElementById("mainContent");

    toggleSidebarButton.addEventListener("click", function () {
        sidebar.classList.toggle("sidebar-collapsed");
        mainContent.classList.toggle("main-collapsed");
    });
});
