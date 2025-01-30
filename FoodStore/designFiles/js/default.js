
//JavaScript for Sliding Background
        let currentSlide = 0;
        const slides = document.querySelectorAll('.hero-background div');
        const totalSlides = slides.length;

        function slideBackground() {
            currentSlide = (currentSlide + 1) % totalSlides;
        document.getElementById('hero-background').style.transform = `translateX(-${currentSlide * 33.33}%)`;
    }

setInterval(slideBackground, 5000); // Change slide every 5 seconds



/* Search product 

const searchProduct = () => {

    let filter = document.getElementById('searchName').value.toUpperCase();

    let cards = orderTableBody.getElementsByClassName('searchByName');

    for (var i = 0; i < cards.length; i++) {

        let pName = cards[i].getElementsByTagName('h6')[0];

        if (pName) {
            let textvalue = pName.textContent || pName.innerHTML;

            if (textvalue.toUpperCase().indexOf(filter) > -1) {
                cards[i].style.display = "";

            }
            else {
                cards[i].style.display = "none"
            }
        }

    }

}  */