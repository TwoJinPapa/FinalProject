<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
.TeamPic {
    border-radius: 50%;
    width: 60%;
}

.FlipCardcontainer {
    margin-top: 5%;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
/*카드슬라이드 전체사이즈*/
.slider-container {
    width: 90vw;
    height: 400px;
    margin: 0 auto;
    position: relative;
    padding: 10px;
    overflow: hidden;
}
/*scroll속성모음*/
.card-container {
    overflow-x: auto;
    display: grid;
    grid-auto-flow: column;
    overscroll-behavior-inline: contain;
    scroll-behavior: smooth;
    height: 300px;
    scroll-snap-type: inline mandatory;
    scroll-padding-inline: 1rem;
    align-items: center;
}

.card {
    box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.3);
    width: 300px;
    height: 270px;
    background-color: #fff;
    border-radius: 10px;
    margin: 10px;
    font-size: 30px;
    letter-spacing: 1px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    scroll-snap-align: start;
    transition: all 0.5s;
}
/*scrollbar숨기기 */
::-webkit-scrollbar {
    display: none;
}

 /* 화살표 속성 */
.sliderBtn {
    width: 40px;
    height: 40px;
    border-top: 10px solid black;
    border-left: 10px solid black;
    position: absolute;
    cursor: pointer;
    top: 30%;
}
 /* border모양을 돌려서 화살표모양만들기 */
.slider-leftBtn  {
    transform: rotate(-45deg);
    left: 1rem;
}
.slider-rightBtn {
    transform: rotate(135deg);
    right: 1rem;
}
</style>
<body>
    <div class="FlipCardcontainer">
        <div class="slider-container">
            <span class="slider-leftBtn sliderBtn"></span>
            <div class="card-container" id="slider">
                <div class="card">
                    <img class="TeamPic" src="https://cdn-icons-png.flaticon.com/512/1077/1077114.png" alt="TeamPicture">
                    <a href="#" class="Green-button">number 1</a>

                </div>
                <div class="card">
                    <img class="TeamPic" src="https://cdn-icons-png.flaticon.com/512/1077/1077114.png" alt="TeamPicture">
                    <a href="#" class="Green-button">number 2</a>
                </div>

                <div class="card">
                    <img class="TeamPic" src="https://cdn-icons-png.flaticon.com/512/1077/1077114.png" alt="TeamPicture">
                    <a href="#" class="Green-button">number 3</a>
                </div>

                <div class="card">
                    <img class="TeamPic" src="https://cdn-icons-png.flaticon.com/512/1077/1077114.png" alt="TeamPicture">
                    <a href="#" class="Green-button">number 4</a>
                </div>

                <div class="card">
                    <img class="TeamPic" src="https://cdn-icons-png.flaticon.com/512/1077/1077114.png" alt="TeamPicture">
                    <a href="#" class="Green-button">number 5</a>
                </div>

                <div class="card">
                    <img class="TeamPic" src="https://cdn-icons-png.flaticon.com/512/1077/1077114.png" alt="TeamPicture">
                    <a href="#" class="Green-button">number 6</a>
                </div>

            </div>
            <span class="slider-rightBtn sliderBtn"></span>
        </div>
    </div>
    <script>
        let leftBtn = [...document.getElementsByClassName("slider-leftBtn")]
    let rightBtn = [...document.getElementsByClassName("slider-rightBtn")]
    let slider = [...document.querySelectorAll(".card-container")]
    let sliderDimension = document.querySelector(".card-container")


    slider.forEach((item, i) => {
        let containerDimension = item.getBoundingClientRect().width;
        if ((item.childElementCount * 350) < (containerDimension + 100)) {
            rightBtn[i].style.display = 'none';
            leftBtn[i].style.display = 'none';
            item.style.justifyContent = 'space-around';
        }
        leftBtn[i].style.display = "none"
        rightBtn[i].addEventListener('click', () => {
            item.scrollLeft += containerDimension;
            leftBtn[i].style.display = 'block';
        })
        leftBtn[i].addEventListener('click', () => {
            item.scrollLeft -= containerDimension;
            rightBtn[i].style.display = 'block';
        })
        item.addEventListener('scroll', () => {
            if (item.offsetWidth + item.scrollLeft >= (item.scrollWidth - 100)) {
                rightBtn[i].style.display = 'none';
                leftBtn[i].style.display = 'block';
            } else if (item.scrollLeft == 0) {
                leftBtn[i].style.display = 'none';
                rightBtn[i].style.display = 'block';
            } else if (item.scrollLeft > 0) {
                leftBtn[i].style.display = 'block';
            }
            if (item.offsetWidth + item.scrollLeft < (item.scrollWidth - 50)) {
                rightBtn[i].style.display = 'block';
            }
        })

        const slidingFunction = () => {
            if (item.offsetWidth + item.scrollLeft >= (item.scrollWidth - 100)) {
                // item.style.scrollBehavior = "auto";
                item.scrollLeft = 0;
            }
            if (item.offsetWidth + item.scrollLeft < (item.scrollWidth - 50)) {
                // item.style.scrollBehavior = "smooth";
                item.scrollLeft += containerDimension;
            }
        }

        setInterval(() => slidingFunction(), 6000)
    })
    </script>
</body>
</html>