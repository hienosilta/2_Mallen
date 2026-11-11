const image = document.getElementById('zoomableImage');
        const overlay = document.getElementById('imageOverlay');

        // Funktion för att växla storlek
        function toggleZoom() {
            image.classList.toggle('enlarged');
            overlay.classList.toggle('active');
        }

        // Klicka på bilden för att förstora/förminska
        image.addEventListener('click', toggleZoom);

        // Klicka på den mörka bakgrunden för att stänga bilden
        overlay.addEventListener('click', toggleZoom);

        