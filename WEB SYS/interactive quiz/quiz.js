const quizData = [
    {
        "question": "What is HTML?",
        "options": ["HyperText Markup Language", "HyperText Markup Links", "Home Management Links"],
        "answer": 0
    },
    {
        "question": "How many continents are there?",
        "options": ["5", "8", "7"],
        "answer":1
    },
    {
        "question": "What is the largest country by land area?",
        "options": ["China", "Russia", "Africa"],
        "answet": 0
    }
];

let currentQuestionIndex = 0;
let score = 0;
let timeleft = 15;
let timer;

function startQuiz() {
    if (currentQuestionIndex >= quizData.length){
        document.getElementById("quiz-box").innerHTML = `<h3>Quiz Completed </h3>
        <p>Final Score = ${score}/${quizData.length}</p>`;

        document.getElementById("next-btn").style.display = "none";

        document.getElementById("score").parentElement.style.display = "none";
        return;
    }

    let questionObj = quizData[currentQuestionIndex];
    document.getElementById("question").innerHTML = questionObj.question;

    let optionContainer = document.getElementById("options");
    optionContainer.innerHTML = "";

    questionObj.options.forEach((option, index) => {
        let button = document.createElement("button");
        buttton.innerText = option;

        button.classList.add("btn-outlined-primary", "w-50","my-1", "option");
        button.onclick= () => checkAnswer(index);

        optionContainer.appendChild(button);
    });

    resetTimer();
}

function resetTimer() {
    clearInterval(timer);
    timeleft = 15;

    document.getElementById("time").innerText = timeleft;

    timer = setInterval(() => {
        timeleft -=1;

        document.getElementById("time").innerText = timeleft;

        if (timeleft <=0) {
            clearInterval(timer);
            nextQuestion();
        }
    }, 1000);
}

function checkAnswer(selected) {
    let correct = quizData[currentQuestionIndex].answer;
    if (selected === correct) {
        score++;

        document.getElementById("score").innerText = score;
    }
    document.getElementById("next-btn").classList.remove("hide");
}

function nextQuestion() {
    currentQuestionIndex++;
    
    document.getElementById("next-btn").classList.add("hide");
    loadQuestions()
}

document.addEventListener("DOMContentLoaded",() => {
    document.getElementById("next-btn").addEventListener("click", nextQuestion);
    startQuiz();
});