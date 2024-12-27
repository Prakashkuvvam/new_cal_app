package com.example;

public class App {
    private final Calculator calculator;

    public App() {
        this.calculator = new Calculator();
    }

    public static void main(String[] args) {
        App app = new App();
        System.out.println("Calculator Application");
        System.out.println("2 + 3 = " + app.calculator.add(2, 3));
        System.out.println("5 - 3 = " + app.calculator.subtract(5, 3));
        System.out.println("4 * 2 = " + app.calculator.multiply(4, 2));
        System.out.println("10 / 2 = " + app.calculator.divide(10, 2));
    }
}