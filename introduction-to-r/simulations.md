---
description: >-
  In this section, we explore the fundamental aspects of programming in R by
  simulating the well-known Monty Hall problem.
---

# Simulations

The Monty Hall problem is a probability puzzle that illustrates how counterintuitive probability can be, and this example offers a practical way to learn key programming concepts such as loops, conditionals, and randomness in R.

## **The Monty Hall Problem**

The Monty Hall problem originates from a game show where a contestant is faced with three doors. Behind one door is a car (the prize), and behind the other two doors are goats. The contestant initially selects one of the doors. Then, the host, who knows what’s behind the doors, opens one of the remaining doors, revealing a goat. The contestant is then asked whether they would like to stick with their original choice or switch to the other unopened door. The question is: should the contestant switch or stay to maximize their chances of winning?

Mathematically, switching offers a 2/3 chance of winning, while staying with the original choice only gives a 1/3 chance of winning. This simulation will demonstrate why switching is the better strategy by running thousands of trials.

## **Key Concepts in R Programming**

To simulate the Monty Hall problem, we will use several core programming concepts in R:

* **Variables**: Variables store values and help track information like the number of wins or the number of games played.
* **Loops**: A loop allows us to repeat a block of code multiple times. Here, a `for` loop will help us simulate the game thousands of times.
* **Conditionals (if-else statements)**: These enable the program to make decisions based on logical conditions.
* **Random Number Generation**: Random numbers are critical for simulating real-life scenarios like randomly assigning the car to a door or randomly choosing a door.

## **The R Code Explained**

Let’s walk through the Monty Hall simulation code in detail:

### **a. Initializing Variables**

```r
wins <- 0
games_played <- 0
```

We initialize two variables, `wins` and `games_played`, both set to 0. `wins` will count how many times the contestant wins the game, and `games_played` keeps track of the total number of games played.

### **b. Defining the Doors**

```r
doors <- seq(1, 3)
```

The variable `doors` holds the possible doors (1, 2, and 3) behind which the car could be hidden. This sequence will be used to simulate the possible locations for the car and contestant choices.

### **c. Setting Parameters**

```r
n <- 10000
decision <- "switch"
```

We set `n` to 10,000, which specifies how many games will be simulated. The variable `decision` controls the contestant’s strategy: `"switch"` means the contestant will always switch doors, while `"stay"` would indicate the contestant sticks with their original choice.

### **d. The Loop: Running the Simulation**

```r
for (i in 1:n) {
    car_position <- sample(1:3, 1)
    contestant_choice <- sample(1:3, 1)
```

The `for` loop runs `n` times, which means it simulates the game 10,000 times. For each game, the car is randomly placed behind one of the doors using `sample(1:3, 1)`. The contestant also randomly chooses one of the doors.

### **e. Monty's Action**

```r
montys_options <- setdiff(doors, c(car_position, contestant_choice))
montys_choice <- sample(montys_options, 1)
```

Monty, the host, will open a door that neither contains the car nor was selected by the contestant. The `setdiff()` function helps us find Monty’s available options by excluding both the car’s position and the contestant’s choice. Then, `sample()` is used to randomly pick one of these doors for Monty to open.

### **f. Conditional Logic: Determining the Contestant’s Outcome**

```r
if (decision == "switch") {
    user_wins <- !contestant_correct
} else if (decision == "stay") {
    user_wins <- contestant_correct
}
```

The `if` statement evaluates the contestant’s strategy. If `decision == "switch"`, the contestant wins if their initial choice was wrong (i.e., they were incorrect initially and then switched to the correct door). If `decision == "stay"`, the contestant wins if their initial choice was correct.

### **g. Tracking the Results**

```r
wins <- wins + user_wins
games_played <- games_played + 1
```

After each game, we update the total number of wins by adding `user_wins` to the `wins` variable. The total number of games played is incremented with each loop iteration.

### **h. Final Output**

```r
win_percentage <- wins / n
print(win_percentage)
```

After all the simulations are completed, the code calculates the winning percentage by dividing the total wins by the number of games (`n`). The result is then printed, showing the success rate based on the contestant’s decision to switch or stay.

## **Conclusion**

By simulating the Monty Hall problem in R, we can see how switching doors results in a higher probability of winning (approximately 66.67%). This example demonstrates the power of R for simulating real-world problems and the importance of understanding probability in decision-making.

This simulation also provides an excellent introduction to basic R programming concepts:

* **Loops** help automate repetitive tasks, like running multiple simulations.
* **Conditionals** allow for decision-making within a program, essential for implementing different strategies.
* **Random number generation** is crucial for modeling uncertain or random events, as we saw when randomly assigning car positions and contestant choices.
