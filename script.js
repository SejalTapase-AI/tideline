/* =========================================
   TIDELINE FRONTEND PROTOTYPE
========================================= */


function showScreen(screenId) {

    const screens = document.querySelectorAll(".screen");

    screens.forEach(screen => {

        screen.classList.remove("active");

    });


    const selectedScreen = document.getElementById(screenId);

    if (selectedScreen) {

        selectedScreen.classList.add("active");

    }

}


/* =========================================
   ANALYSIS ANIMATION
========================================= */

function startAnalysis() {

    showScreen("analysis");

    let progress = 0;

    const progressNumber =
        document.getElementById("progress-number");

    const progressCircle =
        document.querySelector(".progress-circle");


    const interval = setInterval(() => {

        progress += 2;

        progressNumber.textContent = progress + "%";


        progressCircle.style.background =
            `conic-gradient(
                #2563EB ${progress * 3.6}deg,
                #DBEAFE ${progress * 3.6}deg
            )`;


        if (progress >= 100) {

            clearInterval(interval);

            setTimeout(() => {

                showScreen("result");

            }, 500);

        }

    }, 35);

}