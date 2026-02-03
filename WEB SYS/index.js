function changecolor(){
    let color = ["red","blue", "green"]
    let randomcolor = color[Math.floor(Math.random() * color.length)]

    document.getElementById("box").style.backgroundColor = randomcolor

}